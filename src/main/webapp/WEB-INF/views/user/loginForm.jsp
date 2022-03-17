<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="user/css/user.css" rel="stylesheet" type="text/css">
    <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>답인사 | 로그인</title>
    <script type="text/javascript"> 
        $(function() {
	
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}
	});
    </script>
<jsp:include page="header.jsp"/>
</head>
<body>
   <span class="back-button"><a href="#none"
			onclick="history.go(-1);return false;" class="btnBack"><Strong>BACK</Strong></a>
		</span>
    <form class="login-box" action="/loginProc" method="post">
        <h3 class="login-logo">로그인</h3>
        <div>
        </div>
        <div>
            <input type="text" id="m_id" name="m_id" class="inputId" placeholder="아이디">
        </div>
    <br>
    <div>
        <input type="password" name="m_pass" class="inputPw" placeholder="비밀번호">
    </div>
    <br>
    <div>
        <input type="submit" class="login-button" value="로그인">
    </div>
    <br>
    <div>
    <a href="findId" class="findId">아이디 찾기</a> <a href="findPwPage" class="findPw">비밀번호 찾기</a>
    </div>
    <br>
    <div class="social-login">
    <p>
        <a href="joinFrm">회원가입</a>
    </p>
    <p>
       <a href="/oauth2/authorization/kakao">
        <img src="user/images/login/kakao_login.png">
        </a>
    </p>

    <p>
       <a href="/oauth2/authorization/naver"> <img src="user/images/login/naver_login.png"> </a>
    </p>

    <p>
      <a href="/oauth2/authorization/google">  <img src="user/images/login/google_login.png" > </a>
    </p>
   	</div>
    </form>

    <footer>
    <jsp:include page="footer.jsp"/>
    </footer>
    
</body>
</html>