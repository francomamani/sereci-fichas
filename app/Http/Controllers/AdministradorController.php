<?php

namespace App\Http\Controllers;

use App\Administrador;
use App\User;

class AdministradorController extends Controller
{
    public function index(){
        return response()->json(Administrador::with('user')->orderByDesc('id')->get());
    }
    public function show($id){
        return response()->json(Administrador::find($id), 200);
    }
    public function store(){
        $administrador = Administrador::create(request()->all());
        return response()->json($administrador , 201);
    }
    public function update($id){
        $administrador =  Administrador::find($id);
        $administrador->update(request()->all());
        return response()->json($administrador, 200);
    }
    public function destroy($id){
        $administrador = Administrador::find($id);
        $administrador->delete();
        return response()->json(['exito'=>'Administrador eliminado con id: ' . $administrador->id], 200);
    }
    public function administradoresUser(){
        return response()->json(User::has('administrador')->orderBy('nombres','asc')->get());
    }
}
