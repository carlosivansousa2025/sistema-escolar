<?php

namespace App\Http\Controllers;

use App\Models\Cargo;
use Illuminate\Http\Request;
use App\Http\Requests\CargoRequest;

class CargoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        
       $titulo      = $request->query('titulo');
       $descricao  = $request->query('descricao');       
       $status      = strlen($request->query('status')) > 0 ? [$request->query('status')] : [0,1];



       $cargos = Cargo::where('titulo', 'LIKE','%'.$titulo.'%')
                            ->where('descricao', 'LIKE','%'.$descricao.'%')
                            ->whereIn('status', $status)
                            ->paginate(6);

       return view('cargo.index',compact("cargos"));



    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('cargo.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(CargoRequest $request)
    {
        $cargo = Cargo::create([
            'titulo' => $request['titulo'],
            'descricao' => $request['descricao'],            
            'status' => $request['status']

        ]);

        if($cargo)
            {
                return redirect()->route('cargo.index')
                                 ->with('success', 'Cargo criado com sucesso!');
            }
            else
            {
                return redirect()->route('cargo.index')
                                 ->with('error', 'Erro ao criar cargo!');
            }
    }


    /**
     * Display the specified resource.
     */
    public function show(Cargo $cargo)
    {
        return view('cargo.view',[
            'modelCargo' => $cargo
                
        ]);       
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Cargo $cargo)
    {
        return view('cargo.update',[
            'modelCargo' => $cargo
                
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(CargoRequest $request, Cargo $cargo)
    {
        $cargo = $cargo->update([
            'titulo' => $request['titulo'],
            'descricao' => $request['descricao'],            
            'status' => $request['status']

        ]);

        if($cargo)
            {
                return redirect()->route('cargo.index')
                                 ->with('success', 'Cargo atualizado com sucesso!');
            }
            else
            {
                return redirect()->route('cargo.index')
                                 ->with('error', 'Nao foi possivel atualiar o cargo!');
            }
    }
    
        //
    

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Cargo $cargo)
    {
        //
    }
}
