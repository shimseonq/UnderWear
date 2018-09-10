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
					"action" : "/qna/qnaUpdate.do"
				});
				$("#f_writeForm").submit();
			}
		});

		// 목록 버튼 클릭 시 처리 이벤트
		$("#boardListBtn").click(function() {
			location.href = "/qna/qnaList.do"
		})
	})
</script>
</head>
<body>

	<div class="contentContainer">
		<div class="contentTit">
			<h3>문의 게시판 글수정</h3>
		</div>
		<div class="contentTB">

			<div class="contentTB">
				<form id="f_writeForm" name="f_writeForm"
					enctype="multipart/form-data">
					<input type="hidden" id="q_no" name="q_no"
						value="${updateData.q_no}" /> <input type="hidden" id="q_img"
						name="q_img" value="${updateData.q_img}" />
					<table id="boardWrite" class="table table-hover">
						<colgroup>
							<col width="17%" />
							<col width="83%" />
						</colgroup>
						
						<tr class="form-group">
						<tr>
							<td class="ac">글번호</td>
							<td>${updateData.q_no}</td>
							<td class="ac">작성일</td>
							<td>${updateData.q_date}</td>
						</tr>

						<tr class="form-group">
							<td><label for="exampleInputEmail1">글제목</label></td>
							<td><input type="text" class="form-control" id="q_title"
								name="q_title" value="${updateData.q_title}"/></td>
						</tr>
							<tr class="form-group">
							
							
						<td><label for="exampleInputPassword1">글 내용</label></td>
						<td><script type="text/javascript"
							src="//editor.cafe24.com/js/nneditor.js"></script> <script
							type="text/javascript">
								NN.Config.instanceID = "q_content";
								NN.Config.value = "①키:<br />\n②몸무게:<br />\n③본인사이즈:<br />\n④상품명:<br>";
								NN.Config.toolbarType = "simple";
								NN.Config.height = 400;

								var q_content = new NNEditor();
								q_content.build();

								if (typeof $Editor != "object") {
									$Editor = {
										_obj : {},

										push : function(obj, id) {
											this._obj[id] = obj;
										},

										get : function(id) {
											return this._obj[id];
										},

										reset : function(id) {
											this._obj[id].getText().value = "";
											this._obj[id].getIFDoc().body.innerHTML = this._obj[id].Config.START_HTML;
										},

										contents : function(id, context) {
											this._obj[id].getText().value = context;
											this._obj[id].getIFDoc().body.innerHTML = this._obj[id].view
													.parsing(2);
										}
									};
								}
								$Editor.push(q_content, "q_content");
							</script> <input type="hidden" id="q_content"
						  value="q_content" /></td>
					</tr>
					
					
						<tr class="form-group">
							<td><label for="exampleInputFile">파일 업로드</label></td>
							<td colspan="3"><input type="file" id="q_imgfile" name="q_imgfile" />
							<span id="imgView" >기존 이미지 파일명 : ${updateData.q_img}<span id="imgArea"></span></span></td>
						</tr>
					</table>
				</form>
			</div>
			</div>
			<div class="contentBtn">
				<input type="button" id="boardUpdateBtn" value="수정" /> <input
					type="button" id="boardListBtn" value="목록" />
			</div>
		</div>
</body>
</html>