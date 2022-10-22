document.addEventListener("turbolinks:load", function () {
  $(function() {
    $('#back a').on('click',function(event){
      $('body, html').animate({
        scrollTop:0
      }, 800);
      event.preventDefault();
    });
  });
  $(function(){
    $('.icon').mouseover(function(){
      $('.action').toggleClass('rotation');
      return false;
    });
    $('.icon').mouseout(function(){
      $('.action').toggleClass('rotation');
      return false;
    });
  });
});