$(function(){
    $('.description').each(function(ind, obj){
      $(obj).find('svg').css("fill", $(obj).data("fill"));
      $(obj).find('path').css("fill", $(obj).data("fill"));
      $(obj).find('g').css("fill", $(obj).data("fill"));
    });
    
    $('#menu a:not(.current)').find("span").hide();
    
    $('#menu').hover(function(){
      $('#menu a:not(.current)').find("span").fadeIn("slow");
    }, function(){
      $('#menu a:not(.current)').find("span").fadeOut("slow");
    })
});
