<?php

namespace App\Http\Controllers;

use App\Example;
use App\Normativa;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ExampleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $formulario = $request->all();
        $nuevoRegistro = Example::create($formulario);
        return response()->json($formulario);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Example  $example
     * @return \Illuminate\Http\Response
     */
    public function show(Example $example)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Example  $example
     * @return \Illuminate\Http\Response
     */
    public function edit(Example $example)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Example  $example
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Example $example)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Example  $example
     * @return \Illuminate\Http\Response
     */
    public function destroy(Example $example)
    {
        //
    }
    /*
     * time of expiration to attend
     *
     * */
    public function test(){
        $current_date = Carbon::now()->subMinutes(5);
        $normativas = Normativa::whereDate('created_at', date('Y-m-d'))
                               ->where('created_at','<=', $current_date)
                               ->get();
        return response()->json($normativas);
    }
}
