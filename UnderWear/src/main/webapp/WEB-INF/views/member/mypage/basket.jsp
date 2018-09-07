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
    <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
    <style type="text/css">
    	img{
    		width: 80px;
    		height: 50px;  
    	}  
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
         margin:0px;
      }
    </style>

<script type="text/javascript">
var checkB = [];


	$(function(){
		  
	   
		$("#pay").click(function(){
			boxForm();
			$("#b_data").val(checkB);
				$("#b_data").attr({
				"method" : "get",
				"action" : "/order/orderForm.do"
				});
			
			$("#b_data").submit();
			});
		});
		
	
	
	function boxForm(){		
		var values = document.getElementsByName("item");
	   	for(var i = 0; i<values.length; i++){
	   		if(values[i].checked){
	   			
	   			checkB.push(values[i].value);
	   			
	               
	   		}
	   	}
	   	var output = "";
	   	for (var i = 0; i < checkB.length; ++i){
	   		output = output + "<input type='hidden' name='b_no' value='"+checkB[i]+"'/>"; 
	   	}
	   	return output;
	}
	
	var b_noCheck = boxForm();
	
	
</script>
</head>

  <body>
      <h3>My page</h3>
       
         
      <div class="masthead">
        <nav>
          <ul class="nav nav-justified">
            <li><a href="/mypage/basket.do">장바구니조회</a></li>
            <li><a href="/mypage/mypage.do">주문조회</a></li>
            <li><a href="/mypage/myinfo.do">개인정보 조회</a></li>
            <li><a href="/mypage/rank.do">등급현황</a></li>
            <li><a href="/mypage/myboard.do">게시물 조회</a></li>
          </ul>
        </nav>
      </div> 
      
      <h3>장바구니 내역</h3>
      <div class="jumbotron">
    <form name="b_data" id="b_data">
    	<script >document.write(b_noCheck);</script>
    </form> 
            <table class="table table-condensed">
            <thead>
            <tr>
               <td>선택</td>
               <td>상품 이미지</td>
               <td>상품명</td>
               <td>상품금액</td>
               <td>갯수</td>
               <td>총 금액</td>
            </tr>            
            </thead>
            
               <tbody id="list">
               <!-- 데이터 출력 -->
                  <c:choose>
                      <c:when test="${not empty basketList}" >
                        <c:forEach var="basket" items="${basketList}" varStatus="status">
                           <tr class="tac" data-num="${basket.b_no}"  >
                              <td><input type="checkbox" name="item" id="item" value="${basket.b_no}"/></td>
                              <td><img alt="" src="/resources/image/${basket.img_image }"></td>
                              <td>${basket.p_name}</td>
                              <td>${basket.pr_01}</td>
                              <td>${basket.b_count}</td>
                              <td>${basket.total}</td>
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

   <div class="container"> 
      <p><a class="btn btn-lg btn-success" href="/" role="button">쇼핑하러 가기</a>
      <input type="button" class="btn btn-lg btn-success" id="pay" name="pay" value="결제"/></p> 
   </div>
   
      <!--Example row of columns
      <div class="row">
        <div class="col-lg-4">
          <h2>Safari bug warning!</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-primary" href="#" role="button">배송조회 &raquo;</a></p>
        </div>
        <div class="col-lg-4">
          <h2>Heading</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-primary" href="#" role="button">결제완료 &raquo;</a></p>
       </div>
        <div class="col-lg-4">
          <h2>Heading</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p>
          <p><a class="btn btn-primary" href="#" role="button">리뷰작성 &raquo;</a></p>
        </div>
      </div>

    </div> --> <!-- /container -->

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>