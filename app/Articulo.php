<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Articulo extends Model
{
    use SoftDeletes;
    protected $table = 'articulos';
    protected $fillable = [
        'numero',
        'descripcion',
        'inciso'
    ];
    protected $dates = ['deleted_at'];

    protected function normativa(){
        return $this->belongsTo('App\Normativa');
    }
    protected function detalles(){
        return $this->hasMany('App\Detalle');
    }
}
