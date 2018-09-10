<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/header.js"></script>

<section class="menu cid-r1UxZzsjgj" once="menu" id="menu2-k">

    <nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <div class="hamburger">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
        </button>
        <div class="menu-logo"> <!-- 메인 이미지 쪽 -->
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="http://localhost:8080/">
                        <img src="/resources/image/underwear.png" alt="WnderWear" style="height: 3.8rem;">
                    </a>
                </span>
                
            </div>
        </div>
        <div class="collapse navbar-collapse" id="navbarSupportedContent"> <!-- header -->
            <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
            <li class="nav-item">
                    <li class="text-black dropdown-item display-4" >
                    <c:choose>
                  <c:when test="${login.c_id != null and login.c_id != ''}">
                     <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
                   <li class="nav-item"><a class="nav-link link text-black display-4" href="#"><strong>${login.c_name}</strong>님 반가워요</a></li>
                     <li class="nav-item"><a class="nav-link link text-black display-4">
                     <input type="button" id="logout" value="로그아웃" style="text-align: 10px;"><span></span></a></li>
                    <li class="nav-item">
                    <a class="nav-link link text-black display-4" href="/product/productList.do">Man</a></li>
                    <li class="nav-item"><a class="nav-link link text-black display-4" href="#">Woman</a></li>
                    <li class="nav-item dropdown">
                   <a class="nav-link link text-black dropdown-toggle display-4" href="#" data-toggle="dropdown-submenu" aria-expanded="false">content</a>
                    <div class="dropdown-menu"><a class="text-black dropdown-item display-4" href="/notice/noticeList.do">Notice</a>
                    <a class="text-black dropdown-item display-4" href="/review/reviewList.do">Review<br></a>
                    <a class="text-black dropdown-item display-4" href="/qna/qnaList.do">Q&amp;A</a></div></li>  
                     <li class="nav-item">
                 <a class="text-black dropdown-item display-4" href="/mypage/pwdCheck.do">My page<br></a></li>
                  <li class="nav-item">
                 <a class="text-black dropdown-item display-4" href="/mypage/basket.do">Basket<br></a></li>            
             </ul>
          </c:when>
          <c:otherwise>
             <ul class="nav navbar-nav navbar-right">
               <li class="nav-item"><a class="nav-link link text-black display-4" href="/login/login.do">Login</a></li>
               <li class="nav-item"><a class="nav-link link text-black display-4" href="/member/join.do"> Join Us</a></li>
               <li class="nav-item"><a class="nav-link link text-black display-4" href="/product/productList.do">Man</a></li>        
               <li class="nav-item"><a class="nav-link link text-black display-4" href="#">Woman</a></li>
               <li class="nav-item dropdown">
                <a class="nav-link link text-black dropdown-toggle display-4" href="#" data-toggle="dropdown-submenu" aria-expanded="false">content</a>
                   <div class="dropdown-menu">
                   <a class="text-black dropdown-item display-4" href="/notice/noticeList.do">Notice</a>
                   <a class="text-black dropdown-item display-4" href="/review/reviewList.do">Review<br></a>
                   <a class="text-black dropdown-item display-4" href="/qna/qnaList.do">Q&amp;A</a></div></li>  
                
             </ul>
          </c:otherwise>
          </c:choose></li>  
            
           
                   </ul>
                   
        
        </div> <!-- 여기까지  header -->
    </nav>

</section>
    