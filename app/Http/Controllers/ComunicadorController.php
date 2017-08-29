<?php

namespace App\Http\Controllers;

use App\Comunicador;
use App\User;

class ComunicadorController extends Controller
{
    public function index(){
        return response()->json(Comunicador::with('user')->orderByDesc('id')->get());
    }
    public function show($id){
        return response()->json(Comunicador::find($id), 200);
    }
    public function store(){
        $comunicador = Comunicador::create(request()->all());
        return response()->json($comunicador , 201);
    }
    public function update($id){
        $comunicador =  Comunicador::find($id);
        $comunicador->update(request()->all());
        return response()->json($comunicador, 200);
    }
    public function destroy($id){
        $comunicador = Comunicador::find($id);
        $comunicador->delete();
        return response()->json(['exito'=>'Comunicador eliminado con id: ' . $comunicador->id], 200);
    }
    public function comunicadoresUser(){
        return response()->json(User::has('comunicador')->orderBy('nombres', 'asc')->get());
    }
}
