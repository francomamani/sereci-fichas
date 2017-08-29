<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Cajero extends Model
{
    use SoftDeletes;
    protected $table = "cajeros";
    protected $fillable = ['user_id'];
    protected $dates = ['deleted_at'];
    public function user(){
        return $this->belongsTo('App\User');
    }
    public function tramites(){
        return $this->hasMany('App\Tramite');
    }
    public function asignacionCategorias(){
        return $this->hasMany('App\AsignacionCategoria');
    }
    public function asignacionVentanillas(){
        return $this->hasMany('App\AsignacionVentanilla');
    }
}
