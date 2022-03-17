<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>1:1 문의 게시글</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
<!-- Theme style -->
<link rel="stylesheet" href="admin/dist/css/adminlte.min.css">
<link rel="stylesheet" href="css/hf.css?ver=1">
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
						<h1 style="font-size: 25px; font-weight: 700;">1:1 문의 게시글</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">1:1 문의 게시글</li>
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
														href="./oneone_download?bf_sysname=${fitem.bf_sysname}&bf_oriname=${fitem.bf_oriname}">
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
											onclick="location.href='./oneone_list?pageNum=${pageNum}'">
											<i class="fas fa-bars"></i> 목록
										</button>
									</div>
									<button type="button" class="btn btn-primary" id="upbtn"
										onclick="location.href='./oneone_updateFrm?bnum=${board.bnum}'">
										<i class="fas fa-edit"></i> 글수정
									</button>
									<button type="button" class="btn btn-default" id="delbtn"
										onclick="delCheck(${board.bnum})">
										<i class="far fa-trash-alt"></i> 삭제
									</button>
								</div>
								<!-- /.card-header -->
								<!-- 댓글 작성 양식 -->
								<form id="rFrm">
									<textarea name="r_contents" placeholder="관리자 답변 작성"
										id="compose-textarea" class="form-control"
										style="height: 100px;"></textarea>
									<input type="button" value="답변 전송" class="btn btn-primary"
										onclick="replyInsert('${board.bnum}')"
										style="width: 100%; margin-bottom: 30px;">
								</form>
								<!-- 댓글 목록 보기 -->
								<table style="width: 100%">
									<!-- 제목 테이블 -->
									<tr bgcolor="#007bff" align="center" height="30">
										<td width="100%" style="color: #fff">답변내용</td>
									</tr>
								</table>
								<!-- 목록 테이블 -->
								<div id="rtable" style="width: 100%">
									<c:forEach var="r" items="${rList}">
										<div class="mailbox-read-info">
											<p
												style="text-align: left; font-size: 13px; font-weight: 500;">${r.r_contents}</p>
											<h6>
												<br> <span class="mailbox-read-time float-left">${r.r_id}</span><span
													class="mailbox-read-time float-right">${r.r_date}</span>
											</h6>
										</div>
									</c:forEach>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
					</div>
				</div>
				<!-- /.container-fluid -->
				<!-- 페이징 -->
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>
	<!-- /.control-sidebar -->
	<!-- ./wrapper -->
	<!-- jQuery -->
</body>
<script src="admin/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="admin/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="admin/dist/js/demo.js"></script>
<script src="admin/js/jquery.serializeObject.js"></script>
<!-- 댓글 전송 및 댓글 목록 새로고침용 스크립트 -->
<script type="text/javascript">
function replyInsert(bnum){
	console.log(bnum);
	
	var replyFrm = $("#rFrm").serializeObject();//댓글 내용
	replyFrm.r_bnum = bnum;//게시글 번호
	replyFrm.r_id = "${mb.m_id}";//댓글작성자(로그인) id
	console.log(replyFrm);
	
	//controller에 ajax로 전송
	$.ajax({
		url: "oneone_replyIns",
		type: "post",
		data: replyFrm,
		dataType: "json",
		success: function(result){//result에 rmap이 들어감.
			var dlist = "";
			var rlist = result.rList;//result(rmap)에서 rList를 꺼냄.
			console.log(rlist);//내용확인 필!
			
			//목록이라서 반복!
			for(var i = 0; i < rlist.length; i++){
				dlist += "<div class='mailbox-read-info'>"
					+ "<p style='text-align: left; font-size: 13px; font-weight: 500;''>" + rlist[i].r_contents + "</p>"
					+ "<h6><br><span class='mailbox-read-time float-left'>" + rlist[i].r_id + "</span>"
					+ "<span class='mailbox-read-time float-right'>" + rlist[i].r_date + "</span></h6>"
					+ "</div>";
			}
			$("#rtable").html(dlist);
			$("#comment").val("");
		},
		error: function(error){
			console.log(error);
			alert("댓글 입력 실패");
		}
	});
}

function delCheck(bnum){
	var conf = confirm("삭제하시겠습니까?");
	
	if(conf == true){
		location.href='./oneone_delete?bnum=' + bnum;
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

</html>