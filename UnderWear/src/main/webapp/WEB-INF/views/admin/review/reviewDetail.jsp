<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <link rel="shortcut icon" href="../image/icon.png" />
        <link rel="apple-touch-icon" href="../image/icon.png" />
        <!-- 모바일 웹 페이지 설정 끝 -->
        
        <!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
        <!-- [if it IE 9] > <script src="../jshtml5shiv.js"></script> [endif] -->
      
 <link rel="stylesheet" type="text/css"
	href="/resources/include/css/common.css" />
 
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
var butChk = 0;	
$(function() {
		
		/* 첨부 파일 이미지 보여주기 위한 속성 추가 */
	 	var file = "<c:out value='${detail.rv_img}' />";		
		if(file != "") {
			$("#fileImage").attr({
				src:"/uploadStorage/review/${detail.rv_img}",
				width:"450px",
				height:"200px"
			});
		} 	
		
		 /* 삭제 버튼 클릭 시 처리 이벤트 */
 		$("#boardDeleteBtn").click(function() {
 			goUrl = "/admin/review/reviewDelete.do";
 			
 			$("#f_data").attr("action",goUrl);
				$("#f_data").submit();
 		}); 
		 	//목록버튼
		$("#noticeListBtn").click(function() {
			location.href="/admin/review/reviewList.do"
			});
		
		 /* 답변 버튼 클릭 시 처리 이벤트 
      	$("#boardReply").click(function(){
      		$("#f_data").attr({
      		"method":"post",
      		"action":"/admin/review/replyForm.do"
      	}),
      	$("#f_data").submit()
   }); */
		
})
         </script>
   </head>
     <body>
	<div class="contentContainer">
			<div class="contentTit"> <h3>관리자 문의 게시판 상세보기</h3></div>
			<form id="f_data" name="f_data" method="post">
			<input type="hidden" name="rv_no" value="${detail.rv_no}" /> <input
				type="hidden" name="rv_img" id="rv_img" value="${detail.rv_img}" />
		</form>
		
		<table id="boardPwdBut">
					<tr>
						<td id="btd2">
							<!-- <input type="button" value="답변" id="boardReply"> -->
							<input type="button" id="boardDeleteBtn" value="삭제" />
							<input type="button" id="noticeListBtn" value="목록" />
						</td>
					</tr>
				</table>
			
				<!-- ====== 상세 정보 보여주기 시작 ====== -->
				<div class = "contentTB">
					<table>
						<colgroup>
							<col width="25%" />
							<col width="25%" />
							<col width="25%" />
							<col width="25%" />
						</colgroup>
						<tbody>
							<tr>
								<td class="ac">글번호</td>
								<td>${detail.rv_no }<span>(조회수 : ${detail.rv_hit })</span></td>
								<td class="ac">작성일</td>
								<td>${detail.rv_date }</td>
							</tr>
							
							<tr>
								<td class="ac">제목</td>
								<td colspan="3">${detail.rv_title }</td>
							</tr>
							
							<tr>
								<td class="ac">작성자</td>
								<td colspan="3">${detail.c_name}</td>
							</tr>
							
							<tr class="ctr">
								<td class="ac">내용</td>
									<td colspan="3">${detail.rv_content }</td>	
							</tr>
							<c:if test="${detail.rv_img != ''}">
							<tr>
								<td class="ac vm">첨부파일 이미지</td>
								<td colspan="3"><img id="fileImage"></td>
							</tr>
							</c:if>
						</tbody>
					</table>
				</div>
				
				 <jsp:include page="reviewReply.jsp"></jsp:include>  
			</div>
		</body>
</html>