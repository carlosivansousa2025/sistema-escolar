$(document).ready(function () {
    $(document).on('click','#btn-add-conteudo',function(e)
    {
        e.preventDefault();
        let cloneConteudo = $('.conteudo-modelo').clone();
        $('.campos-novos').append(cloneConteudo.html());

    })
}
);