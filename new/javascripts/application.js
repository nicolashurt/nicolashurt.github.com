$(function(){
  $('svg').css("fill", "#ccc");
  
  $('#menu a').hover(function(){
    $(this).css("color", "#000");
    $($('object', $(this))[0].contentDocument.documentElement).css("fill", "#000").css("cursor", "pointer"); 
  }, function(){
    $(this).css("color", "#aaa");
    $($('object', $(this))[0].contentDocument.documentElement).css("fill", "#aaa"); 
  });
});

$(window).load(function(){
  $('object').each(function(ind, obj){  
    //$(obj).hover(function(){ console.log("hoverin")}, function(){$(obj).removeClass("black")});
    
    $(obj.contentDocument.documentElement).css("fill", "#aaa");
  });
})
