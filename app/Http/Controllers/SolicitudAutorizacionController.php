<?php

namespace App\Http\Controllers;

use App\SolicitudAutorizacion;

class SolicitudAutorizacionController extends Controller
{
    public function index(){
        return response()->json(SolicitudAutorizacion::orderBy('id', 'desc')->get(), 200);
    }
    public function show($id){
        return response()->json(SolicitudAutorizacion::find($id), 200);
    }
    public function store(){
        $solicitud_autorizacion = SolicitudAutorizacion::create(request()->all());
        return response()->json($solicitud_autorizacion, 201);
    }
    public function update($id){
        $solicitud_autorizacion =  SolicitudAutorizacion::find($id);
        $solicitud_autorizacion->update(request()->all());
        return response()->json($solicitud_autorizacion, 200);
    }
    public function destroy($id){
        $solicitud_autorizacion = SolicitudAutorizacion::find($id);
        $solicitud_autorizacion->delete();
        return response()->json(['exito'=>'Solicitud de Autorizacion eliminado con id: ' . $solicitud_autorizacion->id], 200);
    }
}
