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

	$('#example').DataTable( {
			responsive: {
					details: {
							display: $.fn.dataTable.Responsive.display.modal( {
									header: function ( row ) {
											var data = row.data();
											return 'Details for '+data[0]+' '+data[1];
									}
							} ),
							renderer: $.fn.dataTable.Responsive.renderer.tableAll( {
									tableClass: 'table'
							} )
					}
			}
	} );
});

