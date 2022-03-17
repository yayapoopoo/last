<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%
Authentication auth = SecurityContextHolder.getContext().getAuthentication();
Object principal = auth.getPrincipal();

String name = "";
if (principal != null) {
	name = auth.getName();
}
%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>답인사</title>

	<!-- favicon -->
	<link rel="shortcut icon" href="../images/01.header/logo.png">
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="user/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="user/css/materialdesignicons.min.css" />
	<link rel="stylesheet" type="text/css" href="user/css/jquery.mCustomScrollbar.min.css" />
	<link rel="stylesheet" type="text/css" href="user/css/00_common.css" />
</head>

<body class="app" data-target="user/product_listnino-navbar" data-spy="scroll">
	<!-- 사이드 바-->
`	<div class="side-bar" id="side-bar">
		<!--사이드 헤더-->
		<div class="sign-processor">
			<!-- 아이콘-->
			<sec:authorize access="isAnonymous()">
			<div class="sign-icon">
				<i class="mdi mdi-account-circle"></i>
				<div class="sign-icon-2">
					<i class="mdi mdi-close" id="close"></i>
					
					<c:choose>
					<c:when test="${M_ROLE == 'ROLE_ADMIN'}">
					<a href="../admin/main"><i class="mdi mdi-account-check" id="manager"></i>
					</a>
					</c:when>
					<c:otherwise>
					</c:otherwise>
					</c:choose>
					
				</div>
				<!-- 로그인/회원가입 -->
				<div class="sign-login">
					<!-- 첫번째 줄 -->
					<a href="/loginForm"
						class="sign-login-link">로그인 하기 ></a>
					<!-- 두번째 줄-->
					<div class="sign-join">
						<span class="sign-join-guide">아직 회원이 아니신가요?</span>
						<a href="/joinFrm" class="sign-join-link">회원가입</a></div>
				</div>
			</div>
			</sec:authorize>
			
			<sec:authorize access="isAuthenticated()">
			<div class="sign-icon">
				<i class="mdi mdi-account-circle"></i>
				<div class="sign-icon-2">
					<i class="mdi mdi-close" id="close"></i>
					<a href="../admin/main"><i class="mdi mdi-account-check" id="manager"></i>
					</a>
					
				</div>
				<!-- 로그인/회원가입 -->
				<div class="sign-login">
					<!-- 첫번째 줄-->
					<a href="/logout"
						class="sign-login-link">로그아웃 하기 ></a>
					<!-- 두번째 줄-->
					<div class="sign-join">
						<span class="sign-join-guide"><%=name %>님 환영합니다</span>
					</div>
				</div>
				</div>		
				</sec:authorize>
		</div>
		
		<!-- 검색바-->
		<form name="search" method="get">
		<div class="search">
		<input type="text" class="search-text" placeholder="Search..." name="keyword" >
		<button class="search-btn" type="submit">검색</button>
		</div>
		</form>
		
		<!--카테고리 부분-->
		<!--대분류-->
		<div class="category-menu">
			<ul class="tab-menu-list">
				<li class="tab-menu-selector" id="s-category">
					카테고리
				</li>
				<li class="tab-menu-selector" id="s-community">
					커뮤니티
				</li>
			</ul>

			<!--카테고리 중분류-->
			<div class="category-m-menu" id="category">
				<!--중분류(메인 카테고리)-->
				<ul class="m-menu-list">
					<li class="menu_selector">
						<span class="menu_selector-wrapper" id="1">
							답례품
						</span></li>
					<li class="menu_selector">
						<span class="menu_selector-wrapper" id="2">
							답례품 교환권
						</span></li>
					<li class="menu_selector">
						<span class="menu_selector-wrapper" id="3">
							드레스/한복
						</span></li>
					<li class="menu_selector">
						<span class="menu_selector-wrapper" id="4">
							헤어/메이크업
						</span></li>
					<li class="menu_selector">
						<span class="menu_selector-wrapper" id="5">
							스튜디오
						</span></li>
					<li class="menu_selector">
						<span class="menu_selector-wrapper" id="6">
							청첩장
						</span></li>
					<li><a href="../product_list" class="m-menu-all">
							카테고리 전체보기
							<i class="mdi mdi-chevron-right"></i>
						</a></li>
				</ul>
				<!-- 소분류 -->
				<div class="s-menu-list">
					<a href="product_list" class="menu-link menu-link-all">답례품 전체보기 ></a>
					<div class="menu-line"></div>
					<a href="user/product_list" class="menu-link">돌</a>
					<a href="user/product_list" class="menu-link">환갑/고희</a>
					<a href="user/product_list" class="menu-link">결혼</a>
					<a href="user/product_list" class="menu-link">전사</a>
					<a href="user/product_list" class="menu-link">2p/3p세트 타올</a>
					<a href="user/product_list" class="menu-link">원피스/페브릭 타올</a>
					<a href="user/product_list" class="menu-link">주방타올/발매트</a>
					<a href="user/product_list" class="menu-link">케잌타올</a>
				</div>


				<!-- 소분류2 -->
				<div class="s-menu-list-2">
					<a href="product_list" class="menu-link menu-link-all">답례품 교환권 전체보기 ></a>
					<div class="menu-line"></div>
					<a href="user/product_list" class="menu-link">커피</a>
					<a href="user/product_list" class="menu-link">케이크</a>
					<a href="user/product_list" class="menu-link">책</a>
				</div>

				<!-- 소분류3 -->
				<div class="s-menu-list-3">
					<a href="user/product_list" class="menu-link menu-link-all">드레스/한복 전체보기 ></a>
					<div class="menu-line"></div>
					<a href="user/product_list" class="menu-link">커피</a>
					<a href="user/product_list" class="menu-link">케이크</a>
					<a href="user/product_list" class="menu-link">책</a>
				</div>

				<!-- 소분류4 -->
				<div class="s-menu-list-4">
					<a href="user/product_list" class="menu-link menu-link-all">헤어/메이크업 전체보기 ></a>
					<div class="menu-line"></div>
					<a href="user/product_list" class="menu-link">커피</a>
					<a href="user/product_list" class="menu-link">케이크</a>
					<a href="user/product_list" class="menu-link">책</a>
				</div>

				<!-- 소분류5 -->
				<div class="s-menu-list-5">
					<a href="user/product_list" class="menu-link menu-link-all">스튜디오 전체보기 ></a>
					<div class="menu-line"></div>
					<a href="user/product_list" class="menu-link">커피</a>
					<a href="user/product_list" class="menu-link">케이크</a>
					<a href="user/product_list" class="menu-link">책</a>
					<a href="user/product_list" class="menu-link">커피</a>
					<a href="user/product_list" class="menu-link">케이크</a>
					<a href="user/product_list" class="menu-link">책</a>
					<a href="user/product_list" class="menu-link">커피</a>
					<a href="user/product_list" class="menu-link">케이크</a>
					<a href="user/product_list" class="menu-link">책</a>
				</div>

				<!-- 소분류6 -->
				<div class="s-menu-list-6">
					<a href="user/product_list" class="menu-link menu-link-all">청첩장 전체보기 ></a>
					<div class="menu-line"></div>
					<a href="user/product_list" class="menu-link">커피</a>
					<a href="user/product_list" class="menu-link">케이크</a>
					<a href="user/product_list" class="menu-link">책</a>
				</div>
			</div>

			<!--커뮤니티 중분류-->
			<div class="community-m-menu" id="community">

				<ul class="cm-menu-list">
					<li class="cmenu_selector">
						<a href="../../infuse_list">공지사항
							<i class="mdi mdi-chevron-right"></i>
						</a>
					</li>
					<li class="cmenu_selector">
						<a href="../../review_list">
							상품 사용후기
							<i class="mdi mdi-chevron-right"></i>
						</a>
					</li>
					<li class="cmenu_selector">
						<a href="../../oneone_list">
							상품 Q&A
							<i class="mdi mdi-chevron-right"></i>
						</a>
					</li>
					<li class="cmenu_selector">
						<a href="../../product_list">
							이벤트
							<i class="mdi mdi-chevron-right"></i>
						</a>
					</li>
				</ul>
			</div>
		</div>

		<!-- 최근 본 상품 -->
		<div class="recently-product">
			<header class="title">최근 본 상품</header>
			<div class="mini-posts">
				<a href="../product/${id}"><img src="../images/01.main/${val}" alt="" /></a>
				
			</div>
		</div>
		<!--고객센터 -->
		<div class="customer">
			<header class="title">center</header>
			<div class="center">
				<ul>
					<li class="email"><a href="mailto:llap0420@naver.com">llap0420@naver.com</a></li>
					<li class="phone"><a href="tel:010-3455-6985">010-3455-6985</a></li>
					<li class="home">서울특별시 강서구 공항대로 212 (마곡동)<br /> 문영퀸즈파크11차 A동 730호
					</li>
				</ul>
			</div>
			<div class="service">
				<ul>
					<li class="fa-envelope-o">
						<a href="tel:010-3455-6985">
							<i class="mdi mdi-phone-in-talk"></i>
							고객센터
						</a>
					</li>
					<li class="fa-envelope-o">
						<a href="http://suynthe.cafe24.com/board/consult/list.html">
							<i class="mdi mdi-bulletin-board"></i>
							1:1 문의
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>


	<!-- 헤더 -->
	<header id="main-header">
		<div id="main-headerInner">
			<!-- 헤더 - 네비게이션 -->
			<nav id="main-navbar" class="navbar navbar-default" role="navigation">
				<div class="container">
					<!-- 로고(이미지,글씨) -->
					<div class="navbar-header">
						<a class="navbar-brand" href="/">
							<img class="main-logo-img" src="user/images/logo.png" alt="web-logo">
							<span class="nino-subHeading main-logo"> DABYINSA</span>
						</a>
					</div>

					<!-- 메뉴바 옆 카테고리 -->
					<div class="nino-menuItem pull-right">
						<!-- 누르면 해당 메뉴가 있는 곳으로 이동함 -->
						<div class="collapse navbar-collapse pull-left"
							id="nino-navbar-collapse">
							<ul class="nav navbar-nav">
								<li><a href="user/product_list">답례품</a></li>
								<li><a href="user/product_list">답례품교환권</a></li>
								<li><a href="user/product_list">드레스/한복</a></li>
								<li><a href="user/product_list">헤어/메이크업</a></li>
								<li><a href="user/product_list">스튜디오</a></li>
								<li><a href="user/product_list">청첩장</a></li>
							</ul>
						</div>

						<!-- 장바구니 마이페이지-->
						<ul class="nino-iconsGroup nav navbar-nav">
							<!-- 사이드 메뉴 버튼 -->
							<button id="sbtn" class="sbtn" style="color: white;" ><a href="myPage"><i class="mdi mdi-heart-outline"></i></a></button>
							<button id="sbtn" class="sbtn" style="color: white;" ><a href="user/cart/list"><i class="mdi mdi-cart-outline nino-icon"></i></a></button>
							<button id="sbtn" class="sbtn" style="color: white;" ><a href="user/wish/wishList"><i class="mdi mdi-account"></i></a></button>
							<button id="sbtn" class="sbtn"><i class="mdi mdi-menu"></i></button>
							
								
						</ul>
					</div>
				</div>
			</nav>

		</div>
	</header>

	<script type="text/javascript" src="user/js/05_jquery.min.js"></script>
	<script type="text/javascript" src="user/js/00_common.js"></script>
	
	<script type="text/javascript" src="user/js/01_bootstrap.min.js"></script>
	<script type="text/javascript" src="user/js/02_isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="user/js/03_jquery.hoverdir.js"></script>
	<script type="text/javascript" src="user/js/04_jquery.mCustomScrollbar.concat.min.js"></script>
	
	<script type="text/javascript" src="user/js/07_modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="user/js/08_template.js"></script>
	<script type="text/javascript" src="user/js/09_unslider-min.js"></script>
</body>

</html>