<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>  


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
              <a class="navbar-brand" href="/">UnderWear</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                 <li><a href="http://localhost:8080/">MEN</a></li>
                  <li><a href="http://localhost:8080/">WOMEN</a></li>
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
              <li><a href="#">공지사항</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">게시판<span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">리뷰 게시판</a></li>
                    <li><a href="#">문의 게시판</a></li>
                  </ul>
                </li>
              </ul>
              <ul class="nav navbar-nav">
                 <li><a href="#"><img src="/resources/image/mypang.png" alt="마이페이지"/></a></li>
                 <li><a href="#"><img src="/resources/image/basket.gif" alt="장바구니"/></a></li>
                   <li><a href="/member/join.do">Login</a></li>
                 </ul>
              </div>
            </div>
         </nav>
    </div>
 </div>

    