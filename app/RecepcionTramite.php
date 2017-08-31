<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class RecepcionTramite extends Model
{
    use SoftDeletes;
    protected $table = 'recepcion_tramites';
    protected $fillable = [
        'ventanilla_id',
        'tramite_id',
        'estado_tramite'
    ];
    protected $dates = ['deleted_at'];

    public function ventanilla(){
        return $this->belongsTo('App\Ventanilla');
    }
    public function tramite(){
        return $this->belongsTo('App\Tramite');
    }
}
