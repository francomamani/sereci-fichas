<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Video extends Model
{
    use SoftDeletes;
    protected $table = "videos";
    protected $fillable = [
        'descripcion',
        'habilitado',
        'url'
    ];
    protected $dates = ['deleted_at'];

}
