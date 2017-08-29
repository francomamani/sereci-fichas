<?php

namespace App\Http\Controllers;

use App\Cajero;
use App\User;

class CajeroController extends Controller
{
    public function index(){
        return response()->json(Cajero::with('user')->orderByDesc('id')->get());
    }
    public function show($id){
        return response()->json(Cajero::find($id), 200);
    }
    public function store(){
        $cajero = Cajero::create(request()->all());
        return response()->json($cajero , 201);
    }
    public function update($id){
        $cajero =  Cajero::find($id);
        $cajero->update(request()->all());
        return response()->json($cajero, 200);
    }
    public function destroy($id){
        $cajero = Cajero::find($id);
        $cajero->delete();
        return response()->json(['exito'=>'Cajero eliminado con id: ' . $cajero->id], 200);
    }
    public function cajerosUser(){
        return response()->json(User::has('cajero')->orderBy('nombres', 'asc')->get());
    }

}
