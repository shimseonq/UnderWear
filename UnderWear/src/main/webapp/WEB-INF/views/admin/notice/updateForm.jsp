<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="/resources/include/css/board.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/common.css" />
	
 <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
 <script type="text/javascript" src="/resources/include/js/common.js"></script>
 
 <script type="text/javascript">
 $(function() {
	

//수정 버튼 클릭 시 처리 이벤트
	$("#boardUpdateBtn").click(function() {
		// 입력값 체크
		if(!chkSubmit($('#n_title'), "제목을")) return;
		else if(!chkSubmit($('#n_content'), "작성할 내용을")) return;
		else {
			$("#f_writeForm").attr({
				"method":"POST",
				"action":"/admin/notice/noticeUpdate.do"
			});
			$("#f_writeForm").submit();
		}
	});
	
	// 목록 버튼 클릭 시 처리 이벤트
	$("#boardListBtn").click(function() {
		location.href="/admin/notice/noticeList.do"
	})
})

 </script>
        
</head>
<body>
<div class="contentContainer">
			<div class="contentTit"><h3>공지사항 글수정</h3></div>
			
			<div class="contentTB">
				<form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
					<input type="hidden" id="n_no" name="n_no" value="${updateData.n_no}" />
					
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
								<td>${updateData.n_no}</td>
								<td class="ac">작성일</td>
								<td>${updateData.n_date}</td>
							</tr>
							<tr>
								<td class="ac">작성자</td>
								<td colspan="3">관리자</td>
							</tr>
							<tr>
								<td class="ac">글제목</td>
								<td colspan="3"><input type="text" name="n_title" id="n_title" value="${updateData.n_title}" /></td>
							</tr>
							<tr>
								<td class="ac vm">글내용</td>
								<td colspan="3"><textarea name="n_content" id="n_content">${updateData.n_content}</textarea></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="contentBtn">
				<input type="button" id="boardUpdateBtn" value="수정" />
				<input type="button" id="boardListBtn" value="목록" />
			</div>
		</div>
</body>
</html>