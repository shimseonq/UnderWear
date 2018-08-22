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

		button{
    		display:block;
    		text-align: center;
    	}
    </style>
  </head>

  <body>
      
     <h3>결제</h3>
     <hr/>
     <h4>주문물품</h4>
	<div class="jumbotron"> 
		
        <table class="table table-condensed">
				<thead>
				<tr>
					<td>상품 이미지</td>
					<td>상품명</td>
					<td>상품금액</td>
					<td>갯수</td>
					<td>담긴날짜</td>
					<td>총 금액</td>
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
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6" class="tac">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
      </div>
	<div class="well">
	<h4>주문서 작성</h4>
		<form id="orderForm" class="form-horizontal">
			<input type="hidden" name="email" id="email" />
			<input type="hidden" name="pinno" id="pinno" />
		<div>	
			<div class="form-group form-group-sm">
				<label for="o_name" class="col-sm-2 control-label">주문자 명</label>
				<div class="col-sm-3">
					<input type="text" id="o_name" name="o_name"  maxlength="12" class="form-control" placeholder="User ID" />
				</div> 
			</div>
			<div class="form-group form-group-sm">
				<label for="o_address" class="col-sm-2 control-label">주소</label>
				<div class="col-sm-3">
					<input type="text" id="o_address" name="o_address" maxlength="15" class="form-control" placeholder="Password" >
					<input type="text" id="o_address" name="o_address" maxlength="15" class="form-control" placeholder="Password" >
					<input type="text" id="o_address" name="o_address" maxlength="15" class="form-control" placeholder="Password" >
				</div>
			</div>
				<div class="form-group form-group-sm">
					<label for="phone" class="col-sm-2 control-label">핸드폰 번호</label>
				<div class="col-sm-3">
					<input type="text" id="phone" name="phone" maxlength="15" class="form-control" placeholder="Phone Number">	
				</div>
			</div>	
				<div class="form-group form-group-sm">
					<label for="phone" class="col-sm-2 control-label">핸드폰 번호</label>
				<div class="col-sm-3">
					<input type="text" id="phone" name="phone" maxlength="15" class="form-control" placeholder="Phone Number">	
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="emailName" class="col-sm-2 control-label">회원 이메일</label>
				<div class="col-sm-3">
					<input type="text" id="emailName" name="emailName" maxlength="60" class="form-control" placeholder="EMAIL">
				</div>
				<div class="col-sm-2">
					<select id="emailDomain" class="form-control">
						<option value="naver.com">네이버</option>
						<option value="daum.net">다음</option>
						<option value="nate.com">네이트</option>																	
					</select> 
				</div>
			</div>
		</div>
		<div>	
			<div class="form-group form-group-sm">
				<label for="birth" class="col-sm-2 control-label">이메일</label>
				<div class="col-sm-3">
					<input type="text" id="birth" name="birth" maxlength="10" class="form-control" placeholder="주민등록번호 6자리">	
				</div>
				<div class="col-sm-2">
					<input type="text" id="gender" name="gender" maxlength="10" class="form-control" placeholder="주민등록번호 7번째 1자리">	
				</div>
			</div>						
			<div class="form-group form-group-sm">
				<label for="userPwCheck" class="col-sm-2 control-label">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password"  id="userPwCheck" name="userPwCheck" maxlength="15" class="form-control" placeholder="Password Confirm" >
				</div>
			</div>
		</div>
								
		<div class="form-group form-group-sm">
			<label for="userName" class="col-sm-2 control-label">회원이름</label>
			<div class="col-sm-3">
				<input type="text" id="userName" name="userName" maxlength="10" class="form-control" placeholder="NAME" >
			</div>										
		</div>
		<h4>결제 금액</h4>
		<div class="jumbotron"> 	
        	<table class="table table-condensed">
				<thead>
				<tr>
					<td>상품 금액</td>
					<td>할인금액  / 추가금액 </td>
					<td>총 결제 금액</td>
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
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6" class="tac">결제할 금액이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
      </div>
      <div class="form-group">	
				<div class="col-sm-offset-2 col-sm-6">
					<input type="button" value="확인" id="joinInsert" class="btn btn-default" /> 
					<input type="button" value="재작성" id="joinReset" class="btn btn-default" />
					<input type="button" value="취소" id="joinCancel" class="btn btn-default" />						
				</div>	
			</div>																										
		</form>
	</div>
	
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
