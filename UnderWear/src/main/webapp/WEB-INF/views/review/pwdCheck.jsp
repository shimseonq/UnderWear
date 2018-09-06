<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, userscalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Login</title>
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
<!-- <script type="text/javascript" src="/resources/include/js/login.js"></script> -->
<script type="text/javascript">
    $(function(){
      $("#gosave").click(function(){
         if (!chkData('#c_pwd',"로그인 시 비밀번호를")) return;
         else{
            $("#loginForm").attr({
               "method":"post",
               "action":"/review/pwdCheck.do"
            });
            $("#loginForm").submit();   
         }
       });   
   }); 
   
   function errorCodeCheck() {
      var status = '<c:out value="${status}" />';
      if (status != "") {
         // 명확한 자료형 명시를 위해 status의 타입을 정수형으로 변환.
         switch (parseInt(status)) {
         case 1:
            alert("아이디 또는 비밀번호 일치 하지 않거나 존재하지 않는 \n회원입니다. 다시 로그인해 주세요.");
            break;
         case 6:
            alert("5번이상 로그인 시도로 30초동안 로그인 할 수 없습니다.\n잠시 후 다시 시도해 주세요");
            break;
         }
      }
   }
</script>
</head>
<body>
   <h3>My page</h3>
   <div class="masthead">
        <nav>
          <ul class="nav nav-justified">
            <li><a href="/mypage/basket.do">장바구니조회</a></li>
            <li><a href="/mypage/mypage.do">주문조회</a></li>
            <li><a href="/mypage/myinfo.do">개인정보 조회</a></li>
            <li><a href="/mypage/rank.do">등급현황</a></li>
            <li><a href="/mypage/myboard.do">게시물 조회</a></li>
          </ul>
        </nav>
      </div> 
   <div class="contentContainer">    
      <div class="well">
         <%-- 로그인 전 화면 --%>
         <form id="loginForm" class="form-horizontal">
         
         <input type="hidden" id="rv_no" name="rv_no" value="${review.rv_no}" />
         
            <div class="form-group">
            
               <label for="c_id" class="col-sm-2 control-label">아 이 디 </label>
               <div class="col-sm-4">${login.c_id}</div>
            </div>
            <div class="form-group">
               <label for="c_pwd" class="col-sm-2 control-label">비밀번호 </label>
               <div class="col-sm-4">
                  <input type="password" id="c_pwd" name="c_pwd" class="formcontrol"
                     placeholder="비밀번호를 입력해주세요.">
               </div>
            </div>
            <input type="button" id="gosave" name="gosave" value="확인" />
            <input type="button" id="cancel" name="cancel" value="취소" />
         </form>
      </div>
   </div>
</body>
</html>