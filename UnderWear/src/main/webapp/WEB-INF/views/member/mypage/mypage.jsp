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
    body{
       font-family: 'Do Hyeon', sans-serif;
    }
       .jumbotron{
          height: 300px;
          padding:0px;
          border-top: 1px solid lightgray;
          border-bottom: 1px solid lightgray;
       }
       .masthead, .row{
          margin-bottom:20px;
       }
       h3{
          color:gray;        
       }
       body{
          
       }
       .jumbotron{
          height: 300px;
          padding:0px;
          border-top: 1px solid lightgray;
          border-bottom: 1px solid lightgray;
          text-align:center;
       }
       .masthead, .row{
          margin-bottom:100px;
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
      .jumbotron{
         overflow:auto;
      }
      .subject{
         font-size: 1.4em;
      }
      
      .row{
         text-align:center;
         margin-bottom:2%;
      }
      .shop{
         text-align:center;
         margin:0px -5% 0px -5%;
      }
      .jumbotron{
         overflow:auto;
      }
      .subject{
         font-size: 1.1em;
      }
      
    </style>
    <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        
       $(function(){           
          $(".finish").click(function(){
             var o_no = $(this).parents("tr").attr("data-num");
               $("#o_no").val(o_no);
             $("#o_data").attr({
                "method":"post",
                "action":"/mypage/orderFin.do"
             });
             
             $("#o_data").submit();
          })
          
          $(".review").click(function(){
             var o_no = $(this).parents("tr").attr("data-num");
              $("#o_no").val(o_no);
               $("#o_data").attr({
                  "method":"post",
                  "action":"/review/writeForm.do"
               });  
               $("#o_data").submit();
          });
       })
    </script>
  </head>

  <body>
      <!-- Jumbotron -->
         <h3>My page</h3>
         
         <div class="masthead">
        <nav>
          <ul class="nav nav-justified">
            <li><a href="/mypage/basket.do">장바구니조회</a></li>
            <li><a href="/mypage/mypage.do">주문조회</a></li>
            <li><a href="/mypage/pwdCheck.do">개인정보 조회</a></li>
            <li><a href="/mypage/rank.do">등급현황</a></li>
            <li><a href="/mypage/myboard.do">게시물 조회</a></li>
          </ul>
        </nav>
      </div>
          
      <h3>주문 내역</h3>
      <div class="jumbotron">
      <form id="o_data" name="o_data">
         <input type="hidden" id="o_no" name="o_no"/>
      </form>   
        <table class="table table-condensed">
            <thead>
            <tr>
               <td class="subject">상품 이미지</td>
               <td class="subject">상품명</td>
               <td class="subject">가격</td>
               <td class="subject">갯수</td>
               <td class="subject">수령인</td>
               <td class="subject">주소지</td>
               <td class="subject">결제일</td>
               <td class="subject">배송 상태</td>
            </tr>
            
            </thead>
            <tbody id="list">
            <!-- 데이터 출력 -->
               <c:choose>
                   <c:when test="${not empty payList}" >
                     <c:forEach var="pay" items="${payList}" varStatus="status">
                        <tr class="tac" data-num="${pay.o_no}">
                           <td>${pay.o_no}</td>
                           <td>${pay.p_name}</td>
                           <td>${pay.pr_01}</td>
                           <td>${pay.b_count}</td>
                           <td>${pay.o_deliveryname}</td>
                           <td>${pay.o_deliveryaddress}</td>
                           <td>${pay.o_delivery}</td>
                           <td>${pay.o_date}</td>
                           <td><input type="button" value="구매확정" class="finish" name="finish"/>
                           <input type="button" value="리뷰작성" class="review" name="review"/></td>
                        </tr>
                     </c:forEach>
                  </c:when>
                  <c:otherwise>
                     <tr>
                        <td colspan="7" class="tac1">등록된 게시물이 존재하지 않습니다.</td>
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

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>