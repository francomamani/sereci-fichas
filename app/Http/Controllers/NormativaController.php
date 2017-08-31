<?php

namespace App\Http\Controllers;

use App\Normativa;
use Illuminate\Http\Request;

class NormativaController extends Controller
{
    public function index()
    {
        return response()->json(Normativa::orderByDesc('id')->get(), 200);
    }

    public function store(Request $request)
    {
        return response()->json(Normativa::create($request->all()), 201);
    }

    public function show($id)
    {
        return response()->json(Normativa::find($id), 200);
    }

    public function update(Request $request, $id)
    {
        $normativa = Normativa::find($id);
        if ($request->input('vigente')==false){
            $normativa->codigo = $request->input('codigo');
            $normativa->descripcion = $request->input('descripcion');
            $normativa->vigente = $request->input('vigente');
            $normativa->fecha_baja = date('Y-m-d');
            $normativa->save();
        }else{
            $normativa->update($request->all());
        }
        return response()->json($normativa, 200);

    }

    public function destroy($id)
    {
        $normativa = Normativa::find($id);
        $normativa->delete();
        return response()->json(['exito'=>'Normativa eliminada satisfactoriamente con id: '. $normativa->id], 200);
    }
}
