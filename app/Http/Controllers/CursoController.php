<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Curso;
use App\Http\Requests\CursoRequest;


class CursoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        //dd($request);
        $nome = !empty($request->query("nome")) ? $request->query("nome") :  '' ;
        $descricao = !empty($request->query("descricao")) ? $request->query("descricao") :  '' ;
        $status = strlen($request->query("status")) > 0 ? [$request->query("status")] : [0,1] ;
        

        $cursos = Curso::where('nome','LIKE','%'.$nome.'%')
        ->where('descricao','LIKE','%'.$descricao.'%')
        ->whereIn('status',$status)
        ->paginate(6);
              
        return view('curso.index', [
            'cursos' => $cursos
            ]);

    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('curso.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(CursoRequest $request)
    {
       //dd($request);
       $cursoCadastraodo = Curso::create([
                                'nome'        => $request['nome'],
                                'descricao'   => $request['descricao'],
                                'status'      => $request['status'],
                                'preco'       => $request['preco'],
                                'observacao'  => $request['observacao'],
                                'dt_cadastro' => date('Y-m-d')  //'dt_cadastro' => now()
       ]);
       
        if($cursoCadastraodo)
        {
            return redirect()->route('curso.index')->with('success', 'Curso cadastrado com sucesso!');
        
        } 
        else
        {
            return redirect()->route('curso.create')->with('error', 'Erro ao cadastrar curso!');
        }

    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $modelCurso = Curso::find($id);
        dd($modelCurso);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
