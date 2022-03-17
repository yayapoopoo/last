<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<script type="text/javascript">
$(function(){	
	//수정/삭제 버튼 처리(운영자 아니면 수정/삭제 불가)
	$("#upbtn").hide();
	$("#delbtn").hide();
	
	var mg = "${mb.m_grade}";
	
	if(mg == '운영자' || mg == '부운영자'){
		$("#upbtn").show();
		$("#delbtn").show();
	}
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
						<h1 style="font-size: 25px; font-weight: 700;">이용안내 게시글</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">이용안내 게시글</li>
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
					<div class="col-md-9">
						<div class="card card-primary card-outline">
							<div class="card-header">
								<p class="card-title" style="font-size: 15px;">글번호
									${board.bnum}</p>
							</div>
							<!-- /.card-header -->
							<div class="card-body p-0">
								<div class="mailbox-read-info">
									<span class="mailbox-read-time float-right">조회수
										${board.bviews}</span>
									<p
										style="text-align: center; font-size: 20px; font-weight: 700;">${board.btitle}</p>
									<h6>
										<br> <span class="mailbox-read-time float-left">${board.mname}</span><span
											class="mailbox-read-time float-right">${board.bdate}</span>
									</h6>
								</div>

								<!-- /.mailbox-read-info -->
								<div class="mailbox-controls with-border text-center">
									<!-- /.mailbox-controls -->
									<div class="mailbox-read-message"
										style="font-size: 16px; height: 450px; text-align: left;">${board.bcontents}
									</div>
									<!-- /.mailbox-read-message -->
								</div>
								<!-- /.card-body -->
								<div class="card-footer bg-white">
									<div>
										<span style="font-weight: 700;">첨부파일</span> <span
											style="margin-left: 50px;"> <!-- 첨부파일이 없을 경우 --> <c:if
												test="${empty fList}">
							첨부된 파일이 없습니다.
						</c:if> <!-- 첨부파일이 있을 경우 --> <c:if test="${!empty fList}">
												<!-- 첨부파일이 여러개인 경우를 기본으로 처리 -->
												<c:forEach var="fitem" items="${fList}">
													<a
														href="./review_download?bf_sysname=${fitem.bf_sysname}&bf_oriname=${fitem.bf_oriname}">
														<span class="file-title">
															&nbsp;${fitem.bf_oriname}&nbsp; </span>
													</a>
												</c:forEach>
											</c:if>
										</span>
									</div>
								</div>
								<!-- /.card-footer -->
								<div class="card-footer">
									<div class="float-right">
										<button type="button" class="btn btn-default"
											onclick="location.href='./review_list?pageNum=${pageNum}'">
											<i class="fas fa-bars"></i> 목록
										</button>
									</div>
									<button type="button" class="btn btn-primary" id="upbtn"
										onclick="location.href='./review_updateFrm?bnum=${board.bnum}'">
										<i class="fas fa-edit"></i> 글수정
									</button>
									<button type="button" class="btn btn-default" id="delbtn"
										onclick="delCheck(${board.bnum})">
										<i class="far fa-trash-alt"></i> 삭제
									</button>
								</div>
								<!-- /.card-header -->

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
	<script src="admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables  & Plugins -->
	<script src="admin/plugins/datatables/jquery.dataTables.min.js"></script>
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
	<script src="admin/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script src="admin/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script src="admin/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<!-- AdminLTE App -->
	<script src="admin/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="admin/dist/js/demo.js"></script>
	<!-- Page specific script -->
	<!-- 삭제 스크립트 -->
	<script type="text/javascript">
function delCheck(bnum){
	var conf = confirm("삭제하시겠습니까?");
	
	if(conf == true){
		location.href='./review_delete?bnum=' + bnum;
	}
}
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