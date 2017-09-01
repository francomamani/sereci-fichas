<?php

namespace App\Http\Controllers;

use App\Articulo;
use Illuminate\Http\Request;

class ArticuloController extends Controller
{
    public function index()
    {
        return response()->json(Articulo::with('normativa')->orderByDesc('articulos.id')->get(), 200);
    }

    public function store(Request $request)
    {
        return response()->json(Articulo::create($request->all()), 201);
    }

    public function show($id)
    {
        return response()->json(Articulo::find($id), 200);
    }

    public function update(Request $request, $id)
    {
        $articulo = Articulo::find($id);
        $articulo->update($request->all());
        return response()->json($articulo, 200);
    }

    public function destroy($id)
    {
        $articulo = Articulo::find($id);
        $articulo->delete();
        return response()->json(['exito'=>'Articulo eliminado satisfactoriamente con id: '. $articulo->id], 200);
    }
}
