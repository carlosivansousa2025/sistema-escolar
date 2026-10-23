<x-layout>

    <div class="container-fluid">

        <div class="row">
            {{-- CABEÇALHO --}}
            <div class="col-12 d-flex justify-content-between align-items-center border-bottom border-secondary pb-3 my-3">
                <h3 class="my-0">
                    <span class="font-weight-bold">Tipo Conteúdo</span> - Detalhes
                </h3>
                <a class="btn btn-primary btn-sm shadow-sm" href="{{ route('tipo-conteudo.index') }}">
                    <i class="fas fa-arrow-left fa-sm text-white-50 mr-1"></i> Voltar para a Lista
                </a>
            </div>

            {{-- CONTEÚDO EM CARD --}}
            <div class="col-12 my-2">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Informações do Registro</h6>
                    </div>
                    <div class="card-body">
                        <div class="row align-items-center">


                           <div class="col-12 col-md-6 mb-3 mb-md-0">
                                <label class="form-label font-weight-bold text-gray-800 small mb-1">Tipo de Conteúdo:</label>
                                <input type="text" class="form-control bg-light" 
                                       value="{{ $modelTipoConteudo->tipo }}" readonly disabled>
                            </div>

                            <div class="col-12 col-md-3">
                                <label class="form-label font-weight-bold text-gray-800 small mb-1 d-block">Status:</label>
                                <div>
                                    @if($modelTipoConteudo->status == 1)
                                        <span class="badge badge-success px-3 py-2">
                                            <i class="fas fa-check-circle mr-1"></i> Ativo
                                        </span>
                                    @else
                                        <span class="badge badge-danger px-3 py-2">
                                            <i class="fas fa-times-circle mr-1"></i> Inativo
                                        </span>
                                    @endif
                                </div>
                            </div>



                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</x-layout>