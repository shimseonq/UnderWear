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
	        var butChk = 0;		// 수정버튼과 삭제버튼을 구별하기 위한 변수(전역변수)
	     	$(function() { 	     		
	     		/* 첨부 파일 이미지 보여주기 위한 속성 추가 */
	     		var file = "<c:out value='${detail.img_image}' />";		// 코어태그를 빼도 무방함.
	     		if(file != "") {
	     			$("#fileImage").attr({
	     				src:"/uploadStorage/product/${detail.img_image}",
	     				width:"450px",
	     				height:"200px"
	     			});
	     		}
	     		
	     		/* 수정 버튼 클릭 시 처리 이벤트 */
	     		/* $("#updateFormBtn").click(function() {
	     			//btnChk = 1;
	     			location.href="/admin/product/productUpdate.do";
	     		}); */
	     		
	     		/* 삭제 버튼 클릭 시 처리 이벤트 */
	     		$("#productDeleteBtn").click(function() {
	     			location.href="/admin/product/productDelete.do";
	     		});
	     		
	     		/* 목록 버튼 클릭 시 처리 이벤트 */
	     		$("#productListBtn").click(function() {
	     			location.href="/admin/product/productList.do";
	     		});
	     		
	     		/* 수정 버튼 클릭 시 처리 이벤트 */
	     		$("#updateFormBtn").click(function() {
         				/* $.ajax({
         					url : "/admin/product/productUpdate.do",	// 전송 url
         					type : "post",		// 전송 시 method 방식
         					data : $("#f_data").serialize(),		// 폼 전체 데이터 전송. 전달 할 데이터 값(파라미터값), 번호와 비밀번호이용 시 "b_num="+$("#b_num").val+"b_pwd="+$("#b_pwd").val(),
         					dataType : "text",		// url에 대한 응답 받을 데이터 타입
         					error : function() {		// 실행 시 오류가 발생 하였을 경우.
         						alert("시스템 오류 입니다. 관리자에게 문의하세요.");
         					},
         					success : function(resultData) {		// 정상적으로 실행이 되었을 경우.
         						var goUrl="";		// 이동할 경로를 저장할 변수.
         						 if(resultData=="성공") {		// 일치할 경우.
         							$("#msg").text("");
         							if(butChk==1) {
         								goUrl = "/admin/product/productDelete.do";
         							} else if(butChk==2) {
         								goUrl = "/admin/product/productList.do";
         							}
         							$("#f_data").attr("action",goUrl);
         							$("#f_data").submit();
         						}
         					}
         				}); */
	     				$("#f_data").attr("action","/admin/product/updateForm.do");
						$("#f_data").submit();
						
         		});
	     	})

        </script>
		
	</head>
		<body>
			<div class="contentContainer"><h2>게시판 상세보기</h2>
				<form id="f_data" name="f_data" method="post">
					<input type="hidden" name="p_code" value="${detail.p_code}" />
					<input type="hidden" name="img_image" id="img_image" value="${detail.img_image}" />
				</form>
				
					<!-- ======================= 비밀번호 확인 버튼 및 버튼 추가 시작 ======================= -->
					<table id="boardPwdBut">
						<tr>							
							<td id="btd2">
								<input type="button" id="updateFormBtn" value="수정" />
								<input type="button" id="productDeleteBtn" value="삭제" />
								<input type="button" id="productListBtn" value="목록" />
							</td>
						</tr>
					</table>
										
					<div class="contentTB">
						<table>
							<tbody>
								<colgroup>
									<col width="17%" />
									<col width="83%" />
								</colgroup>
								<tr>
									<td class="ac">대분류</td>
									<td>${detail.bigct_category}</td>
								</tr>
								<tr>
									<td class="ac">소분류</td>
									<td>${detail.smallct_category}</td>
								</tr>
								<tr>
									<td class="ac vm">상품명</td>
									<td>${detail.p_name}</td>
								</tr>
								<tr>
									<td class="ac vm">상품 재고량</td>
									<td>${detail.p_inventory}</td>
								</tr>
								<tr>
									<td class="ac vm">상품 가격</td>
									<td>${detail.pr_01}</td>
								</tr>
								<tr>
									<td class="ac vm">상품 컬러</td>
									<td>${detail.p_color}</td>
								</tr>
								<tr>
									<td class="ac vm">상품 사이즈</td>
									<td>${detail.p_size}</td>
								</tr>
								<tr>
									<td class="ac vm">상품 성별</td>
									<td>${detail.p_gender}</td>
								</tr>
								<tr>
									<td class="ac vm">상품 등록일</td>
									<td>${detail.p_date}</td>
								</tr>
								<tr>
									<td class="ac vm">상품 설명</td>
									<td>${detail.p_content}</td>
								</tr>
								
								<c:if test="${not empty imageList}">
									<c:forEach var="image" items="${imageList}" varStatus="status">
										<tr>
											<td class="ac vm">첨부파일 이미지</td>
											<td colspan="3"><img src="/uploadStorage/product/${image.img_image}" data-no="${image.img_no}"></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
		</body>
</html>