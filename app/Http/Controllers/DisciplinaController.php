<?php

namespace App\Http\Controllers;

use App\Models\Disciplina;
use Illuminate\Http\Request;
use App\Http\Requests\DisciplinaRequest;
use App\Models\TipoConteudo;

class DisciplinaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
       $nome       = $request->query('nome');
       $descricao  = $request->query('descricao');       
       $status      = strlen($request->query('status')) > 0 ? [$request->query('status')] : [0,1];



       $disciplinas = Disciplina::where('nome', 'LIKE','%'.$nome.'%')
                            ->where('descricao', 'LIKE','%'.$descricao.'%')
                            ->whereIn('status', $status)
                            ->paginate(6);

       return view('disciplina.index',compact("disciplinas"));
       
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('disciplina.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(DisciplinaRequest $request)
    {
         $disciplina = Disciplina::create([
            'nome' => $request['nome'],
            'descricao' => $request['descricao'],            
            'status' => $request['status'],
            'observacao' => $request['observacao'],                        
            'dt_cadastro' => date('Y-m-d')

        ]);

        if($disciplina)
            {
                return redirect()->route('disciplina.index')
                                 ->with('success', 'Disciplina criada com sucesso!');
            }
            else
            {
                return redirect()->route('disciplina.index')
                                 ->with('error', 'Erro ao criar disciplina!');
            }
    }

    /**
     * Display the specified resource.
     */
    public function show(Disciplina $disciplina)
    {
       return view('disciplina.view',['modelDisciplina'=>$disciplina] ); 
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Disciplina $disciplina)
    {
        return view('disciplina.update',['modelDisciplina'=>$disciplina] );
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(DisciplinaRequest $request, Disciplina $disciplina)
    {
     $disciplina = $disciplina->update([
            'nome' => $request['nome'],
            'descricao' => $request['descricao'],            
            'status' => $request['status'],
            'observacao' => $request['observacao'],                        
            

        ]);

        if($disciplina)
            {
                return redirect()->route('disciplina.index')
                                 ->with('success', 'Disciplina atualizada com sucesso!');
            }
            else
            {
                return redirect()->route('disciplina.index')
                                 ->with('error', 'Erro ao atualizar disciplina!');
            }        

    }

    /**
     * Add content
     */
    public function conteudos(Disciplina $id)
    {
       $modelDisciplina = $id;
       $tipoConteudo = TipoConteudo::get();
       
       return view('disciplina.conteudos',compact('modelDisciplina','tipoConteudo')); 
    }

   /**
     * Add content
     */
    public function addConteudos(Request $request)
    {
       return view('disciplina.conteudos'); 
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Disciplina $disciplina)
    {
        //
    }


    
}
