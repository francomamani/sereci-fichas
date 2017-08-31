<?php

namespace App\Http\Controllers;

use App\Detalle;

class DetalleController extends Controller
{
    public function index(){
        return response()->json(Detalle::get(), 200);
    }
    public function store(){
        $detalle = Detalle::create(request()->all());
        return response()->json($detalle, 201);
    }
    public function update($id){
        $detalle = Detalle::find($id);
        $detalle->update(request()->all());
        return response()->json($detalle, 200);
    }
    public function destroy($id){
        $detalle = Detalle::find($id);
        $detalle->delete();
        return response()->json(['exito'=>'Detalle eliminado exitosamente con id: ' . $detalle->id], 200);
    }
}
