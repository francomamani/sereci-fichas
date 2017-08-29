<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Ficha extends Model
{
    use SoftDeletes;
    protected $table = "fichas";
    protected $fillable = [
        'categoria_id',
        'numero',
        'estado_ficha'
    ];
    protected $dates = ['deleted_at'];
    public function categoria(){
        return $this->belongsTo('App\Categoria');
    }
    public function tramite(){
        return $this->hasOne('App\Tramite');
    }
}