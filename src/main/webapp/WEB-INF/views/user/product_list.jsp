<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link rel="shortcut icon" href="images/01.header/logo.png">

<!-- css -->

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.materialdesignicons.com/2.3.54/css/materialdesignicons.min.css">
<link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.min.css" />
<link rel="stylesheet" type="text/css" href="css/00_common.css" />
<link rel="stylesheet" type="text/css" href="css/02_product_list.css" />

</head>

<body class="app" data-target="#nino-navbar" data-spy="scroll">

	<!----------------- header ----------------->
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>


	<!-- 상품 -->
    <section id="product">
        <div class="product-title">
            <div class="title-left">
                <p class="product-num">${map.count}</p>
                <p>items</p>
            </div>
            <div class="title-right">
                <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                    <button value="recently" type="button" class="btn new-btn">
                        <a>신상품</a>
                    </button>
                    <button value="review" type="button" class="btn review-btn">
                        <a>낮은가격</a>
                    </button>

                    <button value="price" type="button" class="btn price-btn">
                        <a>높은가격</a>
                    </button>
                </div>
            </div>
        </div>
        <hr class="underline">
        


			<div class="product-list">
			<ul class="eventcontent">
			
			<c:forEach var="pList" items="${map.pList}">
				<li class="up-on-scroll">
					<div class="product-card">
					<a href="product/${pList.prod_id}">
						<img alt="상품이미지" class="image product-up-on-scroll"
							src="images/01.main/${pList.oriname}" />
						</a>
							<div class="product-card-body">
								<button class="title-btn">
								<a href="product/${pList.prod_id}" class="card-title">${pList.prod_name}</a>
								</button>
								<a href="product/${pList.prod_id}" class="price"><fmt:formatNumber value="${pList.retail_price}" pattern="#,###" /></a>
								<p class="card-text">${pList.prod_summary_ex}</p>
							</div>

								<div class="product-btn">
								<button class="product-btn2">								
							 <a href="order/${pList.prod_id}">
							 <i class="mdi mdi-currency-usd"></i></a>
							 </button>
							 
							 
							 <button class="product-btn2" type="submit">
							 <a href="/user/cart/cainsert?prod_id=${pList.prod_id}">
							 <i class="mdi mdi-cart-outline"></i></a>
							 </button>
							 
							 <button class="product-btn2">
							 <a href="wish/wishList"><i class="mdi mdi-heart-outline"></i> </a>
							 </button>
						</div>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>



	</section>
    <hr class="underline">
    
    
    
    
    







	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>


	<!-- 위로 스크롤하도록 -->
	<a href="#" id="nino-scrollToTop">Go to Top</a>



	<!-- javascript -->

	<script type="text/javascript" src="js/05_jquery.min.js"></script>
	<script type="text/javascript" src="js/01_bootstrap.min.js"></script>
	<script type="text/javascript" src="js/02_isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="js/03_jquery.hoverdir.js"></script>
	<script type="text/javascript"
		src="js/04_jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="js/06_jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="js/07_modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="js/08_template.js"></script>
	<script type="text/javascript" src="js/09_unslider-min.js"></script>
	<script type="text/javascript" src="js/00_common.js"></script>
	<script type="text/javascript" src="js/10_product_list.js"></script>
</body>

</html>