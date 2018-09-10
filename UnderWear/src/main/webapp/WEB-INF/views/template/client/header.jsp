<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script> 
<script type="text/javascript" src="/resources/include/js/header.js"></script>

<nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">UnderWear</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
             <c:choose>
                  <c:when test="${login.c_id != null and login.c_id != ''}">
                 <li class="active"><a href="/">Home</a></li>
             <li><a href="/product/productThumbnail.do?p_gender=남자">Man</a></li>
            <li><a href="/product/productThumbnail.do?p_gender=여자">Woman</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Content <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="/notice/noticeList.do">Notice</a></li>
                <li><a href="/qna/qnaList.do">Q&A</a></li>
                <li><a href="/review/reviewList.do">Review</a></li>
              </ul>
            </li>
             <li><a href="/mypage/pwdCheck.do">Mypage</a></li>
              <li><a href="/mypage/basket.do">Basket</a></li>
              
              <li><a href="#about"><strong>${login.c_name}</strong>님 반가워요</a></li>
          <li><a> <input type="button" id="logout" value="로그아웃" style="text-align: 10px;"><span></span></a></li> 
            </c:when>
            <c:otherwise>
                <li class="active"><a href="/">Home</a></li>
                   <li><a href="/product/productThumbnail.do?p_gender=남자">Man</a></li>
            <li><a href="/product/productThumbnail.do?p_gender=여자">Woman</a></li>
                  <li class="dropdown">
                 <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Content <span class="caret"></span></a>
                 <ul class="dropdown-menu" role="menu">
                <li><a href="/notice/noticeList.do">Notice</a></li>
                <li><a href="/qna/qnaList.do">Q&A</a></li>
                <li><a href="/review/reviewList.do">Review</a></li>
              </ul>
               </li>
                <li><a href="/login/login.do">Login</a></li>
                  <li><a href="/member/join.do">Join Us</a></li>   
            </c:otherwise>
            </c:choose>
            
            
            
          
              
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav> 