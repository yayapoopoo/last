<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
$(function(){
	//메시지 출력 부분
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
	
	//로그인한 회원 정보 및 로그아웃 출력
	var lname = "${mb.m_name}";
	$("#mname").html(lname + "님");
	$(".suc").css("display", "block");
	$(".bef").css("display", "none");
});
</script>
</head>
<body>
<div class="wrap">
	<section>
	<div class="content">
		<form action="./boardWrite" class="write-form"
			method="post" enctype="multipart/form-data">
		
			<h2 class="login-header">이벤트 게시판</h2>
			<input type="hidden" name="bid" value="${mb.m_id}">
			<input type="text" class="write-input"
				name="btitle" autofocus placeholder="제목"
				required>
			<textarea rows="15" name="bcontents"
				placeholder="내용을 적어주세요."
				class="write-input ta"></textarea>
			<div class="filebox">
				<label for="file">업로드</label>
				<input type="file" name="files" id="file"
					multiple>
				<input type="text" class="upload-name"
					value="파일선택" readonly>
				<!-- 업로드할 파일이 있으면 1, 없으면 0 -->
				<input type="hidden" id="filecheck"
					value="0" name="fileCheck">
			</div>
			<div class="btn-area">
				<input type="submit" class="btn-write"
					value="글작성">
			</div>
		</form>
	</div>
	</section>
</div>
</body>
<script type="text/javascript">
$("#file").on("change", function(){
	var files = $("#file")[0].files;
	console.log(files);
	
	var fileName = "";
	
	if(files.length > 1){
		fileName = files[0].name + " 외 " 
			+ (files.length - 1) + "개";
	}
	else if(files.length == 1){
		fileName = files[0].name; 
	}
	
	$(".upload-name").val(fileName);
	
	//fileCheck 부분 변경
	if(fileName == ""){//파일 취소 시.
		$("#filecheck").val(0);
		$(".upload-name").val("파일선택");
	}
	else {//파일 선택 시.
		$("#filecheck").val(1);
	}
});
</script>
</html>








