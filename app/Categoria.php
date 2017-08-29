<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Categoria extends Model
{
    use SoftDeletes;
    protected $table = "categorias";
    protected $fillable = [
        'descripcion',
        'acronimo',
        'prioridad'
    ];
    protected $dates = ['deleted_at'];
    public function agencia(){
        return $this->belongsTo('App\Agencia');
    }
    public function fichas(){
        return $this->hasMany('App\Ficha');
    }
    public function asignacionCategorias(){
        return $this->hasMany('App\AsignacionCategoria');
    }
}