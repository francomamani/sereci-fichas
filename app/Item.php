<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Item extends Model
{
    use SoftDeletes;
    protected $table = 'items';
    protected $fillable = [
        'tramite_id',
        'descripcion',
    ];
    protected $dates = ['deleted_at'];
    protected function tramite(){
        return $this->belongsTo('App\Tramite');
    }
    protected function detalles(){
        return $this->hasMany('App\Detalle');
    }
}
