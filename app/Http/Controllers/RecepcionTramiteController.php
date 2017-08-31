<?php

namespace App\Http\Controllers;

use App\RecepcionTramite;

class RecepcionTramiteController extends Controller
{
    public function index(){
        return response()->json(RecepcionTramite::orderByDesc('desc')->get(), 200);
    }
    public function store(){
        $recepcion_tramite = RecepcionTramite::create(request()->all());
        return response()->json($recepcion_tramite, 201);
    }
    public function update($id){
        $recepcion_tramite = RecepcionTramite::find($id);
        $recepcion_tramite->update(request()->all());
        return response()->json($recepcion_tramite, 200);
    }
    public function destroy($id){
        $recepcion_tramite = RecepcionTramite::find($id);
        $recepcion_tramite->delete();
        return response()->json(['exito'=>'Recepcion de Tramite eliminado exitosamente con id: '. $recepcion_tramite->id], 200);
    }
}
