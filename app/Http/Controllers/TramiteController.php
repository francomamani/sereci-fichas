<?php

namespace App\Http\Controllers;

use App\Tramite;

class TramiteController extends Controller
{
    public function index(){
        return response()->json(Tramite::orderBy('id', 'desc')->get(), 200);
    }
    public function show($id){
        return response()->json(Tramite::find($id), 200);
    }
    public function store(){
        $tramite = Tramite::create(request()->all());
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
