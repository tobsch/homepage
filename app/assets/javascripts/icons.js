$(function(){
  var images = $('#info img');
  var caption = $('#info #caption');
  
  images.mouseover(function(){
    $(this).animate({opacity: 1.0})
    $(caption).html($(this).attr('alt'))
    $(caption).animate({opacity: 0.5})
  });
  images.mouseout(function(){
    $(this).animate({opacity: 0.5})
    $(caption).css({opacity: 0.0})
  })
  
  
});
