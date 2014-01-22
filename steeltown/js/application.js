$(function(){
    $('#title').hide();
    
    setTimeout(function(){
        $('#title').fadeIn(2000);
    }, 1200);
    
    $('#nav a').click(function(){
        var target = $(this).attr("href").split(".")[0]
        moveTitleUp(target);
        
        $('#nav a').removeClass('current')
        
        $(this).addClass("current");
        
        return false;
    });
    
    var moveTitleUp = function(section){
        if(section == "index"){
            $('#content').fadeOut(function(){
                $('h1').animate({
                    "margin-top": "200px",
                    "font-size": "110px",
                    "width": "600px" 
                }); 
            });
        } else {
            $('h1').animate({
                "margin-top": 0,
                "font-size": "60px",
                "width": "350px" 
            });   
            
            
            $('#content').fadeOut(function(){
                $('#content').html($('#' + section).html())
                $('#content').fadeIn();
            });
        }
    };
});
