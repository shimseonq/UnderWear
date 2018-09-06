<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        
      <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
      
      <link href="/resources/include/dist/camroll/camroll_slider.css" rel="stylesheet" type="text/css">
      
      <style>
      	#content{
      		background-color:red;
      		width: 200px;
      		margin-left: 20%;
      		margin-top: 2%;
      	}
      	#sumdiv{
      		margin-top: 2%;
      		margin-left: 20%;
      		background-color: orange;
      		display: none;
      		text-align: center;
      		width: 200px;
      		
      	}
      	#option{
      		margin-top: 42px;
      		background-color: lime;
      		width: 600px;
      		height: 500px;
      		float: right;
      	}
      	
      	img{
      		margin-bottom: 200px;
      		padding: 50px;
      	}
      	.testimg{
      		background-color: black;
      		
      	}
      	.table{
      		width: 300px;
      		background-color: black;
      		
      	}
      	.container4{
      		
      		width: 200px;
      		margin-top: 2%;
      		margin-left: 20%;
      		background-color: yellow;
      	}
      	.container3{
      		background-color: aqua;
      		
      		width : 200px;
      		margin-top: 25%;
      		margin-left: 20%;
      		
      	}
         .container2 {
            max-width: 650px;
            
            margin-top: 2%;
            padding: 0 20px;
            padding-bottom: 80px;
             float:left;
             width:650px;
             background-color: black;
             
            
         }

         #my-slider {
            width: 100%;
            height: 450px;
            color: white;
           
            
         }
         
         @media ( max-width : 640px) {
            #my-slider .crs-bar-roll-current {
               width: 38px;
               height: 38px;
            }
            #my-slider .crs-bar-roll-item {
               width: 30px;
               height: 30px;
            }
         }
         .all{
      		border-bottom: solid;
      		height: 700px;
      		
      		background-color: gray;    	}
      </style>
        
        <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
         
        <script type="text/javascript">
         
        </script>
        
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT" crossorigin="anonymous"></script>
           <script type="text/javascript" src="/resources/include/js/camroll_slider.js"></script>
         

<script type="text/javascript">
	
	var sell_price;
	var amount;
	var c_id = "${login.c_id}";
	var state;
	var state2;
	
	$(function(){
		init();
		$("#selectColor").change(function(){
			 state = $("#selectColor option:selected").val();
		});
		$("#selectSize").change(function(){
			 state2 = $("#selectSize option:selected").val();
		
			if(state != null){
				if(state2 != null){
					$("#sumdiv").show();
					$("#spanval").html(state+"/"+state2);
				}
			}else{
				$("#sumdiv").hide();
			}
		});
		
		// 구매 버튼 클릭시 구매페이지로
	 	$("#orderFormBtn").click(function() {
			/* var p_code = $(this).parents("tr").attr("data-num");
			$("#p_code").val(p_code); */
			if(c_id!=""){
			console.log("상품코드 : " + $("#p_code").val());
			// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
			$("#detailForm").attr({
				"method":"post",
				"action":"/order/orderForm.do"
			});
			$("#detailForm").submit();
			}else{
	            location.href="/login/login.do";
	         }
		}); 
		
		$("#basketBtn").click(function() {
			/* var p_code = $(this).parents("div.container3").attr("data-num");
			$("#p_code").val(p_code); */
			
			if(c_id!=""){
	            location.href="/mypage/basket.do";
	        
			console.log("상품코드!!!!!!!!!!!!!!!!!!!!!! : " + $("#p_code").val());
			
			// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
			$("#detailForm").attr({
				"method":"get",
				"action":"/mypage/basket.do"
			});
			 $("#detailForm").submit();
			 }else{
		            location.href="/login/login.do";
		         }
		}); 
		$("#my-slider").camRollSlider();
		
		
		
	})
	

	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
	_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
	_gaq.push([ '_trackPageview' ]);

	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
	
	

	

	function init () {
		sell_price = document.form.sell_price.value;
		amount = document.form.amount.value;
		document.form.sum.value = sell_price;
		change();
	}

	function add () {
		hm = document.form.amount;
		sum = document.form.sum;
		hm.value ++ ;

		sum.value = parseInt(hm.value) * sell_price;
	}

	function del () {
		hm = document.form.amount;
		sum = document.form.sum;
			if (hm.value > 1) {
				hm.value -- ;
				sum.value = parseInt(hm.value) * sell_price;
			}
	}

	function change () {
		hm = document.form.amount;
		sum = document.form.sum;

			if (hm.value < 0) {
				hm.value = 0;
			}
		sum.value = parseInt(hm.value) * sell_price;
	}  
</script>


</head>

      <body>
      
      
      	
         <script type="text/javascript"><!--
         google_ad_client = "ca-pub-2783044520727903";
         /* jQuery_demo */
         google_ad_slot = "2780937993";
         google_ad_width = 728;
         google_ad_height = 90;
         //-->
         </script>
         <div class="all">
         	
           <div class="container2">
             <div id="my-slider" class="crs-wrap">
               <div class="crs-screen">
                 <div class="crs-screen-roll">
                   <div class="crs-screen-item" style="background-image: url('https://picsum.photos/1440/810?image=680')">
                     <div class="crs-screen-item-content"><h1>기동쓰끼</h1></div>
                   </div>
                   <div class="crs-screen-item" style="background-image: url('https://picsum.photos/1440/810?image=676')">
                     <div class="crs-screen-item-content"><h1>Lorem...</h1></div>
                   </div>
                   <div class="crs-screen-item" style="background-image: url('https://picsum.photos/1440/810?image=660')">
                     <div class="crs-screen-item-content"><h1>Lorem...</h1></div>
                   </div>
                   <div class="crs-screen-item" style="background-image: url('https://picsum.photos/1440/810?image=646')">
                     <div class="crs-screen-item-content"><h1>Lorem...</h1></div>
                   </div>
                   <div class="crs-screen-item" style="background-image: url('https://picsum.photos/1440/810?image=633')">
                     <div class="crs-screen-item-content"><h1>Lorem...</h1></div>
                   </div>
                   <div class="crs-screen-item" style="background-image: url('https://picsum.photos/1440/810?image=28')">
                     <div class="crs-screen-item-content"><h1>Lorem...</h1></div>
                   </div>
                 </div>
               </div>
               <div class="crs-bar">
                 <div class="crs-bar-roll-current"></div>
                 <div class="crs-bar-roll-wrap">
                   <div class="crs-bar-roll">
                     <div class="crs-bar-roll-item" style="background-image: url('https://picsum.photos/1440/810?image=680')"></div>
                     <div class="crs-bar-roll-item" style="background-image: url('https://picsum.photos/1440/810?image=676')"></div>
                     <div class="crs-bar-roll-item" style="background-image: url('https://picsum.photos/1440/810?image=660')"></div>
                     <div class="crs-bar-roll-item" style="background-image: url('https://picsum.photos/1440/810?image=646')"></div>
                     <div class="crs-bar-roll-item" style="background-image: url('https://picsum.photos/1440/810?image=633')"></div>
                     <div class="crs-bar-roll-item" style="background-image: url('https://picsum.photos/1440/810?image=628')"></div>
                   </div>
                 </div>
               </div>
             </div>
    
   
	</div>
		<div id="option">
			<div class="container3" >
			<table>
				<tr >
					<td><span>상품명 : </span></td>
					<td>${detail.p_name}</td>
				</tr>
				<tr>
					<td><span>가격 : </span></td>
					<td>${detail.pr_01}</td>
				</tr>
				<tr>
					<td><span>색상 : </span></td>
					<td>&nbsp; <select id="selectColor" name="selectColor">
							<option value="">--옵션 선택--</option>
							<option value="컬러 1">랙블</option>
							<option value="컬러 2">블랙</option>
							<option value="컬러 3">앰블랙</option>
					</select>
					</td>
				</tr>
				<tr>
					<td><span>사이즈 : </span></td>

					<td>&nbsp; <select id="selectSize" name="selectSize">
							<option value="">--옵션 선택--</option>
							<option value="사이즈 1">XL</option>
							<option value="사이즈 2">XXL</option>
							<option value="사이즈 3">XXXL</option>
					</select>
					</td>
				</tr>
			</table>
		</div>

			<form name="detailForm" id="detailForm" method="get">
				<input type="hidden" id="p_code" name="p_code" value="${detail.p_code }" />
				<div id="content"> ${detail.p_name}<span id="spanval"></span>
				</div>
				<div id="sumdiv">
					수량 : <input type=hidden name="sell_price" value="${detail.pr_01}">
					<input type="text" name="b_count" value="1" size="3"
						onchange="change();"> <input type="button" value=" + "
						onclick="add();"> <input type="button" value=" - "
						onclick="del();"><br> 금액 : <input type="text"
						name="sum" size="11" readonly>원
				</div>

				<div class="container4">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" id="orderFormBtn" name="orderFormBtn" value="BUY"><br> 
					<input type="button" id="basketBtn" name="basketBtn" value="add to cart">
				</div> 
			</form>
		</div>
    </div>
    
    <div class="testimg" align="center">
    	<img  alt="" src="/resources/image/test/test14.jpg"><br>
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
    	<img alt="" src="/resources/image/test/test26.jpg">
    	
    </div>
           
 
      </body>
      
</html>