<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/common.css" />

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
var butChk = 0;	
$(function() {
	$("#pwdChk").hide();
		
		/* 첨부 파일 이미지 보여주기 위한 속성 추가 */
	 	var file = "<c:out value='${detail.q_img}' />";		
		if(file != "") {
			$("#fileImage").attr({
				src:"/uploadStorage/qna/${detail.q_img}",
				width:"450px",
				height:"200px"
			});
		} 	
		
		 	//목록버튼
		$("#noticeListBtn").click(function() {
			location.href="/admin/qna/qnaList.do"
			});
		
		/* 답변 버튼 클릭 시 처리 이벤트 */
      	$("#boardReply").click(function(){
      		$("#f_data").attr({
      		"method":"post",
      		"action":"/admin/qna/replyForm.do"
      	}),
      	$("#f_data").submit()
   });
		
})
         </script>
</head>
<body>
<div class="contentContainer">
			<div class="contentTit"> <h3>관리자 문의 게시판 상세보기</h3></div>
			<form id="f_data" name="f_data" method="post">
			<input type="hidden" name="q_no" value="${detail.q_no}" /> <input
				type="hidden" name="q_img" id="q_img" value="${detail.q_img}" />
		</form>
		
		<table id="boardPwdBut">
					<tr>
						<td id="btd2">
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
								<td>${detail.q_no }<span>(조회수 : ${detail.q_hit })</span></td>
								<td class="ac">작성일</td>
								<td>${detail.q_date }</td>
							</tr>
							
							<tr>
								<td class="ac">제목</td>
								<td colspan="3">${detail.q_title }</td>
							</tr>
							
						<%-- 	<tr>
								<td class="ac">작성자</td>
								<td colspan="3">${detail.c_id}</td>
							</tr> --%>
							
							<tr class="ctr">
								<td class="ac">내용</td>
									<td colspan="3">${detail.q_content }</td>	
							</tr>
							<c:if test="${detail.q_img != ''}">
							<tr>
								<td class="ac vm">첨부파일 이미지</td>
								<td colspan="3"><img id="fileImage"></td>
							</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
</body>
</html>