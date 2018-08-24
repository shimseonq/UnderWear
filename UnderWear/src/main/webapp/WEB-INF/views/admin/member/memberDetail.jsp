<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!DOCTYPE html>
		<html>
   			<head>
      		<meta charset="UTF-8">
     	    <title>회원 정보</title>
      
     	 		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
         		<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여 주도록 설정. -->
      
        		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
        		<!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정.    initial-scale는 초기비율 -->
         
        		<!-- 모바일 웹 페이지 설정 -->
        		<link rel="shortcut icon" href="../image/icon.png" />
        		<link rel="apple-touch-icon" href="../image/icon.png" />
        		<!-- 모바일 웹 페이지 설정 끝 -->
        
        		<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
        		<!-- [if it IE 9] > <script src="../jshtml5shiv.js"></script> [endif] -->
      
     
      
   			</head>
      		<body>	
     		<form name="f_data" id="f_data" method="post">
     	 <input type="hidden" name="b_num" value="${detail.idx}"/>
     
      
   </form>
   <div>
      <h3>회원 상세보기</h3>
      <div>
         <input type="button" value="수정" id="updateBtn" name="updateBtn"/>
         <input type="button" value="삭제" id="deleteBtn" name="deleteBtn"/>
         <input type="button" value="목록" id="listBtn" name="listBtn"/>
      </div>
      <!-- ==================비밀번호 확인 버튼 및 버튼 추가 시작================================== -->
      <table id="memberPwdBut">
         <tr>
            <td id="btd1">
               <div id="pwdChk">
                  <form name="f_pwd" id="f_pwd">
                     <input type="hidden" name="idx" id="idx" value="${detail.idx}"/>
                     <label for="userPwd" id="userPwd">비밀번호 : </label>
                     <input type="password" name="userPwd" id="userPwd"/>
                      <input type="button" value="확인" id="pwdBtn"/>
                      <span id="msg"></span>
                   </form>
                </div>
             </td>
          </tr>      
      </table>
      <form>
         <table class="table table-bordered">
            <tr>
               <td class="ac">회원명</td>
               <td>${detail.userName}</td>
               <td class="ac">작성일</td>
               <td>${detail.joinDate}</td>
            </tr>
            <tr>
               <td class="ac">회원 전화번호</td>
               <td colspan="3">${detail.userPhone}</td>
            </tr>
            <tr>
               <td class="ac vm">회원 이메일</td>
               <td colspan="3">${detail.email}</td>
            </tr>
            <tr>
               <td class="ac">비밀번호</td>
               <td colspan="3">${detail.userPw}</td>
            </tr>
             <tr>
               <td class="ac">생년월일</td>
               <td colspan="3">${detail.pinno}</td>
            </tr>
         </table>
      </form>
   </div>
      		</body>
		</html>