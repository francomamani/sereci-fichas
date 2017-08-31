<?php

namespace App\Http\Controllers;

use App\Solicitante;

class SolicitanteController extends Controller
{
    public function index(){
        return response()->json(Solicitante::orderByDesc('id')->get(), 200);
    }
    public function store(){
        $solicitante = Solicitante::create(request()->all());
        return response()->json($solicitante, 201);
    }
    public function update($id){
        $solicitante = Solicitante::find($id);
        $solicitante->update(request()->all());
        return response()->json($solicitante, 200);
    }
    public function destroy($id){
        $solicitante = Solicitante::find($id);
        $solicitante->delete();
        return response()->json(['exito'=>'Solicitante eliminado exitosamente con id: ' . $solicitante->id], 200);
    }
}
