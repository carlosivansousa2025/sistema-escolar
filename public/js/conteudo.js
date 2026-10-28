$(document).ready(function () {
    $(document).on('click','#btn-add-conteudo',function(e)
    {
        e.preventDefault();
        let cloneConteudo = $('.conteudo-modelo').clone();
        $('.campos-novos').append(cloneConteudo.html());

    })

    $(document).on('click','.btn-remove-conteudo',function(e)
    {
        e.preventDefault();
        if(!confirm("Deseja remover o contéudo?"))
        {
            return false;
        }

        let elementoIrmaoId = $(this).closest('div')
                 .siblings('.campo-id')
                 .children('[name="id[]"]')[0].value;

                 
        console.log(elementoIrmaoId);
        return false;
        let elementoPai  = $(this).closest('.card').css({'background-color':'#f1d2d2'});
        console.log(elementoPai);

    })


}
);