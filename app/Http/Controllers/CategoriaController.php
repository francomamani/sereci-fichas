<?php

namespace App\Http\Controllers;

use App\Categoria;

class CategoriaController extends Controller
{
    public function index(){
        return response()->json(Categoria::orderBy('prioridad', 'asc')->get(), 200);
    }
    public function store(){
        $categoria = Categoria::create(request()->all());
        return response()->json($categoria, 201);
    }
    public function update($id){
        $categoria = Categoria::find($id);
        $categoria->update(request()->all());
        return response()->json($categoria, 200);
    }
    public function destroy($id){
        $categoria = Categoria::find($id);
        $categoria->delete();
        return response()->json(['exito'=>'Categoria eliminada exitosamente'], 200);
    }
}