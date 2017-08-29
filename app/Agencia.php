<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Agencia extends Model
{
    use SoftDeletes;
    protected $table = 'agencias';
    protected $fillable = [
        'nombre',
        'direccion',
        'habilitado'
    ];
    protected $dates = ['deleted_at'];
    public  function categorias(){
        return $this->hasMany('App\Categoria');
    }
}