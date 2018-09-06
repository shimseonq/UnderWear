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

<style type="text/css">
#imgView {
	position: absolute;
}

.imgViewData {
	position: relative;
	top: -2px;
	left: 0px;
	z-index: 100;
}
</style>

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		var value = "${updateData.q_img}";
		if (value != "") {
			var img = $("<img>"); // 동적 생성
			$("#imgView").hover(function() {
				img.attr({
					src : "/uploadStorage/qna/${updateData.q_img}",
					width : "400px",
					height : "180px"
				})
				img.addClass("imgViewData");
				$("#imgArea").append(img);
			}, function() {
				img.remove(); // 마우스 벗어 났을때 remove로 사진을 숨김.
			});
		} else {
			$("#imgView").hide(); // 이미지 파일 없을 때 관련된 모든 것 숨김.
		}

		// 수정 버튼 클릭 시 처리 이벤트
		$("#boardUpdateBtn").click(function() {
			// 입력값 체크
			if (!chkSubmit($('#q_title'), "제목을"))
				return;
			else if (!chkSubmit($('#q_content'), "작성할 내용을"))
				return;
			else {
				$("#f_writeForm").attr({
					"method" : "POST",
					"action" : "admin/qna/qnaUpdate.do"
				});
				$("#f_writeForm").submit();
			}
		});

		// 목록 버튼 클릭 시 처리 이벤트
		$("#boardListBtn").click(function() {
			location.href = "admin/qna/qnaList.do"
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
							<td class="ac">작성자</td>
							<td>${detail.c_id}</td>
						</tr>
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
							<tr class="form-group">
							<td><label for="exampleInputEmail1">글제목</label></td>
							<td><input type="text" class="form-control" id="q_title"
								name="q_title" /></td>
						</tr>
						<tr class="form-group">
							<td><label for="exampleInputPassword1">글 내용</label></td>
							<td><textarea class="form-control" rows="7" id="q_content"
									name="q_content"></textarea></td>
						</tr>
						<tr class="form-group">
							<td><label for="exampleInputFile">파일 업로드</label></td>
							<td colspan="3"><input type="file" id="q_imgfile" name="q_imgfile" />
							<span id="imgView" >기존 이미지 파일명 : ${updateData.q_img}<span id="imgArea"></span></span></td>
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