<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/header.js"></script>

<!-- <script type="text/javascript">
var c_id = "{login.c_id}";

$(function(){
	login();
}); 

function login(){
	if(c_id != ""){
		$("#login").hide();
		$("#joinus").hide();
	}else{
		$("#login").show();
		$("#joinus").show();

<script type="text/javascript">
	$(function(){
		login();
		$("#mypage").click(function(){
			if(${login.c_id != null && login.c_id != ''}){
				location.href="/mypage/mypage.do";
			}else{
				location.href="/login/login.do";
			}
		});
		
		$("#basket").click(function(){
			if(${login.c_id != null && login.c_id != ''}){
				location.href="/mypage/basketList.do";
			}else{
				location.href="/login/login.do";
			}
		});
	});
	
	function login(){
		if(${login.c_id != null && login.c_id != ''}){
			$("#login").hide();
			$("#joinus").hide();
		}else{
			$("#login").show();
			$("#joinus").show();
		}

	}
}
</script> -->

 <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="/"><img src="/resources/image/underwear.png"></a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                 <li><a href="/product/productList.do">MEN</a></li>
                  <li><a href="#">WOMEN</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">PRODUCT<span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">브래지어</a></li>
                    <li><a href="#">여성 팬티</a></li>
                    <li><a href="#">남성 팬티</a></li>
                    <li class="divider"></li>
                    <li><a href="#">속옷 셋트</a></li>
                  </ul>
                </li>
              <li><a href="/notice/noticeList.do">공지사항</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">게시판<span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="/review/reviewList.do">리뷰 게시판</a></li>
                    <li><a href="/qna/qnaList.do">문의 게시판</a></li>
                  </ul>
                </li>

              </ul>
              <ul class="nav navbar-nav">
                 <li><a id="mypage" name="mypage" href="#"><img src="/resources/image/mypang.png" alt="마이페이지"/></a></li>
                 <li><a id="basket" name="basket"href="#"><img src="/resources/image/basket.gif" alt="장바구니"/></a></li>
                   <li><a id="login" name="login" href="/login/login.do">Login</a></li>
                    <li><a id="joinus" name="joinus" href="/member/join.do">join us</a></li>
                    <li><c:if test="${login.c_id != null and login.c_id != ''}">
						<fieldset id="loginAfter">
						<legend>
							<p>[ ${login.c_name} ]님 반갑습니다</p>
						</legend>
						<span id="memberMenu" class="tac">     
						<input type="button" id="logout" value="로그아웃"><span> </span></span>
						</fieldset>

					</c:if></li>

                 </ul>
              </div>
            </div>
         </nav>
    </div>
 </div>

    