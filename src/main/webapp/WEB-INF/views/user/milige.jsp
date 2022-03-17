<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>답인사</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/user/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/user/css/style.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
<link href="https://cdn.materialdesignicons.com/2.3.54/css/materialdesignicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/jquery.mCustomScrollbar.min.css" />  
<link rel="stylesheet" type="text/css" href="../css/00_common.css" />

<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="/myPage">마이페이지</a></li>
    <li class="breadcrumb-item active" aria-current="page">마일리지</li>
  </ol>
</nav>
<div id="miAll">
<h2>내 마일리지</h2>
    <div id="mi_top">
        <h3>마일리지 현황</h3>
        </div>
<c:choose>
	<c:when test="${mimap.micount == 0}">
		<div id="nod">적립된 마일리지가 없습니다.
		<a href="/user/product_list" class="btn btn-secondary" type="button" id="goshopping">쇼핑하기</a>
		</div>
	</c:when>
	<c:otherwise>
		<form id= "miform" name="form1" style="text-align: center;" method="post">
		<table class="table table-hover">
			<tr>
				<th>고객명</th>
				<th>보유 마일리지</th>
			</tr>
			<c:forEach var="row" items="${mimap.miList}">
			<tr>
				<td>${row.m_name} 님의</td>
				<td>총 마일리지 : ${row.mi_acc}포인트</td>
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

    <footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>