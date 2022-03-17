<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>QR Code 관리자 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
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
<!-- jsGrid -->
<link rel="stylesheet"
	href="admin/plugins/jsgrid/jsgrid.min.css">
<link rel="stylesheet"
	href="admin/plugins/jsgrid/jsgrid-theme.min.css">
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

.card-body .content:hover {
	background-color: #c4e2ff;
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
							<h1 style="font-size: 25px; font-weight: 700;">QR 조회/수정</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">QR 조회/수정</li>
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
						<div class="col-12">
							<div class="card">
								<div class="card-header" style="background-color: #007bff;">
									<h3 class="card-title" style="font-size: 15px; color: #fff">QR
										Code를 조회/수정하는 게시판 입니다.</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<c:choose>
										<c:when test="${mb.m_grade == '운영자' || mb.m_grade == '부운영자'}">
											<table id="example2" class="table table-bordered table-hover"
												style="text-align: center; font-size: 14px;">
												<thead>
													<tr style="background-color: #f9f9f9">
														<th>번호</th>
														<th>구분</th>
														<th>주문자</th>
														<th>전화번호</th>
														<th>생성자</th>
														<th>생성자ID</th>
														<th>행사일자</th>
														<th>조회</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="qitem" items="${qList}">
														<tr class="content">
															<th class="t-no" style="font-weight: 500;">${qitem.qnum}</th>
															<th class="t-select" style="font-weight: 500;">${qitem.qselect}</th>
															<th class="t-title" style="font-weight: 500;">
																<!-- 상세보기 화면 이동 url + 게시글번호 --> <a
																href="./contents?qnum=${qitem.qnum}">
																	${qitem.qordername} </a>
															</th>
															<th class="t-phonenumber" style="font-weight: 500;">${qitem.qphonenumber}</th>
															<th class="t-writer" style="font-weight: 500;">${qitem.mname}</th>
															<th class="t-writer" style="font-weight: 500;">${qitem.qid}</th>
															<th class="t-date" style="font-weight: 500;">${qitem.qeventdate}</th>
															<th class="t-view" style="font-weight: 500;">${qitem.qviews}</th>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</c:when>
										<c:when test="${mb.m_grade == '기업회원' || mb.m_grade == '개인회원'}">
											<table id="example2" class="table table-bordered table-hover"
												style="text-align: center; font-size: 14px;">
												<thead>
													<tr style="background-color: #f9f9f9">
														<th>구분</th>
														<th>주문자</th>
														<th>전화번호</th>
														<th>생성자</th>
														<th>행사일자</th>
														<th>조회</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="qitem" items="${qmyList}">
														<tr class="content">
															<th class="t-select" style="font-weight: 500;">${qitem.qselect}</th>
															<th class="t-title" style="font-weight: 500;">
																<!-- 상세보기 화면 이동 url + 게시글번호 --> <a
																href="./contents?qnum=${qitem.qnum}">
																	${qitem.qordername} </a>
															</th>
															<th class="t-phonenumber" style="font-weight: 500;">${qitem.qphonenumber}</th>
															<th class="t-writer" style="font-weight: 500;">${qitem.mname}</th>
															<th class="t-date" style="font-weight: 500;">${qitem.qeventdate}</th>
															<th class="t-view" style="font-weight: 500;">${qitem.qviews}</th>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</c:when>
									</c:choose>	
									<!-- 페이징 -->
									<div class="paging"
										style="text-align: center; margin-top: 10px;">${paging}</div>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
				<!-- 페이징 -->
			</section>
			<!-- /.content -->
		</div>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
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
	<script>
		$(function() {
			$('#example2').DataTable({
				"paging" : false,
				"lengthChange" : false,
				"searching" : true,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
				order : [ [ 0, "desc" ] ]
			});
		});
	</script>
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
