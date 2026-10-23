<x-layout>
   
    <div class="container-fluid">
        
        <div class="row">
            {{-- CABEÇALHO --}}
            <div class="col-12 d-flex justify-content-between align-items-end border-bottom border-secondary py-3">
                <h3 class="my-0"> <span class="font-weight-bold"> Disciplina </span> - Editar Disciplina</h3>
                <a class="btn btn-primary" href="{{ route('disciplina.index') }}"> Listar Disciplina</a>
            </div>
        
            {{-- ALERTA DE ERRO --}}
            <div class="col-6 my-2">
                @if ($errors->any())
                    <div class="alert alert-danger alert-dismissible fade show border-left-danger shadow-sm" role="alert">
                        <h6 class="font-weight-bold"><i class="fas fa-exclamation-triangle mr-1"></i> Ops! Corrija os erros abaixo:</h6>
                        <ul class="mb-0 pl-3">
                            @foreach($errors->all() as $error )
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                @endif

                @if(session('success'))
                    <div class="alert alert-success alert-dismissible fade show border-left-success shadow-sm" role="alert">
                        <i class="fas fa-check-circle mr-1"></i> {{ session('success') }}
                        <button type="button" class="close" data-dismiss="alert"><span>&times;</span></button>
                    </div>
                @endif
            </div>

            <div class="col-12 my-4">
                <form action="{{ route('disciplina.update',$modelDisciplina->id) }}" method="post">
                    @csrf
                    @method('put');

                    {{-- LINHA 1: 4 CAMPOS = 10 COLUNAS (3+3+2+2) --}}
                    <div class="row align-items-start">
                        
                    
                       <div class="col-12 col-md-6 col-lg-3">
                            <div class="form-group mb-3">
                                <label class="mb-1 small">Nome:</label>
                                <input id="nome" class="form-control @error('nome') is-invalid @enderror" type="text" 
                                       name="nome" value="{{ $modelDisciplina->nome }}">
                                @error('nome')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="col-12 col-md-6 col-lg-3">
                            <div class="form-group mb-3">
                                <label class="mb-1 small">Descricao</label>
                                <input id="descricao" class="form-control @error('descricao') is-invalid @enderror" type="text" 
                                       name="descricao" value="{{ $modelDisciplina->descricao }}">
                                @error('descricao')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>



                        <div class="col-12 col-md-6 col-lg-2">
                            <div class="form-group mb-3">
                                <label class="mb-1 small">Status:</label>
                                <select class="form-control @error('status') is-invalid @enderror" 
                                        name="status" id="status">
                                    <option value="">-</option>
                                    <option value="1" @selected($modelDisciplina->status == 1)>Ativo</option>
                                    <option value="0" @selected($modelDisciplina->status == 0)>Inativo</option>
                                </select>
                                @error('status')
                                   <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>


                        <div class="col-12 col-md-6 col-lg-8">
                            <div class="form-group mb-3">
                                <label class="mb-1 small">Observacao</label>
                                <textarea id="observacao" rows="4" class="form-control" name="observacao">{{$modelDisciplina->observacao}}</textarea>
                            </div>
                        </div>



                        {{-- LINHA 2: OBSERVACAO 10 + BOTOES 2 DO LADO --}}
                            <div class="col-12 col-lg-2">
                                <div class="form-group mb-3 d-flex flex-column" style="margin-top: 38px;">
                                    <button class="btn btn-primary mb-2 w-100">Salvar</button>
                                    <a href="{{ route('disciplina.index') }}" class="btn btn-danger w-100">Cancelar</a>
                                </div>
                            </div>

                    </div>    
                    
                </form>
            </div>
        </div>
    </div>

</x-layout>