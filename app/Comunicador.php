<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Comunicador extends Model
{
    use SoftDeletes;
    protected $table = 'comunicadores';
    protected $fillable = ['user_id'];
    protected $dates = ['deleted_at'];
    public function user(){
        return $this->belongsTo('App\User');
    }
}