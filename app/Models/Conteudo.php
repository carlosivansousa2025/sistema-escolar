<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Conteudo extends Model
{
    protected $table = "conteudo";
    protected $fillable = ['titulo', 'descricao', 'status','observacao','id_disciplina','id_tipo'];
}
