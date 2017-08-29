<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Noticia extends Model
{
    use SoftDeletes;
    protected $table = 'noticias';
    protected $fillable = [
        'descripcion',
        'habilitado'
    ];
    protected $dates = ['deleted_at'];
}
