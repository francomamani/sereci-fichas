<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Articulo extends Model
{
    use SoftDeletes;
    protected $table = 'articulos';
    protected $fillable = [
        'normativa_id',
        'numero',
        'descripcion',
        'inciso'
    ];
    protected $dates = ['deleted_at'];

    public function normativa(){
        return $this->belongsTo('App\Normativa');
    }
    public  function detalles(){
        return $this->hasMany('App\Detalle');
    }

}
