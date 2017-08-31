<?php

namespace App\Http\Controllers;

use App\Item;

class ItemController extends Controller
{
    public function index(){
        return response()->json(Item->get(), 200);
    }
    public function store(){
        $item = Item::create(request()->all());
        return response()->json($item, 201);
    }
    public function update($id){
        $item = Item::find($id);
        $item->update(request()->all());
        return response()->json($item, 200);
    }
    public function destroy($id){
        $item = Item::find($id);
        $item->delete();
        return response()->json(['exito'=>'Item eliminado exitosamente con id: '. $item->id], 200);
    }
}
