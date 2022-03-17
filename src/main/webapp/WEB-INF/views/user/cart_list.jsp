<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/user/css/style.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
<link href="https://cdn.materialdesignicons.com/2.3.54/css/materialdesignicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/jquery.mCustomScrollbar.min.css" />  
<link rel="stylesheet" type="text/css" href="../css/00_common.css" />
	
<!-- Bootstrap CSS -->


<title>Hello, world!</title>
<script>
$(function(){
	$("#btnList").click(function(){
		location.href="/user/prod/list";
	});
	$("#btnDelete").click(function(){
		if(confirm("장바구니를 비우시겠습니까?")){
			location.href="/user/cart/deleteAll";
		}
	});
});
</script>
<script> 
  function submit2(frm) { 
    frm.action='/user/cart/update'; 
    frm.submit(); 
    return true; 
  } 
</script>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>

<div class="aaa">
<nav style="-bs-breadcrumb-divider: url(&amp; #34; data: image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&amp;#34;);"
		aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/myPage">마이페이지</a></li>
			<li class="breadcrumb-item active" aria-current="page">장바구니</li>
		</ol>
</nav>
	<c:choose>
		<c:when test="${map.count == 0}">
		<div id="nod">장바구니가 비었습니다.<br>
		<a href="/user/product_list" class="btn btn-secondary"
					type="button" id="btnList">쇼핑 계속하기</a></div>
	</c:when>
		<c:otherwise>
			<form id="form5" name="form1" style="text-align: center;"
				method="post" action="/user/order/">
				<table class="table table-sm">
					<tr>
						<th>선택</th>
						<th>상품명</th>
						<th>금액</th>
						<th>수량</th>
						<th>합계금액</th>
						<th>&nbsp;</th>
					</tr>
					<c:forEach var="row" items="${map.list}">
						<tr>
							<td><input type="checkbox" name="chkod"
								value="${row.prod_id}"></td>
							<td><a href="../product/${row.prod_id}">
						<img alt="상품이미지" class="jhimg"
							src="../images/01.main/${row.oriname}" /></a>   ${row.prod_name}</td>
							<td>${row.price}</td>
							<td><input type="number" style="width: 40px;" min="0"
								max="100" name="amount" value="${row.amount}">
								<input class="btn btn-light" type="button" value="변경" onclick='return submit2(form1);'>
								<input type="hidden" name="cart_id" value="${row.cart_id}"></td>
							<td>${row.money}</td>
							<td><a href="/user/cart/delete?cart_id=${row.cart_id}"
								class="btn btn-outline-info">삭제</a></td>
						</tr>
					</c:forEach>

					<tr>
						<td colspan="5" align="center">장바구니 금액 합계 <fmt:formatNumber
								value="${map.sumMoney}" pattern="#,###,###" /><br> 배송료 :
							${map.fee}<br>
							<div id="hab">
								총합계 :
								<fmt:formatNumber value="${map.sum}" pattern="#,###,###" />
							</div>
						</td>
					</tr>

				</table>
				<input class="btn btn-secondary" type="submit" id="orderInsert"
					value="${row.prod_id}주문하기">
				
				<br>
				<br> <a href="/user/product_list" class="btn btn-secondary"
					type="button" id="btnList">쇼핑 계속하기</a>
					
				<button class="btn btn-secondary" type="button" id="btnDelete">장바구니
					비우기</button>

			</form>
		</c:otherwise>
	</c:choose>
</div>
	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		<script type="text/javascript" src="../js/05_jquery.min.js"></script>
	<script type="text/javascript" src="../js/00_common.js"></script>
	
	
	<script type="text/javascript" src="../js/01_bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/02_isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="../js/03_jquery.hoverdir.js"></script>
	<script type="text/javascript" src="../js/04_jquery.mCustomScrollbar.concat.min.js"></script>
	
	<script type="text/javascript" src="../js/07_modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="../js/08_template.js"></script>
	<script type="text/javascript" src="../js/09_unslider-min.js"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
    <footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>