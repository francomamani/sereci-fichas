<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class AsignacionVentanilla extends Model
{
    use SoftDeletes;
    protected $table = 'asignacion_ventanillas';
    protected $fillable = [
        'ventanilla_id',
        'cajero_id',
        'activo',
    ];
    protected $dates = ['deleted_at'];
    public function ventanilla(){
        return $this->belongsTo('App\Ventanilla');
    }
    public function cajero(){
        return $this->belongsTo('App\Cajero');
    }
}
