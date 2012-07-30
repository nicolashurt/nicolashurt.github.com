$(function(){
    $('.description').each(function(ind, obj){
      $(obj).find('svg').css("fill", $(obj).data("fill"));
      $(obj).find('path').css("fill", $(obj).data("fill"));
      $(obj).find('g').css("fill", $(obj).data("fill"));
    });
});
