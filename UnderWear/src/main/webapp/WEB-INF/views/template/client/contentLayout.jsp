<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %> 

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

       
  <link rel="stylesheet" href="/resources/include/bcss/mobirise-icons.css">
  <link rel="stylesheet" href="/resources/include/bcss/tether.min.css">
  <link rel="stylesheet" href="/resources/include/bcss/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/include/bcss/bootstrap-grid.min.css">
  <link rel="stylesheet" href="/resources/include/bcss/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="/resources/include/bcss/style.css">
  <link rel="stylesheet" href="/resources/include/bcss/styles.css">
  <link rel="stylesheet" href="/resources/include/bcss/style1.css">
  <link rel="stylesheet" href="/resources/include/bcss/mbr-additional.css" type="text/css">

   <!--      bootstrap core css
     <link href="/resources/include/dist/css/bootstrap.css" rel="stylesheet"> 
      <link href="/resources/include/css/carousel.css" rel="stylesheet"> 
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>  -->
     
  
    
    <title><tiles:getAsString name="title"/></title>
   <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
   <script type="text/javascript" src="/resources/include/js/common.js"></script>
   
      
  </head>

  <body>

    <!-- Fixed navbar -->
 <!-- nav 영역 -->
       <tiles:insertAttribute name="header" /> <!-- header -->
 
   
   <br/><br/><br/><br/><br/>
    <!-- Begin page content -->
   <div class="container">
     <%--  <div class="page-header">  
        <h1><tiles:getAsString name="title"/></h1>
      </div>   --%>
         <tiles:insertAttribute name="body" /> <!-- content 영역 -->
   </div>
    <br/><br/><br/><br/><br/><br/><br/><br/>
    
    
   <!--  <footer class="footer">  -->  <!-- footer 영역 -->
       <tiles:insertAttribute name="footer" />
   <!--  </footer> -->
  
  
   <!-- bootstrap js -->
  <!--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
    <script src="/resources/include/dist/assets/js/docs.min.js"></script>
   
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script> 
   
 -->

   <script src="/resources/include/bjs/jquery.min.js"></script>
  <script src="/resources/include/bjs/popper.min.js"></script>
  <script src="/resources/include/bjs/tether.min.js"></script>
  <script src="/resources/include/bjs/smooth-scroll.js"></script>
  <script src="/resources/include/bjs/script.min.js"></script>
  <script src="/resources/include/bjs/jquery.touch-swipe.min.js"></script>
  <script src="/resources/include/bjs/jquery.mb.vimeo_player.js"></script>
  <script src="/resources/include/bjs/social-likes.js"></script>
  <script src="/resources/include/bjs/bootstrap-carousel-swipe.js"></script>
  <script src="/resources/include/bjs/jquery.mb.ytplayer.min.js"></script>
  <script src="/resources/include/bjs/script.js"></script>
  <script src="/resources/include/js/script.js"></script>
    <script src="/resources/include/bjs/bootstrap.min.js"></script>
  

  
  </body>
  
</html>