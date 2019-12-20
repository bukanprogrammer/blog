$(document).ready(function() {

  // card hover
  $( ".card" ).hover(
    function() {
      $(this).addClass('shadow-sm').css('cursor', 'pointer'); 
    }, function() {
      $(this).removeClass('shadow-sm');
    }
  );

  $( ".list-group-item" ).hover(
    function() {
      $(this).addClass('shadow-sm text-dark font-weight-bold').css('cursor', 'pointer'); 
    }, function() {
      $(this).removeClass('shadow-sm text-dark font-weight-bold');
    }
  );

  // tooltip
  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
  })

  // auto hide notif
	window.setTimeout(function() {
			$(".alert").fadeTo(500, 0).slideUp(500, function(){
					$(this).remove(); 
			});
	}, 2000);

  // data table
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

  // page scroll on click
  $('.page-scroll').on('click', function(e) {

    var href = $(this).attr('href');

    var elemenTujuan = $(href);

    $('#home').animate({
      scrollTop: elemenTujuan.offset().top - 50
    }, 1250, 'swing');
    
    e.preventDefault();
  });

  // hide back to top button

  $('.backToTop').hide();

  $(window).scroll(function() {
    var y = $(this).scrollTop();

    if(y <= $('.jumbotron').offset().top + 200) {
      $('.backToTop').hide();
    } else {
      $('.backToTop').show();
    }
  });
});

