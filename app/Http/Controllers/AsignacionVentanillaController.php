<?php

namespace App\Http\Controllers;

use App\AsignacionVentanilla;
use Illuminate\Http\Request;

class AsignacionVentanillaController extends Controller
{
    public function index()
    {
        return response()->json(AsignacionVentanilla::with(['ventanilla', 'cajero.user'])
                                                    ->orderBy('id', 'desc')
                                                    ->get(), 200);
    }

    public function store(Request $request)
    {
        return response()->json(AsignacionVentanilla::create($request->all()), 201);
    }

    public function show($id)
    {
        return response()->json(AsignacionVentanilla::with(['ventanilla', 'cajero.user'])->find($id), 200);
    }

    public function update(Request $request, $id)
    {
        $asignacionVentanilla = AsignacionVentanilla::find($id);
        $asignacionVentanilla->update($request->all());
        return $this->show($id);
    }

    public function destroy(AsignacionVentanilla $asignacionVentanilla)
    {
        $asignacionVentanilla = AsignacionVentanilla::find($id);
        $asignacionVentanilla->delete();
        return response()->json(['exito'=>'Asignacion de ventanilla eliminado con id: ' . $asignacionVentanilla->id], 200);
    }
}
