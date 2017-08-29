<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TipoTramite extends Model
{
    protected $table = "tipo_tramites";
    protected $fillable = [
        'nombre',
        'descripcion'
    ];
    protected $dates = ['deleted_at'];
    public function tramites(){
        return $this->hasMany('App\Tramite');
    }
}
