<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class AsignacionCategoria extends Model
{
    use SoftDeletes;
    protected $table = 'asignacion_categorias';
    protected $fillable = [
        'categoria_id',
        'ventanilla_id'
    ];
    protected $dates = ['deleted_at'];
    public function ventanilla(){
        return $this->belongsTo('App\Ventanilla');
    }
    public function categoria(){
        return $this->belongsTo('App\Categoria');
    }
}
