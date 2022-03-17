<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답례품 선택 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- CFoxlite Script Font Family -->
<link href="http://fonts.cdnfonts.com/css/foxlite-script"
	rel="stylesheet">

<!-- Google Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="admin/board/QRCode/vendor/aos/aos.css" rel="stylesheet">
<link href="admin/board/QRCode/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="admin/board/QRCode/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="admin/board/QRCode/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="admin/board/QRCode/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="admin/board/QRCode/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="admin/board/QRCode/css/style.css?ver1" rel="stylesheet">

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>



<!-- 다음 주소 API -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	//하객리스트/다운/수정/삭제/목록 버튼 처리(운영자, 부운영자, 본인의 글이 아니면 수정/삭제 불가)
	$("#upbtn").hide();
	$("#delbtn").hide();
	$("#list").hide();
	$(".guest_list_wrap").hide();
	$("#glist_down").hide();
	
	var mid = "${mb.m_id}";
	var midg = "${mb.gr_name}";
	var qid = "${qrcode.qid}";
	
	if(mid == qid || midg == '운영자' || midg == '부운영자'){
		$("#upbtn").show();
		$("#delbtn").show();
		$(".guest_list_wrap").show();
		$("#glist_down").show();
		$("#list").show();
	}	
});
</script>
</head>
<body>
	<!-- ======= Header ======= -->
	<header id="header" class="d-flex align-items-center">
		<div
			class="container d-flex align-items-center justify-content-between">
			<nav id="navbar" class="navbar"></nav>
			<!-- .navbar -->
		</div>
	</header>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<!-- 버튼 박스 -->
	<div class="card-footer">
		<div class="float-right">
			<button class="btn btn-primary" id="list"
				onclick="location.href='./list?pageNum=${pageNum}'">목록</button>
			<button class="btn btn-primary" id="upbtn"
				onclick="location.href='./updateFrm?qnum=${qrcode.qnum}'">수정</button>
			<button class="btn btn-primary" id="delbtn"
				onclick="delCheck(${qrcode.qnum})">삭제</button>
		</div>
	</div>

	<c:choose>
		<c:when test="${qrcode.qselect == '결혼식'}">
			<section id="hero">
				<div class="hero-container">
					<div class="hero-logo" data-aos="zoom-in">
						<img src="admin/board/QRCode/img/wedding.png" alt="">
					</div>
					<p data-aos="zoom-in">Wedding Story</p>
					<h2 data-aos="fade-up">
						꼭 잡은 두손, 마주한 모습 속에서<br>기쁨과 슬픔, 때로는 아픔을 함께하며<br>자그마한 행복의
						계단을 쌓아가겠습니다.<br>바쁘신 시간 내주어 참석해주시어 감사드립니다.
					</h2>
					<!-- <a data-aos="fade-up" data-aos-delay="10" href="#name" class="btn-get-started scrollto">답례품 선택</a> -->
					<a href="#name" class="btn-get-started scrollto" id="fade-in-btn">답례품
						선택하러가기</a>
				</div>
			</section>
		</c:when>
		<c:when test="${qrcode.qselect == '돌잔치'}">
			<section id="hero">
				<div class="hero-container">
					<div class="hero-logo" data-aos="zoom-in">
						<img src="admin/board/QRCode/img/dol.png" alt="">
					</div>
					<p data-aos="zoom-in">Happy 1ST Birthday</p>
					<h2 data-aos="fade-up">
						어느덧 1년, 아이를 키워보니<br>부모님의 마음과 더불어<br>감사함을 많이 느끼게 됩니다.<br>앞으로도
						여러분께 받은 마음 잊지 않고<br>건강하고 밝게 잘 키우겠습니다.<br>오늘 귀한 시간 내주심에
						감사드립니다.
					</h2>
					<!-- <a data-aos="fade-up" data-aos-delay="10" href="#name" class="btn-get-started scrollto">답례품 선택</a> -->
					<a href="#gift" class="btn-get-started scrollto" id="fade-in-btn">답례품
						선택하러가기</a>
				</div>
			</section>
		</c:when>
		<c:when test="${qrcode.qselect == '부모님'}">
			<section id="hero">
				<div class="hero-container">
					<div class="hero-logo" data-aos="zoom-in">
						<img src="admin/board/QRCode/img/huan.png" alt="">
					</div>
					<h2 data-aos="fade-up">
						언제나 든든한 버팀목이 되어 주신 은혜에<br>감사와 존경하는 마음을 전합니다<br>앞으로도 오래오래
						건강하시고<br>행복을 기원합니다.<br>언제나 사랑합니다.<br>사랑하는 가족 일동
					</h2>
					<!-- <a data-aos="fade-up" data-aos-delay="10" href="#name" class="btn-get-started scrollto">답례품 선택</a> -->
					<a href="#gift" class="btn-get-started scrollto" id="fade-in-btn">답례품
						선택하러가기</a>
				</div>
			</section>
		</c:when>
	</c:choose>
	<!-- End Hero -->
	<form id="gFrm">
		<main id="main">
			<!-- ======= Name Section ======= -->
			<c:choose>
				<c:when test="${qrcode.qselect == '결혼식'}">
					<section id="name" class="name">
						<div class="container">
							<div class="section-title" data-aos="fade-up">
								<p1>신랑 신부 선택</p1>
								<br>
								<!--	<p2>신랑측/신부측을 선택해주세요</p2> -->
								<br> <a class="name-logo" data-aos="zoom-in"><img
									src="admin/board/QRCode/img/person4.png" alt=""></a> <select
									class="form-select" aria-label="Default select example"
									name="g_select" required>
									<option value="선택하지않음" selected>신랑측/신부측을 선택해주세요</option>
									<option value="신랑측">신랑측</option>
									<option value="신부측">신부측</option>
								</select>
							</div>
						</div>
					</section>
				</c:when>
				<c:when test="${qrcode.qselect == '돌잔치' || '부모님'}">
					<section id="name" class="name" style="display: none;">
						<div class="container">
							<div class="section-title" data-aos="fade-up">
								<p1>신랑 신부 선택</p1>
								<br>
								<!--	<p2>신랑측/신부측을 선택해주세요</p2> -->
								<br> <a class="name-logo" data-aos="zoom-in"><img
									src="admin/board/QRCode/img/person4.png" alt=""></a> <select
									class="form-select" aria-label="Default select example"
									name="g_select" required>
									<option value="선택하지않음" selected>신랑측/신부측을 선택해주세요</option>
									<option value="신랑측">신랑측</option>
									<option value="신부측">신부측</option>
								</select>
							</div>
						</div>
					</section>
				</c:when>
			</c:choose>
			<!-- End Name Section -->

			<!-- ======= Gift Section ======= -->
			<section id="gift" class="gift">
				<div class="container" data-aos="zoom-in">
					<p1>답례품 선택</p1>
					<p2>답례품은 중복 선택이 불가 합니다.</p2>

					<div class="gift-slider swiper-container" data-aos="fade-up"
						data-aos-delay="100">
						<div class="swiper-wrapper">
							<c:forEach var="f" items="${fList}" begin="0" end="2">
								<div class="swiper-slide">
									<div class="gift-item">
										<c:if test="${fn:containsIgnoreCase(f.qf_sysname, '.jpg')}">
											<img class="gift-img"
												src="qrcode/${f.qf_sysname}" width="300px"
												height="300px">
										</c:if>
										<c:if test="${fn:containsIgnoreCase(f.qf_sysname, '.png')}">
											<img class="gift-img"
												src="qrcode/${f.qf_sysname}" width="300px"
												height="300px">
										</c:if>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="swiper-pagination"></div>
					</div>

					<select class="form-select" aria-label="Default select example"
						name="g_present" required>
						<option value="${qrcode.qprod1}" selected>답례품을 선택해주세요</option>
						<option value="${qrcode.qprod1}">${qrcode.qprod1}</option>

						<c:choose>
							<c:when test="${qrcode.qprod2 != null}">
								<option value="${qrcode.qprod2}">${qrcode.qprod2}</option>
							</c:when>
							<c:when test="${qrcode.qprod2 == null}">
								<option value="${qrcode.qprod2}" style="display: none;">${qrcode.qprod2}</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${qrcode.qprod3 != null}">
								<option value="${qrcode.qprod3}">${qrcode.qprod3}</option>
							</c:when>
							<c:when test="${qrcode.qprod3 == null}">
								<option value="${qrcode.qprod3}" style="display: none;">${qrcode.qprod3}</option>
							</c:when>
						</c:choose>
					</select>

					<p id="selectx">
						답례품을 선택하지 않으면 <br> 첫번째 답례품으로 자동 선택이 됩니다
					</p>
					<!-- <div calss="btn-align">
          <a href="#name" class="btn-get-started scrollto" id="fade-in-btn">이전</a>
          <a href="#shipinf" class="btn-get-started scrollto" id="fade-in-btn">다음</a>
        </div> -->
				</div>
			</section>
			<!-- End Gift Section -->

			<!-- ======= Shipinf Section ======= -->
			<section id="shipinf" class="shipinf">
				<div class="container">
					<div class="section-title" data-aos="fade-up">
						<!-- <p1>배송정보입력</p1><br>
          <p2>답례품 수령 정보를 입력해주세요</p2> -->
						<a class="shipinf-img" data-aos="zoom-in"><img
							src="admin/board/QRCode/img/shipinf.png" alt=""></a>
					</div>
					<input type="text" class="form-control" id="form-control_margin"
						placeholder="수령인을 입력해주세요" name="g_name" required> <input
						type="text" class="form-control" id="form-control_margin"
						placeholder="연락처를 입력해주세요" name="g_phonenumber" required>

					<!-- <div class="input-group mb-3">
            <input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호"
              aria-label="Recipient's username" aria-describedby="basic-addon2">
            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
          </div> -->
					<!-- 
          <div class="input-group mb-3">
            <input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소"
              aria-label="Recipient's username" aria-describedby="basic-addon2">
          </div>
          <span id="guide" style="color:#999;display:none"></span>
          <div class="input-group mb-3">
            <input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소"
              aria-label="Recipient's username" aria-describedby="basic-addon2">
          </div>     -->
					<div id="postcode">
						<input type="text" class="form-control" id="sample4_postcode"
							placeholder="우편번호" name="g_post" required> <input
							type="button" id="sample4_postcode_btn"
							onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					</div>

					<input type="text" class="form-control" id="sample4_roadAddress"
						placeholder="도로명주소" name="g_address1" required> <input
						type="text" class="form-control" id="sample4_jibunAddress"
						placeholder="지번주소"> <span id="guide"
						style="color: #999; display: none"></span> <input type="text"
						class="form-control" id="sample4_detailAddress" placeholder="상세주소"
						name="g_address2" required> <input type="text"
						class="form-control" id="sample4_extraAddress" placeholder="참고항목">
					<select class="form-select" aria-label="Default select example"
						name="g_memo" required>
						<option selected>배송메모를 선택해주세요</option>
						<option value="배송 전에 미리 연락 바랍니다">배송 전에 미리 연락 바랍니다.</option>
						<option value="부재시 경비실에 맡겨 주세요">부재시 경비실에 맡겨 주세요</option>
						<option value="문앞에 놔주세요.">문앞에 놔주세요.</option>
					</select>
					<div class="section3">
						<p3>완료 버튼 클릭 후에는 <p4>정보 수정이 불가</p4>하니</p3>
						<br>
						<p3>답례품 및 수령인 정보 최종 확인 후</p3>
						<br>
						<p3>완료 버튼 클릭 부탁 드립니다.</p3>
						<br>
					</div>

					<div class="section4">
						<p5>개인정보 제공 동의 : 답인사 <a href="./thanks">상세보기</a></p5>
						<BR>
						<p6>선택 내용을 확인 하였으며, 정보 제공 등에 동의 합니다.</p6>
					</div>

					<!-- <div calss="btn-align">
          <a href="#gift" class="btn-get-started scrollto" id="fade-in-btn">이전</a>
          <input class="btn btn-primary" type="submit" value="완료">
        </div> -->

					<!-- 하객 정보에 기입 후 빠져나가기-->
					<input type="button" value="완료" class="btn btn-primary"
						style="width: 100%;" onclick="guestInsert(${qrcode.qnum});">

					<!--   <div class="row justify-content-center" id="submit">
						<input class="btn btn-primary" type="submit" value="완료">
					</div> -->
				</div>
			</section>
			<!-- End Shipinf Section -->
		</main>
	</form>
	<!-- End #main -->

	<!-- 하객 리스트-->
	<div class="guest_list_wrap">
		<table class="guest_list" id="guest_list">
			<thead>
				<tr class="line1">
					<th colspan="3" style="width: 100%">하객 정보</th>

				</tr>
				<tr class="line2">
					<th scope="col" style="width: 3%">No</th>
					<th scope="col" style="width: 5%">구분</th>
					<th scope="col" style="width: 17%">답례품</th>
					<th scope="col" style="width: 5%">수령인</th>
					<th scope="col" style="width: 10%">연락처</th>
					<th scope="col" style="width: 5%">우편번호</th>
					<th scope="col" style="width: auto">도로명주소</th>
					<th scope="col" style="width: 10%">상세주소</th>
					<th scope="col" style="width: 15%">배송메모</th>
					<th scope="col" style="width: 10%">작성시간</th>
				</tr>
			</thead>
			<!-- 댓글 리스트 불러오기-->
			<tbody class="gtable">
				<c:forEach var="g" items="${gList}">
					<tr class="line3">
						<th>${g.g_num}</th>
						<th>${g.g_select}</th>
						<th>${g.g_present}</th>
						<th>${g.g_name}</th>
						<th>${g.g_phonenumber}</th>
						<th>${g.g_post}</th>
						<th>${g.g_address1}</th>
						<th>${g.g_address2}</th>
						<th>${g.g_memo}</th>
						<th><fmt:formatDate value="${g.g_date}"
								pattern="yyyy-MM-dd HH:mm:ss" /></th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<button type="button" class="btn btn-primary" id="glist_down"
		style="width: 100%;" onclick="fnExcelReport('guest_list','하객명단');">하객명단
		다운</button>
</body>
<script src="admin/board/js/jquery.serializeObject.js"></script>
<!-- 댓글 전송 및 댓글 목록 새로고침용 스크립트 -->
<script type="text/javascript">
function guestInsert(qnum){
	console.log("qnum : "+qnum);
	
	var guestFrm = $("#gFrm").serializeObject();//댓글 내용
	guestFrm.g_qnum = qnum;//게시글 번호
	guestFrm.g_id = "${mb.m_id}";//댓글작성자(로그인) id
	console.log("guestFrm : "+guestFrm);
	
	//controller에 ajax로 전송
	$.ajax({
		url: "guestIns",
		type: "post",
		data: guestFrm,
		dataType: "json",
		success: function(result){//result에 rmap이 들어감.
			console.log(result);
			var dlist = "";
			var glist = result.gList;//result(rmap)에서 gList를 꺼냄.
			console.log(glist);//내용확인 필!
			
			//목록이라서 반복!
			
			for(var i = 0; i < glist.length; i++){
				dlist += "<tr class='line3'>"
					+ "<th>" + glist[i].g_num + "</th>"
					+ "<th>" + glist[i].g_select + "</th>"
					+ "<th>" + glist[i].g_present + "</th>"
					+ "<th>" + glist[i].g_name + "</th>"
					+ "<th>" + glist[i].g_phonenumber + "</th>"
					+ "<th>" + glist[i].g_post + "</th>"
					+ "<th>" + glist[i].g_address1 + "</th>"
					+ "<th>" + glist[i].g_address2 + "</th>"
					+ "<th>" + glist[i].g_memo + "</th>"
					+ "<th>" + glist[i].g_date + "</th>"
					+ "</tr>";
			}	
			
			$("#gtable").html(dlist);
			$("#comment").val("");
			location.href='./thanks?qnum=' + qnum;
		},
		error: function(error){
			console.log(error);
			alert("모든 정보를 선택&입력 해주셔야 합니다.");
		}
	});
}

function delCheck(qnum){
	var conf = confirm("삭제하시겠습니까?");
	
	if(conf == true){
		location.href='./delete?qnum=' + qnum;
	}
}

</script>
<!-- Vendor JS Files -->
<script src="admin/board/QRCode/vendor/aos/aos.js"></script>
<script
	src="admin/board/QRCode/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="admin/board/QRCode/vendor/glightbox/js/glightbox.min.js"></script>
<script
	src="admin/board/QRCode/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="admin/board/QRCode/vendor/php-email-form/validate.js"></script>
<script src="admin/board/QRCode/vendor/swiper/swiper-bundle.min.js"></script>

<!-- Template Main JS File -->
<script src="admin/board/QRCode/js/main.js"></script>
<script type="text/javascript">
document.onkeydown = trapRefresh;
function trapRefresh(){
   if(event.keyCode == 116){
      event.keyCode = 0;
      event.cancleBubble = true;
      event.returnValue = false;
      document.location.reload();
   }
}
  </script>
</html>