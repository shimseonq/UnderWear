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
<link rel="shortcut icon" href="/resour"src/main/webapp/WEB-INF/views/member/mypage/myinfo.jsp"ces/image/icon.png" />
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
function errorCodeCheck(){
	var status = '<c:out value="${status}" />';
	var status <c out value ${status} /> ;
	if(status != ""){
	alert("기존 비밀번호 검증에 실패하였습니다. \n기존 비밀번호를 다시 확인해 주세요. ");
	}
}

loginUserId = "${member.userId}";
function emailCheck(){
	var email = "${email[1]}";
	$("#emailDomain").val(email).prop("selected", "true");
}
</script>
<style type="text/css">
    	.jumbotron{
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
</head>
<body>
<!-- Jumbotron -->
  	 	<h3>My page</h3>
  	 	
  	 	<div class="masthead">
        <nav>
          <ul class="nav nav-justified">
            <li><a href="/mypage/basketList.do">장바구니조회</a></li>
            <li><a href="/mypage/mypage.do">주문조회</a></li>
            <li><a href="/mypage/myinfo.do">개인정보 조회</a></li>
            <li><a href="/mypage/rank.do">등급현황</a></li>
            <li><a href="/mypage/myboard.do">게시물 조회</a></li>
          </ul>
        </nav>
      </div> 
	<div class="contentContainer"> 
		<div class="well">
			<form id="memberForm" class="form-horizontal">
				<input type="hidden" name="idx" id="idx" value="${member.idx}" /> <input
					type="hidden" name="email" id="email" />
				<div class="form-group form-group-sm">
					<label for="userId" class="col-sm-2 control-label">사용자 ID</label>
					<div class="col-sm-3">${member.userId}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="oldUserPw" class="col-sm-2 control-label">기존 비밀
						번호</label>
					<div class="col-sm-3">
						<input type="password" id="oldUserPw" name="oldUserPw"
							maxlength="15" class="form-control" placeholder="기존 비밀번호 입력">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="userPw" class="col-sm-2 control-label">변경할 비밀
						번호</label>
					<div class="col-sm-3">
						<input type="password" id="userPw" name="userPw" maxlength="15"
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
					<label for="phone" class="col-sm-2 control-label">핸드폰 번호</label>
					<div class="col-sm-3">
						<input type="text" id="phone" name="phone" maxlength="15"
							class="formcontrol" value="${member.phone}">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="birth" class="col-sm-2 control-label">생년월일</label>
					<div class="col-sm-3">${member.pinno} ******</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="userName" class="col-sm-2 control-label">회원이름</label>
					<div class="col-sm-3">${member.userName}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="emailName" class="col-sm-2 control-label">회원
						이메일</label>
					<div class="col-sm-3">
						<input type="text" id="emailName" name="emailName" maxlength="60"
							class="form-control" value="${email[0]}">
					</div>
					<div class="col-sm-2">
						<select id="emailDomain" class="form-control">
							<option value="naver.com">네이버</option>
							<option value="daum.net">다음</option>
							<option value="nate.com">네이트</option>
						</select>
					</div>
					<div class="col-sm-3">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<input type="button" value="확인" id="modify"
							class="btn btn-default" /> <input type="button" value="재작성"
							id="modifyReset" class="btn btn-default" /> <input type="button"
							value="취소" id="modifyCancel" class="btn btn-default" />
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>