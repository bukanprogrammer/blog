$(document).ready(function() {
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
});

$(document).on('turbolinks:load', function () {

  // tooltip
  $('[data-toggle="tooltip"]').tooltip()

  // page scroll on click
  $('.page-scroll').on('click', function(e) {

    var href = $(this).attr('href');

    var elemenTujuan = $(href);

    $('#home').animate({
      scrollTop: elemenTujuan.offset().top
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

  // card hover
  $( ".card" ).hover(
    function() {
      $(this).addClass('shadow').css('cursor', 'pointer'); 
    }, function() {
      $(this).removeClass('shadow');
    }
  );

  $( ".list-group-item" ).hover(
    function() {
      $(this).addClass('shadow-sm text-dark font-weight-bold').css('cursor', 'pointer'); 
    }, function() {
      $(this).removeClass('shadow-sm text-dark font-weight-bold');
    }
  );

  tinymce.remove();

  tinymce.init({
    selector: "#content",  // change this value according to your HTML
    plugins: "fullscreen code link advlist lists quickbars",
    toolbar: "bold italic  link image  alignleft aligncenter alignright  alignjustify bullist numlist outdent indent code",
  });

  // Remove all global properties set by addthis, otherwise it won't reinitialize
  for (var i in window) {
    if (/^addthis/.test(i) || /^_at/.test(i)) {
      delete window[i];
    }
  }
  window.addthis_share = null;

  // Finally, load addthis
  $.getScript("//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5e16a9104844e7db");

});
