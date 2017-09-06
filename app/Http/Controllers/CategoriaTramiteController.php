<?php

namespace App\Http\Controllers;

use App\CategoriaTramite;

class CategoriaTramiteController extends Controller
{
    public function index(){
        return response()->json(CategoriaTramite::with('tipoTramite')->orderBy('descripcion')->get(), 200);
    }
    public function show($id){
        return response()->json(CategoriaTramite::with('tipoTramite')->find($id), 200);
    }
    public function store(){
        $categoria_tramite = CategoriaTramite::create(request()->all());
        return response()->json($categoria_tramite, 201);
    }
    public function update($id){
        $categoria_tramite = CategoriaTramite::find($id);
        $categoria_tramite->update(request()->all());
        return response()->json($categoria_tramite, 200);
    }
    public function destroy($id){
        $categoria_tramite = CategoriaTramite::find($id);
        $categoria_tramite->delete();
        return response()->json(['exito'=>'Categoria de Tramite eliminado exitosamente' . $categoria_tramite->id], 200);
    }
}
