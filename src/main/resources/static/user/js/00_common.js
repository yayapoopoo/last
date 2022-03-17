/* =============== 스크롤 시 메인 메뉴 바뀜 =============== */

jQuery(function ($) {


	$(window).scroll(function () {
		if ($(this).scrollTop() == $('#main-header').height() || $(this).scrollTop() > $('#main-header').height()) {
			$('body').addClass("nino-fixed-nav");
			$('body').css('padding-top', $('#main-navbar').height() + 'px');
		} else {
			$('body').removeClass("nino-fixed-nav");
			$('body').css('padding-top', 0);
		}
	});

});


/* =============== 사이드 메뉴 =============== */

// 사이드바 여닫기
$(document).ready(function () {
	var target = $("#side-bar");
	$(document).on("click", "#sbtn", function (e) {
		target.show();
		target.addClass('emphasized');
	});
	$(document).mouseup(function (e) {
		if (target.has(e.target).length == 0) {
			target.hide();
			target.removeClass('emphasized');
		}
	});
});

// 사이드바 x 클릭시 창 닫기 / 홈으로 이동
$(document).ready(function () {
	var target = $("#side-bar");
	$(document).on("click", "#close", function (e) {
		target.hide();
	});
	$(document).on("click", "#manager", function (e) {
		if (login == 0) {
			alert('관리자 회원 전용 메뉴입니다');
		} else {
			window.open("")
		}
	});
});

// 카테고리 / 커뮤니티 ( 대 → 중 )
$("#s-community").click(function () {
	$("#community").show();
	$("#category").hide();
});
$("#s-category").click(function () {
	$("#category").show();
	$("#community").hide();
});

// 카테고리 / 세부메뉴 ( 중 → 소 )
$("#1").click(function () {
	$(".s-menu-list").show();
	$(".s-menu-list-2").hide();
	$(".s-menu-list-3").hide();
	$(".s-menu-list-4").hide();
	$(".s-menu-list-5").hide();
	$(".s-menu-list-6").hide();
});
$("#2").click(function () {
	$(".s-menu-list-2").show();
	$(".s-menu-list").hide();
	$(".s-menu-list-3").hide();
	$(".s-menu-list-4").hide();
	$(".s-menu-list-5").hide();
	$(".s-menu-list-6").hide();
});
$("#3").click(function () {
	$(".s-menu-list-3").show();
	$(".s-menu-list").hide();
	$(".s-menu-list-2").hide();
	$(".s-menu-list-4").hide();
	$(".s-menu-list-5").hide();
	$(".s-menu-list-6").hide();
});
$("#4").click(function () {
	$(".s-menu-list-4").show();
	$(".s-menu-list").hide();
	$(".s-menu-list-2").hide();
	$(".s-menu-list-3").hide();
	$(".s-menu-list-5").hide();
	$(".s-menu-list-6").hide();
});
$("#5").click(function () {
	$(".s-menu-list-5").show();
	$(".s-menu-list").hide();
	$(".s-menu-list-2").hide();
	$(".s-menu-list-3").hide();
	$(".s-menu-list-4").hide();
	$(".s-menu-list-6").hide();
});
$("#6").click(function () {
	$(".s-menu-list-6").show();
	$(".s-menu-list").hide();
	$(".s-menu-list-2").hide();
	$(".s-menu-list-3").hide();
	$(".s-menu-list-4").hide();
	$(".s-menu-list-5").hide();
});



/* =============== 맨 위로 이동 =============== */
jQuery(function ($) {
	// 특정위치에서 보이게
	$(window).scroll(function () {
		if ($(this).scrollTop() > 200) {
			$('#nino-scrollToTop').fadeIn();
		} else {
			$('#nino-scrollToTop').fadeOut();
		}
	});
	/*최상단으로*/
	$('#nino-scrollToTop').click(function () {
		$('html, body').animate({
			scrollTop: 0
		}, 800);
		return false;
	});
	/* 최하단으로*/
	$('#nino-scrollToBottom').click(function () {
		$('html, body').animate({
			scrollTop: 8000
		}, 800);
		return false;
	});
});



