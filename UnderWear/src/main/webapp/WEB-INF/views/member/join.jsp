<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!DOCTYPE html>
		<html>
   			<head>
      		<meta charset="UTF-8">
     	    <title></title>
      
     	 		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
         		<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여 주도록 설정. -->
      
        		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
        		<!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정.    initial-scale는 초기비율 -->
         
        		<!-- 모바일 웹 페이지 설정 -->
        		<link rel="shortcut icon" href="../image/icon.png" />
        		<link rel="apple-touch-icon" href="../image/icon.png" />
        		<!-- 모바일 웹 페이지 설정 끝 -->
    		    <script type="text/javascript" src="/resources/include/css/agreement.css"></script>
        		<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
        		<!-- [if it IE 9] > <script src="../jshtml5shiv.js"></script> [endif] -->
      			
      			<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
 				<script type="text/javascript" src="/resources/include/js/common.js"></script>
 				<script type="text/javascript" src="/resources/include/js/join.js"></script>
 				<script type="text/javascript">
 					function errCodeCheck(){
 						var errCode = '<c:out value="${errCode}" /> ';
 						if(errCode != ''){
 							switch (parseInt(errCode)){
 							case 1:
 								alert("이미 가입된 회원입니다!");
 								break;
 							case 2:
 								alsert("회원가입 처리가 실패하였습니다. 잠시후에 시도해 주십시오.");
 								break;
 							}
 						}
 					}
 				
 				</script>		
  		    			
   			</head>
   			
      		<body>
     		
     		
					 	<jsp:include page="agreement.jsp"/>
     		 	
     		 	
     	 		<br /> <br />
     	 	
     	<h3>회원정보 입력</h3>
	<div class="well">
		<form id="memberForm" class="form-horizontal">
			<input type="hidden" name="c_email" id="c_email" />
			<input type="hidden" name="c_birth" id="c_birth" />
			<div class="form-group form-group-sm">
				<label for="c_id" class="col-sm-2 control-label">사용자 ID</label>
				<div class="col-sm-3">
					<input type="text" id="c_id" name="c_id"  maxlength="12" class="form-control" placeholder="User ID" />
				</div>
				<div class="col-sm-2">
					<input type="button" id="idConfirmBtn" value="아이디 중복체크" class="form-control btn-primary" />
				</div> 
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="c_pwd" class="col-sm-2 control-label">비밀 번호</label>
				<div class="col-sm-3">
					<input type="password" id="c_pwd" name="c_pwd" maxlength="15" class="form-control" placeholder="Password" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="userPwCheck" class="col-sm-2 control-label">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password"  id="userPwCheck" name="userPwCheck" maxlength="15" class="form-control" placeholder="Password Confirm" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="c_phone" class="col-sm-2 control-label">핸드폰 번호</label>
				<div class="col-sm-3">
					<input type="text" id="c_phone" name="c_phone" maxlength="15" class="form-control" placeholder="Phone Number">	
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>	
			<div class="form-group form-group-sm">
				<label for="birth" class="col-sm-2 control-label">생년월일</label>
				<div class="col-sm-3">
					<input type="text" id="birth" name="birth" maxlength="6" class="form-control" placeholder="주민등록번호 6자리">	
				</div>
				<div class="col-sm-2">
					<input type="text" id="gender" name="gender" maxlength="1" class="form-control" placeholder="주민등록번호 7번째 1자리">	
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>										
			<div class="form-group form-group-sm">
				<label for="c_name" class="col-sm-2 control-label">회원이름</label>
				<div class="col-sm-3">
					<input type="text" id="c_name" name="c_name" maxlength="10" class="form-control" placeholder="NAME" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>						
			</div>
			<div class="form-group form-group-sm">
				<label for="c_address" class="col-sm-2 control-label">주소</label>
				<div class="col-sm-3">
					<input type="text" id="c_address" name="c_address" maxlength="10" class="form-control" placeholder="ADDRESS" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>						
			</div>
			<div class="form-group form-group-sm">
				<label for="emailName" class="col-sm-2 control-label">회원 이메일</label>
				<div class="col-sm-3">
					<input type="text" id="emailName" name="emailName" maxlength="60" class="form-control" placeholder="EMAIL">
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
					<input type="button" value="확인" id="joinInsert" class="btn btn-default" /> 
					<input type="button" value="재작성" id="joinReset" class="btn btn-default" />
					<input type="button" value="취소" id="joinCancel" class="btn btn-default" />						
				</div>	
			</div>																										
		</form>
	</div>

	
      </body>
</html>