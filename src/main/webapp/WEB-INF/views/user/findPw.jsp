<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="user/css/user.css" rel="stylesheet" type="text/css">
    <jsp:include page="header.jsp"></jsp:include>
    <title>답인사 | 비밀번호 찾기</title>

</head>
<script>
        var test1 = $("#m_id").val();
        var test2 = $("#m_email").val();
        console.log(test1);
        console.log(test2);
        
        
        $.ajax({
            url : "findPw",
            type : "get",
            data : {
                id : $("#m_id").val(),
                email : $("#m_email").val()
            },
            success : function(result) {
                alert(result);
            },
            error : function(error){
                alert(error);
            }
        })
    });
})  

        $(function() {
    
        var msg = "${msg}";
        if (msg != "") {
            alert(msg);
        }
    });
    
</script>

<body>
<span class="back-button"><a href="#none"
			onclick="history.go(-1);return false;" class="btnBack"><Strong>BACK</Strong></a>
		</span>

    <form class="find_pw_form" action="findPw" method="get">
        <div>
            <h3>비밀번호 찾기</h3>
            <input type="radio" checked="checked" class="email_radio"><a>이메일 인증</a>
        </div>
        <div>
            <input type="text" class="find_id" id="m_id" name="m_id" placeholder=" 아이디">
        </div>

        <div>
            <input type="email" class="find_pw-email" id="m_email" name="m_email" placeholder=" 예) dabyinsa@dabyinsa.com">
        </div>
        <div>
            <input type="submit" class="find_id_button" value="비밀번호 찾기">
        </div>
    </form>
    <footer>
    <jsp:include page="footer.jsp"></jsp:include>
    </footer>
</body>
</html>