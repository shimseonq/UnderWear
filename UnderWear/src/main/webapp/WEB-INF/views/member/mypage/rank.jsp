<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>마이페이지</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/include/css/mainheader.css" rel="stylesheet"/>

    <!-- Custom styles for this template -->
    <link href="/resources/include/css/justified-nav.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    	.jumbotron{
    		height: 200px;
    		width: 700px;
    		border: 2px solid lightgray;
    		border-radius: 10px;
    		padding:0px;
    		margin: 20px auto;
    		}
    	.masthead, .myrank{
    		margin-bottom:20px;
    	}
    	h3{
    		color:gray;  		
    	}
		.myrank{
			text-align:center;
		}
		
		.rk_rank{
			color:green;
			font-size: 1.6em;
			font-weight: bold;
		}
    </style>
    <script type="text/javascript">
    	
    
    </script>
  </head>

  <body>
  	 <!-- Jumbotron -->
  	 	<h3>My page</h3>
  	 	
  	 	<div class="masthead">
        <nav>
          <ul class="nav nav-justified">
            <li><a href="/mypage/basketList.do">장바구니조회</a></li>
            <li><a href="/mypage/mypage.do">주문조회</a></li>
            <li><a href="/mypage/pwdCheck.do">개인정보 조회</a></li>
            <li><a href="/mypage/rank.do">등급현황</a></li>
            <li><a href="/mypage/myboard.do">게시물 조회</a></li>
          </ul>
        </nav>
      </div> 
      
      <h3>나의 등급</h3>
      
      <!-- Example row of columns -->
        
        <form class="myrank">
        	<input type="hidden" id="c_id" name="c_id" value="${login.c_id}"/>
          <h2>나의 등급</h2>
	          <p>현재 나의 등급은<span id ="rk_rank" class="rk_rank"> ${myRank}</span>입니다.</p>
          <p><a class="btn btn-primary" href="#" role="button">View details &raquo;</a></p>
        </form>
     
      <div class="jumbotron">
        <table class="table table-condensed">
			<thead>
				<tr>
					<td>등급번호</td>
					<td>등급명</td>
					<td>등급별 할인률</td>
					<td>등급 누적 구매액</td>
					<td></td>
				</tr>
				
			</thead>
			<tbody id="list">
				<!-- 데이터 출력 -->
				<c:choose>
					<c:when test="${not empty rankList}" >
						<c:forEach var="rank" items="${rankList}" varStatus="status">
							<tr class="tac" data-num="${rank.rk_no}" >
								<td>${rank.rk_no}</td>
								<td>${rank.rk_rank}</td>
								<td>${rank.rk_discount}</td>
								<td>${rank.rk_standard}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>   
						<tr>
							<td colspan="3" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
      </div>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
