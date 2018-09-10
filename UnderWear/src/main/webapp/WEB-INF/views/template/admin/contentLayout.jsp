<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>  
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title><tiles:getAsString name="title" /></title>
        
    <link rel="icon" href="/resources/image/icon.png">
    
    <!-- Bootstrap core CSS -->
    <link href="/resources/include/dist/css/adminbootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/include/css/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/include/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="/resources/include/css/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/include/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
     <!-- jQuery -->
    <script src="/resources/include/js/jquery-1.12.4.min.js"></script>
  </head>
  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
       <tiles:insertAttribute name="header" />
    </nav>

	<br />
		<br />
		<br />
		<br />
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <tiles:insertAttribute name="left" />
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
         <tiles:insertAttribute name="sub" />
         <tiles:insertAttribute name="main" />
        </div>
      </div>
    </div>

    

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/include/js/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="/resources/include/js/raphael.min.js"></script>
    <script src="/resources/include/js/morris.min.js"></script>
    <script src="/resources/include/js/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/include/dist/js/sb-admin-2.js"></script>
  </body>
</html>