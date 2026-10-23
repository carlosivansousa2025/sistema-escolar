<x-layout>

    <div class="container-fluid">

        {{-- 1. CABEÇALHO DA PÁGINA --}}
        <div class="d-sm-flex align-items-center justify-content-between mb-4 border-bottom pb-3">
            <h1 class="h3 mb-0 text-gray-800">
                <span class="font-weight-bold">Disciplina</span> - Listar
            </h1>
            <a class="btn btn-primary btn-sm shadow-sm" href="{{ route('disciplina.create') }}">
                <i class="fas fa-plus fa-sm text-white-50 mr-1"></i> Cadastrar Disciplina
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
                <form action="{{ route('disciplina.index') }}" method="get" class="row align-items-end">
                    <div class="col-12 col-md-4 mb-3 mb-md-0">
                        <label class="font-weight-bold text-gray-700 small mb-1">Nome:</label>
                        <input class="form-control" type="text" name="nome" 
                               placeholder="Digite o nome para buscar..." 
                               value="{{ request()->query('nome') }}">
                    </div>
                    <div class="col-12 col-md-4 mb-3 mb-md-0">
                        <label class="font-weight-bold text-gray-700 small mb-1">Descrição:</label>
                        <input class="form-control" type="text" name="descricao" 
                               placeholder="Digite a descrição para buscar..." 
                               value="{{ request()->query('descricao') }}">
                    </div>
                    <div class="col-12 col-md-2 mb-3 mb-md-0">
                        <label class="font-weight-bold text-gray-700 small mb-1">Status:</label>
                        <select class="form-control" name="status">
                            <option value="" @selected(request()->query("status") === null || request()->query("status") === "")>Todos os Status</option>
                            <option value="1" @selected(request()->query("status") === "1")>Ativo</option>
                            <option value="0" @selected(request()->query("status") === "0")>Inativo</option>
                        </select>
                    </div>
                    <div class="col-12 col-md-2 d-flex">
                        <button type="submit" class="btn btn-primary mr-2 flex-grow-1" title="Pesquisar">
                            <i class="fas fa-search fa-sm mr-1"></i> Pesquisar
                        </button>
                            <a href="{{ route('disciplina.index') }}" class="btn btn-warning" title="Limpar Filtros">
                                <i class="fas fa-undo fa-sm text-white"></i>
                            </a>
                        </a>
                    </div>
                </form>
            </div>
        </div>

        {{-- 4. CARD DA TABELA DE DADOS - LINHA BAIXA --}}
        <div class="card shadow mb-4">
            <div class="card-header py-2">
                <h6 class="m-0 font-weight-bold text-primary">
                    <i class="fas fa-list mr-1"></i> Registros Cadastrados
                </h6>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">

                    <table class="table table-sm table-hover table-striped mb-0 compact-table">
                        <thead class="thead-light">
                            <tr style="height: 32px;">    
                                <th class="pl-3 py-1" style="width: 30%;">Nome</th>
                                <th class="py-1" style="width: 40%;">Descrição</th>
                                <th class="text-center py-1" style="width: 15%;">Status</th>
                                <th class="text-center py-1" style="width: 15%;">Ações</th>  
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($disciplinas as $disciplina) 
                                <tr style="height: 32px; line-height: 1;">
                                    <td class="pl-3 py-1 align-middle font-weight-bold text-dark">
                                        {{ $disciplina->nome }}
                                    </td>
                                    <td class="py-1 align-middle text-muted small">
                                        {{ Str::limit($disciplina->descricao, 90, '...') }}
                                    </td>
                                    <td class="py-1 align-middle text-center">
                                        @if($disciplina->status == 1)
                                            <span class="badge badge-success px-2" style="font-size:0.70rem; padding-top:2px; padding-bottom:2px;">
                                                Ativo
                                            </span>
                                        @else
                                            <span class="badge badge-secondary px-2" style="font-size:0.70rem; padding-top:2px; padding-bottom:2px;">
                                                Inativo
                                            </span>
                                        @endif
                                    </td>
                                   
                                   
                                    <td class="py-0 align-middle text-center">
                                        <div class="d-flex justify-content-center align-items-center" style="gap: 7px; height: 20px;">
                                            <a href="{{ route('disciplina.show', $disciplina->id) }}" class="text-primary">
                                                <x-bx-detail width="19" />
                                            </a>
                                            <a href="{{ route('disciplina.edit', $disciplina->id) }}" class="text-secondary">
                                                <x-eva-edit-outline width="19" />
                                            </a>
                                            <a href="{{ route('disciplina.conteudos', ['id' => $disciplina->id ]) }}" class="text-info">
                                                <x-gmdi-content-copy-o width="19" />
                                            </a>                                  
                                            <button type="button" class="text-danger border-0 bg-transparent p-0 btn-inativar" 
                                                    data-id="{{ $disciplina->id }}" data-toggle="modal" data-target="#modalInativar">
                                                <x-eva-trash-2-outline width="19" />
                                            </button>                                            
                                        </div>
                                    </td>


                                </tr>    
                            @empty
                                <tr>
                                    <td colspan="4" class="text-center py-4 text-muted">
                                        <i class="fas fa-folder-open fa-2x mb-2 d-block opacity-50"></i>
                                        Nenhum registro encontrado.
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="card-footer d-flex flex-column flex-md-row justify-content-between align-items-center py-2 bg-white">
                <div class="small text-muted mb-2 mb-md-0">
                    Mostrando {{ $disciplinas->firstItem() ?? 0 }} até {{ $disciplinas->lastItem() ?? 0 }} de {{ $disciplinas->total() }} resultados
                </div>
                <div>
                    {{ $disciplinas->withQueryString()->links() }}
                </div>
            </div>
        </div>
    </div>

    {{-- MODAL DE INATIVAÇÃO --}}
    <div class="modal fade" id="modalInativar" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title">
                        <i class="fas fa-exclamation-triangle mr-1"></i> Inativar Disciplina?
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
                form.action = "/disciplina/" + id;
            });
        });
    });
    </script>



<style>
    /* FORÇA A LINHA BAIXA */
    .compact-table thead th {
        padding-top: 4px !important;
        padding-bottom: 4px !important;
        height: 28px !important;
        font-size: 0.82rem;
    }
    .compact-table tbody td {
        padding-top: 2px !important;
        padding-bottom: 2px !important;
        height: 26px !important;
        line-height: 26px !important;
        vertical-align: middle !important;
    }
    .compact-table tbody tr {
        height: 26px !important;
    }
    /* Deixa o badge e os ícones sem altura extra */
    .compact-table .badge {
        line-height: 1 !important;
        padding: 2px 6px !important;
        font-size: 0.68rem !important;
        vertical-align: middle;
    }
    .compact-table svg {
        display: block;
        width: 16px !important;
        height: 16px !important;
    }
    .compact-table .btn-inativar {
        line-height: 1 !important;
        height: 16px;
    }
</style>


</x-layout>