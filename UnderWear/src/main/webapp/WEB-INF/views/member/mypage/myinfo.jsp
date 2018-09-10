<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- 아래 내용은 DB에 이메일 정보가 javauser2018@naver.com으로 저장되어 있기에 @를 구분자로 분리하고 작성한 소스--%>
<c:set var="email" value="${fn:split(member.email,'@')}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, userscalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Update Member!</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->
<!--[if lt IE 9]>
<script src="/resources/include/js/html5shiv.js"></script>
<![endif]-->
	 <script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script> 
	
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript" src="/resources/include/js/modify.js"></script>

    <!-- Custom styles for this template -->
    
    <link href="/resources/include/css/justified-nav.css" rel="stylesheet">
<script type="text/javascript">
$(function(){
	$("#save").click(function(){
		if($("#c_pwd").val() != $("#userPwCheck").val()){
			alert("패스워드 입력이 일치하지 않습니다");
		}else{
		confirm("회원정보를 수정 하시겠습니까?");
		$("#memberForm").attr({
			"method":"post",
			"action":"/member/modify.do"
		});
		$("#memberForm").submit();
		}
	});
	
	$("#byebye").click(function(){
		confirm("회원 탈퇴 하시겠습니까?");
		$("#memberForm").attr({
			"method":"post",
			"action":"/member/delete.do"
		});
		$("#memberForm").submit();
	})
		
})
/* function errorCodeCheck(){
	var status = '<c:out value="${status}" />';
	if(status != ""){
	alert("기존 비밀번호 검증에 실패하였습니다. \n기존 비밀번호를 다시 확인해 주세요. ");
	}
}

var loginUserId = "${member.userId}"; */

</script>
<style type="text/css">
    	.jumbotron{-
    		height: 300px;
    		border: 2px solid lightgray;
    		border-radius: 10px;
    		padding:0px;
    	}
    	.masthead, .row{
    		margin-bottom:20px;
    	}
    	h3{
    		color:gray;  		
    	}

		.row{
			text-align:center;
			margin-bottom:2%;
		}
		.shop{
			text-align:center;
			margin:0px -5% 0px -5%;
		}

    </style>
    <script type="text/javascript">
    	
    </script>
</head>
<body>
<!-- Jumbotron -->
  	 	<h3>My page</h3>
  	 	
  	 <div class="masthead">
        <nav>
          <ul class="nav nav-justified">
            <li><a href="/mypage/basket.do">장바구니조회</a></li>
            <li><a href="/mypage/mypage.do">주문조회</a></li>
            <li><a href="/mypage/pwdCheck.do">개인정보 조회</a></li>
            <li><a href="/mypage/rank.do">등급현황</a></li>
            <li><a href="/mypage/myboard.do">게시물 조회</a></li>
          </ul>
        </nav>
      </div> 
	<div class="contentContainer"> 
		<div class="well">
			<form id="memberForm" class="form-horizontal">
				<input type="hidden" name="idx" id="idx" value="${myInfo.c_num}" /> <input
					type="hidden" name="email" id="email" />
				<div class="form-group form-group-sm">
					<label for="c_id" class="col-sm-2 control-label">사용자 ID</label>
					<label id="c_id">${myInfo.c_id}</label>
				</div>
				<div class="form-group form-group-sm">
					<label for="c_pwd" class="col-sm-2 control-label">변경할 비밀
						번호</label>
					<div class="col-sm-3">
						<input type="password" id="c_pwd" name="c_pwd" maxlength="15"
							class="form-control" placeholder="변경할 비밀번호 입력">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p> 
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="userPwCheck" class="col-sm-2 control-label">변경할
						비밀번호 확인</label>
					<div class="col-sm-3">
						<input type="password" id="userPwCheck" name="userPwCheck"
							maxlength="15" class="form-control" placeholder="변경할 비밀번호 입력 확인">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="c_name" class="col-sm-2 control-label">회원이름</label>
					<div class="col-sm-3" id="c_name">${myInfo.c_name}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="c_birth" class="col-sm-2 control-label">생년월일</label>
					<label id="c_birth">${myInfo.c_birth}</label>
				</div>
				<div class="form-group form-group-sm">
					<label for="c_phone" class="col-sm-2 control-label">핸드폰 번호</label>
					<div class="col-sm-3">
						<input type="text" id="c_phone" name="c_phone" maxlength="15"
							class="formcontrol" value="${myInfo.c_phone}">
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="c_address" class="col-sm-2 control-label">주소</label>
					<div class="col-sm-3">
						<input type="text" id="c_address" name="c_address" maxlength="15"
							class="formcontrol" value="${myInfo.c_address}">
					</div>
				</div>
				
				
				<div class="form-group form-group-sm">
					<label for="c_email" class="col-sm-2 control-label">회원
						이메일</label>
					<div class="col-sm-3">
						<input type="text" id="c_email" name="c_email" maxlength="60"
							class="form-control" value="${myInfo.c_email}">
					</div>
					<div class="col-sm-2">
						<select id="emailDomain" class="form-control">
							<option selected="selected">직접입력</option>
							<option value="@naver.com">네이버</option>
							<option value="@daum.net">다음</option>
							<option value="@nate.com">네이트</option> 
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<input type="button" value="확인" id="save"
							class="btn btn-default" /> <input type="button" value="재작성"
							id="modifyReset" class="btn btn-default" /> <input type="button"
							value="취소" id="modifyCancel" class="btn btn-default" />
							<input type="button" value="회원탈퇴" id="byebye" class="btn btn-default" />
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>