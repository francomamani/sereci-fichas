<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SolicitudAutorizacion extends Model
{
    use SoftDeletes;
    protected $table = 'solicitud_autorizaciones';
    protected $fillable = [
        'rectificacion',
        'complementacion',
        'ratificacion',
        'cambio',
        'cancelacion',
        'reposicion',
        'traspaso'
    ];
    protected $dates = ['deleted_at'];

    public function tramite(){
        return $this->hasOne('App\Tramite');
    }
}
