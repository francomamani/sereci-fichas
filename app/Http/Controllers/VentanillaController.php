<?php

namespace App\Http\Controllers;

use App\Ventanilla;
use Illuminate\Http\Request;

class VentanillaController extends Controller
{
    public function index()
    {
        return response()->json(Ventanilla::orderBy('numero', 'asc')->get());
    }

    public function store(Request $request)
    {
        return response()->json(Ventanilla::create($request->all()), 200);
    }

    public function show($id)
    {
        return response()->json(Ventanilla::find($id), 200);
    }

    public function update(Request $request, $id)
    {
        $ventanilla = Ventanilla::find($id);
        $ventanilla->update($request->all());
        return response()->json($ventanilla, 200);
    }

    public function destroy($id)
    {
        $ventanilla = Ventanilla::find($id);
        $ventanilla->delete();
        return response()->json(['exito'=>'Ventanilla eliminada exitosamente'], 200);
    }
}