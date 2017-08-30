<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CategoriaTramite extends Model
{
    use SoftDeletes;
    protected $table = 'categoria_tramites';
    protected $fillable = [
        'tipo_tramite_id',
        'descripcion',
        'duracion_horas',
    ];
    protected $dates = ['deleted_at'];

    public function tipoTramite(){
        return $this->belongsTo('App\TipoTramite');
    }
    public function tramites(){
        return $this->hasMany('App\Tramite');
    }
}
