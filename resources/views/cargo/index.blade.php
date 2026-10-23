<x-layout>

    <div class="container-fluid">

        {{-- 1. CABEÇALHO DA PÁGINA --}}
        <div class="d-sm-flex align-items-center justify-content-between mb-4 border-bottom pb-3">
            <h1 class="h3 mb-0 text-gray-800">
                <span class="font-weight-bold">Cargo</span> - Listar
            </h1>
            <a class="btn btn-primary btn-sm shadow-sm" href="{{ route('cargo.create') }}">
                <i class="fas fa-plus fa-sm text-white-50 mr-1"></i> Cadastrar Cargo
            </a>
        </div>

        {{-- 2. MENSAGENS DE ALERTAS --}}
        @if (session('success'))
            <div id="alert-success" class="alert alert-success alert-dismissible fade show shadow-sm" role="alert">
                <i class="fas fa-check-circle mr-1"></i> {{ session('success') }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <script>
                setTimeout(function(){
                    $("#alert-success").fadeOut(500, function(){ $(this).remove(); });
                }, 4000);
            </script>
        @endif

        @if (session('error'))
            <div id="alert-error" class="alert alert-danger alert-dismissible fade show shadow-sm" role="alert">
                <i class="fas fa-exclamation-circle mr-1"></i> {{ session('error') }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <script>
                setTimeout(function(){
                    $("#alert-error").fadeOut(500, function(){ $(this).remove(); });
                }, 4000);
            </script>
        @endif

        {{-- 3. CARD DE FILTROS DE PESQUISA --}}
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    <i class="fas fa-filter mr-1"></i> Filtros de Pesquisa
                </h6>
            </div>
            <div class="card-body">
                <form action="{{ route('cargo.index') }}" method="get" class="row align-items-end">
                    
                    {{-- Campo Título --}}
                    <div class="col-12 col-md-4 mb-3 mb-md-0">
                        <label class="font-weight-bold text-gray-700 small mb-1">Título:</label>
                        <input class="form-control" type="text" name="titulo" 
                               placeholder="Digite o título para buscar..." 
                               value="{{ request()->query('titulo') }}">
                    </div>

                    {{-- Campo Descrição --}}
                    <div class="col-12 col-md-4 mb-3 mb-md-0">
                        <label class="font-weight-bold text-gray-700 small mb-1">Descrição:</label>
                        <input class="form-control" type="text" name="descricao" 
                               placeholder="Digite a descrição para buscar..." 
                               value="{{ request()->query('descricao') }}">
                    </div>

                    {{-- Campo Status --}}
                    <div class="col-12 col-md-2 mb-3 mb-md-0">
                        <label class="font-weight-bold text-gray-700 small mb-1">Status:</label>
                        <select class="form-control" name="status">
                            <option value="" @selected(request()->query("status") === null || request()->query("status") === "")>Todos os Status</option>
                            <option value="1" @selected(request()->query("status") === "1")>Ativo</option>
                            <option value="0" @selected(request()->query("status") === "0")>Inativo</option>
                        </select>
                    </div>

                    {{-- Botões de Ação do Filtro --}}
                    <div class="col-12 col-md-2 d-flex">
                        <button type="submit" class="btn btn-primary mr-2 flex-grow-1" title="Pesquisar">
                            <i class="fas fa-search fa-sm mr-1"></i> Pesquisar
                        </button>
                        <a href="{{ route('cargo.index') }}" class="btn btn-secondary" title="Limpar Filtros">
                            <i class="fas fa-undo fa-sm"></i>
                        </a>
                    </div>

                </form>
            </div>
        </div>

{{-- 4. CARD DA TABELA DE DADOS (COMPACTO) --}}
<div class="card shadow mb-4">
    <div class="card-header py-2">
        <h6 class="m-0 font-weight-bold text-primary">
            <i class="fas fa-list mr-1"></i> Registros Cadastrados
        </h6>
    </div>
    <div class="card-body p-0">
        <div class="table-responsive">
            {{-- Adicionada a classe "table-sm" aqui --}}
            <table class="table table-sm table-hover table-striped align-middle mb-0">
                <thead class="thead-light">
                    <tr>    
                        <th class="pl-3 py-2" style="width: 25%;">Título</th>
                        <th class="py-2" style="width: 45%;">Descrição</th>
                        <th class="text-center py-2" style="width: 15%;">Status</th>
                        <th class="text-center py-2" style="width: 15%;">Ações</th>  
                    </tr>
                </thead>
                <tbody>
                    @forelse($cargos as $cargo) 
                        <tr>
                            {{-- Título --}}
                            <td class="pl-3 align-middle font-weight-bold text-dark">
                                {{ $cargo->titulo }}
                            </td>

                            {{-- Descrição --}}
                            <td class="align-middle text-muted small">
                                {{ Str::limit($cargo->descricao, 90, '...') }}
                            </td>

                            {{-- Status --}}
                            <td class="align-middle text-center">
                                @if($cargo->status == 1)
                                    <span class="badge badge-success px-2 py-1">
                                        <i class="fas fa-check-circle mr-1"></i> Ativo
                                    </span>
                                @else
                                    <span class="badge badge-secondary px-2 py-1">
                                        <i class="fas fa-minus-circle mr-1"></i> Inativo
                                    </span>
                                @endif
                            </td>

                            {{-- Ações --}}
                            <td class="align-middle text-center py-1">
                                <div class="btn-group" role="group">
                                    <a href="{{ route('cargo.show', $cargo->id) }}" class="btn btn-sm btn-info py-0 px-2" title="Visualizar">
                                        <i class="fas fa-eye fa-xs"></i>
                                    </a>
                                    <a href="{{ route('cargo.edit', $cargo->id) }}" class="btn btn-sm btn-warning py-0 px-2" title="Editar">
                                        <i class="fas fa-edit fa-xs"></i>
                                    </a>
                                    <button type="button" class="btn btn-sm btn-danger py-0 px-2 btn-inativar" 
                                            data-id="{{ $cargo->id }}" 
                                            data-toggle="modal" 
                                            data-target="#modalInativar" 
                                            title="Inativar">
                                        <i class="fas fa-trash fa-xs"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>    
                    @empty
                        <tr>
                            <td colspan="4" class="text-center py-3 text-muted">
                                <i class="fas fa-folder-open fa-lg mb-1 d-block"></i>
                                Nenhum registro encontrado.
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    

    {{-- Rodapé --}}
    <div class="card-footer d-flex flex-column flex-md-row justify-content-between align-items-center py-2">
        <div class="small text-muted mb-2 mb-md-0">
            Mostrando {{ $cargos->firstItem() ?? 0 }} até {{ $cargos->lastItem() ?? 0 }} de {{ $cargos->total() }} resultados
        </div>
        <div>
            {{ $cargos->withQueryString()->links() }}
        </div>
        

    </div>




    



</div>




    {{-- MODAL DE INATIVAÇÃO --}}
    <div class="modal fade" id="modalInativar" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title">
                        <i class="fas fa-exclamation-triangle mr-1"></i> Inativar Cargo?
                    </h5>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Esse registro será <strong>inativado</strong>. Deseja realmente continuar?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <form id="formInativar" method="POST" action="">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger">Sim, inativar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('formInativar');
        document.querySelectorAll('.btn-inativar').forEach(btn => {
            btn.addEventListener('click', function() {
                let id = this.getAttribute('data-id');
                form.action = "/cargo/" + id;
            });
        });
    });
    </script>

</x-layout>