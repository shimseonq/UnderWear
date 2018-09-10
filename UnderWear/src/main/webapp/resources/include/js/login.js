$(function() {
	// 아래 함수는 서버로 받아 온 코드값에 대한 처리 함수(login.jsp 파일에 정의.)
	errorCodeCheck();
	$('#c_id, #c_pwd').bind("keyup", function() {
		$(this).parents("div").find(".error").html("");
	});
	/* 로그인 버튼 클릭 시 처리 이벤트 */
	$("#loginBtn").click(function() {
		if (!formCheck($('#c_id'), $('.error:eq(0)'), "아이디를"))
			return;
		else if (!inputVerify(0, '#c_id', '.error:eq(0)'))
			return;
		else if (!formCheck($('#c_pwd'), $('.error:eq(1)'), "비밀번호를"))
			return;
		else if (!inputVerify(1, '#c_pwd', '.error:eq(1)'))
			return;
		else {
			$("#loginForm").attr({
				"method" : "POST",
				"action" : "/login/login.do"
			});
			$("#loginForm").submit();
		}
	});
	/* 회원가입 버튼 클릭 시 처리 이벤트 */
	$("#joinBtn").click(function() {
		location.href = "/member/join.do";
	});

	$("#idCheckBtn").click(function() {
		
		$.ajax({
				url:"/login/idCheck.do",		//전송 url
				type:"post",					//전송시 method 방식 
				data:$("#idCheckForm").serialize(),	//폼 전체 데이터 전송	 	"b_num=" + $("#b_num").val()+"&b_pwd=" + $("#b_pwd").val(),	//형식은 queryString형식으로 
				dataType:"text", 		//text/ xml / json
				error:function(){		//실행시 오류가 발생하였을 경우
				alert('시스템 오류입니다. 관리자에게 문의하세요');	 					
				},
				success:function(resultData){		//정상적으로 실행이 되었을 경우
					console.log(resultData);
					if(resultData.indexOf("아이디")<0){
						alert("찾고자하는 아이디는 :"+resultData+"입니다.");
						location.href="/login/login.do"
					}else{
						alert(resultData);
					}
				}
			});
		
		});
	
});