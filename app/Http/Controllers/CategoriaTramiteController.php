<?php

namespace App\Http\Controllers;

use App\CategoriaTramite;
use Illuminate\Http\Request;

class CategoriaTramiteController extends Controller
{
    public function index()
    {
        return response()->json(CategoriaTramite::with('tipoTramite')->orderByDesc('id')->get());
    }

    public function store(Request $request)
    {
        return response()->json(CategoriaTramite::create($request->all()), 201);
    }

    public function show($id)
    {
        return response()->json(CategoriaTramite::find($id));
    }

    public function update(Request $request, $id)
    {
        $categoria_tramite = CategoriaTramite::find($id);
        $categoria_tramite->update($request->all());
        return response()->json($categoria_tramite, 200);

    }

    public function destroy($id)
    {
        $categoria_tramite = CategoriaTramite::find($id);
        $categoria_tramite->delete();
        return response()->json(['exito'=>'Categoria de Tramite eliminado satisfactoriamente con id: '. $categoria_tramite->id], 200);
    }
}
