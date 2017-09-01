<?php

namespace App\Http\Controllers;

use App\Video;
use Illuminate\Support\Facades\Storage;

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
    public function getInfoVideo($id){
        $video = Video::find($id);
        $file = Storage::url('app/'.$video->url);
        $size = Storage::size($video->url);
        return response()->json(compact('file','size'));
    }
    public function file($id){
        $video = Video::find($id);
        return response()->file(storage_path('app/' . $video->url));
    }
    public function download($id){
        $video = Video::find($id);
        return response()->download(storage_path('app/' . $video->url));
    }
    public function videoIds(){
        return response()->json(Video::select('id')->orderByDesc('id')->get());
    }
}
