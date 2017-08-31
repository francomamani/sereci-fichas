<?php

namespace App\Http\Controllers;

use App\Partida;

class PartidaController extends Controller
{
    public function index(){
        return response()->json(Partida::get(), 200);
    }
    public function store(){
        $partida = Partida::create(request()->all());
        return response()->json($partida, 201);
    }
    public function update($id){
        $partida = Partida::find($id);
        $partida->update(request()->all());
        return response()->json($partida, 200);
    }
    public function destroy($id){
        $partida = Partida::find($id);
        $partida->delete();
        return response()->json(['exito'=>'Partida eliminada exitosamente'], 200);
    }
}
