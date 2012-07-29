$(function(){
  $('a').hover(function(){
    $($('object', $(this))[0].contentDocument.documentElement).css("fill", "#000").css("cursor", "pointer"); 
  }, function(){
    $($('object', $(this))[0].contentDocument.documentElement).css("fill", "#bbb"); 
  });
});

$(window).load(function(){
  $('object').each(function(ind, obj){  
    //$(obj).hover(function(){ console.log("hoverin")}, function(){$(obj).removeClass("black")});
    
    $(obj.contentDocument.documentElement).css("fill", "#bbb"); 
  });
})
