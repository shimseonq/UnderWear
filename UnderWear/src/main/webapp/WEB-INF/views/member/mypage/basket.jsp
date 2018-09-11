<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %> 

    <title>마이페이지</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/resources/include/css/justified-nav.css" rel="stylesheet">
    <!-- Custom styles for this template -->

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>
     <script src="/resources/include/js/jquery-1.12.4.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->   
    
    
    <style type="text/css">
       .jumbotron{
          height: 300px;
          background-color: white;
          border: none;
          border-top: 2px solid lightgray;
          border-bottom: 2px solid lightgray;
          border-radius: 10px;
          padding:0px;
          text-align:center;
       }
       .container{
          text-align:center;
          margin-bottom: 3%;
       }
       .masthead, .row{
          margin-bottom:100px;
       }
       h3{
          color:gray;  
          text-align:left;      
       }

      .row{
         text-align:center;
         margin:0px;
      }
     .table{
        background-color: white;
        border: none;
        border-top: 1px solid whitegray;
        border-bottom: 1px solid whitegray;
        border-radius: 4px;
     }
     .button{
        height: 30px;
        width: 110px;
        border:none;
        background-color: white;
        font-size:16px;
        font-color:gray;
        font-weight:bold;
        margin:5px;
     }
    </style>

<script type="text/javascript">
   var checkB = [];

   $(function(){      
      $("#pay").click(function(){
         boxForm();
         if($("#b_number").val() == ""){
            alert("결제할 품목이 없습니다.");
         }else{
            $("#b_data").attr({
            "method" : "post",
            "action" : "/order/orderForm.do"
            });
         
         $("#b_data").submit();
         }
      });
      $("#shopping").click(function() {
         location.href="/";
      })
     
   $("#cancel").click(function() {
         $.ajax({
            url : "/mypage/basket.do",
            type : "get",
            data : "b_no=" + $("#item").val(), //받아올 data 값, queryString
            dataType : "text", //응답받는 데이터 타입
            error : function() {
               alert("시스템 오류입니다. 관리자에게 문의하세요");
            },
            success : function(resultData) {
               if (resultData == 0) {
                  alert("장바구니 삭제에 실패 했습니다. 확인 후 다시 요청해 주세요.");
                  return;
               }else {               
                  if(confirm("물품을 삭제하시겠습니까?")){
                  boxForm();
                  if($("#b_number").val()!=""){
                     
                     $("#b_data").attr({
                        "method" : "get",
                        "action" : "/mypage/basketDelete.do"
                     });
                     console.log($("#b_number").val());
                     $("#b_data").submit();
                     alert("삭제가 완료 되었습니다.");
                  }else{
                     console.log($("#b_number").val());
                     alert("삭제할 물품이 없습니다.");   
                  }
                  }
               }
            }
         })
      });
   });

   function boxForm() {
      var values = document.getElementsByName("item");
      for (var i = 0; i < values.length; i++) {
         if (values[i].checked) {
            checkB.push(values[i].value);
         }
      }
      var output = "";
      for (var i = 0; i < checkB.length; ++i) {
         output += checkB[i];
         //if(i<checkB.length-1) output+=","
         //   output = output + "<input type='hidden' name='b_no' value='"+checkB[i]+"'/>"; 
      }

      $("#b_number").val(checkB);
      //console.log($("#b_number").val());
      //return output;
   }
</script>
</head>
  <body>
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
      
      <h3>장바구니 내역</h3>
      <div class="jumbotron">
    <form name="b_data" id="b_data">
       <input type='hidden' name='b_number' id="b_number" />
     <!--   <script >document.write(b_noCheck);</script> -->
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
                           <tr class="tac" data-num="${basket.b_no}">
                              <td><input type="checkbox" name="item" id="item" value="${basket.b_no}"/></td>
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
      <p><input type="button" class="button" id="shopping" value="쇼핑하러 가기"/>
       <input type="button" class="button" id="cancel" name="cancel" value="삭제"/>
      <input type="button" class="button" id="pay" name="pay" value="결제"/></p> 
   </div>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>