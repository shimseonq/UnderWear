<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/include/css/productFont.css" />

<style type="text/css"> 
	.imageContent{
		text-align: center;
		font-size: 30px;
		background-color: #EAEAEA;
	}
	#big{	
	}
	.small{ 
		margin-left : -3%; 
		padding-top: 5%;
		float: left;
		padding-left: 10%;
		color: black;
		
	}
	#small2{
		width: 200px;
		height: 300px;
		background-color: blue;
	}
	#small3{
		width: 200px;
		height: 300px;
		background-color: yellow;
	}
	#small4{
		width: 200px;
		height: 300px;
		background-color: green;
	}  
	img{ 
		width: 270px;  
		height: 370px;
		margin-top: 6%;
	}
	.img{
		width: 300px;
		height: 400px;
		background-color: #EAEAEA;
		text-align: center;
	}
</style>   

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>


<script type="text/javascript">
	$(function(){
		$(".goDetail").click(function(){
			var p_code = $(this).parents("div").attr("data-num");
			$("#p_code").val(p_code);
			console.log("상품코드 : "+ p_code);
			
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/product/productDetail.do"
			})
			$("#detailForm").submit();
		}) 
	})
</script>
</head>
<body>
	<form name="detailForm" id="detailForm">
		<input type="hidden" id="p_code" name="p_code" />
		<!-- hidden 값을 전달해 줌 -->
	</form>
	
	<div id="big">
		<c:choose>
			<c:when test="${not empty productThumbnail }">
				<c:forEach var="product" items="${productThumbnail }" varStatus="status">
					<div class="small" >
						<div class="img" data-num="${product.p_code}">
						<a class="goDetail tal"><img alt="imgView" src="/resources/image/preview/${product.p_image}"></a>
						</div>
						<div class="imageContent">
						<span>${product.pr_01}WON</span><br>
						<span>${product.p_name}</span>
						</div>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>
</body>
</html>

		