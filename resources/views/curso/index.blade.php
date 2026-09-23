<x-layout>
   
    <div class="container-fluid">
        
        <div class="row">
            {{-- CABEÇALHO --}}
            <div class="col-12 d-flex justify-content-between align-items-end border-bottom border-secondary py-3">
                <h3 class="my-0"> <span class="font-weight-bold"> Curso </span> - Listar Cursos</h3>
                <a class="btn btn-primary" href="{{ route('curso.create') }}"> Cadastrar Curso</a>
            </div>
        
            {{-- ======================================================= --}}
            {{-- AQUI COMEÇA O FILTRO - TUDO DENTRO DESSE BLOCO É O FORM --}}
            {{-- ======================================================= --}}
            

                <div class="col-12">
                @if (session('success'))
                    <div id="alert-success" class="alert alert-success alert-dismissible fade show mt-2" role="alert">
                        {{ session('success') }}
                        <button type="button" class="close" data-dismiss="alert">
                            <span>&times;</span>
                        </button>
                    </div>
                    <script>
                        setTimeout(function(){
                            $("#alert-success").fadeOut(500, function(){ $(this).remove(); });
                        }, 4000); // 4000 = 4 segundos
                    </script>
                @endif
                </div>

                <div class="col-12">
                    @if (session('error'))
                        <div id="alert-error" class="alert alert-danger alert-dismissible fade show mt-2" role="alert">
                            {{ session('error') }}
                            <button type="button" class="close" data-dismiss="alert">
                                <span>&times;</span>
                            </button>
                        </div>
                        <script>
                            setTimeout(function(){
                                $("#alert-error").fadeOut(500, function(){ $(this).remove(); });
                            }, 4000);
                        </script>
                    @endif    
                </div>

             
            <div class="col-12 my-1">
                {{-- O FORM É O PRÓPRIO ROW, NÃO PRECISA DE DIV ROW DENTRO --}}
                <form class="row" action="{{ route('curso.index') }}" method="get">

                    <div class="col-12 col-md-6 col-lg-3">
                        <div class="form-group m-0">
                            <label>Nome:</label>
                            {{-- MUDANÇA 1: name="nome" simples + value pra manter digitado --}}
                            <input class="form-control" type="text" name="nome" value="{{ request()->query('nome') }}">
                        </div>
                    </div>

                    <div class="col-12 col-lg-3">
                        <div class="form-group m-0">
                            <label>Descricao:</label>
                            <input class="form-control" type="text" name="descricao" value="{{ request()->query('descricao') }}">
                        </div>
                    </div>
                    
                    <div class="col-12 col-lg-2">
                        <div class="form-group m-0">
                            <label>Status:</label>
                            <select class="form-control" name="status">
                                <option value="">-</option>
                                {{-- MUDANÇA 2: @selected pra manter selecionado --}}
                                <option value="1" @selected(request()->query("status") == 1)>Ativo</option>
                                <option value="0" @selected(request()->query("status") == 0)>Inativo</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-12 col-lg-4 d-flex align-items-end">
                        <button class="btn btn-primary mr-1">Pesquisar</button>
                        <a href="{{ route('curso.index') }}" class="btn btn-danger">Limpar</a>
                    </div>
                    
                </form>
            </div>
            {{-- ======================================================= --}}
            {{-- AQUI TERMINA O FILTRO - DAQUI PRA BAIXO É SÓ TABELA --}}
            {{-- ======================================================= --}}
           
            {{-- TABELA FORA DO FORM, EM OUTRA DIV SEPARADA --}}
            <div class="col-12 my-3">
                <div class="table-responsive">
                    <table class="table table-sm table-striped align-middle table-hover">
                        <thead>
                            <tr>    
                                <th>Nome</th>
                                <th>Descricao</th>
                                <th>Data de Cadastro</th>
                                <th>Preço</th>
                                <th>Status</th>   
                                <th>Ações</th>  
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($cursos as $key => $curso ) 
                                <tr>
                                    <td>{{ $curso->nome }}</td>
                                    <td>{{ $curso->descricao }}</td>
                                    <td>{{ date('d/m/Y', strtotime($curso->dt_cadastra)) }}</td>
                                    <td>R$ {{ $curso->preco }}</td>
                                    <td>{{ $curso->status == 1 ?"Ativo":"Inativo" }}</td>
                                    <td>
                                        <div class="d-flex" style="gap: 3px;">
                                            <a href="{{ route('curso.show',$curso->id) }}"> <x-bx-detail width="20"/>  </href>
                                            <a href="{{ route('curso.edit',$curso->id) }}"> <x-eva-edit-outline width="20" /> </href>
                                            <a href="#" class="btn-inativar" data-id="{{ $curso->id }}" data-toggle="modal" data-target="#modalInativar">
                                                <i class="fas fa-trash text-danger"></i>
                                            </a>
                                           

                                        </div>
                                    </td>
                                </tr>    
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div>
                        Mostrando {{ $cursos->firstItem() }} até {{ $cursos->lastItem() }} de {{ $cursos->total() }} resultados
                    </div>
                    <div>
                        {{ $cursos->withQueryString()->links() }}
                    </div>
                </div>
            </div>

        </div>
    </div>



{{-- MODAL INATIVAR --}}
<div class="modal fade" id="modalInativar" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Inativar Curso?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Esse curso será <strong>inativado</strong> e ficará com status <span class="badge badge-secondary">Inativo</span>. Deseja continuar?
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
            form.action = "/curso/" + id;
        });
    });
});
</script>





</x-layout>

