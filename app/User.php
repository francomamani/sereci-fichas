<?php

namespace App;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;
    use SoftDeletes;
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'cuenta', 'password', 'nombres', 'apellidos', 'carnet', 'celular', 'tipo', 'activo'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
    ];

    public function comunicador(){
        return $this->hasOne('App\Comunicador');
    }
    public function administrador(){
        return $this->hasOne('App\Administrador');
    }
    public function cajero(){
        return $this->hasOne('App\Cajero');
    }
}