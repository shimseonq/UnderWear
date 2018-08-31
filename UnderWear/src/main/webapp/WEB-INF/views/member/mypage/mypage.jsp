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
    		height: 300px;
    		border: 2px solid lightgray;
    		border-radius: 10px;
    		padding:0px;
    	}
    	.masthead, .row{
    		margin-bottom:20px;
    	}
    	h3{
    		color:gray;  		
    	}

		.row{
			text-align:center;
			margin-bottom:2%;
		}
		.shop{
			text-align:center;
			margin:0px -5% 0px -5%;
		}

    </style>
  </head>

  <body>
  	 <!-- Jumbotron -->
  	 	<h3>My page</h3>
  	 	
  	 	<div class="masthead">
        <nav>
          <ul class="nav nav-justified">
            <li><a href="/mypage/basketList.do">장바구니조회</a></li>
            <li><a href="/mypage/mypage.do">주문조회</a></li>
            <li><a href="/mypage/myinfo.do">개인정보 조회</a></li>
            <li><a href="/mypage/rank.do">등급현황</a></li>
            <li><a href="/mypage/myboard.do">게시물 조회</a></li>
          </ul>
        </nav>
      </div>    
      <h3>주문 내역</h3>
      <div class="jumbotron">

        <table class="table table-condensed">
				<thead>
				<tr>
					<td>상품 이미지</td>
					<td>상품명</td>
					<td>가격</td>
					<td>갯수</td>
					<td>수령인</td>
					<td>주소지</td>
					<td>배송 상태</td>
				</tr>
				
				</thead>
				<tbody id="list">
				<!-- 데이터 출력 -->
					<c:choose>
						 <c:when test="${not empty productList}" >
							<c:forEach var="product" items="${productList}" varStatus="status">
								<tr class="tac" data-num="${product.p_code}" >
									<td>${product.p_code}</td>
									<td>${product.p_name}</td>
									<td>${product.p_inventory}</td>
									<td>${product.p_color}</td>
									<td>${product.p_size}</td>
									<td>${product.p_date}</td>
									<td>${product.p_gender}</td>
									<td>${product.p_gender}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="7" class="tac">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
      </div>


      <!-- Example row of columns -->
      <div class="row">
        <img alt="배송상태 확인" src="/resources/image/1234.PNG"/>
      </div>
    <div class="shop">
        <div class="col-lg-4">
          
          <p><a class="btn btn-primary" href="#" role="button">배송조회 &raquo;</a></p>
        </div>
        <div class="col-lg-4">
          
          <p><a class="btn btn-primary" href="#" role="button">결제완료 &raquo;</a></p>
       </div>
        <div class="col-lg-4">
          <p><a class="btn btn-primary" href="#" role="button">리뷰작성 &raquo;</a></p>
        </div>
	</div>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
