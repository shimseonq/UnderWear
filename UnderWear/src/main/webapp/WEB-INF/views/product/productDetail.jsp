<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title></title>
       
      <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
         <!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여 주도록 설정. -->
      
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
        <!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정.    initial-scale는 초기비율 -->
         
        <!-- 모바일 웹 페이지 설정 -->
        <link rel="shortcut icon" href="/resources/image/icon.png" />
        <link rel="apple-touch-icon" href="/resources/image/icon.png" />
        <!-- 모바일 웹 페이지 설정 끝 -->
        
        <!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
        <!-- [if it IE 9] > <script src="../jshtml5shiv.js"></script> [endif] -->
        
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <link rel="stylesheet" href="/resources/include/css/normalize.css" />
    <link rel="stylesheet" href="/resources/include/css/foundation.css" />
    <link rel="stylesheet" href="/resources/include/css/demo.css" />
    <link rel="stylesheet" href="/resources/include/css/select.css" />
    <link rel="stylesheet" href="/resources/include/css/button.css" />
    <link rel="stylesheet" href="/resources/include/css/productFont.css" />
    
    <script src="/resources/include/js/modernizr.js"></script>
<script src="/resources/include/js/jquery.js"></script>
        
        <!-- xzoom plugin here -->
  <script type="text/javascript" src="/resources/include/js/xzoom.min.js"></script>
  <link rel="stylesheet" type="text/css" href="/resources/include/css/xzoom.css" media="all" /> 
        
      
       
      
      
        <script type="text/javascript" src="/resources/include/js/jquery.hammer.min.js"></script>

<style>
      .productImg{
         padding: 10%
      }
      .large-7.column{
             width: 350px;
             margin-top: 30%;
      }
      
      
      
      #con{
             width: 290px;
             text-align: center;
             color: red;
             margin-left: 8.2%;
      }
      #selltxt{
         width: 100px;
      }
      table{
         width: 400px;
      }
      td{
         padding: 3%; 
      }
      
      #p_name{
         text-align: center;  
      } 
      #default {
         width: 950px;
         
      }
      
      .taegwang {
         
         float: left;
         width: 550px;
         height: 100%;
      }
        
      #content {
         
         width: 200px;
         margin-left: -3.5%
      }
      
      #sumdiv {
         
         display: none;
         text-align: center;
         width: 200px;
         
      }
      
      #option {
         margin-left: 16.5%;
         margin-top: 5%;
           
         width: 400px;
         display: inline-block;
      }
      
      hr {
         margin-top: 10%;
      }
      
      .testimg {
         background-color: white;
      }
      
      .table {
         width: 400px;
         
      }
      
      .container4 {
         width: 400px;
         
      }
      
      .container3 {
         background-color: white;
         width: 400px;
         margin-top: -12%;
         margin-left: -2.5%;
      }
      
      .container2 {
         max-width: 650px;
         margin-top: 2%;
         padding: 0 20px;
         padding-bottom: 80px;
         float: left;
         width: 650px;
         
      }
      
      .all {
         border-bottom: solid;
         margin-top: 15%;
         width: 100%;
         height: 550px;
         
      }
      
      .button_base {
          margin-left: 39%;
      }
      
      #tableCon{
         margin-left: -13%;
      }
</style>



<script type="text/javascript">
   var sell_price;

   var c_id = "${login.c_id}";
   var state;
   var state2;
   var state3 ="${detail.p_name}";

   $(function() {
      init();
      $("#selectColor").change(function() {
         state = $("#selectColor option:selected").val();
      });
      $("#selectSize").change(function() {
         state2 = $("#selectSize option:selected").val();

         if (state != null) {
            if (state2 != null) {
               $("#sumdiv").show();
               $("#con").val(state3+"/"+state + "/" + state2);
               
            }
         } else {
            $("#sumdiv").hide();
         }
      });

      $("#orderFormBtn").click(function() {
         if (c_id != "") {
            $("#detailForm").attr({
               "method" : "get",
               "action" : "/order/orderForm.do"
            });

            $("#detailForm").submit();
         } else {
            location.href = "/login/login.do";
         }
      });

      $("#basketBtn").click(function() {

         if (c_id != "") {
            $("#detailForm").attr({
               "method" : "get",
               "action" : "/mypage/basketInsert.do"
            });

            $("#detailForm").submit();
         } else {
            location.href = "/login/login.do";
         }
      });

   })

   function init() {
      sell_price = document.detailForm.sell_price.value;
      b_count = document.detailForm.b_count.value;
      document.detailForm.sum.value = sell_price;
      change();
   }

   function add() {
      hm = document.detailForm.b_count;
      sum = document.detailForm.sum;
      hm.value++;

      sum.value = parseInt(hm.value) * sell_price;
   }

   function del() {
      hm = document.detailForm.b_count;
      sum = document.detailForm.sum;
      if (hm.value > 1) {
         hm.value--;
         sum.value = parseInt(hm.value) * sell_price;
      }
   }

   function change() {
      hm = document.detailForm.b_count;
      sum = document.detailForm.sum;

      if (hm.value < 0) {
         hm.value = 0;
      }
      sum.value = parseInt(hm.value) * sell_price;
   }

   function createColorOptions() {
      // colorOptions = [];
      var p_color = "${detail.p_color}";
      var colorOptions = [];
      var color = "";
      for (var i = 0; i < p_color.length; ++i) {
         var character = p_color.charAt(i); //;
         if (character != ';') {
            color = color + character; // color = 
         } else {
            colorOptions.push(color);
            color = "";
         }
      }

      var output = "";
      for (var i = 0; i < colorOptions.length; ++i) {
         output = output + "<option>" + colorOptions[i] + "</option>";
         // <option>빨강</option> <option>파랑</option> <option>검정</option>
      }
      return output;
   }

   function createSizeOptions() {
      var p_size = "${detail.p_size}";
      var sizeOptions = [];
      var size = "";
      for (var i = 0; i < p_size.length; ++i) {
         var character = p_size.charAt(i); //;
         if (character != ';') {
            size = size + character; // color = 빨강
         } else {
            sizeOptions.push(size);
            size = "";
         }
      }

      var output = "";
      for (var i = 0; i < sizeOptions.length; ++i) {
         output = output + "<option value='"+sizeOptions[i]+"'>"
               + sizeOptions[i] + "</option>";
      }
      return output;
   }

   var colorOptions = createColorOptions();
   var sizeOptions = createSizeOptions();
</script>
        
        <link type="text/css" rel="stylesheet" media="all" href="/resources/include/css/jquery.fancybox.css" />
  <link type="text/css" rel="stylesheet" media="all" href="/resources/include/css/magnific-popup.css" />
  <script type="text/javascript" src="/resources/include/js/jquery.fancybox.js"></script>
  <script type="text/javascript" src="/resources/include/js/magnific-popup.js"></script>  
</head>

      <body>
      <form name="detailForm" id="detailForm" method="get">
         <script type="text/javascript"><!--
         google_ad_client = "ca-pub-2783044520727903";
         /* jQuery_demo */
         google_ad_slot = "2780937993";
         google_ad_width = 728;
         google_ad_height = 90;
         //-->
         </script>
         <div class="all">
           <div class="taegwang">
    <!-- default start -->
      <section id="default" class="padding-top0">
      
    <div class="row">
      <div class="large-12 column"><span id="imgTitle">Future ability education center 3 teams</span></div>
      <div class="large-5 column">
        <div class="xzoom-container">
          <img class="xzoom" id="xzoom-default" src="/resources/image/preview/${detail.p_image}" xoriginal="/resources/image/original/${detail.p_image}" />
          <div class="xzoom-thumbs">
            <a href="/resources/image/original/${detail.p_image}"><img class="xzoom-gallery" width="80" src="/resources/image/thumbs/${detail.p_image}"  xpreview="/resources/image/preview/${detail.p_image}" title="The description goes here"></a>
            <a href="/resources/image/original2/${detail.p_image}"><img class="xzoom-gallery" width="80" src="/resources/image/preview2/${detail.p_image}" title="The description goes here"></a>
            <a href="/resources/image/original3/${detail.p_image}"><img class="xzoom-gallery" width="80" src="/resources/image/preview3/${detail.p_image}" title="The description goes here"></a>
            <a href="/resources/image/original4/${detail.p_image}"><img class="xzoom-gallery" width="80" src="/resources/image/preview4/${detail.p_image}" title="The description goes here"></a>
          </div>
           
        </div>   
               
      </div>
      <div class="large-7 column">
         <div id="inforDiv"><span id="infor">[해당 이미지에 마우스를 올리면 사진이 확대됩니다.]</span></div>
      </div>
    </div>
    
    </section>
    <!-- default end -->
      </div>
         <div id="p_name">
            <span class="p_name">[${detail.smallct_category }] </span>
            <span class="p_name">${detail.p_name}</span>
            
            
         </div>
      <div id="option">
         
      <div class="container3" >
         
         
         <table>
            <tr>
               <td><span class="price">Price</span></td>
               <td>:</td>
               <td><span class="price">${detail.pr_01}won</span></td>
               <%-- <td>${detail.p_file }</td> --%>
            </tr>
            <tr>
            <!-- 셀렉트 배열처리 -->
               <td><span id="color">Color</span></td>
               <td>:</td>
               <td> <select id="selectColor" name="selectColor">
                     <option>옵션</option> 
                     <script>document.write(colorOptions);</script>
               </select>
               </td>
            </tr>
             
            <tr>
               <td><span id="size">Size</span></td>
               <td>:</td>
               <td>
               <select id="selectSize" name="selectSize">
                     <option>옵션</option>
                     <script>document.write(sizeOptions);</script>
               </select> 
               </td>
            </tr>
         </table>
      </div>
       
            <input type="hidden" id="p_code" name="p_code" value="${detail.p_code}" />
            
         
            <div id="sumdiv">
               <div id="content"><input type="text" id="con" readonly value="${detail.p_name}">
            </div>
               <table id="tableCon">
                  <tr>
                     <td><span id="sellCount">수량</span></td>
                     <td>:</td>
                     <td>
                        <input type="number" name="b_count" value="1"  onchange="change();">EA
                        <input type=hidden name="sell_price" id="selltxt" value="${detail.pr_01}">
                     </td>
                  </tr>
                  <tr>
                     <td><span id="sellPrice">금액</span></td>
                     <td>:</td>
                     <td>
                        <input type="text" name="sum" size="11" readonly>원
                     </td>
                  </tr>
               </table> 

                   
            </div>

            <div class="container4">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <!-- <input type="button" id="orderFormBtn" name="orderFormBtn" value="BUY"><br> --> 
               
               <!-- <input type="button" id="basketBtn" name="basketBtn" value="add to cart"> -->
            </div>
<div class="back">
    <div class="button_base b05_3d_roll" id="orderFormBtn">
        <div>BUY</div>
        <div>BUY</div>
    </div>
    <br>
    <br>
    <div class="button_base b05_3d_roll" id="basketBtn">
        <div>add to cart</div>
        <div>add to cart</div> 
    </div>
</div>
            </div>
            
    </div>
    <hr>
   <div class="testimg" align="center">
    
       <!-- <img alt="" src="/resources/image/test/test14.jpg"><br>
       <img alt="" src="/resources/image/test/test15.jpg"><br>
       <img alt="" src="/resources/image/test/test16.jpg"><br>
       <img alt="" src="/resources/image/test/test17.jpg"><br>
       <img alt="" src="/resources/image/test/test18.jpg"><br>
       <img alt="" src="/resources/image/test/test19.jpg"><br>
       <img alt="" src="/resources/image/test/test20.jpg"><br>
       <img alt="" src="/resources/image/test/test21.jpg"><br>
       <img alt="" src="/resources/image/test/test22.jpg"><br>
       <img alt="" src="/resources/image/test/test23.jpg"><br>
       <img alt="" src="/resources/image/test/test25.jpg"><br>
       <img alt="" src="/resources/image/test/test26.jpg"> -->
       <%--  <img alt="" src="/uploadStorage/product/${detail.img_image }"> --%>
       
       <%-- <c:choose>
          <c:when test="${not empty productDetail}" >
             <c:forEach var="image" items="${imageList }" varStatus="status">
                <img src="/uploadStorage/product/${image.img_image}">
             </c:forEach>
             
             
          </c:when>
          
       </c:choose> --%>
         <c:if test="${not empty imageList}">
            <c:forEach var="image" items="${imageList}" varStatus="status">
               
                  <img class="productImg" src="/resources/image/${image.img_image}">
                  
            </c:forEach>
         </c:if>
         
         
      </div>   
         
    <script src="/resources/include/js/foundation.min.js"></script>
    <script src="/resources/include/js/setup.js"></script>
         
         
         </form>
      </body>
      
</html>