<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="top">
    <img alt="로고" src="resources/images/logo.png"
				class="toplogo" onclick="location.href='http://suynthe.cafe24.com/'">
				</div>
				<nav class="top-right">
				<ul>
					<li class="suc" id="grade"><b>${mb.gr_name}</b></li>									
					<li class="suc" id="mname">게스트님</li>
					<li class="suc"><a href="./logout">로그아웃</a></li>
					<li class="bef"><a href="./loginFrm">로그인</a></li>
					<li class="bef"><a href="./joinFrm">회원가입</a></li>
				</ul>
			</nav>

	
	<script>
	function gohome(){
		var id = "${mb.m_id}";
		
		if(id == ""){
			//로그인 전에는 제일 첫 페이지로 이동
			location.href = "./";
		}
		else if(id != ""){
			//로그인 후에는 목록 페이지로 이동
			location.href = "./list";
		}
	}
	</script>