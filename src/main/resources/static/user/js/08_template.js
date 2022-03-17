jQuery(function ($) {

	/* =============== SHOW / HIDE FORM SEARCH =============== */
	$("main-header .nino-search, #nino-searchForm .nino-close").click(function () {
		$("#nino-searchForm").toggleClass("open");
	});

	/* =============== SHOW / HIDE GOOGLE MAP =============== */
	$("#nino-map .sectionHeading").click(function () {
		$("#nino-map").toggleClass("showMap");
		$(this).find(".text").toggle();
	});

	/* =============== TESTIMONIAL SLIDER =============== */
	$('.nino-testimonialSlider').unslider({
		nav: false,
		arrows: {
			//  Unslider default behaviour
			prev: '<a class="unslider-arrow prev"><i class="mdi mdi-chevron-left"></i></a>',
			next: '<a class="unslider-arrow next"><i class="mdi mdi-chevron-right"></i></a>',
		}
	});

	/* =============== CUSTOM SCROLLBAR STYLE =============== */
	$("#nino-whatWeDo .panel-body").mCustomScrollbar({
		theme: "default"
	});

	/* =============== ISOTOP =============== */
	$(window).load(function () {
		$portfolio = $('.nino-portfolioItems');
		$portfolio.isotope({
			itemSelector: 'li',
			layoutMode: 'masonry'
		});
	});

	/* =============== PORTFOLIO HOVER EFFECT =============== */
	$('.nino-portfolioItems > li').each(function () {
		$(this).hoverdir();
	});

	/* =============== PERTTYPHOTO =============== */
	$("a.nino-prettyPhoto").prettyPhoto();

	/* =============== SMOOTH SCROOL EFFECT =============== */
	$('#main-navbar ul li a').on('click', function (e) {
		e.preventDefault();
		var target = this.hash,
			$target = $(target);

		$('html, body').stop().animate({
			'scrollTop': $target.offset().top
		}, 500, 'swing', function () {
			window.location.hash = target;
		});
	});









});