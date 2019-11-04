$(document).ready(function() {
  $( ".card" ).hover(
    function() {
      $(this).addClass('shadow').css('cursor', 'pointer'); 
    }, function() {
      $(this).removeClass('shadow');
    }
  );

  $( ".list-group-item" ).hover(
    function() {
      $(this).addClass('bg-gradient-light shadow font-weight-bold').css('cursor', 'pointer'); 
    }, function() {
      $(this).removeClass('bg-gradient-light shadow font-weight-bold');
    }
  );
});
