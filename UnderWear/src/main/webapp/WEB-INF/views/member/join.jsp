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
     		
     		
					 	
 <table width="1400" height="650">
  <tr>
   <td width="100%" height="10%"><span style="padding-left: 160px"></span>&nbsp;
    <br>
    <hr>
   </td>
  </tr>
  <tr>
   <td width="100%" height="50%" align="center">
   <p align="left">
   <span style="padding-left: 160px">
   UnderWear 사이트 약관동의</span>
   </p>
   <br>
   <textarea rows="20" cols="150">
				 가. 수집하는 개인정보의 항목첫째, 회사는 회원가 입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
				회원가입
				- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
				만14세 미만 아동 회원가입
				- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
				단체아이디 회원가입
				- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
				- 선택항목 : 대표 홈페이지, 대표 팩스번호
				둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
				- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
				셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다.
				넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다.
				- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보
				다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
				- 신용카드 결제시 : 카드사명, 카드번호 등
				- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
				- 계좌이체시 : 은행명, 계좌번호 등
				- 상품권 이용시 : 상품권 번호
				나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다.
				- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
				- 협력회사로부터의 제공
				- 생성정보 수집 툴을 통한 수집
				   </textarea>
				   <br>
				   <input type="checkbox" name="t_agree" id="t_agree"> 약관정보 수집 및 이용에 동의합니다.
				   </td>
				  </tr>
				  <tr>
				   <td align="center" valign="top">
				   
				    <input type="button" value="동의하지 않습니다" />
				   </td>
				  </tr>
				 </table>
				 
				  <table width="1400" height="650">
				  <tr>
				   <td width="100%" height="10%"><span style="padding-left: 160px"></span>&nbsp; 
				    <br>
				    <hr>
				   </td>
				  </tr>
				  <tr>
				   <td width="100%" height="50%" align="center">
				   <p align="left">
				   <span style="padding-left: 160px">
				   UnderWear 사이트  개인정보 동의</span>
				   </p>
				   <br>
				   <textarea rows="20" cols="150">
				 가. 수집하는 개인정보의 항목첫째, 회사는 회원가 입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다. 회원가입
				- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
				만14세 미만 아동 회원가입
				- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
				단체아이디 회원가입
				- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
				- 선택항목 : 대표 홈페이지, 대표 팩스번호
				둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
				- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
				셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다.
				넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다.
				- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보
				다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
				- 신용카드 결제시 : 카드사명, 카드번호 등
				- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
				- 계좌이체시 : 은행명, 계좌번호 등
				- 상품권 이용시 : 상품권 번호
				나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다.
				- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
				- 협력회사로부터의 제공
				- 생성정보 수집 툴을 통한 수집
				   </textarea>
				   <br>
				   <input type="checkbox" name="t_privacyagree" id="t_privacyagree"> 개인정보 수집 및 이용에 동의합니다.
				   </td>
				  </tr>
				  <tr>
				   <td align="center" valign="top">
				   
				    <input type="button" value="동의하지 않습니다" />
				   </td>
				  </tr>
				 </table>
     	
     		 	
     	 		<br /> <br />
     	 	
     	<h3>회원정보 입력</h3>
	<div class="well" style="border: 1;">
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