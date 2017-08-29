<?php

namespace App\Http\Controllers;

use App\Video;

class VideoController extends Controller
{
    public function index(){
        return response()->json(Video::orderBy('id', 'desc')->get(), 200);
    }
    public function store(){
        $video = Video::create(request()->all());
        return response()->json($video, 201);
    }
    public function update($id){
        $video = Video::find($id);
        $video->update(request()->all());
        return response()->json($video, 200);
    }
    public function destroy($id){
        $video = Video::find($id);
        $video->delete();
        return response()->json(['exito'=>'Video eliminado exitosamente con id: ' . $video->id], 200);
    }
}
