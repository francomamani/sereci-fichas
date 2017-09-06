<?php

namespace App\Http\Controllers;

use App\Inscrito;

class InscritoController extends Controller
{
    public function index(){
        return response()->json(Inscrito::orderBy('descripcion')->get(), 200);
    }
    public function show($id){
        return response()->json(Inscrito::find($id), 200);
    }
    public function store(){
        $inscrito = Inscrito::create(request()->all());
        return response()->json($inscrito, 201);
    }
    public function update($id){
        $inscrito = Inscrito::find($id);
        $inscrito->update(request()->all());
        return response()->json($inscrito, 200);
    }
    public function destroy($id)
    {
        $inscrito = Inscrito::find($id);
        $inscrito->delete();
        return response()->json(['exito' => 'Inscrito eliminado exitosamente con id: ' . $inscrito->id], 200);
    }

    public function buscar() {
        $response = null;
        $busqueda_inscrito = request()->input('busqueda_inscrito');
        $inscritos = Inscrito::where('nombres', 'like', '%'. $busqueda_inscrito .'%')
                             ->orWhere('apellidos', 'like', '%'. $busqueda_inscrito.'%')
                             ->orderBy('nombres')
                             ->get()->toArray();
        if(!empty($inscritos)){
            $response = $inscritos;
        }else {
            $response = [
                'error' => 'El inscrito ' . $busqueda_inscrito . ' no esta registrado T_T',
                'code' => 404
            ];
        }
        return response()->json($response);
    }
}
