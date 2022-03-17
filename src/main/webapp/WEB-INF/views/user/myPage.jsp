<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
<link href="user/css/myPage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.materialdesignicons.com/2.3.54/css/materialdesignicons.min.css" rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>답인사 | 마이페이지</title>


</head>
<body>
<body id="main" class="dnd" style="opacity: 1;">

	<div id="titleArea">
		<h2 class="title">MyPage</h2>
		<span class="back-button"><a href="#none"
			onclick="history.go(-1);return false;" class="btnBack"><Strong>BACK</Strong></a>
		</span>
	</div>
	<div class="xans-element- xans-layout xans-layout-logincheck "></div>
	<div class="gridItem" data-component-id="46"
		id="grid_id_1565920664008_3"
		style="grid-area: 5/1/10/5; min-width: 0;">
		<div class="dnd_module_507772837a23683c50a8344dc83bf446">
			<div class="xans-element- xans-myshop xans-myshop-orderstate ">
				<div class="xans-element- xans-layout xans-layout-logincheck ">

				</div>
				<div class="inner">
					<strong class="title">내 주문 현황 <br> <span
						class="duration">최근 3개월 기준</span></strong>
					<div class="orderState">
						<ul class="order">
							<li class="situation"><a href="#"> <span
									id="xans_myshop_orderstate_shppied_before_count">${cntData.obSum }</span>
									<strong class="label1">입금전</strong>
							</a></li>
							<li class="situation"><a href="#"> <span
									id="xans_myshop_orderstate_shppied_standby_count">${cntData.dbSum}</span> <strong
									class="label1">배송준비중</strong>
							</a></li>
							<li class="situation"><a href="#"> <span
									id="xans_myshop_orderstate_shppied_begin_count">${cntData.diSum }</span> <strong
									class="label1">배송중</strong>
							</a></li>
							<li class="situation"><a href="#"> <span
									id="xans_myshop_orderstate_shppied_complate_count">${cntData.daSum }</span> <strong
									class="label1">배송완료</strong>
							</a></li>
						</ul>
						<br>
						<ul class="cancle-menu">
							<li class="cancel"><a href="#"> <strong class="label1">취소</strong><span
									id="xans_myshop_orderstate_order_cancel_count">${cntData.cancle }</span>
							</a></li>
							<li class="cancel"><a href="#"> <strong class="label1">교환</strong><span
									id="xans_myshop_orderstate_order_exchange_count">${cntData.ret }</span>
							</a></li>
							<li class="cancel"><a href="#"> <strong class="label1">반품</strong><span
									id="xans_myshop_orderstate_order_return_count">${cntData.refund }</span>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div>
		<p class="title-text"><strong>주문</strong></p>
		<ul class="cart-menu">
			<li><a href="/user/cart/list">장바구니 </a></li>
			<li><a href="/user/wish/wishList">관심상품 </a></li>
			<li><a href="/oiqList">주문조회</a></li>
		</ul>
	</div>

	<p class="title-text"><strong>회원</strong></p>
	<ul class="user-menu">
		<li class="displaynone"><a href="infoUpdatePage">개인정보수정</a></li>
		<li class=""><a href="/user/coupon/cpList">쿠폰 </a></li>
		<li><a href="/miList">적립금</a></li>

	</ul>

	<div class="gridItem" data-component-id="49"
		id="grid_id_1565920664008_6"
		style="grid-area: 26/1/30/5; min-width: 0;">
		<div class="dnd_module_42b3a7588b8a72d91aba2ca08695b7dc">
			<div class="xans-element- xans-myshop xans-myshop-main ">
				<div class="xans-element- xans-layout xans-layout-logincheck ">

				</div>
				<p class="title-text"><strong >기타</strong></p>
				<ul class="consult-menu">
					<li class=""><a href="oneone_list">1:1 맞춤상담</a></li>
				</ul>
			</div>



		</div>
	</div>

	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>

</body>
</body>
</html>