$(function(){  
    //$('svg.menu_icon').first().css("margin-left", 0);
  //$('svg.menu_icon').last().css("margin-right", 0);
    
    $('.description').each(function(ind, obj){
      $(obj).find('svg').css("fill", $(obj).data("fill"));
      $(obj).find('path').css("fill", $(obj).data("fill"));
      $(obj).find('g').css("fill", $(obj).data("fill"));
    });
    
    $('#menu a:not(.current)').find("span").fadeTo(0,0);
    
    $('#menu').hover(function(){
      $('#menu a:not(.current)').find("span").fadeTo("slow",100);
    }, function(){
      $('#menu a:not(.current)').find("span").fadeTo("fast",0);
    })
    
    
});
