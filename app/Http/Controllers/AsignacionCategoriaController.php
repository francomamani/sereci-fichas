<?php

namespace App\Http\Controllers;

use App\AsignacionCategoria;

class AsignacionCategoriaController extends Controller
{
    public function index(){
        return response()->json(AsignacionCategoria::with(['ventanilla', 'categoria'])->orderBy('id', 'desc')->get(), 200);
    }
    public function show($id){
        return response()->json(AsignacionCategoria::find($id), 200);
    }
    public function store(){
        $asignacionCategoria = AsignacionCategoria::create(request()->all());
        return response()->json($asignacionCategoria , 201);
    }
    public function update($id){
        $asignacionCategoria =  AsignacionCategoria::find($id);
        $asignacionCategoria->update(request()->all());
        return response()->json($asignacionCategoria, 200);
    }
    public function destroy($id){
        $asignacionCategoria = AsignacionCategoria::find($id);
        $asignacionCategoria->delete();
        return response()->json(['exito'=>'Asignacion de categoria eliminada con id: ' . $asignacionCategoria->id], 200);
    }
}