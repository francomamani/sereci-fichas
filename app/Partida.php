<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Partida extends Model
{
    protected $table = 'partidas';
    protected $fillable = [
        'tramite_id',
        'num_registro',
        'orc',
        'libro',
        'num_partida',
        'fecha_inscripcion',
        'departamento',
        'estado_partida'
    ];
    protected $dates = ['deleted_at'];
    protected function tramite(){
        return $this->belongsTo('App\Tramite');
    }
}
