

$(document).ready(function(){
    $('#menu li a').button()
    $('#menu li.selected a').addClass('ui-state-highlight')
    addEvents();
});
function addEvents(){
    
    $('.pagination a,th a[href*=sort],a.reset_link').unbind('click').click(function() {
        var el = $(this)
        var dia = $("#loading-dialog").dialog()
        $('#container').load(el.attr('href'),
            function(){
                dia.dialog('close')
                addEvents();
            }
            )
          
        return false;
    })
    
    $('a.link').button()
    $('a.create_link').button( {
        icons:{
            primary:'ui-icon-pencil'
        }, 
        text:false
    })
    
    $('a.reset_link').button( {
        icons:{
            primary:'ui-icon-refresh'
        }, 
        text:false
    })
    
    $('.pagination a').button()
    $('em').button({
        disabled:true
    }) 
    $('.pagination span.disabled').hide()
    
    $('.ui-button-text').css('padding',"0.3em")
    $('table.untouched tr th a').each(function(){
        n = $(this)
        c = 'e'
        if(n.hasClass('asc'))
        {
            c = 'n'
            
        }else if(n.hasClass('desc')){
            c = 's'
        }
        n.button({
            icons:{
                primary:'ui-icon-triangle-1-' + c
            },
            text:false
        })
    })
    
    $('table.untouched tr th').attr('colspan',2)
    $('table.untouched tr th a').addClass('ui-corner-top').each(function(){
        n = $(this)
        n.parent().attr('colspan',1).css('width','16px').before('<th>'+ n.text()+'</th>') 
        n.children().last().css('padding','0px')
    }).css('width','1.0em')
    $('table.untouched a.reset_link span.ui-button-text').css('padding','1em')
    $('table.untouched th a.current').addClass('ui-state-focus')
    
    
    $('table.untouched tr td').addClass('ui-corner-all').attr("colspan",2)
    
    $('table.untouched').removeClass('untouched')
    $("a[href$=edit],a[href$=new]").unbind('click').click(function(e){
        $.get($(this).attr('href'),{},function(msg){
            d = $(msg)
            d.dialog({
                width: 500,
                modal: true,
                close:function(){
                    $('.ui-state-focus').removeClass('ui-state-focus')  
                },
                open:addEvents
            });
        });
        return false;
    });
    $('form').unbind('submit').submit(function(){
        f = $(this)
        $.post(f.attr('action'),f.serialize(),function(msg){
            if(msg.length == 0){
                $('form').parent().dialog('close')
                
            }else{
                f.parent().html(msg)
                addEvents();
            }
        })
        return false;
    })
    $("input[type~=checkbox]").button();
    
    $('a.select_competition_link').unbind('click').click(function(){
        $('.select_competition').dialog({
            modal:true, 
            height:450,
            open: addEvents
                
        })
        return false;
    })
    $('.select_competitions_date').datepicker({
        dateFormat: 'yy-mm-dd',
        changeYear:true,
        changeMonth:true,
        showWeek: true, 
        firstDay: 1,
        showButtonPanel: true,
        currentText: 'Hoppa till idag',
        onSelect: function(dateText, inst) { 
            $('div.select_competitions_list').load('/competitions/select',{
                date:dateText
            },function(){
                $('div.select_competitions_list ul li a').click(function(){
                    $('input[name="result[competition_id]"]').val($(this).attr('rev'))
                    $('.select_competition_text').val($(this).text())
                    $('.select_competition').dialog('close')
                    return false;
                })
            })
            darr = dateText.split("-")
            addDatemarkers(darr[0],darr[1])
        },
        onChangeMonthYear: addDatemarkers
    })
    
    $('.select_competitions_date').datepicker('option',$.datepicker.regional['sv'])
    $('.time').unbind('blur').blur(function(){
        n = $(this)
        if((m = n.val().match(/^(\d+)\:(\d+)\:(\d{2})$/)) != null){
            n.val((parseInt(m[1]) * 60 + parseInt(m[2])) + ":" + m[3])
        }
        if(n.hasClass('winner_time_input') && (m = n.val().match(/^(\d+)\:(\d{2})$/)) != null){
            time = $('input[name="result[time]"]').val()
            ta = time.split(":")
            min = parseInt(ta[0])
            sec = parseInt(ta[1])

            wmin = parseInt(m[1])
            wsec = parseInt(m[2])
            
            dmin = 0
            dsec = 0
            
            if(sec - wsec < 0){
                sec += 60
                min -= 1
            }
            dsec = sec - wsec
            dmin = min - wmin
            
            $('input[name="result[time_diff]"]').val(dmin + ":" + (dsec > 9 ? dsec : "0" + dsec))
        }
    })
}

function addDatemarkers(year,month){
    $.getJSON('/competitions/per_month.json',{
        year:year,
        month:month
    },function(arr){
        $('.select_competitions_date td a').each(function(){
            n = $(this)
            $(arr).each(function(){
                if(n.text() == this){
                    n.css('color','yellow').css('font-weight','bold')
                }
            })
        })
    })
}