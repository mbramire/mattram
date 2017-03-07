$(document).ready(function(){
  topNavFunctions();
  imageSliderFunctions();
});

function topNavFunctions(){
  $("#add-drop").hover(function(){
    $('#drop-down').stop().slideDown();
    } , function(){
    $('#drop-down').delay(0100).slideUp();
  });

  $("li[id^='list-item-']").hover(function(){
    $('#drop-down').clearQueue();
    } , function(){
    $('#drop-down').delay(0100).slideUp();
  });
}

function imageSliderFunctions(){
  $(".slider-btns .prev-btn").on('click', function(){
    $('.slide-container').animate({
      backgroundPosition: '+=680px'
    });
  });
  $(".slider-btns .next-btn").on('click', function(){
    $('.slide-container').animate({
      backgroundPosition: '-=680px'
    });
  })
}