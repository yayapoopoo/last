<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="mypage/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/user/css/style.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
<link href="https://cdn.materialdesignicons.com/2.3.54/css/materialdesignicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/jquery.mCustomScrollbar.min.css" />  
<link rel="stylesheet" type="text/css" href="../css/00_common.css" />
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="header.jsp"></jsp:include>
    <title>답인사</title>
</head>
<body>
<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="/myPage">마이페이지</a></li>
    <li class="breadcrumb-item active" aria-current="page">주문조회</li>
  </ol>
</nav>
<c:choose>
			<c:when test="${omap.oiqCount == 0}">
		<div id="nod">주문목록이 없습니다.<br>
		<button class="btn btn-secondary" onclick="location.href='/myPage'">메인으로</button>
		</div>
		<button class="btn btn-secondary" onclick="location.href='/myPage'">메인으로</button></div>
	</c:when>
	<c:otherwise>
		<form id="oiform" name="form1" style="text-align: center;" method="post">
		<div id="order_a">
    <div id="orderterm">
        <input type="radio" id="radioGuide0" name="1week" onclick="setPeriod(this,'1week');">
        <label for="radioGuide0">1주일</label>
        <input type="radio" id="radioGuide1" name="1week" onclick="setPeriod(this,'1month');">
        <label for="radioGuide1">1개월</label>
        <input type="radio" id="radioGuide2" name="1week" onclick="setPeriod(this,'3month');">
        <label for="radioGuide2">3개월</label>
        <input type="radio" id="radioGuide3" name="1week" onclick="setPeriod(this,'');">
        <label for="radioGuide3">전체기간</label>
    </div>
    <div id="order_date">
    <span class="of_date">
        <input type="text" class="datepicker1" name="dt_fr_input" value="" placeholder="-" onblur="checkDateFormat(this);">
    </span>
    <span class="os_date">
        <input type="text" class="datepicker2" name="dt_to_input" value="" placeholder="-" onblur="checkDateFormat(this);">
    </span>
    <button type="button" class="n-btn btn-sm btn-accent" onclick="search();">조회</button>
</div>
</div>
		<table class="table table-striped">
			<tr>
				<th>상품명</th>
				<th>주문번호</th>
				<th>주문일자</th>
				<th>주문상태</th>
				<th>&nbsp;</th>
			</tr>
			<c:forEach var="row" items="${omap.oiqList}">
			<tr>
				<td>
				${row.prod_name}</td>
				<td>${row.o_code}</td>
				<td>${row.o_date}</td>
				<td>${row.d_status}</td>
			</tr>
			</c:forEach>
			
			</table>
			<a href="/" class="btn btn-secondary" type="button" id="goshopping">메인으로</a>
			
		</form>
	</c:otherwise>
	</c:choose>
	
    <script>
  $(function(){
    $('.datepicker1, .datepicker2').datepicker({
    	dateFormat: 'yy.mm.dd'
    });
  })
  $.datepicker.setDefaults({
  dateFormat: 'yy-mm-dd',
  prevText: '이전 달',
  nextText: '다음 달',
  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
  showMonthAfterYear: true,
  yearSuffix: '년'
});

$(function () {
  $('.datepicker').datepicker();
});
</script>
</body>
</html>