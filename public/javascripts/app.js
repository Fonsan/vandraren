

$(document).ready(function(){
    addCSS()
    $('#menu li a').button()
    $('#menu li.selected a').addClass('ui-state-highlight').css('font-weight','bold')
    $('input[type=submit]').button()
    
    
    $('.pagination a,th a[href*=sort],a.reset_link').live('click',function() {
        var el = $(this)
        var dia = $("#loading-dialog").dialog()
        $('#container').load(el.attr('href'),
            function(){
                dia.dialog('close')
                addCSS()
            }
            )
          
        return false;
    })
    post_form = function(){
        f = $('div.list form')
        data = f.serialize()
        data += "&r=" + Math.random()
        
        $.get(f.attr('action'),data,function(msg){
            d = $(msg)
            $('table.model tbody').html($('tbody',d).html())
        })
    };
    $('table.model th input[type=text]').live('keyup',post_form)
    $('table.model th input[type=checkbox]').live('click',post_form)
    
    
    $("a[href$=edit],a[href$=new]").live('click',function(e){
        $.get($(this).attr('href'),{},function(msg){
            d = $(msg)
            d.dialog({
                width: 500,
                modal: true,
                close:function(){
                    $('.ui-state-focus').removeClass('ui-state-focus')  
                },
                open:addCSS
            });
        });
        return false;
    });
    $('div.form form').live('submit',function(){
        f = $(this)
        $.post(f.attr('action'),f.serialize(),function(msg){
            if(msg.length < 5){
                
                f.parent().parent().dialog('close')
                location.reload(true);
                
            }else{
                
                f.parent().html(msg)
                addCSS();
            }
        })
        return false;
    })
    
    $('a.select_competition_link').live('click',function(){
        $('.select_competition').dialog({
            modal:true, 
            height:450,
            open: addCSS
        })
        return false;
    })
    
    $('.time').live('blur',function(){
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
   
});
function addCSS(){
    
    $('input.date').datepicker({
        dateFormat: 'yy-mm-dd',
        changeYear:true,
        changeMonth:true,
        showWeek: true, 
        firstDay: 1,
        showButtonPanel: true,
        currentText: 'Hoppa till idag'
    })
    $('a.link').button()
    
    $('a.create_link').button( {
        icons:{
            primary:'ui-icon-pencil'
        }
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

    $('div.select_competitions_date').datepicker({
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
    $('div.select_competitions_date td a.ui-state-highlight').click()
    
    $('div.select_competitions_date').datepicker('option',$.datepicker.regional['sv'])
   
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
                    n.css('color','red').css('font-weight','bold')
                }
            })
        })
    })
}
