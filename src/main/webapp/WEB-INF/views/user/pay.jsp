<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com">
	<title>답인사</title>
	<!-- favicon -->
	<link rel="shortcut icon" href="user/images/00.logo.png">
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<link href="https://cdn.materialdesignicons.com/2.3.54/css/materialdesignicons.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.min.css" />
	<link rel="stylesheet" type="text/css" href="css/00_common.css" />
	<link rel="stylesheet" type="text/css" href="css/08_pay.css" />


</head>


<body class="app" data-target="#main-navbar" data-spy="scroll">

	<!----------------- header ----------------->
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>

	<!-- 기타 -->
	<a href="#" id="nino-scrollToTop">Go to Top</a>



	<div class="order_content">
		<div class="orderend">
			<div class="orderend_content">
				<p class="title">
					<span class="point_color">주문이 확인</span>되었습니다.
				</p>
				
				<p>
					<span class="point_color" id="Deposit-deadline">
					
					<%Calendar week = Calendar.getInstance();
					week.add(Calendar.DATE , +7);
					String beforeWeek = new java.text.SimpleDateFormat("yyyy-MM-dd").format(week.getTime());
					out.println(beforeWeek);%></span>까지 은행에 입금해주시면 결제가 완료됩니다.
				</p>

				<ul class="desc_list">
					<li>
						<br>
						<span class="point_color">주문자/입금자명이 달라도</span> 가상계좌번호로 정확한 금액 입금 시 정상 입금됨</li>
					<li>
						<span class="point_color">농협, 국민, 부산, SC, 우체국</span>은 ATM 현금 입금 불가(은행 창구, 인터넷 뱅킹 이용 가능)
					</li>
				</ul>
			</div>



			<div class="orderend_info">
				<table class="order_info">
					<tbody class="order_num">
						<tr>
							<th id="order_title" style="width: 35%;">주문번호</th>
							<td>
								<a href="#" class="">
									<strong>
									${oList.o_code}
									</strong>
									
								</a>
							</td>
						</tr>
					</tbody>

					<tbody>
						<tr class="order_deli">
							<th id="order_title" style="width: 35%;">배송지정보</th>
							<td>
								<ul>
									<li>${oList.o_recipient} / 0${oList.o_num}</li>
									<li>(${oList.o_post}) ${oList.o_address} ${oList.o_add}</li>
									
								</ul>
							</td>
						</tr>
					</tbody>
				

					<tbody>
						<tr class="order_mile">
							<th id="benefit_summary"  style="width: 35%;">구매적립</th>
								<td>
								<b><fmt:formatNumber value="${(oList.retail_price * 1/100) *oList.oi_amount}" pattern="#,###" /></b>원
							</td>
							
						</tr>
					</tbody>
				
				</table>
			</div>
		</div>






		<div class="order_bill">
			<div class="bill_content">
				<div class="scroll">
					<ul class="product_list">
						<li class="product_item">
							<div class="product_dsc">
								<a href="">
									상품명 : ${oList.prod_name}
								</a>
							
								<ul class="option_list">
									<li>주문수량 : ${oList.oi_amount}개</li>
								</ul>
								<p class="add_info">
									<span class="">제조사 : </span>${oList.making_company}
								</p>
							</div>
						</li>
					</ul>
				</div>
				<hr>

				<!-- 주문금액 Start -->
				<div class="order_bill_info">
					<div class="sum">
						<strong class="price_sum_title">주문금액</strong>
						<p class="price_sum_detail">
							<span class="point_color">${oList.oi_totalprice}</span>원
						</p>
					</div>
					<ul class="calc_list">
						<li><strong>상품금액</strong>
							<p>
								<span class="point_color">가격</span>
								${oList.retail_price}원</strong>
							</p>
						</li>
						<li><strong>배송비</strong>
							<p>
								<span class="point_color">가격</span>
								${oList.shipping_fee}원</strong>
							</p>
						</li>
						<li><strong>부가결제 금액</strong>
							<p>${ oList.opointUse}원</p>
						</li>
					</ul>
				</div>
				<!-- 주문금액 End -->
<hr>
				<!-- 결제상세 Start -->
				<div class="order_bill_info">
					<div class="sum">결제상세</div>
					<div class="area_payment_info">
						<div class="sum">
							<strong class="price_sum_title">무통장입금</strong>
							<p class="price_sum_detail">
								<span class="point_color">가격</span>
								${oList.oi_totalprice}원
							</p>
						</div>

						<ul class="detail_payment_info">
							<li class="payment_detail_info">카카오뱅크 3333037503011</li>
							<li class="payment_detail_info">예금주 : (주)답인사 한별</li>
							<li class="payment_detail_info">입금기한 : <%out.println(beforeWeek);%></li>
						</ul>
					</div>
				</div>
				<!-- 결제상세 End -->

			</div>
		</div>

		<div class="payment_agree_wrap">

			<button class="p_mypage">구매내역 보기</span></button>
				<button class="p_homepage">
				<a href="http://localhost/">쇼핑 홈 가기</a></button>
		<div class="shdw_bottom"></div>
	</div>
</div>































		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
		
		<script type="text/javascript">
		$(document).ready(function () {
            var date = new Date();
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var day = date.getDate();
            var dayoftheweek = date.getDay();
            if (month < 10) {
                month = "0" + month;
            }
            if (day < 10) {
                day = "0" + day;
            }
            $('#Deposit-deadline').append(year + '년' + month + '월' +(date.getDate() + 7) + '일');
            date.setMonth(date.getMonth() + 1); $('#nextMonth').append(date.getFullYear() + '년' + (date.getMonth() + 1) + '월' + date.getDate()); + '일'  });
		</script>

		<script type="text/javascript" src="js/05_jquery.min.js"></script>
		<script type ="text/javascript" src = "js/00_common.js"></script>
		<script type="text/javascript" src="js/01_bootstrap.min.js"></script>
		<script type="text/javascript" src="js/02_isotope.pkgd.min.js"></script>
		<script type="text/javascript" src="js/03_jquery.hoverdir.js"></script>
		<script type="text/javascript" src="js/04_jquery.mCustomScrollbar.concat.min.js"></script>
		<script type="text/javascript" src="js/06_jquery.prettyPhoto.js"></script>
		<script type="text/javascript" src="js/07_modernizr.custom.97074.js"></script>
		<script type="text/javascript" src="js/08_template.js"></script>
		<script type="text/javascript" src="js/09_unslider-min.js"></script>

</body>

</html>