<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/user/css/style.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
<link href="https://cdn.materialdesignicons.com/2.3.54/css/materialdesignicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/jquery.mCustomScrollbar.min.css" />  
<link rel="stylesheet" type="text/css" href="../css/00_common.css" />

    <title>답인사</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>s
<link rel="stylesheet" href="/mypage/css/style.css">
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="/myPage">마이페이지</a></li>
    <li class="breadcrumb-item active" aria-current="page">쿠폰</li>
  </ol>
</nav>
<div id="cpAll">
<h2>쿠폰등록</h2>
<form id="cp_midle" action="/user/coupon/cpInsert" method="post" action="/user/coupon/cpInsert">
    <div id="couponlush">
    <div id="couponNumber">
        <input type="text" class="cp_num" name="cp_num" placeholder="쿠폰번호를 입력하세요">
    </div>
    <div id="couponInsert">
        <button id="cpin" type="submit" class="btn btn-light">쿠폰입력</button>
    </div>
    </div>
    </form>
    <div id="cp_top">
        <h3>마이쿠폰 ( 보유 : ${cpmap.cpcount}장 )</h3>
        </div>
<c:choose>
	<c:when test="${cpmap.cpcount == 0}">
		사용가능한 쿠폰이 없습니다.
	</c:when>
	<c:otherwise>
		<form id= "cpform" name="form1" style="text-align: center;" method="post">
		<table class="table table-hover">
			<tr>
				<th>쿠폰명</th>
				<th>쿠폰내용</th>
				<th>할인</th>
				<th>등록날짜</th>
			</tr>
			<c:forEach var="row" items="${cpmap.cpList}">
			<tr>
				<td>${row.cp_name}</td>
				<td>${row.cp_content}</td>
				<td>${row.cp_dis}%</td>
				<td>${row.cp_date}</td>
			</tr>
			</c:forEach>
			
			</table>
			<a href="/user/product_list" class="btn btn-secondary" type="button" id="goshopping">쇼핑하기</a>
		</form>
	</c:otherwise>
	</c:choose>
	<div id="underbtn">
	
	</div>
</div>
<script type="text/javascript">
$(function(){
	$("#cpin").click(function(){
		if(confirm("정상적인 쿠폰입니다 등록하시겠습니까")){
			location.href="/user/coupon/cpInsert";
		}
	});
	});
</script>
    <footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>