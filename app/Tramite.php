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
        'tipo_tramite_id',
        'descripcion'
    ];
    protected $dates = ['deleted_at'];
    public function tipoTramite(){
        return $this->belongsTo('App\TipoTramite');
    }
    public function ficha(){
        return $this->belongsTo('App\Tramite');
    }
    public function cajero(){
        return $this->belongsTo('App\Cajero');
    }
    public function ventanilla(){
        return $this->belongsTo('App\Ventanilla');
    }
}
