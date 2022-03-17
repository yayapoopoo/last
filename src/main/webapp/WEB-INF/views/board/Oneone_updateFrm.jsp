<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>1:1 문의 게시판</title>
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
							<h1 style="font-size: 25px; font-weight: 700;">1:1 문의 수정</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">1:1 문의 수정</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<section>
				<form action="./oneone_boardUpdate" class="write-form" method="post"
					enctype="multipart/form-data">
					<div class="card-body">
						<input type="hidden" name="bid" value="${mb.m_id}"> <input
							type="hidden" name="bnum" value="${board.bnum}">
						<div class="form-group">
							<input type="text" class="form-control" name="btitle" autofocus
								placeholder="제목" value="${board.btitle}" required>
						</div>
						<textarea name="bcontents" placeholder="내용을 적어주세요."
							id="compose-textarea" class="form-control" style="height: 450px;">${board.bcontents}</textarea>
						<div class="filebox">
							<div id="bfile" class="befor-file" style="margin-bottom: 10px;">
								<label style="margin-right: 10px;">원본파일</label>
								<c:if test="${empty bfList}">
									<span style="width: 100%">첨부 파일 없음</span>
								</c:if>
								<c:if test="${!empty bfList}">
									<c:forEach var="file" items="${bfList}">
										<span style="width: 100%; margin-right: 10px;"
											onclick="del('${file.bf_sysname}')">
											${file.bf_oriname} </span>
									</c:forEach>
								</c:if>
							</div>
							<label for="file" style="margin-right: 10px;">추가파일</label> <input
								type="file" name="files" id="file" multiple> <input
								class="upload-name" value="파일선택" readonly> <input
								type="hidden" id="filecheck" value="0" name="fileCheck">
						</div>
						<div class="card-footer">
							<div class="float-right">
								<button type="button" class="btn btn-default"
									onclick="javascript:history.back();">
									<i class="fas fa-times"></i> 취소
								</button>
								<button type="submit" class="btn btn-primary">
									<i class="fas fa-pencil-alt"></i> 수정
								</button>
							</div>
						</div>
					</div>
				</form>
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
			$("#file").on('change', function() {
				var files = $("#file")[0].files;
				console.log(files);

				var fileName = "";

				for (var i = 0; i < files.length; i++) {
					fileName += files[i].name + " ";
				}
				console.log(fileName);

				$(".upload-name").val(fileName);

				if (fileName == "") {
					console.log("empty");
					$("#filecheck").val(0);
					$(".upload-name").val("파일선택");
				} else {
					console.log("not empty");
					$("#filecheck").val(1);
				}
			});

			function del(sysname) {
				var con = confirm("파일을 삭제하겠습니까?");
				if (con) {
					var objdata = {
						"sysname" : sysname
					};
					objdata.bnum = ${board.bnum};
					
					console.log(objdata);

					$
							.ajax({
								url : "oneone_delfile",
								type : "post",
								data : objdata,
								dataType : "json",
								success : function(data) {
									alert("삭제 성공");

									var flist = "";
									var dflist = data.fList;
									console.log(dflist);
									if (dflist.length == 0) {
										flist += '<label style="width: 100%">원본파일</label>';
									} else {
										for (var i = 0; i < dflist.length; i++) {
											flist += '<span style="width: 100%; margin-right: 10px;" '
													+ 'onclick="del(\''
													+ dflist[i].bf_sysname
													+ '\')">'
													+ dflist[i].bf_oriname
													+ '</span>'
										}
									}
									$("#bfile").html(flist);
								},
								error : function(error) {
									alert("삭제 실패");
								}
							});
				}
			}
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
