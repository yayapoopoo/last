	

$(window).load(function(){  // $(window).load 는 해당 페이지의 모든 외부 리소스, 이미지 등이 로드 된 후에 처리가 됩니다.

  $product = $('.eventcontent'); //'.eventcontent'가 eventbaner안에 있다
  $product.isotope({ //이미지정렬 플러그인
    itemSelector : 'li', // 이미지 위치
    layoutMode : 'masonry' // 가장 기본적인 형태, sort 및 filter 가 없음
  });
});
