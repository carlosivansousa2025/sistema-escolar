<x-layout>
   
    <div class="container-fluid">
        
        <div class="row">
            {{-- CABEÇALHO --}}
            <div class="col-12 d-flex justify-content-between align-items-end border-bottom border-secondary py-3">
                <h3 class="my-0"> <span class="font-weight-bold"> Disciplina </span> - Visualizar Disciplina</h3>
                <a class="btn btn-primary" href="{{ route('disciplina.index') }}"> Listar Disciplina</a>
            </div>

            <div class="col-12 my-4">
                <div class = "row">

                    {{-- LINHA 1: 4 CAMPOS = 10 COLUNAS (3+3+2+2) --}}
                    <div class="row align-items-start">
                        
                    
                       <div class="col-12 col-md-6 col-lg-3">
                            <div class="form-group mb-3">
                                <label class="mb-1 small">Nome:</label>
                                <input id="nome" class="form-control" type="text" 
                                       name="nome" value="{{ $modelDisciplina->nome }}" readonly>
                            </div>
                        </div>

                        <div class="col-12 col-md-6 col-lg-3">
                            <div class="form-group mb-3">
                                <label class="mb-1 small">Descricao</label>
                                <input id="descricao" class="form-control" type="text" 
                                       name="descricao" value="{{ $modelDisciplina->descricao }}" readonly>
                            </div>
                        </div>



                        <div class="col-12 col-md-6 col-lg-2">
                            <div class="form-group mb-3">
                                <label class="mb-1 small">Status:</label>
                                   <input id="status" class="form-control" type="text" 
                                           name="status" value="{{ $modelDisciplina->status == 1 ? 'Ativo' : 'Inativo' }}" readonly>
                            </div>
                        </div>


                        <div class="col-12 col-md-6 col-lg-8">
                            <div class="form-group mb-3">
                                <label class="mb-1 small">Observacao</label>
                                <textarea id="observacao" rows="4" class="form-control" name="observacao" readonly>{{$modelDisciplina->observacao}}</textarea>
                            </div>
                        </div>

                      
                            {{-- LINHA de botoes --}}
                            <div class="col-12 col-lg-2">
                                <div class="form-group mb-3 d-flex flex-column position-relative" style="margin-top: 38px;">
                                    
                                    {{-- Painel translúcido cobrindo os botões --}}
                                    <div style="
                                        position: absolute;
                                        top: 0;
                                        left: 0;
                                        width: 100%;
                                        height: 100%;
                                        background-color: rgba(255, 255, 255, 0.65);
                                        backdrop-filter: blur(2px);
                                        z-index: 10;
                                        border-radius: 6px;
                                        cursor: not-allowed;
                                    " title="Ação indisponível nesta visualização"></div>

                                    {{-- Botões --}}
                                    <button class="btn btn-primary mb-2 w-100" disabled>Salvar</button>
                                    <a href="{{ route('disciplina.index') }}" class="btn btn-danger w-100">Voltar</a>
                                </div>
                            </div>
                      


                    </div>    
                    
                </div>
            </div>
        </div>
    </div>

</x-layout>