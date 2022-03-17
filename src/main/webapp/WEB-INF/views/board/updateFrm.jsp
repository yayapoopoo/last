<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>QR Code 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="QRCode/js/main.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="css/hf.css?ver=1">

<!-- Google Icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="admin/plugins/fontawesome-free/css/all.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="admin/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="admin/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="admin/dist/css/adminlte.min.css">
<link rel="stylesheet" href="css/hf.css?ver=1">
<link rel="stylesheet" href="css/style_writeFrm.css?ver=1">


<script type="text/javascript">
	$(function() {
		//메시지 출력 부분
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}

		//로그인한 회원 정보 및 로그아웃 출력
		var lname = "${mb.m_name}";
		$("#mname").html(lname + "님");
		$(".suc").css("display", "block");
		$(".bef").css("display", "none");
	});
</script>
<style type="text/css">
a {
	text-decoration: none;
	cursor: pointer;
	color: black;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a:focus {
	text-decoration: none;
}

a:hover, a:active {
	text-decoration: none;
}
</style>
</head>
<body>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 style="font-size: 25px; font-weight: 700;">QR 수정</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">QR 수정</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<!-- left column -->
						<div class="col-md-12">
							<!-- jquery validation -->
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title" style="font-size: 15px;">QR CODE
										수정하는 게시판 입니다.</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form action="./qrcodeUpdate" class="write-form" method="post"
									enctype="multipart/form-data">
									<!-- 로그인한 id(숨김), 제목, 내용, 파일-->
									<div class="content_title">
										<input type="hidden" name="qid" value="${mb.m_id}"> <input
											type="hidden" name="qnum" value="${qrcode.qnum}">
										<div class="card-body">
											<div class="form-group">
												<label>디자인을 선택해주세요</label> <select class="form-control"
													name="qselect" value="${qrcode.qselect}" required>
													<option value="결혼식">결혼식</option>
													<option value="돌잔치">돌잔치</option>
													<option value="부모님">환갑, 칠순, 팔순 등</option>
												</select>
											</div>

											<!-- qordername -->
											<div class="form-group">
												<label>주문자</label> <input type="text" name="qordername"
													class="form-control" placeholder="이름을 입력해주세요"
													value="${qrcode.qordername}" required>
											</div>

											<!-- qphonenumber -->
											<div class="form-group">
												<label>핸드폰번호</label> <input type="text" name="qphonenumber"
													class="form-control" placeholder="핸드폰번호를 입력해주세요"
													maxlength="13" value="${qrcode.qphonenumber}" required>
											</div>


											<!-- qemail -->
											<div class="form-group">
												<label>이메일</label> <input type="text" name="qemail"
													class="form-control" placeholder="이메일을 입력해주세요"
													value="${qrcode.qemail}" required>
											</div>


											<!-- qeventdate -->
											<div class="form-group">
												<label>행사 날짜</label> <input type="text" name="qeventdate"
													class="form-control"
													placeholder="결혼식, 환갑, 돌 잔치 등 행사날짜를 입력해주세요 ex) 20211030"
													maxlength="8" value="${qrcode.qeventdate}" required>
											</div>


											<!-- qprod1 -->
											<div class="form-group">
												<label>첫번째 답례품</label> <input type="text" name="qprod1"
													class="form-control"
													placeholder="첫번째로 보여질 답례품명을 입력해주세요 ex) 셈 브로 매그넘 틴티드 와인"
													value="${qrcode.qprod1}" required>
											</div>

											<!-- qprod2 -->
											<div class="form-group">
												<label>두번째 답례품</label> <input type="text" name="qprod2"
													class="form-control"
													placeholder="두번째로 보여질 답례품명을 입력해주세요 ex) 히말라야 핑크 소금"
													value="${qrcode.qprod2}">
											</div>

											<!-- qprod3 -->
											<div class="form-group">
												<label>세번째 답례품</label> <input type="text" name="qprod3"
													class="form-control"
													placeholder="세번째로 보여질 답례품명을 입력해주세요 ex) 호두강정세트"
													value="${qrcode.qprod3}">
											</div>

											<!-- qcontents -->
											<div class="form-group">
												<label>특이사항</label> <input type="text" name="qcontents"
													class="form-control" placeholder="특이사항을 입력해주세요"
													value="${qrcode.qcontents}">
											</div>
											<!-- <textarea rows="10" name="qcontents" placeholder="특이사항을 작성해주세요" class="write-input ta"></textarea> -->

											<div class="qfilebox">
												<span style="width: 10%; font-weight: 700; margin-right: 20px;">원본 첨부파일</span>
												<span id="qfile" class="befor-file"
													style="margin-bottom: 10px;">
													<c:if test="${empty qfList}">
														<label style="width: 100%">첨부 파일 없음</label>
													</c:if>
													<c:if test="${!empty qfList}">
														<c:forEach var="file" items="${qfList}">
															<span style="width: 100%; margin-right: 10px;"
																onclick="del('${file.qf_sysname}')">
																${file.qf_oriname} </span>
														</c:forEach>
													</c:if>
												</span>
											</div>

											<div class="filebox">
												<label for="file" style="width: 10%"><b>추가파일</b></label> <input
													type="file" name="files" id="file" multiple> <input
													class="upload-name" value="파일선택" readonly> <input
													type="hidden" id="filecheck" value="0" name="fileCheck">
											</div>
										</div>

										<div class="float-right">
											<!-- <input type="reset" class="material-icons" value="restart_alt">  -->
											<input type="button" class="btn btn-primary" value="취소"
												onclick="location.href='./list?pageNum=${pageNum}'">
											<input type="submit" class="btn btn-primary" value="등록">
										</div>
									</div>
								</form>
							</div>
							<!-- /.card -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.container-fluid -->
			</section>

			<!-- Control Sidebar -->
			<aside class="control-sidebar control-sidebar-dark">
				<!-- Control sidebar content goes here -->
			</aside>
			<!-- /.control-sidebar -->
		</div>
		<!-- ./wrapper -->

		<!-- jQuery -->
		<script src="admin/plugins/jquery/jquery.min.js"></script>
		<!-- Bootstrap 4 -->
		<script
			src="admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- DataTables  & Plugins -->
		<script
			src="admin/plugins/datatables/jquery.dataTables.min.js"></script>
		<script
			src="admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
		<script
			src="admin/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
		<script
			src="admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
		<script
			src="admin/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
		<script
			src="admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
		<script src="admin/plugins/jszip/jszip.min.js"></script>
		<script src="admin/plugins/pdfmake/pdfmake.min.js"></script>
		<script src="admin/plugins/pdfmake/vfs_fonts.js"></script>
		<script
			src="admin/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
		<script
			src="admin/plugins/datatables-buttons/js/buttons.print.min.js"></script>
		<script
			src="admin/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
		<!-- AdminLTE App -->
		<script src="admin/dist/js/adminlte.min.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="admin/dist/js/demo.js"></script>
		<!-- Page specific script -->
		<script type="text/javascript">
			//업로드할 파일을 선택하면 'upload-name' 요소에
			//파일 이름을 출력하고, 'fileCheck' 요소의 value를
			//1로 변경
			$("#file").on(
					"change",
					function() {
						//파일 입력창에서 선택한 파일 목록 가져오기
						var files = $("#file")[0].files;
						console.log(files);

						var fileName = "";

						if (files.length > 1) {//하나 이상의 파일 선택 시
							fileName = files[0].name + " 외 "
									+ (files.length - 1) + "개";
						} else if (files.length == 1) {
							fileName = files[0].name;
						}

						$(".upload-name").val(fileName);

						//fileCheck 부분 변경
						if (fileName == "") {//파일 취소 시.
							$("#filecheck").val(0);
							$(".upload-name").val("파일선택");
						} else {//파일 선택 시.
							$("#filecheck").val(1);
						}
					});

			// 핸드폰 번호 자동 하이픈
			function autoHypenPhone(str) {
				str = str.replace(/[^0-9]/g, '');
				var tmp = '';
				if (str.length < 4) {
					return str;
				} else if (str.length < 7) {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3);
					return tmp;
				} else if (str.length < 11) {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3, 3);
					tmp += '-';
					tmp += str.substr(6);
					return tmp;
				} else {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3, 4);
					tmp += '-';
					tmp += str.substr(7);
					return tmp;
				}
				return str;
			};

			var cellPhone = document.getElementById('qphonenumberInput');
			qphonenumberInput.onkeyup = function(event) {
				event = event || window.event;
				var _val = this.value.trim();
				this.value = autoHypenPhone(_val);
			};
		</script>
		<script src="QRCode/js/main.js"></script>
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
</body>
</html>
