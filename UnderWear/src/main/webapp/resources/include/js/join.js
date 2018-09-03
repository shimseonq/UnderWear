//비밀번호와 비밀번호 확인 일치 여부 확인
function passwordCheck(){
   if($("#c_pwd").val() != $("#userPwCheck").val()){
      alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
      $("#userPwCheck").focus();
      $("#userPwCheck").val("");
      return false;
   }else{
      return true;
   }
}

//아이디에 비밀번호 포함 여부 확인
function idPwdCheck(){
   var c_id = $("#c_id").val();
   var c_pwd = $("#c_pwd").val();
   if(c_pwd.indexOf(c_id) > -1){
      alert("비밀번호에 아이디를 포함할 수 없습니다.");
      $("#c_pwd").val("");
      $("#c_pwd").focus();
      return false;
   }else{
      return true;
   }
}

var idConfirm = 1;
$(function(){
	errCodeCheck();
   //사용자에게 요구사항에 대한 문자열로 배열 초기화
   var message = ["영문,숫자만 가능. 6 ~ 12자로 입력해주세요",
               "영문,숫자,윽수문자만 가능. 8 ~ 15자 입력해 주세요.",
               "비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.",
               "- 포함 입력해 주세요. 예시) 010-0000-0000"];
   
   $(".error").each(function(index){
      $(".error").eq(index).html(message[index]);
   });
   
   $("#c_id, #c_pwd, #userPwCheck, #c_phone").bind("focus", function(){
      var c_num = $("#c_id, #c_pwd, #userPwCheck, #c_phone").index(this);
      console.log(c_num);
      $(this).parents(".form-group").find(".error").html(message[c_num]);
   });
   
   $("#idConfirmBtn").click(function(){
	   if(!formCheck($("#c_id"),$('.error:eq(0)'),"아이디를")) return;
	   else if(!inputVerify(0,"#c_id",".error:eq(0)"))return;
	   else{
		   $.ajax({
			   url:"/member/userIdConfirm.do",
			   type: "post",
			   data: "c_id="+$("#c_id").val(),
			   error:function(){
				   alert("사이트 접속에 문제로 정상 작동하지 않습니다. 잠시후에 다시 시도해 주십시오");
			   },
			   success : function(resultData){
				   console.log("resultData : "+resultData);
				   if(resultData=="1"){
					   $("#c_id").parents(".form-group").find(".error").html("현재 사용중인 아이디입니다.");
				   }else if(resultData=="2"){
					   $("#c_id").parents(".form-group").find(".error").html("사용가능한 아이디 입니다.");
					   idConfirm=2;
				   }
			   }
		   })
	   }
   })
   
   /* 확인 버튼 클릭 시 처리 이벤트*/
   $("#joinInsert").click(function() {
      //입력값체크
	   if(!($('#t_agree').is(":checked"))){
			alert("이용악관에 동의하지 않으셨습니다. 동의해주세요");
			
			$("#t_agree").focus();
			return;
		}	
	   else if(!($('#t_privacyagree').is(":checked"))){
			alert("개인정보 보호에 동의하지 않으셨습니다. 동의해주세요");
			$("#t_privacyagree").focus();
			return;
			
		}
	   else	if(!formCheck($('#c_id'),$('.error:eq(0)'),"아이디를")) return;
      else if(!inputVerify(0,"#c_id",".error:eq(0)")) return;
      
      else if(!formCheck($('#c_pwd'),$('.error:eq(1)'),"비밀번호를")) return;
      else if(!inputVerify(1,"#c_pwd",".error:eq(1)")) return;
      else if(!idPwdCheck()) return;
      else if(!formCheck($('#userPwCheck'),$('.error:eq(2)'),"비밀번호 확인을")) return;
      else if(!inputVerify(1,"#userPwCheck",".error:eq(2)")) return;
      else if(!passwordCheck()) return;
      else if(!formCheck($('#c_phone'),$('.error:eq(3)'),"전화번호를")) return;
      else if(!inputVerify(2,"#c_phone",".error:eq(3)")) return;
      else if(!formCheck($('#c_name'),$('.error:eq(5)'),"이름을")) return;
      else if(!formCheck($('#c_address'),$('.error:eq(6)'),"집주소를")) return;
      else if(!formCheck($('#emailName'),$('.error:eq(7)'),"이메일 주소를")) return;
      else if(idConfirm!=2){ alert("아이디 중복 체크 진행해 주세요."); return;}
      else {
    	  $("#c_email").val($("#emailName").val()+"@"+$("#emailDomain").val());
    	  $("#c_birth").val($("#birth").val()+"-"+$("#gender").val());
    	  $("#memberForm").attr({
    		  "method":"post",
    		  "action":"/member/join.do"
    	  });
    	  $("#memberForm").submit();
      }
   
   });
   $("#joinCancel").click(function(){
	   location.href="/member/login.do";
   });
   $("#joinReset").click(function(){
	   $("#memberForm").each(function (){
		   this.reset();
	   });
   })
});


/*function termsAgree(){
	if(!($('#t_agree').is(":checked"))){
		alert("이용악관에 동의하지 않으셨습니다. 동의해주세요");
		
		$("#t_agree").focus();
		return;
	}
	
	if(!($('#t_privacyagree').is(":checked"))){
		alert("개인정보 보호에 동의하지 않으셨습니다. 동의해주세요");
		$("#t_privacyagree").focus();
		return;
		
	}
}*/