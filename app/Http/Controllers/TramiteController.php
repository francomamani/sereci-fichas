<?php

namespace App\Http\Controllers;

use App\RecepcionTramite;
use App\Tramite;
use App\User;
use JWTAuth;

class TramiteController extends Controller
{
    public function index(){
        return response()->json(Tramite::orderBy('id', 'desc')->get(), 200);
    }
    public function show($id){
        return response()->json(Tramite::find($id), 200);
    }
    public function store(){
        $tramite_data = [
            'ficha_id' => request()->input('ficha_id'),
            'categoria_tramite_id' => request()->input('categoria_tramite_id'),
            'cajero_id' => User::find(JWTAuth::toUser()->id)->cajero()->first()->id,
            'solicitud_autorizacion_id' => request()->input('solicitud_autorizacion_id'),
            'glosa' => request()->input('glosa'),
            'con_prueba' => request()->input('con_prueba'),
            'parentesco' => request()->input('parentesco')
        ];
        $tramite = Tramite::create($tramite_data);
        $data = [
            'ventanilla_id' => request()->input('ventanilla_id'),
            'tramite_id' => $tramite->id,
            'estado_tramite' => 'procesando',
        ];
        RecepcionTramite::create($data);
        return response()->json($tramite, 201);
    }
    public function update($id){
        $tramite =  Tramite::find($id);
        $tramite->update(request()->all());
        return response()->json($tramite, 200);
    }
    public function destroy($id){
        $tramite = Tramite::find($id);
        $tramite->delete();
        return response()->json(['exito'=>'Tramite eliminado con id: ' . $tramite->id], 200);
    }
}
