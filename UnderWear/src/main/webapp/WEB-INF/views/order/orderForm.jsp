<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>

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
<link href="/resources/include/dist/css/bootstrap.min.css"
   rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="/resources/include/css/justified-nav.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
   src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
.jumbotron {
   height: 200px;
   margin: 0px;
   display: inline;
}

.jumbotron1{
   font-size: 1.4em;
   margin: 0px;
   display: inline;
}

.title{
   width:100px;
   margin: 0px;      
}

h4{
   font-weight: bold;
   color: gray;
   display:block;
}

h3 {
   color: gray;
   display:block;
   margin:20px auto;
}

button {
   display: block;
   text-align: center;
}

.maincontroller {
   width: 95%;
   margin: auto;
}

.table{
   text-align:center;
}
.bill{
   height:300px;
   width:100%;

}
.address{
   width:1000px;
   height:30px;
   float:left;
}
.paycmd{
   margin-top: 20px;
   font-size: 1.8em;
}
.form-group{
   width: 300px;
   float: left;
   margin-left:5%;
   margin-top: 2%;
}
.form-control{
   width:200px;
}

.form-group>label{
   width:65%;
}
.o_post{
   width:140px;
   display: inline;
   height: 30px;
   border: 1px solid lightgray;
   border-radius: 4px;
}
#o_comment{
   border: 1px solid lightgray;
   border-radius: 4px;
}
.way, .payway{
   text-align: left;   
}
.way{
   float:left;
}

.paycmd{
   margin: 5%;
}
select{
   height:30px;
   margin:3px;
   border: 1px solid lightgray;
   border-radius: 5px;
}
.cardnum{
   width:100%;
   font-weight: bold;
   margin:5px;
}
.jumbotron2{
   width:80%;
   margin-left: 5%;
}
.card{
   width:120px;
   height:30px;
   border: 1px solid lightgray;
   border-radius: 5px;
}
.cvc{
   padding:5px;
}
.col-sm-offset-2{
   text-align:center;
   height:70px;
   clear:both;
}
#o_post, #o_deliveryaddress, #o_address2{
   margin-bottom:5px;

}
</style>

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/include/js/address.js"></script>
<script>   
   var checkB = [];
   var checkA = [];
   
   $(function() {
      $("#payway1").hide();
      $("#payway2").hide();
      $("#pa_payway").change(function(){
         payway();
      });
      
      $("#o_deliveryaddress").val();
      /* console.log(b_no); */
      $("#searchadd").click(function(){
         searchAddress();
      });

      $("#pay").click(function(){
         boxForm();
         orderConfirm();
         console.log($("#product").val());
         console.log($("#b_number").val());
         $("#orderForm").attr({
            "method":"post",
            "action":"/order/orderInsert.do"
         }); 
         $("#orderForm").submit();  
      });
         
   });
   
   function boxForm() {
      var values = document.getElementsByName("item");
      var product = document.getElementsByName("pcode");
      for (var i = 0; i < values.length; i++) {
         checkB.push(values[i].value);
         checkA.push(product[i].value);
      }
      var output = "";
      for (var i = 0; i < checkB.length; ++i) {
         output += checkB[i];
         //if(i<checkB.length-1) output+=","
         //   output = output + "<input type='hidden' name='b_no' value='"+checkB[i]+"'/>"; 
      }

      $("#b_number").val(checkB);
      $("#product").val(checkA);
      /* console.log($("#b_number").val()); */
      //return output;
   }
   
   function payway(){
      var payway = $("#pa_payway").val();
      if(payway=='카드결제'){
         $("#payway1").show();
         $("#payway2").hide();
      }else if(payway=='무통장입금'){         
         $("#payway1").hide();
         $("#payway2").show();
      }else{
         $("#payway1").hide();
         $("#payway2").hide();
      }
   }
   
   function orderConfirm(){
      var payway = $("#pa_payway").val();
      if(!chkData("#o_deliveryname","주문자명을")) return;
      else if(!chkData("#o_deliveryphone","연락처를")) return;
      else if(!inputVerifyAlert(2,"#o_deliveryphone"))return;
      else if(!chkData("#o_deliveryaddress","배송지 주소를")) return;
      else if(!chkData("#o_address2","나머지 주소를")) return;
      if(payway=='카드결제'){
         if(!chkData("#card1","카드번호를")) return;
         else if(!inputVerifyAlert(3,"#card1")) return;
         else if(!chkData("#card2","카드번호를")) return;
         else if(!inputVerifyAlert(3,"#card2")) return;
         else if(!chkData("#card3","카드번호를")) return;
         else if(!inputVerifyAlert(3,"#card3")) return;
         else if(!chkData("#card4","카드번호를")) return;
         else if(!inputVerifyAlert(3,"#card4")) return;
         else if(!chkData("#cvc","카드번호를")) return;
         else if(!inputVerifyAlert(3,"#cvc")) return;
         else if(!chkData("#cardpwd","카드 비밀번호를")) return;
         else if(!inputVerifyAlert(3,"#cardpwd")) return;
      }
      else{
         $("#orderForm").attr({
            "method":"post",
            "action":"/order/orderInsert.do"
         }); 
         $("#orderForm").submit();  
      }
   }
                 
</script>
</head>
<body>
   <h3>결제</h3>
   <hr />
   <div class="maincontroller">
   <div class="jumbotron">
   <div class="title">   
      <h4>주문물품</h4>
   </div>
   <div class="orderlist">   
         <table class="table table-condensed">
            <thead>
               <tr>
                  <td>상품</td>
                  <td>상품명</td>
                  <td>가격</td>
                  <td>수량</td>
                  <td>결제금액</td>
               </tr>
            </thead>
            <tbody id="list">
               <!-- 데이터 출력 -->
               <c:choose>
                  <c:when test="${not empty basketOrder}">
                     <c:forEach var="basket" items="${basketOrder}" varStatus="status">
                        <tr class="tac" data-num="${basket.b_no}">
                           <td><input type="hidden" name="item"
                              value="${basket.b_no}" />
                              <input type="hidden" name="pcode" value="${basket.p_code}" />
                              </td>
                           <td>${basket.p_name}</td>
                           <td>${basket.pr_01}</td>
                           <td>${basket.b_count}</td>
                           <td>${basket.total}</td>
                        </tr>
                     </c:forEach>
                  </c:when>
                  <c:otherwise>
                     <tr>
                        <td colspan="6" class="tac">주문할 내역이 존재하지 않습니다.</td>
                     </tr>
                  </c:otherwise>
               </c:choose>
            </tbody>
         </table>
      </div>   
      </div>
   
      <form id="orderForm" name="orderForm">
         <input type="hidden" name="b_number" id="b_number" /> <input
            type="hidden" name="sa_money" value="${pay}" />
         <input type="hidden" name="product" id="product"/>   
      
         <h4>주문서 작성</h4>
         <div class="bill">
            <div class="form-group form-group-sm">
               <label for="o_deliveryName">주문자 명 <input type="text"
                  id="o_deliveryname" name="o_deliveryname" class="form-control"
                  placeholder="주문자 명" /></label>
            </div>
            <div class="form-group form-group-sm">
               <label for="c_delivaryPhone">연락처 <input type="text"
                  id="o_deliveryphone" name="o_deliveryphone" class="form-control"
                  maxlength="13" placeholder="핸드폰 번호"></label>
            </div>
            <div class="form-group form-group-sm">
               <label for="o_post">배송지 주소 <input type="text" id="o_post"
                  name="o_post" class="o_post" maxlength="8"
                  placeholder="우편번호"> <input type="button" id="searchadd"
                  name="searchadd" value="찾기" /> <input type="text"
                  id="o_deliveryaddress" name="o_deliveryaddress"
                  class="form-control" placeholder="주소" width="250px"> <input
                  type="text" id="o_address2" name="o_address2"
                  class="form-control" placeholder="나머지 주소 " width="250px">
               </label>
            </div>
            <div class="form-group form-group-sm">
               <label for="o_comment">배송시 유의사항</label>
               <textarea id="o_comment" name="o_comment" cols="133" rows="3"
                  placeholder="배송시 유의 사항"></textarea>
            </div>
            
         </div>
         <div class="jumbotron1">
         <div class="title">   
         <h4>결제 금액</h4>
         </div>
            <div class="orderlist">
            <table class="table table-condensed">
               <thead>
                  <tr>
                     <td>총 상품금액</td>
                     <td>추가/할인 금액</td>
                     <td>총 결제금액</td>
                  </tr>
               </thead>
               <tbody id="list">
                  <!-- 데이터 출력 -->
                  <tr class="tac">
                     <td>${paytotal}</td>
                     <td>${paysale}</td>
                     <td>${pay}</td>
                  <tr>
               </tbody>
            </table>
         </div>
      </div>
         <h4>결제 방법</h4>
         <div class="jumbotron2">         
            <div class="way">
               <select id="pa_payway" name="pa_payway">
                  <option class="col-sm-2 control-label" selected="selected">결제 방법 선택</option>
                  <option class="col-sm-2 control-label" value="카드결제">카드결제</option>
                  <option class="col-sm-2 control-label" value="무통장입금">무통장입금</option>   
               </select>
            </div>   
               <div id="payway1" class="payway">
                  <select id="card" name="card">
                     <option>카드사를 선택해 주세요.</option>
                     <option value="samsung">삼성카드</option>
                     <option value="hyundae">현대카드</option>
                     <option value="shinhan">신한카드</option>
                     <option value="kb">국민카드</option>
                     <option value="woori">우리카드</option>
                     <option value="hana">하나카드</option>
                     <option value="ibk">기업카드</option>
                     <option value="bc">BC카드</option>
                  </select>
                  
                  <div class="cardnum">
                  <label for="card1">카드번호 
                  <input id="card1" type="text" maxlength="4" class="card" />
                     - <input id="card2" type="text" maxlength="4"
                        class="card" /> - <input id="card3"
                        type="password" maxlength="4" class="card" /> -
                     <input id="card4" type="text" maxlength="4" class="card" />
                     </label>
                  </div>
                  <div class="cvc">
                  <label for="cvc">cvc번호 <input type="password" id="cvc"
                     name="cvc" class="card" maxlength="3" />
                  </label> 
                  <label for="cvc">카드비밀번호 <input type="password"
                     id="cardpwd" name="cardpwd" class="card" maxlength="2" /></label>
                  <label for="cardpwd">**</label>
                  </div>
               </div>
               
                  <div id="payway2" class="payway">
                     <label class="paycmd">[신한은행] 110-4445-15303 [예금주] 심현우</label>
                  </div>
               </div>
               </form>   
            <div class="col-sm-offset-2 col-sm-6">
               <input type="button" value="결제" id="pay" class="btn btn-default" />
               <input type="button" value="취소" id="cancel" class="btn btn-default" />
            </div>
         
   </div>

   <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
   <script
      src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>