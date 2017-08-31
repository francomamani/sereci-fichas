<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Normativa extends Model
{
    protected $table = 'normativas';
    protected $fillable = [
        'codigo',
        'descripcion',
        'vigente',
        'fecha_baja'
    ];
    protected $dates = ['deleted_at'];
    protected function articulos(){
        return $this->hasMany('App\Articulo');
    }
}
