<x-layout>
    <div class="container-fluid">

        {{-- CABEÇALHO COM BOTÃO VOLTAR --}}
        <div class="d-flex justify-content-between align-items-center border-bottom pb-3 mb-4">
            <h3 class="m-0 text-gray-800">
                <span class="font-weight-bold">Cargo</span> - Visualizar Cargo
            </h3>
            
            <a class="btn btn-secondary shadow-sm" href="{{ route('cargo.index') }}">
                <i class="fas fa-arrow-left fa-sm mr-1"></i> Voltar para Lista
            </a>
        </div>

        {{-- EXIBIÇÃO DOS DADOS --}}
        <div class="row">
            {{-- TÍTULO --}}
            <div class="col-12 col-md-5 mb-3">
                <label for="titulo" class="font-weight-bold text-gray-700 small text-uppercase mb-1">Título</label>
                <input id="titulo" type="text" class="form-control bg-light" value="{{ $modelCargo->titulo }}" readonly>
            </div>

            {{-- STATUS --}}
            <div class="col-12 col-md-3 mb-3">
                <label for="status" class="font-weight-bold text-gray-700 small text-uppercase mb-1">Status</label>
                <input id="status" type="text" class="form-control bg-light" value="{{ $modelCargo->status == 1 ? 'Ativo' : 'Inativo' }}" readonly>
            </div>

            {{-- DESCRIÇÃO --}}
            <div class="col-12 mb-4">
                <label for="descricao" class="font-weight-bold text-gray-700 small text-uppercase mb-1">Descrição</label>
                <textarea id="descricao" class="form-control bg-light" rows="4" readonly>{{ $modelCargo->descricao }}</textarea>
            </div>
        </div>

    </div>
</x-layout>