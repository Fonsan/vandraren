

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
    $('table.untouched tr th a').button()
    $('table.untouched a.reset_link span.ui-button-text').css('padding','1em')
    $('table.untouched th a.current').addClass('ui-state-focus')
    
    
    $('table.untouched').removeClass('untouched')
    
    $('table.model th input').unbind('keyup').keyup(function(){
        f = $('div.list form')
        data = f.serialize()
        data += "&r=" + Math.random()
        
        $.get(f.attr('action'),data,function(msg){
            d = $(msg)
            $('table.model tbody').html($('tbody',d).html())
            //f.parent().html(msg)
            addEvents();
        })
    })
    
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
    $('form.model').unbind('submit').submit(function(){
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