<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Ventanilla extends Model
{
    use SoftDeletes;
    protected $table = 'ventanillas';
    protected $fillable = ['numero'];
    protected $dates = ['deleted_at'];

    public function asignacionCategorias(){
        return $this->hasMany('App\AsignacionCategoria');
    }
    public function tramites(){
        return $this->hasMany('App\Tramite');
    }
    public function asignacionVentanillas(){
        return $this->hasMany('App\AsignacionVentanilla');
    }

}
