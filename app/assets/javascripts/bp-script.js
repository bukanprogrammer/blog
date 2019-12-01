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
      $(this).addClass('bg-gradient-light shadow text-dark').css('cursor', 'pointer'); 
    }, function() {
      $(this).removeClass('bg-gradient-light shadow text-dark');
    }
  );

  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
  })

	window.setTimeout(function() {
			$(".alert").fadeTo(500, 0).slideUp(500, function(){
					$(this).remove(); 
			});
	}, 2000);

  $('#example').DataTable();
});
