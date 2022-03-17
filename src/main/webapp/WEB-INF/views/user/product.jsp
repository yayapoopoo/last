<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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


<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/2.3.54/css/materialdesignicons.min.css">
<link rel="stylesheet" type="text/css"
	href="../css/jquery.mCustomScrollbar.min.css" />
<link rel="stylesheet" type="text/css" href="../css/00_common.css" />
<link rel="stylesheet" type="text/css" href="../css/03_product.css" />

</head>



<body class="app" data-target="#main-navbar" data-spy="scroll">

	<!----------------- header ----------------->
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>

	<!-- 기타 -->
	<a href="#" id="nino-scrollToTop">Go to Top</a>

	<c:forEach var="pList" items="${pList}">
		<c:if test="${id == pList.prod_id}">
			<div class="container">
				<!-- 제목 이미지(슬라이드) -->
				<div id="product-slider">
					<div class="slider-inner">
						<ul class="slides">
							<li><img src="../images/01.main/${pList.oriname}" alt=""></li>
							<li><img src="../images/01.main/${pList.oriname}" alt=""></li>
							<li><img src="../images/01.main/${pList.oriname}" alt=""></li>
							<li><img src="../images/01.main/${pList.oriname}" alt=""></li>
						</ul>
					</div>
					<p class="slide-btn">
						<span class="prev"><i class="mdi mdi-chevron-left"></i></span> <span
							class="next"><i class="mdi mdi-chevron-right"></i></span>
					</p>
				</div>

				<div class="product-basicinfo">
					<!-- 상품정보 -->
					<div class="info1">
						<h2>${pList.prod_name}</h2>
						<hr>
						<div class="info-body">
							<h4 class="title">Price</h4>
							<h4 class="content">
								<fmt:formatNumber value="${pList.retail_price}" pattern="#,###" />
								KRW
							</h4>
						</div>
						<br>
						<div class="info-body">
							<h4 class="title">Brand</h4>
							<h4 class="content">${pList.making_company}</h4>
						</div>
						<br>
						<div class="info-body">
							<h4 class="title">Delivery</h4>
							<h4 class="content">국내배송</h4>
						</div>
					</div>


<!--  오른쪽 -->
					<div class="info2">
						<form action="<c:url value='../order/${pList.prod_id}' />" method="get">
						<h6 style="text-align: right; font-size: 10px;" class="content">(최소주문수량 1개 이상 / 최대주문수량 99개 이하)</h6>

							<div class="basketdiv" id="basket">
								<div class="row head">
									<div class="subdiv">
										<div class="check" style="width: 10%">선택</div>
										<div class="pname" style="width: 20%">상품명</div>
									</div>
									<div class="subdiv">
										<div class="basketprice" style="width: 20%">가격</div>
										<div class="num" style="width: 25%">수량</div>
										<div class="sum" style="width: 25%">합계</div>
									</div>
									
								</div>
							</div>
	
	
								<div class="row data">
									<div class="subdiv">
									<div class="check" style="width: 10%">
									<input type="checkbox" name="buy" checked="" onclick="javascript:basket.checkItem();">&nbsp;
									</div>
										<div class="pname" style="width: 20%">
											<span>${pList.prod_name}</span>
										</div>
									</div>
									
									
									<div class="subdiv">
										<div class="basketprice" style="width: 20%">
											<input type="hidden" name="p_price" id="p_price1"
												class="p_price" value="${pList.retail_price}">
											<fmt:formatNumber value="${pList.retail_price}"
												pattern="#,###" />KRW
												
										</div>
										
										<div class="num"  style="width: 25%">
											<div class="updown">
												<input style="width: 50%" type="number" name="p_num1" id="p_num1" maxlength="4" class="p_num" value="1"
													onkeyup="javascript:basket.changePNum(1);">
													<span onclick="javascript:basket.changePNum(1);">
													<i class="mdi mdi-chevron-left down"></i></span>
													<span onclick="javascript:basket.changePNum(1);">
													<i class="mdi mdi-chevron-right up"></i></span>
											</div>

										</div>
										<div class="sum" style="width: 25%">
											<fmt:formatNumber value="${pList.retail_price}"
												pattern="#,###" />KRW
										</div>
									</div>
								</div>
								
							<button type="submit" class="btn" id="buynow">BUY NOW</button>
							<button type="button" class="btn" id="cart"><a href="../cart/cainsert?prod_id=${pList.prod_id}">CART</a></button>
							<button type="button" class="btn" id="wishInsert"><a href="../wish/wishInsert?prod_id=${pList.prod_id}">WISH LIST</a></button>
	
		
							 
	
	<div class="summoney" id="sum_p_price">합계 금액 ${pList.retail_price}KRW</div>
								<div class="sumcount" id="sum_p_num">상품 총 개수 1개</div>					
</form>
<hr style="border: none;">							
					</div>
					</div>
					
					

					<!-- 상품상세정보 구매정보 상품후기 상품문의 -->
					
						<div class="btn-group">
							<button id="detail-btn" class="btn">
								<a href="#product-Detail">상품상세정보</a>
							</button>
							<button id="buyinfo-btn" class="btn">
								<a href="#product-info">구매정보</a>
							</button>
							<button id="review-btn" class="btn">
								<a href="#product-review">상품후기</a>
							</button>
							<button id="QnA-btn" class="btn">
								<a href="#product-QnA">상품문의</a>
							</button>
						</div>
					



					<div id="product">
						<div class="product-Detail">
							<h2>상품상세정보</h2>
							<section class="up-on-scroll a">${pList.prod_summary_ex}
							</section>
							<section class="up-on-scroll a">${pList.prod_briefly_ex}
							</section>
							<section class="up-on-scroll a">${pList.prod_detail_ex}</section>
						</div>
					</div>


					<div class="product-info">
					<h2></h2>
						<h2>구매정보</h2>
						<div class="up-on-scroll info-body">
							<h4>
								- 반품 및 환불은 제품 수령 후 72시간 이내 커뮤니티 > Q&A 게시판 혹은 이메일 및 전화로 주문 취소 접수가
								가능합니다.<br> 게시판 답변 및 이메일, 전화통화를 통해 환불/교환 가능여부를 답변해 드립니다.<br>
								- 단순변심의 경우 상자 미개봉에 한하여 왕복택배비 고객 부담으로 처리 됩니다.<br> - 구성품 및 겉
								박스 개봉 시 교환/환불 불가합니다.<br> - 랜덤 상품의 경우는 동일한 제품으로의 교환은 불가능 하며,
								새 상품으로만 교환 가능합니다.<br> - 적립금 사용, 할인 품목 결제 시 교환/환불 불가합니다.<br>
								- 불량 상품의 경우 동일 상품으로 교환(1회에 한함)/반품 처리됩니다.<br>
							</h4>
							<h4>반품 및 교환 관련 문의 : 답인사
							<a href="http://suynthe.cafe24.com/board/consult/list.html">고객센터</a> / 
							<a href="tel:1688-5501">1688-5501</a></h4>
						</div>
					</div>


		<div class="up-on-scroll product-review">
			<table class="table table-responsive">
			<h2 class="titlea">상품후기</h2>
				<button id="move-btn" class="btn">
							<a href="../../review_list">상품후기 작성하러 가기</a>
						</button>	
			<tr align="center">
					<td width="15%">작성자명</td>
					<td width="30%">내용</td>
					<td width="25%">별점</td>
					<td width="10%">날짜</td>
					<td width="20%">답변여부</td>
				</tr>
				
				
				<c:forEach var="rbList" items="${rbList}">
				<c:choose>
				<c:when test="${rbList.b_writer != null}">
				<tr align="center">
				<td width="15%">${rbList.b_writer}</td>
				<td width="30%"><a href="#">${rbList.b_content}</a></td>
				<td width="25%">${rbList.b_star}</td>
				<td width="10%">${rbList.b_date}</td>
				<td width="20%">${rbList.b_reply}</td>
				</tr>
				</c:when>
				
				<c:otherwise>
				<h4>게시물이 없습니다</h4>
				</c:otherwise>
				</c:choose>
				</c:forEach>
				
				</table>
				
				</div>
	
	
	
		<div class="up-on-scroll product-QnA">
			<table class="table table-responsive">
			<h2 class="titlea">상품문의</h2>
			
					<button id="move-btn" class="btn">
							<a href="../../review_list">상품 문의하러가기</a>
						</button>	

			<tr align="center">
					<td width="15%">작성자명</td>
					<td width="25%">제목</td>
					<td width="30%">내용</td>
					<td width="10%">날짜</td>
					<td width="20%">답변여부</td>
				</tr>
				<c:forEach var="qbList" items="${qbList}">
				<c:choose>
				<c:when test="${qbList.b_writer != null}">
				
				<tr align="center">
				<td width="15%">${qbList.b_writer}</td>
				<td width="25%"><a href="../../contents">${qbList.b_title}</a></td>
				<td width="30%"><a href="../../contents">${qbList.b_content}</a></td>
				<td width="10%">${qbList.b_date}</td>
				<td width="20%">${qbList.b_reply}</td>
				</tr>
				</c:when>
						
				<c:otherwise>
				<h4>게시물이 없습니다</h4>
				</c:otherwise>
				</c:choose>
				</c:forEach>
				</table>
				
				</div>
   

	</c:if>
	</c:forEach>






	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
 







	<!-- javascript -->

	<script type="text/javascript">
		/* 바로구매 버튼 */
		$("#buynow").on("click", function() {

		});

		/* 바로구매 버튼 */
		$("#buynow").on(
				"click",
				function() {
					let bookCount = $(".quantity_input").val();
					$(".order_form").find("input[name='orders[0].oi_amount']")
							.val(oi_amount);
					$(".order_form").submit();
				});
	</script>


	<script type="text/javascript" src="../js/05_jquery.min.js"></script>
	<script type="text/javascript" src="../js/01_bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/02_isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="../js/03_jquery.hoverdir.js"></script>
	<script type="text/javascript"
		src="../js/04_jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="../js/06_jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="../js/07_modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="../js/08_template.js"></script>
	<script type="text/javascript" src="../js/09_unslider-min.js"></script>
	<script type="text/javascript" src="../js/00_common.js"></script>
	<script type="text/javascript" src="../js/11_product.js"></script>
</body>

</html>
				