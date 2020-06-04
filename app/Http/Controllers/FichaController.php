<?php

namespace App\Http\Controllers;

use App\AsignacionVentanilla;
use App\Cajero;
use App\Categoria;
use App\Ficha;
use App\Ventanilla;
use Carbon\Carbon;
use JWTAuth;

class FichaController extends Controller
{
    public function index()
    {
        return response()->json(Ficha::orderBy('id', 'desc')->get(), 200);
    }

    public function show($id)
    {
        return response()->json(Ficha::find($id), 200);
    }

    public function store()
    {
        $response = null;
        $categoria_id = request()->input('id');
        $estado_ficha = 'espera';
        $currentDate = date('Y-m-d');
        $count = Categoria::find($categoria_id)->fichas()->whereDate('fichas.created_at', $currentDate)->count();
        if ($count == 0) {
            $numero = request()->input('acronimo') . '-1';
            $ficha = Ficha::create(compact('categoria_id', 'numero', 'estado_ficha'));
            $response = Ficha::with('categoria')->find($ficha->id);
        } else {
            $i = $count + 1;
            $numero = request()->input('acronimo') . '-' . $i;
            $ficha = Ficha::create(compact('categoria_id', 'numero', 'estado_ficha'));
            $response = Ficha::with('categoria')->find($ficha->id);
        }
        return response()->json($response, 201);
    }

    public function update($id)
    {
        $ficha = Ficha::find($id);
        $ficha->update(request()->all());
        return response()->json($ficha, 200);
    }

    public function destroy($id)
    {
        $ficha = Ficha::find($id);
        $ficha->delete();
        return response()->json(['exito' => 'Asignacion de categoria eliminada con id: ' . $ficha->id], 200);
    }

    public function llamarFicha($ventanilla_id)
    {
        $response = [];
        $ventanilla = Ventanilla::find($ventanilla_id);
        $total_asignacion_categorias = $ventanilla->asignacionCategorias()->count();
        if ($total_asignacion_categorias > 0) {
            $asignacion_categorias = $ventanilla->asignacionCategorias()->get();
            foreach ($asignacion_categorias as $asignacion_categoria) {
                $total_fichas = $asignacion_categoria->categoria()->first()->fichas()->count();
                if ($total_fichas > 0) {
                    $this->updateEstadoFicha($asignacion_categoria);
                    $ventanilla_count = $asignacion_categoria->categoria()->first()
                        ->fichas()
                        ->with('categoria')
                        ->whereDate('created_at', date('Y-m-d'))
                        ->where('estado_ficha', '!=', 'ventanilla')
                        ->count();
                    if ($ventanilla_count > 0) {
                        $records = $asignacion_categoria->categoria()->first()
                            ->fichas()
                            ->with('categoria')
                            ->whereDate('created_at', date('Y-m-d'))
                            ->where('estado_ficha', '!=', 'ventanilla')
                            ->get()
                            ->toArray();
                    } else {
                        $records = $asignacion_categoria->categoria()->first()
                            ->fichas()
                            ->with('categoria')
                            ->whereDate('created_at', date('Y-m-d'))
                            ->where('estado_ficha', '!=', 'atendido')
                            ->get()
                            ->toArray();
                    }

                    $response = array_merge($response, $records);
                }
            }
            if ($this->countByExpiracion($response) > 0) {
                $ficha_id = $this->getByExpiracion($response)[0]['id'];
                $ficha = Ficha::find($ficha_id);
                $ficha->estado_ficha = 'ventanilla';
                $ficha->save();
                $response = $this->getByExpiracion($response)[0];
            } else {
                if ($this->countByPrioridadSelectivo($response) > 0) {
                    $ficha_id = $this->getByPrioridadSelectivo($response)[0]['id'];
                    $ficha = Ficha::find($ficha_id);
                    $ficha->estado_ficha = 'ventanilla';
                    $ficha->save();
                    $response = $this->getByPrioridadSelectivo($response)[0];
                } else {
                    if (count($response) > 0) {
                        $ficha_id = $this->getOrderedFichas($response)[0]['id'];
                        $ficha = Ficha::find($ficha_id);
                        $ficha->estado_ficha = 'ventanilla';
                        $ficha->save();
                        $response = $this->getOrderedFichas($response)[0];
                    } else {
                        $response = ['error' => 'No existen fichas en espera ^_^'];
                    }
                }
            }

        } else {
            $response = ['error' => 'La ventanilla no tiene categorias asignadas'];
        }
        return response()->json($response);
    }

    public function updateEstadoFicha($asignacion_categoria)
    {
        //update to selectivo
        $date_selectivo = Carbon::now()->subMinutes(12);
        $date_expiracion = Carbon::now()->subMinutes(25);
        $fichas = $asignacion_categoria->categoria()->first()
            ->fichas()
            ->whereDate('created_at', date('Y-m-d'))
            ->where('estado_ficha', 'espera')
            ->where('created_at', '<=', $date_selectivo)
            ->get();
        foreach ($fichas as $ficha) {
            $ficha->estado_ficha = 'selectivo';
            $ficha->save();
        }
        //update to expiracion
        $fichas2 = $asignacion_categoria->categoria()->first()
            ->fichas()
            ->whereDate('created_at', date('Y-m-d'))
            ->where('estado_ficha', 'selectivo')
            ->where('created_at', '<=', $date_expiracion)
            ->get();
        foreach ($fichas2 as $ficha) {
            $ficha->estado_ficha = 'expiracion';
            $ficha->save();
        }
    }

    public function countByExpiracion($fichas)
    {
        $response = [];
        foreach ($fichas as $ficha) {
            if ($ficha['estado_ficha'] == 'expiracion') {
                $record = [
                    'id' => $ficha['id'],
                    'prioridad' => $ficha['categoria']['prioridad'],
                    'descripcion' => $ficha['categoria']['descripcion'],
                    'acronimo' => $ficha['categoria']['acronimo'],
                    'categoria_id' => $ficha['categoria']['id'],
                    'numero' => $ficha['numero'],
                    'estado_ficha' => $ficha['estado_ficha'],
                    'created_at' => $ficha['created_at'],
                ];
                array_push($response, $record);
            }
        }
        return count($response);
    }

    public function getByExpiracion($fichas)
    {
        $response = [];
        foreach ($fichas as $ficha) {
            if ($ficha['estado_ficha'] == 'expiracion') {
                $record = [
                    'id' => $ficha['id'],
                    'prioridad' => $ficha['categoria']['prioridad'],
                    'descripcion' => $ficha['categoria']['descripcion'],
                    'acronimo' => $ficha['categoria']['acronimo'],
                    'categoria_id' => $ficha['categoria']['id'],
                    'numero' => $ficha['numero'],
                    'estado_ficha' => $ficha['estado_ficha'],
                    'created_at' => $ficha['created_at'],
                ];
                array_push($response, $record);
            }
        }
        sort($response);
        return $response;
    }

    public function countByPrioridadSelectivo($fichas)
    {
        $response = [];
        foreach ($fichas as $ficha) {
            if ($ficha['estado_ficha'] == 'selectivo') {
                $record = [
                    'prioridad' => $ficha['categoria']['prioridad'],
                    'descripcion' => $ficha['categoria']['descripcion'],
                    'acronimo' => $ficha['categoria']['acronimo'],
                    'categoria_id' => $ficha['categoria']['id'],
                    'id' => $ficha['id'],
                    'numero' => $ficha['numero'],
                    'estado_ficha' => $ficha['estado_ficha'],
                    'created_at' => $ficha['created_at'],
                ];
                array_push($response, $record);
            }
        }
        return count($response);
    }

    public function getByPrioridadSelectivo($fichas)
    {
        $response = [];

        foreach ($fichas as $ficha) {
            if ($ficha['estado_ficha'] == 'selectivo') {
                $record = [
                    'prioridad' => $ficha['categoria']['prioridad'],
                    'descripcion' => $ficha['categoria']['descripcion'],
                    'acronimo' => $ficha['categoria']['acronimo'],
                    'categoria_id' => $ficha['categoria']['id'],
                    'id' => $ficha['id'],
                    'numero' => $ficha['numero'],
                    'estado_ficha' => $ficha['estado_ficha'],
                    'created_at' => $ficha['created_at'],
                ];
                array_push($response, $record);
            }
        }
        sort($response);
        return $response;
    }

    public function getOrderedFichas($fichas)
    {
        $response = [];
        foreach ($fichas as $ficha) {
            $record = [
                'id' => $ficha['id'],
                'prioridad' => $ficha['categoria']['prioridad'],
                'descripcion' => $ficha['categoria']['descripcion'],
                'acronimo' => $ficha['categoria']['acronimo'],
                'categoria_id' => $ficha['categoria']['id'],
                'numero' => $ficha['numero'],
                'estado_ficha' => $ficha['estado_ficha'],
                'created_at' => $ficha['created_at'],
            ];
            array_push($response, $record);
        }
        sort($response);
        return $response;
    }
}
