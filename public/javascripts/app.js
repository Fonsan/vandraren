

$(document).ready(function(){
    $('#menu li a').button();
    $('#runner_birthdate').datepicker({
        changeYear: true,
        changeMonth:true,
        dateFormat: 'yy-mm-dd',
        defaultDate: "-15y",
        yearRange: 'c-80:c'
    });
    $('#competition_date').datepicker({
        changeYear: true,
        changeMonth:true,
        dateFormat: 'yy-mm-dd'
    });
    $('#menu li.selected a').addClass('ui-state-highlight')

    $("#runner_result_time").val($("#runner_result_time").attr('rel'))
  

    addEvents();
    paginate();
});

function paginate(){
    
    //Paginate
    var img = new Image
    img.src = '/images/spinner.gif'


    $('.pagination a').click(function() {
        var el = $(this)
        el.parent().before("<img src=" + img.src + " />")
        var dia = $('<div title="laddar">' + "<img src=" + img.src + " /></div>").dialog()
        el.parent().parent().load(el.attr('href'),
        function(){
            dia.dialog('close')
            paginate()
        })
        return false;
    })
}
function addEvents(){
    $("a[href$=edit],a[href$=new]").unbind('click').click(function(e){
        $.get($(this).attr('href'),{},function(msg){
            $(msg).dialog({
                width: 500,
                modal: true,
                open:addEvents
            });
        });
        return false;
    });
    $('form').submit(function(){
        f = $(this)
        $.post(f.attr('action'),f.serialize(),function(msg){
            f.parent().html(msg)
        })
        return false;
    })
    $("input[type~=checkbox]").button();
}