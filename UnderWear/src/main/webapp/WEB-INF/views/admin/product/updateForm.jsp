<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        
        <link rel="stylesheet" type="text/css" href="/resources/include/css/board.css" />
        <link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
        
        <style type="text/css">
        	#imgView {
        		position : absolute;
        	}
        	
     		.imgViewData {
     			position:relative;
     			top: -2px;
     			left: 0px;
     			z-index:100;
     		}
        </style>
                
        <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
        <script type="text/javascript" src="/resources/include/js/common.js"></script>
         
        <script type="text/javascript">
	        $(function() {
	    		var value = "${updateData.img_image}";
	    		if(value != "") {
	    			var img = $("<img>");		// 동적 생성
	    			$("#imgView").hover(function() {
	    				img.attr({
	        				src:"/uploadStorage/product/${updateData.img_image}",
	        				width:"400px",
	        				height:"180px"
	    			})
	    			img.addClass("imgViewData");
	    				$("#imgArea").append(img);
	        		},
	        		function() {
	        			img.remove();		// 마우스 벗어 났을때 remove로 사진을 숨김.
	        		});
	        	} else {
	        		$("#imgView").hide();	// 이미지 파일 없을 때 관련된 모든 것 숨김.
	        	};
	        	
	        	/*이미지 추가 버튼 클릭시 처리 이벤트 */
		          /*  $("#fileBtn").click(function(){
					 var fileIndex =  $("input[type=file]").length;
					 console.log(fileIndex);
		             
					 var br = $("<br/>");
		              
		              $("#boardWrite tr:nth-child(12) td:eq(0)").attr("rowspan", fileIndex+1)
		              $("#boardWrite tr:nth-child(12) td:eq(1)").append("<input type='file' name='files["+ fileIndex + "]' class='gapBox' />");

		           }); */
	    		
	    		// 수정 버튼 클릭 시 처리 이벤트
	    		$("#productUpdateBtn").click(function() {
	    			// 입력값 체크
	    			if(!chkSubmit($('#p_name'), "상품명")) return;
	    			else if(!chkSubmit($("#p_inventory"), "재고량을")) return;
	    			/* else if(!chkSubmit($('#pr_01'), "가격을")) return;
	    			else if(!chkSubmit($("#"))) */
	    			else {
	    				$("#f_writeForm").attr({
	    					"method":"POST",
	    					"action":"/admin/product/productUpdate.do"
	    				});
	    				$("#f_writeForm").submit();
	    			}
	    		});
		           
		           $(".imageUpdate").click(function() {
		        	   console.log("data-no"+$(this).parents("tr").find("img").attr("data-no"));
		        	   var imgSrc = $(this).parents("tr").find("img").attr("src");
		        	   console.log("src"+imgSrc.substring(imgSrc.lastIndexOf("/")+1));
		        	   
		        	   $("#img_no").val($(this).parents("tr").find("img").attr("data-no"));
		        	   $("#img_image").val(imgSrc.substring(imgSrc.lastIndexOf("/")+1));
		        	  
		        	   $(this).parents("tr").find("input[type='file']").attr("name","files[0]");
		        	   console.log($("input[type='file']").val());
		        	   $("#formBtn").attr({
	    					"method":"POST",
	    					/* "enctype":"multipart/form-data", */
	    					"action":"/admin/product/imageUpdate.do"
	    				});
	    				$("#formBtn").submit();
		        	   
		           });
		           
		           $(".imageDelete").click(function() {
		        	   console.log("data-no"+$(this).parents("tr").find("img").attr("data-no"));
		        	   var imgSrc = $(this).parents("tr").find("img").attr("src");
		        	   console.log("src"+imgSrc.substring(imgSrc.lastIndexOf("/")+1));
		        	   
		        	   $("#img_no").val($(this).parents("tr").find("img").attr("data-no"));
		        	   $("#img_image").val(imgSrc.substring(imgSrc.lastIndexOf("/")+1));
		        	   console.log($("input[type='file']").val());
		        	   $(this).parents("tr").find("input[type='file']").attr("name","files[0]");
		        	   $("#formBtn").attr({
	    					"method":"POST",
	    					/* "enctype":"multipart/form-data", */
	    					"action":"/admin/product/imageDelete.do"
	    				});
	    				$("#formBtn").submit();
		           });
	    		
	    		// 목록 버튼 클릭 시 처리 이벤트
	    		$("#productListBtn").click(function() {
	    			location.href="/admin/product/productList.do"
	    		})
	    	})
        </script>
		
	</head>
		<body>
		
			<div class="contentContainer" >
				<div class="contentTB">
					<form id="f_writeForm">		<!-- enctype은 태그가 아닌 attr에서도 사용이 가능. 첨부파일 시 사용. -->
						<input type="hidden" id="p_code" name="p_code" value="${updateData.p_code}" />
						<%-- <input type="hidden" id="img_image" name="img_image" value="${updateData.img_image}" /> --%>
						
						<table id="boardWrite">
							<colgroup>
								<col width="17%" />
								<col width="83%" />
							</colgroup>
							
							<tr>
								<td class="ac">소분류</td>
								<td colspan="2">${updateData.smallct_category}</td>
							</tr>
							<tr>
								<td class="ac vm">상품명</td>
								<td colspan="2"><input type="text" name="p_name" id="p_name" value="${updateData.p_name}" /></td>
							</tr>
							<tr>
								<td class="ac vm">상품 재고량</td>
								<td colspan="2"><input type="text" name="p_inventory" id="p_inventory" value="${updateData.p_inventory}" /></td>
							</tr>
							<tr>
								<td class="ac vm">상품 가격</td>
								<td colspan="2">${updateData.pr_01}</td>
							</tr>
							<tr>
								<td class="ac vm">상품 컬러</td>
								<td colspan="2">${updateData.p_color}</td>
							</tr>
							<tr>
								<td class="ac vm">상품 사이즈</td>
								<td colspan="2">${updateData.p_size}</td>
							</tr>
							<tr>
								<td class="ac vm">상품 성별</td>
								<td colspan="2">${updateData.p_gender}</td>
							</tr>
							<tr>
								<td class="ac vm">상품 수정일</td>
								<td colspan="2"><input type="date" name="p_date" id="p_date" /></td>
							</tr>
							<tr>
								<td class="ac vm">상품 설명</td>
								<td colspan="2"><textarea cols="100" rows="30" name="p_content" id="p_content" >${updateData.p_content}</textarea></td>
							</tr>
							
								
							</table>
							<div class="contentBtn">
							<input type="button" id="productUpdateBtn" value="수정" />
							</div>
					</form>
							 <form id="formBtn"  enctype="multipart/form-data">
		 						<input type="hidden" name="img_no" id="img_no">
		 						<input type="hidden" name="img_image" id="img_image">
		 						<input type="hidden" name="p_code" value="${updateData.p_code}">
						<table>
							<c:if test="${not empty imageUpdate}">
								<c:forEach var="image" items="${imageUpdate}" varStatus="status">
									<tr>
										<td class="ac">첨부파일</td>
										<td colspan="2">
										<input type="file" class="file" />
										
										<img src="/uploadStorage/product/${image.img_image}" data-no="${image.img_no}">
										<button type="button" class="imageUpdate">수정</button>
										<button type="button" class="imageDelete">삭제</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${not empty imageInsert}">
								<c:forEach var="image" items="${imageInsert}" varStatus="status">
									<tr>
										<td class="ac">첨부파일</td>
										<td colspan="2"><input type="file" id="files" />
										<button type="button" class="imageInsert">입력</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
						</form>
			</div>
			<div class="contentBtn">
				<!-- <input type="button" id="productUpdateBtn" value="수정" /> -->
				<input type="button" id="productListBtn" value="목록" />
			</div>
		</div>
		</body>
</html>