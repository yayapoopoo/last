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
        }
        else {
        window.open("") 
        }
    });

});




// 카테고리 / 커뮤니티 ( 대 → 중 )
    $("#s-community").click(function() {
        $("#community").show();
        $("#category").hide();
    });

    $("#s-category").click(function() {
        $("#category").show();
        $("#community").hide();
    });



// 카테고리 / 세부메뉴 ( 중 → 소 )
$("#1").click(function() {
    $(".s-menu-list").show();
    $(".s-menu-list-2").hide();
});

$("#2").click(function() {
    $(".s-menu-list-2").show();
    $(".s-menu-list").hide();
});




