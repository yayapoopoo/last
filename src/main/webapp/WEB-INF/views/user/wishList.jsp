<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/mypage/css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/user/css/style.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
<link href="https://cdn.materialdesignicons.com/2.3.54/css/materialdesignicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/jquery.mCustomScrollbar.min.css" />  
<link rel="stylesheet" type="text/css" href="../css/00_common.css" />

    <title>답인사</title>
    <script>
	$(function(){
		$("#btnList").click(function(){
			location.href="/user/prod/list";
		});
	$("#wbtnDelete").click(function(){
		if(confirm("관심상품을 비우시겠습니까?")){
			location.href="/user/wish/wishDeleteAll";
		}
	});
	});
</script>
<script>

$(function(){
	$("#cartBtn").click(function(){
		location.href="/user/cart/list";
	});

$(".btn-wishlist").click(function() {
	alert("상품을 위시리스트에 추가하였습니다.");
});
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="/myPage">마이페이지</a></li>
    <li class="breadcrumb-item active" aria-current="page">관심상품</li>
  </ol>
</nav>
<h2>관심상품</h2>
<c:choose>
	<c:when test="${wmap.wishCount == 0}">
		<div id="nod">관심상품을 등록해주세요.<br>
		<a href="/user/product_list" class="btn btn-secondary"
					type="button" id="btnList">쇼핑하기</a>
		</div>
	</c:when>
	<c:otherwise>
		<form id="form1" name="form1" action="/user/cart/cinsert" style="text-align: center;" method="post">
		<table class="table caption-top">
			<tr>
			<th>선택</th>
				<th>상품명</th>
				<th>금액</th>
				<th>&nbsp;</th>
			</tr>
			<c:forEach var="row" items="${wmap.wishList}">
			<tr>
			<td>
			<input type="checkbox" id="cinsert" name="chk" value="${row.prod_id}"></td>
			
				<td>
				<a href="product/${row.prod_id}">
						<img alt="상품이미지" class="image product-up-on-scroll"
							src="images/01.main/${row.oriname}" /></a>
				${row.prod_name}</td>
				<td>${row.price}</td>
				<td>
					<input type="hidden" name="cw_id" value="${row.w_id}">
				</td>
				<td><a href="/user/wish/wishDelete?w_id=${row.w_id}" class="btn btn-outline-info">삭제</a></td>
			</tr>
			</c:forEach>
			
			</table>
			<input id="cinsert" type="submit" class="btn btn-secondary" value="${row.prod_id}">장바구니 담기</button>
			<a href="/user/product_list" class="btn btn-secondary"
					type="button" id="btnList">쇼핑하기</a>
			<button class="btn btn-secondary" type="button" id="wbtnDelete">관심상품 비우기</button>
		</form>
	</c:otherwise>
	</c:choose>

    <footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>