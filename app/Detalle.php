<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Detalle extends Model
{
    use SoftDeletes;
    protected $table = 'detalles';
    protected $fillable = [
        'item_id',
        'articulo_id',
        'descripcion',
        'descripcion_adicional',
    ];
    protected $dates = ['deleted_at'];
    protected function item(){
        return $this->belongsTo('App\Item');
    }
    protected function articulo(){
        return $this->belongsTo('App\Articulo');
    }
}
