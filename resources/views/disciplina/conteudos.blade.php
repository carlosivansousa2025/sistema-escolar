<x-layout>
   
    <div class="container-fluid">
        
        <div class="row">
            {{-- CABEÇALHO --}}
            <div class="col-10 d-flex justify-content-between align-items-end border-bottom border-secondary py-1">
                <h5 class="my-0"> <span class="font-weight-bold"> Disciplina </span> - Cadastrar Conteudo</h5>
                <a class="btn btn-primary" href="{{ route('disciplina.index') }}"> Listar Disciplinas</a>
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

            
            <div class="col-10 my-2">
                <form class="row" action="{{ route('disciplina.add-conteudo') }}" method="post">
                    @csrf
                    <div class="col-12">

                         <div class="row conteudos-adicionados"> 
                             <div class="col-12">
                                     <h5>Conteúdos Adicionados</h5>
                             </div>
                            @foreach ($modelDisciplina->conteudos as $conteudo )
                                <div class="col-12 card my-2">
                                    <div class="card-body row">
                                       <div class="col-7 form-group">
                                           <label for="titulo">Titulo</label>
                                           <input class="form-control" name="titulo[]"type="text" id="titulo"
                                           value="{{ $conteudo->titulo }}" required>
                                       </div>

                                       <div class="col-5 form-group">
                                           <label for="tipo_conteudo">Tipo de Conteudo</label>
                                           <select class = "form-control" name="tipo_conteudo[]" id="tipo_conteudo" required>
                                               @foreach ($tipoConteudo as $tipo )
                                                  <option value="{{$tipo->id}}" @selected($tipo->id==$conteudo->id_tipo) > {{ $tipo->tipo}}</option>
                                               @endforeach
                                           </select>
                                       </div>                                            

                                       <div class="col-2 form-group">
                                           <label for="titulo">Status</label>
                                           <select class = "form-control" name="status[]" id="status">
                                               <option value="1" @selected($conteudo->status==1) >Ativo</option>
                                               <option value="0" @selected($conteudo->status==0) >Inativo</option>
                                           </select>
                                       </div>

                                       <div class="col-10 form-group">
                                           <label for="titulo">Descricao</label>
                                           <input class="form-control" type="text" name="descricao[]" id="descricao"
                                           value="{{ $conteudo->descricao }}" required>
                                       </div>

                                       <div class="col-12 form-group">
                                           <label for="">Observacao</label>
                                           <textarea class="form-control" name="observacao" id="observacao" rows="1">{{ $conteudo->observacao}}</textarea>
                                       </div>
                                       <div>
                                           <input type="hidden" name="id" value {{$conteudo->id}}>
                                           <input type="hidden" name="foi_excluido[]" value="0">
                                       </div>
                                    </div>
                                </div>
                            @endforeach
                         </div>
                       <div class="row conteudos novos my-3"> 

                           <div class="col-12">  
                            
                           
                                <div class="row"> 
                                    <div class="col-12 d-flex justify-content-between align-items-end"  >
                                        <h5>Novos Conteúdos</h5>
                                        <button class="btn btn-primary" type="button" id="btn-add-conteudo">Adicionar Conteudo</button>
                                    </div>
                                </div>

                              
                                
                                <div class="row d-none conteudo-modelo">
                                    <div  class="col-12 card my-2"> 
                                        <div class="card-body row">
                                            <div class="col-7 form-group">
                                                <label for="titulo">Titulo</label>
                                                <input name="titulo[]" class="form-control" type="text">
                                            </div>

                                            <div class="col-5 form-group">
                                                <label for="tipo_conteudo">Tipo de Conteudo</label>
                                                <select class = "form-control" name="tipo_conteudo[]" id="tipo_conteudo" required>
                                                    @foreach ($tipoConteudo as $tipo )
                                                    <option value="{{$tipo->id}}" > {{ $tipo->tipo}}</option>
                                                    @endforeach
                                                </select>
                                            </div>                                            

                                            <div class="col-2 form-group">
                                                <label for="status">Status</label>
                                                <select class = "form-control" name="status[]" id="">
                                                    <option value="">Ativo</option>
                                                    <option value="">Inativo</option>
                                                </select>
                                            </div>

                                            <div class="col-10 form-group">
                                                <label for="titulo">Descricao</label>
                                                <input class="form-control" name="descricao[]" type="text">
                                            </div>

                                            <div class="col-12 form-group">
                                                <label for="">Observacao</label>
                                                <textarea class="form-control" name="observacao[]" id="" rows="2"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                                <div class="col-12">
                                    <div class="row campos-novos">

                                    </div>

                                </div>
                                
                            </div>

                         </div>
                    </div>
                </form>
            </div>






        </div>
    </div>

</x-layout>