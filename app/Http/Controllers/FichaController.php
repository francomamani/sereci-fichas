<?php

namespace App\Http\Controllers;

use App\Categoria;
use App\Ficha;

class FichaController extends Controller
{
    public function index(){
        return response()->json(Ficha::orderBy('id', 'desc')->get(), 200);
    }
    public function show($id){
        return response()->json(Ficha::find($id), 200);
    }
    public function store(){
        $response = null;
        $categoria_id = request()->input('id');
        $estado_ficha = 'espera';
        $currentDate = date('Y-m-d');
        $count = Categoria::find($categoria_id)->fichas()->whereDate('fichas.created_at', $currentDate)->count();
        if ($count == 0){
            $numero = request()->input('acronimo') . '-1';
            $ficha = Ficha::create(compact('categoria_id','numero', 'estado_ficha'));
            $response = Ficha::with('categoria')->find($ficha->id);
        }else{
            $i = $count + 1;
            $numero = request()->input('acronimo') . '-' . $i;
            $ficha = Ficha::create(compact('categoria_id','numero', 'estado_ficha'));
            $response = Ficha::with('categoria')->find($ficha->id);
        }
        return response()->json($response, 201);
    }
    public function update($id){
        $ficha =  Ficha::find($id);
        $ficha->update(request()->all());
        return response()->json($ficha, 200);
    }
    public function destroy($id){
        $ficha = Ficha::find($id);
        $ficha->delete();
        return response()->json(['exito'=>'Asignacion de categoria eliminada con id: ' . $ficha->id], 200);
    }
}
