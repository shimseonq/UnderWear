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
           height:150px;
          border-radius: 10px;
          padding:0px;
          margin:0px;
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
      .form-control{
         width:150px;
         display:inline;
      }
    
      .form-group:nth-child(5){
         width:1200px;
      }
      .form-group{
         width:350px;
         height:40px;
         float:left;
      }
      .col-sm-5{
         width:1200px;
         float:inherit;
      }
       .col-sm-5>label{
          font-
       }
       .maincontroller{
             width:85%;
             margin:auto;
       }
       #card, #pa_payway{
             height:30px;
             width:130px;
             border-radius:5px;
       }

    </style>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript" src="/resources/include/js/address.js"></script>
   <script>   
   var checkB = [];
   $(function() {
      $("#o_deliveryaddress").val();
      /* console.log(b_no); */
      $("#searchadd").click(function(){
         searchAddress();
      });

      $("#pay").click(function(){
         boxForm();
         $("#orderForm").attr({
            "method":"post",
            "action":"/order/orderInsert.do"
         }); 
             $("#orderForm").submit();   
      })
   });
   
   function boxForm() {
      var values = document.getElementsByName("item");
      for (var i = 0; i < values.length; i++) {
         checkB.push(values[i].value);
      }
      var output = "";
      for (var i = 0; i < checkB.length; ++i) {
         output += checkB[i];
         //if(i<checkB.length-1) output+=","
         //   output = output + "<input type='hidden' name='b_no' value='"+checkB[i]+"'/>"; 
      }

      $("#b_number").val(checkB);
      console.log($("#b_number").val());
      //return output;
   }
   </script>
  </head>
<body>
   <h3>결제</h3>
   <hr />
   <div class="maincontroller">
      <h4>주문물품</h4>
      <div class="jumbotron">
         <table class="table table-condensed">
            <thead>
               <tr>
                  <td>상품</td>
                  <td>상품명</td>
                  <td>가격</td>
                  <td>결제금액</td>
               </tr>
            </thead>
            <tbody id="list">
               <!-- 데이터 출력 -->
               <c:choose>
                  <c:when test="${not empty basketOrder}">
                     <c:forEach var="basket" items="${basketOrder}" varStatus="status">
                        <tr class="tac" data-num="${basket.b_no}">
                           <td><input type="hidden" name="item" value="${basket.b_no}"/></td>
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
      <form id="orderForm" name="orderForm">
         <input type="hidden" name="b_number" id="b_number" />
         <input type="hidden" name="sa_money" value="${pay}"/>
      <h4>결제 금액</h4>
         <div class="jumbotron">
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
         <h4>주문서 작성</h4>
         <div class="ordermake">
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
               <label for="o_post">배송지 주소 <input type="text"
                  id="o_post" name="o_post" maxlength="5"
                  class="form-control" placeholder="우편번호" > <input
                  type="button" id="searchadd" name="searchadd" value="찾기" /> <input
                  type="text" id="o_deliveryaddress" name="o_deliveryaddress" maxlength="15"
                  class="form-control" placeholder="주소" width="250px"> <input type="text"
                  id="o_address2" name="o_address2" maxlength="15"
                  class="form-control" placeholder="나머지 주소 " width="250px">
               </label>
            </div>
            <div class="form-group form-group-sm">
               <label for="o_comment">배송시 유의사항</label>
               <textarea id="o_comment" name="o_comment" cols="30" rows="3"
                  placeholder="배송시 유의 사항"></textarea>
            </div>
         </div>
         <div class="jumbotron">
            <label for="userName">결제 방법</label>
            <div>
               <select id="pa_payway" name="pa_payway">
                  <option class="col-sm-2 control-label" value="카드결제">카드결제</option>
                  <option class="col-sm-2 control-label" value="무통장입금">무통장입금</option>
               </select> <select id="card" name="card">
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
                  <input type="text" maxlength="4" class="form-control" /> 
                  <label>-</label>
                  <input type="text" maxlength="4" class="form-control" /> 
                  <label>-</label> 
                  <input type="password" maxlength="4" class="form-control" /> 
                  <label>-</label>
                  <input type="text" maxlength="4" class="form-control" />
               </div>
            </div>

            <label for="cvc">cvc번호 <input type="password" id="cvc"
               name="cvc" class="form-control" maxlength="3" />
            </label> <label for="cvc">카드비밀번호 <input type="password" id="cardpwd"
               name="cardpwd" class="form-control" maxlength="2" /></label> <label
               for="cardpwd">**</label>
         </div>
         <div class="form-group">
            <div class="col-sm-offset-2 col-sm-6">
               <input type="button" value="결제" id="pay" class="btn btn-default" />
               <input type="button" value="취소" id="cancel" class="btn btn-default" />
            </div>
         </div>
      </form>
   </div>


   <%--  <div class="well">
   <h4>주문서 작성</h4>
         <div class="form-group form-group-sm">
            <label for="o_name" class="col-sm-2 control-label">주문자 명</label>
            <div class="col-sm-3">
               <input type="text" id="o_name" name="o_name"  maxlength="12" class="form-control" placeholder="주문자 명" />
            </div> 
         </div>
         <div class="form-group form-group-sm">
            <label for="phone" class="col-sm-2 control-label">연락처</label>
            <div class="col-sm-3">
               <input type="text" id="phone" name="phone" maxlength="15" class="form-control" placeholder="핸드폰 번호">   
            </div>
         </div>   
         <div class="form-group form-group-sm">
            <label for="o_address" class="col-sm-2 control-label">배송지 주소</label>
            <div class="col-sm-3">
               <input type="button" id="searchadd" name ="searchadd" value="우편번호 찾기"/>
               <input type="text" id="o_post" name="o_post" maxlength="15" class="form-control" placeholder="우편번호" >
               <input type="text" id="o_address1" name="o_address1" maxlength="15" class="form-control" placeholder="주소" >
               <input type="text" id="o_address2" name="o_address2" maxlength="15" class="form-control" placeholder="나머지 주소 " >
            </div>
         </div>   
         <div class="form-group form-group-sm">
            <label for="birth" class="col-sm-2 control-label">배송시 유의사항</label>
            <div class="col-sm-3">
               <textarea id="o_content" name="o_content" cols="60" rows="3" class="form-control" placeholder="배송시 유의 사항"></textarea>   
            </div>
         </div>
                                             
     <div class="form-group form-group-sm">
         <label for="userName" class="col-sm-2 control-label">결제 방법</label>
         <div class="col-sm-3">
            <select name="payway">
               <option value="paycard">카드결제</option>
               <option value="paycmd">무통장입금</option>
            </select>
            <c:if test="#{pay.payway ==paycard}">
               <p><select name="card">
                  <option>-----------</option>
                  <option value="samsung">삼성카드</option>
                  <option value="hyundae">현대카드</option>
                  <option value="shinhan">신한카드</option>
                  <option value="kb">국민카드</option>
                  <option value="woori">우리카드</option>
                  <option value="hana">하나카드</option>
                  <option value="ibk">기업카드</option>
                  <option value="bc">BC카드</option>
               </select>
               <label>카드사를 선택해 주세요.</label>
               <input type="text" class="cardnum" maxlength="4"/>
               <label>-</label>
               <input type="text" class="cardnum" maxlength="4"/>
               <label>-</label>
               <input type="password" class="cardnum" maxlength="4"/>
               <label>-</label>
               <input type="text" class="cardnum" maxlength="4"/>
               </p>
               <p>
               <label for="cvc">cvc번호 </label>
               <input type="text" id="cvc" name="cvc" class="cardnum" maxlength="3"/>
               </p>
               <p>
               <label for="cvc">카드비밀번호 </label>
               <input type="text" id="cardpwd" name="cardpwd" class="cardnum" maxlength="2"/>
               <label for="cardpwd">**</label>
               </p>
            </c:if>            
         </div>                              
      </div> 
   </div>--%>
   <%-- <h4>결제 금액</h4>
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
                  </c:otherwise>u
               </c:choose>
            </tbody>
         </table>
      </div>
       <div class="form-group">   
         <div class="col-sm-offset-2 col-sm-6">
            <input type="button" value="결제" id="pay" class="btn btn-default" /> 
            <input type="button" value="취소" id="cancel" class="btn btn-default" />                  
         </div>   
      </div>  --%>

   <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
   <script
      src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>