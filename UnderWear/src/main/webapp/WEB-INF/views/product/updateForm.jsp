<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	    		var value = "${updateData.p_file}";
	    		if(value != "") {
	    			var img = $("<img>");		// 동적 생성
	    			$("#imgView").hover(function() {
	    				img.attr({
	        				src:"/uploadStorage/product/${updateData.p_file}",
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
	    		
	    		// 수정 버튼 클릭 시 처리 이벤트
	    		$("#productUpdateBtn").click(function() {
	    			// 입력값 체크
	    			if(!chkSubmit($('#b_title'), "제목을")) return;
	    			else if(!chkSubmit($('#b_content'), "작성할 내용을")) return;
	    			else {
	    				$("#f_writeForm").attr({
	    					"method":"POST",
	    					"action":"/product/productUpdate.do"
	    				});
	    				$("#f_writeForm").submit();
	    			}
	    		});
	    		
	    		// 목록 버튼 클릭 시 처리 이벤트
	    		$("#productListBtn").click(function() {
	    			location.href="/product/productList.do"
	    		})
	    	})
        </script>
		
	</head>
		<body>
			<div class="contentContainer">
			<div class="contentTit"><h3>게시판 글수정</h3></div>
			
			<div class="contentTB">
				<form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
					<input type="hidden" id="b_num" name="b_num" value="${updateData.b_num}" />
					<input type="hidden" id="b_file" name="b_file" value="${updateData.b_file}" />
					
					<table>
						<colgroup>
							<col width="17%" />
							<col width="33%" />
							<col width="17%" />
							<col width="33%" />
						</colgroup>
						<tbody>
							<tr>
								<td class="ac">글번호</td>
								<td>${updateData.b_num}</td>
								<td class="ac">작성일</td>
								<td>${updateData.b_date}</td>
							</tr>
							<tr>
								<td class="ac">작성자</td>
								<td colspan="3">${updateData.b_name}</td>
							</tr>
							<tr>
								<td class="ac">글제목</td>
								<td colspan="3"><input type="text" name="b_title" id="b_title" value="${updateData.b_title}" /></td>
							</tr>
							<tr>
								<td class="ac vm">글내용</td>
								<td colspan="3"><textarea name="b_content" id="b_content">${updateData.b_content}</textarea></td>
							</tr>
							<tr>
								<td class="ac">첨부파일</td>
								<td colspan="3"><input type="file" id="file" name="file" />
								<span id="imgView" >기존 이미지 파일명 : ${updateData.b_file}<span id="imgArea"></span></span></td>
							</tr>
							<tr>
								<td class="ac">비밀번호</td>
								<td colspan="3"><input type="password" id="b_pwd" name="b_pwd" ><label>수정할 비밀번호를 입력해 주세요.</label></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="contentBtn">
				<input type="button" id="productUpdateBtn" value="수정" />
				<input type="button" id="productListBtn" value="목록" />
			</div>
		</div>
		</body>
</html>