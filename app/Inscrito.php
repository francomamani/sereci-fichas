<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Inscrito extends Model
{
    use SoftDeletes;
    protected $table = 'inscritos';
    protected $fillable = [
        'nombres',
        'apellidos'
    ];
    protected $dates = ['deleted_at'];
    public function tramites(){
        return $this->hasMany('App\Tramite');
    }

}
