<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Solicitante extends Model
{
    use SoftDeletes;
    protected $table = 'solicitantes';
    protected $fillable = [
        'nombres',
        'apellidos',
        'celular',
        'carnet'
    ];
    protected $dates = ['deleted_at'];
    public function tramites(){
        return $this->hasMany('App\Tramite');
    }
}
