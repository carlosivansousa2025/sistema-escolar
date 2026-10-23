<x-layout>
   
    <div class="container-fluid">
        
        <div class="row">
            {{-- CABEÇALHO --}}
            <div class="col-8 d-flex justify-content-between align-items-end border-bottom border-secondary py-3">
                <h4 class="my-0"> <span class="font-weight-bold"> Tipo de Conteudo </span> - Listar Tipo de Conteudo</h4>
                <a class="btn btn-primary" href="{{ route('tipo-conteudo.create') }}"> Cadastrar Tipo de Conteudo</a>
            </div>
        
            {{-- ======================================================= --}}
            {{-- AQUI COMEÇA O FILTRO - TUDO DENTRO DESSE BLOCO É O FORM --}}
            {{-- ======================================================= --}}
            

                <div class="col-7">
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

                <div class="col-7">
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

             
            <div class="col-12 my-3">
                {{-- O FORM É O PRÓPRIO ROW, NÃO PRECISA DE DIV ROW DENTRO --}}
                <form class="row" action="{{ route('tipo-conteudo.index') }}" method="get">

                    <div class="col-12 col-md-6 col-lg-3">
                        <div class="form-group m-0">
                            <label>Tipo:</label>
                            {{-- MUDANÇA 1: name="tipo" simples + value pra manter digitado --}}
                            <input class="form-control" type="text" name="tipo" value="{{ request()->query('tipo') }}">
                        </div>
                    </div>

                    <div class="col-12 col-lg-2">
                        <div class="form-group m-0">
                            <label>Status:</label>
                            <select class="form-control" name="status">
                                <option value="" @selected(request()->query("status") === null || request()->query("status") === "")>-</option>
                                <option value="1" @selected(request()->query("status") === "1")>Ativo</option>
                                <option value="0" @selected(request()->query("status") === "0")>Inativo</option>
                            </select>
                        </div>
                    </div>
 

                    <div class="col-12 col-lg-4 d-flex align-items-end">
                        <button class="btn btn-primary mr-1">Pesquisar</button>
                        <a href="{{ route('tipo-conteudo.index') }}" class="btn btn-danger">Limpar</a>
                    </div>
                    
                </form>
            </div>
            {{-- ======================================================= --}}
            {{-- AQUI TERMINA O FILTRO - DAQUI PRA BAIXO É SÓ TABELA --}}
            {{-- ======================================================= --}}
           
            {{-- TABELA FORA DO FORM, EM OUTRA DIV SEPARADA --}}
            <div class="col-7 my-2">
                <div class="table-responsive">
                    <table class="table table-sm table-striped align-middle table-hover">
                        <thead>
                            <tr>    
                                <th>Tipo</th>
                                <td>Status</td>
                                <th>Ações</th>  
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($tipos as $key => $tipo ) 
                                <tr>
                                    <td>{{ $tipo->tipo }}</td>
                                    <td>{{ $tipo->status == 1 ?"Ativo":"Inativo" }}</td>

                                    <td>
                                        <div class="d-flex" style="gap: 3px;">
                                            <a href="{{ route('tipo-conteudo.show',$tipo->id) }}"> <x-bx-detail width="20"/>  </a>
                                            <a href="{{ route('tipo-conteudo.edit',$tipo->id) }}"> <x-eva-edit-outline width="20" /> </a>
                                            <a href="#" class="btn-inativar" data-id="{{ $tipo->id }}" data-toggle="modal" data-target="#modalInativar">
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
                        Mostrando {{ $tipos->firstItem() }} até {{ $tipos->lastItem() }} de {{ $tipos->total() }} resultados
                    </div>
                    <div>
                        {{ $tipos->withQueryString()->links() }}
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
        <h5 class="modal-title">Inativar Tipo de Conteudo?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Esse tipo será <strong>inativado</strong> e ficará com status <span class="badge badge-secondary">Inativo</span>. Deseja continuar?
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
            form.action = "/tipo-conteudo/" + id;
        });
    });
});
</script>






</x-layout>

