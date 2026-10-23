<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TipoConteudo extends Model
{
    protected $table = "tipo_conteudo";
    protected $fillable = ["tipo","status"];
}
