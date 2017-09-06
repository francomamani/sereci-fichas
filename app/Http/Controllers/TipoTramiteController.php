<?php

namespace App\Http\Controllers;

use App\TipoTramite;

class TipoTramiteController extends Controller
{
    public function index(){
        return response()->json(TipoTramite::orderBy('nombre')->get(), 200);
    }
    public function show($id){
        return response()->json(TipoTramite::find($id), 200);
    }
    public function store(){
        $tipoTramite = TipoTramite::create(request()->all());
        return response()->json($tipoTramite , 201);
    }
    public function update($id){
        $tipoTramite =  TipoTramite::find($id);
        $tipoTramite->update(request()->all());
        return response()->json($tipoTramite, 200);
    }
    public function destroy($id){
        $tipoTramite = TipoTramite::find($id);
        $tipoTramite->delete();
        return response()->json(['exito'=>'Tipo de tramite eliminado con id: ' . $tipoTramite->id], 200);
    }
    public function getCategoriaTramites($tipo_tramite_id){
        $categoria_tramites = TipoTramite::find($tipo_tramite_id)->categoriaTramites()->orderBy('descripcion')->get();
        return response()->json($categoria_tramites, 200);
    }
}
