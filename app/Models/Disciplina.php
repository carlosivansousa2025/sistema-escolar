<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Disciplina extends Model
{
    protected $table = 'disciplina';
    protected $fillable = ['nome', 'descricao','observacao','status','dt_cadastro' ];
    
    public function conteudos()
    {
        return $this->hasMany(Conteudo::class, 'id_disciplina','id');
    }
}
