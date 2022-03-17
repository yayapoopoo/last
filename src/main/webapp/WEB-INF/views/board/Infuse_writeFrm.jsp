<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>이용안내 게시판</title>
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
							<h1 style="font-size: 25px; font-weight: 700;">이용안내 등록</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">이용안내 등록</li>
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
									<h3 class="card-title" style="font-size: 15px;">이용안내를 생성하는
										게시판 입니다.</h3>
								</div>
								<!-- /.card-header -->

								<!-- form start -->
								<form action="./infuse_boardWrite" class="write-form"
									method="post" enctype="multipart/form-data">
									<div class="card-body">
										<input type="hidden" name="bid" value="${mb.m_id}">
										<div class="form-group">
											<input type="text" class="form-control" name="btitle"
												autofocus placeholder="제목" required>
										</div>

										<textarea name="bcontents" placeholder="내용을 적어주세요."
											id="compose-textarea" class="form-control" style="height: 450px;"></textarea>
										<div class="filebox" style="margin-top: 15px;">
											<!-- 파일 입력 처리 영역 -->
											<label for="file" style="margin-right: 10px;">첨부파일</label> <input type="file"
												name="files" id="file" multiple> <input type="text"
												class="upload-name" value="파일선택" readonly>
											<!-- 업로드할 파일이 있으면 1, 없으면 0 -->
											<input type="hidden" id="filecheck" value="0" name="fileCheck">
										</div>
									</div>

									<div class="card-footer">
										<div class="float-right">
											<button type="button" class="btn btn-default"
												onclick="location.href='./infuse_list?pageNum=${pageNum}'">
												<i class="fas fa-times"></i> 취소
											</button>
											<button type="submit" class="btn btn-primary">
												<i class="fas fa-pencil-alt"></i> 작성
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
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
		<!-- AdminLTE App -->
		<script src="admin/dist/js/adminlte.min.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="admin/dist/js/demo.js"></script>


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
		</script>
		<!-- Page specific script -->
		<script type="text/javascript">
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
