<?php

namespace App\Http\Controllers;

use App\Video;

class VideoController extends Controller
{
    public function index(){
        return response()->json(Video::orderBy('id', 'desc')->get(), 200);
    }
    public function store(){
        $descripcion = "something!";
        $habilitado = true;
        $user_id = 1;
        $rol = 'administrador';
        if (request()->hasFile('video')){
            $path = request()->file('video')->store('videos');
            $video = new Video();
            $video->descripcion = $descripcion;
            $video->habilitado = $habilitado;
            //$video->url = 'videos/' . $filename;
            $video->url = $path;
            $video->user_id = $user_id;
            $video->rol = $rol;
            $video->save();
            return response()->json($video, 201);
        }else{
            return response()->json(['error'=>'error uploading...'],200);
        }

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
