//아이디 중복 체크를 했는지 여부 저장
var ckOk = false;

function idcheck(){
	var inId = $("#mid").val();
	
	//아이디 값을 입력했는지 확인
	if(inId == ""){//입력 안했을 경우
		alert("아이디를 입력하세요.");
		$("#mid").focus();
		return;
	}
	
	var ckObj = {"mid":inId};
	
	//ajax로 전송
	$.ajax({
		url: "idCheck",
		type: "get",
		data: ckObj,
		success: function(result){
			//중복 id가 아니면 "ok".
			if(result == "ok"){
				alert("아이디 사용 가능");
				ckOk = true;
			}
			else {
				alert("사용할 수 없는 아이디");
				$("#mid").val("");//입력한 아이디 지우기
				$("#mid").focus();//아이디 입력칸에 포커스
				ckOk = false;
			}
		},
		error: function(error){
			console.log(error);
			ckOk = false;
		}
	});
}

//입력 양식에 빈칸이 있는지 확인하는 함수
function check(){
	if(ckOk == false){
		alert("아이디 중복 체크를 해주세요.");
		return false;//submit 막기(action 실행 안됨)
	}
	
	//form 태그의 내용을 전부 가져오기
	var frm = document.join-box;
	console.log(frm);
	
	//submit 버튼을 제외한 나머지 input 태그의 개수
	var length = frm.length - 1;
	
	//input 태그 중 value가 ""인 요소가 있는지 확인(입력 안된 요소)
	for(var i = 0; i < length; i++){
		if(frm[i].value == "" || frm[i].value == null){
			alert(frm[i].joinInfo + " 입력!");
			frm[i].focus();
			return false;
		}
	}
	//모든 입력칸이 다 채워졌고, 아이디 중복 체크도 한 상태
	//return true;//submit이 실행되도록 true를 반환
}
