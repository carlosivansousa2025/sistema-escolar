<x-layout>
   
    <div class="container-fluid">
        
        <div class="row">
            {{-- CABEÇALHO --}}
            <div class="col-12 d-flex justify-content-between align-items-end border-bottom border-secondary py-3">
                <h3 class="my-0"> <span class="font-weight-bold"> Curso </span> - Visualizar Cursos</h3>
                <a class="btn btn-primary" href="{{ route('curso.index') }}"> Listar Curso</a>
            </div>
        

            <div class="col-12 my-4">
                    {{-- LINHA 1: 4 CAMPOS = 10 COLUNAS (3+3+2+2) --}}
                    <div class="row align-items-start">
                        <div class="col-12 col-md-6 col-lg-3">
                            <div class="form-group mb-3">
                                <label class="mb-1 small">Nome:</label>
                                <input id="nome" class="form-control" type="text" value="{{ $modelCurso->nome }}" readonly>
                            </div>
                        </div>

                        <div class="col-12 col-md-6 col-lg-3">
                            <div class="form-group mb-3">
                                <label class="mb-1 small">Descricao:</label>
                                <input id="descricao" class="form-control" type="text" value="{{ $modelCurso->descricao }}" readonly>
                            </div>
                        </div>
                        
                        <div class="col-12 col-md-6 col-lg-2">
                            <div class="form-group mb-3">
                                <label class="mb-1 small">Preco:</label>
                                <input id="preco" class="form-control" type="text" value="{{ $modelCurso->preco }}" readonly>
                            </div>
                        </div>

                        <div class="col-12 col-md-6 col-lg-2">
                            <div class="form-group mb-3">
                                <label class="mb-1 small">Status:</label>
                                <input id="status" class="form-control" type="text"  
                                       value="{{ $modelCurso->status == 1 ? 'Ativo' : 'Inativo' }}" readonly>
                            </div>
                        </div>
                    </div>

                    {{-- LINHA 2: OBSERVACAO 10 + BOTOES 2 DO LADO --}}
                    <div class="row align-items-start">
                        <div class="col-12 col-lg-10">    
                           <div class="form-group mb-3">
                               <label class="mb-1 small">Observacao</label>
                               <textarea id="observacao" class="form-control" rows="4"  readonly>{{ $modelCurso->observacao }}</textarea>  
                           </div>
                        </div>
                    </div>

            </div>
        </div>
    </div>

</x-layout>