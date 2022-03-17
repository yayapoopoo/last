<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
	<link rel="stylesheet" type="text/css" href="user/css/bootstrap.min.css" />
	<link href="https://cdn.materialdesignicons.com/2.3.54/css/materialdesignicons.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.min.css" />
	<link rel="stylesheet" type="text/css" href="user/css/00_main.css" />
	<link rel="stylesheet" type="text/css" href="user/css/01_main.css" />
</head>

<body class="app" data-target="#main-navbar" data-spy="scroll">

	<!----------------- header ----------------->
	<header>
		<jsp:include page="user/main_header.jsp"></jsp:include>
	</header>
	

	<!-- 기타 -->
	<a href="#" id="nino-scrollToTop">Go to Top</a>
	
	<!-- 상품 배너 - NEW ITEMS -->
    <section id="new-items">
        <div class="container">
            <h2 class="sectiontitle">NEW ITEMS</h2>
            <div class="sectionContent">
                <div class="row items-hoverEffect">
                    <c:forEach var="MNPList" items="${mmap.MNPList}" begin="0" end="1">
                        <div class="col-md-6 col-sm-6">
                            <div class="item">
                                <a class="overlay" href="user/product/${MNPList.prod_id}">
                                    	<span class="content">
                                        	<i class="mdi mdi-alert-box"></i>
                                        	<h2>${MNPList.prod_name}</h2>
                                        	<h4>${MNPList.retail_price}</h4>
                                    	    <p>${MNPList.prod_summary_ex}</p>
                                	    </span>
									<img src="user/images/01.main/${MNPList.oriname}" alt="">
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>


    <!-- 상품 배너 - BEST ITEMS -->
    <section id="beat-items">
        <div class="container">
            <h2 class="sectiontitle">BEST ITEMS</h2>

            <div class="sectionContent">
                <div class="row">
					<c:forEach var="MBPList" items="${mmap.MBPList}" begin="0" end="8">                   
                        <div class="col-md-4 col-sm-4">
                            <article>
                                <div class="articleThumb">
                                    <a href="user/product/${MBPList.prod_id}">
                                        <img src="user/images/01.main/${MBPList.oriname}" alt="">
                                    </a>
                                </div>
                                <div class="articleThumbs">
                                    <a href="user/product/${MBPList.prod_id}">
                                        <h2>${MBPList.prod_name}</h2>
                                    </a>
                                    <a href="user/product/${MBPList.prod_id}">
                                    <i class="mdi mdi-comment-multiple-outline"></i>
                                    ${MBPList.b_content}</a>
                                    <p>
                                    <a href="user/product/${MBPList.prod_id}">${MBPList.prod_summary_ex}</a>
                                    </p>
                                </div>
                            </article>
                        </div>
                     </c:forEach>
                </div>
            </div>
        </div>
    </section>
                
                
					
					
					
					
					
					
					
					
					
		<!-- 이벤트-->
	  <section id="nino-portfolio">
        <div class="container">
            <h2 class="sectiontitle">STORY</h2>
        </div>
        <div class="sectionContent">
            <ul class="nino-portfolioItems">
                <c:forEach var="MBEList" items="${mmap.MBEList}" begin="0" end="0">
                    <li class="item">
                        <a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="#">
                            <img src="user/images/01.main/story01.jpg" alt="" />
                            <div class="overlay">
                                <div class="content">
                                    <i class="mdi mdi-crown nino-icon"></i>
                                    <h4 class="title">${MBEList.b_title}</h4>
                                    <span class="desc">${MBEList.b_content}</span>
                                </div>
                            </div>
                        </a>
                    </li>
                </c:forEach>
                <c:forEach var="MBEList" items="${MBEList}" begin="1" end="1">
                    <li class="item">
                        <a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="#">
                            <img src="user/images/01.main/story02.jpg" alt="" />
                            <div class="overlay">
                                <div class="content">
                                    <i class="mdi mdi-cube-outline nino-icon"></i>
                                    <h4 class="title">${MBEList.b_title}</h4>
                                    <span class="desc">${MBEList.b_content}</span>
                                </div>
                            </div>
                        </a>
                    </li>
                </c:forEach>
                <c:forEach var="MBEList" items="${MBEList}" begin="2" end="2">
                    <li class="item">
                        <a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="#">
                            <img src="user/images/01.main/story03.jpg" alt="" />
                            <div class="overlay">
                                <div class="content">
                                    <i class="mdi mdi-desktop-mac nino-icon"></i>
                                    <h4 class="title">${MBEList.b_title}</h4>
                                    <span class="desc">${MBEList.b_content}</span>
                                </div>
                            </div>
                        </a>
                    </li>
                </c:forEach>
                <c:forEach var="MBEList" items="${MBEList}" begin="3" end="3">
                    <li class="item">
                        <a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="#">
                            <img src="user/images/01.main/story04.jpg" alt="" />
                            <div class="overlay">
                                <div class="content">
                                    <i class="mdi mdi-flower nino-icon"></i>
                                    <h4 class="title">${MBEList.b_title}</h4>
                                    <span class="desc">${MBEList.b_content}</span>
                                </div>
                            </div>
                        </a>
                    </li>
                </c:forEach>
                <c:forEach var="MBEList" items="${MBEList}" begin="4" end="4">
                    <li class="item">
                        <a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="#">
                            <img src="user/images/01.main/story05.jpg" alt="" />
                            <div class="overlay">
                                <div class="content">
                                    <i class="mdi mdi-gamepad-variant nino-icon"></i>
                                    <h4 class="title">${MBEList.b_title}</h4>
                                    <span class="desc">${MBEList.b_content}</span>
                                </div>
                            </div>
                        </a>
                    </li>
                </c:forEach>
                <c:forEach var="MBEList" items="${MBEList}" begin="5" end="5">
                    <li class="item">
                        <a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="#">
                            <img src="user/images/01.main/story06.jpg" alt="" />
                            <div class="overlay">
                                <div class="content">
                                    <i class="mdi mdi-gnome nino-icon"></i>
                                    <h4 class="title">${MBEList.b_title}</h4>
                                    <span class="desc">${MBEList.b_content}</span>
                                </div>
                            </div>
                        </a>
                    </li>
                </c:forEach>
                <c:forEach var="MBEList" items="${MBEList}" begin="6" end="6">
                    <li class="item">
                        <a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="#">
                            <img src="user/images/01.main/story01.jpg" alt="" />
                            <div class="overlay">
                                <div class="content">
                                    <i class="mdi mdi-guitar-electric nino-icon"></i>
                                    <h4 class="title">${MBEList.b_title}</h4>
                                    <span class="desc">${MBEList.b_content}</span>
                                </div>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </section>


	<footer>
		<jsp:include page="user/footer.jsp"></jsp:include>
	</footer>







	<!-- javascript -->
	
	<script type="text/javascript" src="user/js/01_bootstrap.min.js"></script>
	<script type="text/javascript" src="user/js/02_isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="user/js/03_jquery.hoverdir.js"></script>
	<script type="text/javascript" src="user/js/04_jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="user/js/05_jquery.min.js"></script>
	<script type="text/javascript" src="user/js/06_jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="user/js/07_modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="user/js/08_template.js"></script>
	<script type="text/javascript" src="user/js/09_unslider-min.js"></script>
	<script type="text/javascript" src="user/js/00_common.js"></script>


</body>

</html>