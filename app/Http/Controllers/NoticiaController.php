<?php

namespace App\Http\Controllers;

use App\Noticia;
use Illuminate\Http\Request;

class NoticiaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(Noticia::orderBy('id', 'desc')->get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return response()->json(Noticia::create($request->all()));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return response()->json(Noticia::find($id));
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $noticia = Noticia::find($id);
        $noticia->update($request->all());
        return response()->json($noticia);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $noticia = Noticia::find($id);
        $noticia->delete();
        return response()->json(['exito'=>'Notica eliminada exitosamente con id:'.$noticia->id]);
    }

    public function noticiasHabilitadas(){
        $habilitados= Noticia::where('habilitado', true)
                            ->orderBy('id','desc')
                            ->get();
        return response()->json($habilitados);
    }
    public function noticiasDeshabilitadas(){
        $deshabilitados= Noticia::where('habilitado', false)
                                ->orderBy('id','desc')
                                ->get();
        return response()->json($deshabilitados);

    }
}
