$(function() {

        	  $('.check_All').on('click', function() {

        	  	if ( $(this).prop('checked') ) {
        		  	$('div input[type="checkbox"]').each(function() {
        		  		$(this).prop('checked', true);
        	        $(this).closest('div').addClass('active');
        		  	})
        	  	} else {
        	  		$('div input[type="checkbox"]').each(function() {
        		  		$(this).prop('checked', false);
        	        $(this).closest('div').removeClass('active');
        		  	})
        	  	}

        	  });

        	  $('div[scope="row"] input[type="checkbox"]').on('click', function() {
        	    if ( $(this).closest('div').hasClass('active') ) {
        	      $(this).closest('div').removeClass('active');
        	    } else {
        	      $(this).closest('div').addClass('active');
        	    }
        	  });

        	    

        	});
        	
        	
        	
        	$(document).ready(function(){
	$("#info-agree").click(function(){
		$("#info-agree-content").toggle();
	});
	$("#store-agree").click(function(){
		$("#store-agree-content").toggle();
	});
	$("#sns-agree").click(function(){
		$("#sns-agree-content").toggle();
	});
});