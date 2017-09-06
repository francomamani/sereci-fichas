<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tramite extends Model
{
    protected $table = "tramites";
    protected $fillable = [
        'ficha_id',
        'ventanilla_id',
        'cajero_id',
        'categoria_tramite_id',
        'solicitud_autorizacion_id',
        'glosa',
    ];
    protected $dates = ['deleted_at'];
    public function tipoTramite(){
        return $this->belongsTo('App\TipoTramite');
    }
    public function solicitante(){
        return $this->belongsTo('App\Solicitante');
    }
    public function ficha(){
        return $this->belongsTo('App\Tramite');
    }
    public function cajero(){
        return $this->belongsTo('App\Cajero');
    }
    public function solicitudAutorizacion(){
        return $this->belongsTo('App\SolicitudAutorizacion');
    }
    public function partidas(){
        return $this->hasMany('App\Partida');
    }
    public function items(){
        return $this->hasMany('App\Item');
    }
    public function recepcionTramites(){
        return $this->hasMany('App\RecepcionTramite');
    }
    public function inscrito(){
        return $this->belongsTo('App\Inscrito');
    }

}
