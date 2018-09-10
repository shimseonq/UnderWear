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
		$("#noticeInsertBtn").click(function() {
			// 입력값 체크
			 if (!chkSubmit($('#n_title'), "제목을")) return;
		else if (!chkSubmit($('#n_content'), "작성할 내용을")) return;
			else {
				$("#f_writeForm").attr({
					"method" : "post",
					"action" : "/admin/notice/noticeInsert.do"
				})
				$("#f_writeForm").submit();
			}
		})
	})
</script>

</head>
<body>

<div class="contentContainer">

			<div class="contentTB">
				<form id="f_writeForm" 
					enctype="multipart/form-data">
					
					<table id="boardWrite" class="table table-hover">
						<colgroup>
							<col width="17%" />
							<col width="83%" />
						</colgroup>

						<tr class="form-group">
							<td class="ac"><label for="exampleInputEmail1">글제목</label></td>
							<td><input type="text" class="form-control" id="n_title"
								name="n_title" /></td>
						</tr>
						<tr class="form-group">
							<td class="ac"><label for="exampleInputPassword1">글 내용</label></td>
							<td><textarea class="form-control" rows="7" id="n_content"
									name="n_content"></textarea></td>
						</tr>
					</table>
					<div class="contentBtn">
				<input type=button class="btn btn-default" id="noticeInsertBtn"
					value="글쓰기" />
			</div>
					
					
					
				</form>
			</div>
				
		</div>
</body>
</html>