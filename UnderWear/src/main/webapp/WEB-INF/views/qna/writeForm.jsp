
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text.css"
	href="/resources/include/css/common.css" />
<link rel="stylesheet" type="text.css"
	href="/resources/include/css/board.css" />

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		$("#qnaInsertBtn").click(function() {
			// 입력값 체크
			 if (!chkSubmit($('#q_title'), "제목을")) return;
		else if (!chkSubmit($('#q_content'), "작성할 내용을")) return;
			/*  else if (!chkSubmit($("#q_imgfile"), "첨부파일을")) return;
			else if (!chkFile($("q_imgfile"))) return; */
			else {
				if ($("#q_imgfile").val() != "") {
					if (!chkFile($("#q_imgfile")))
						return;
				}
				$("#f_writeForm").attr({
					"method" : "post",
					"action" : "/qna/qnaInsert.do"
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

			<form id="f_writeForm" enctype="multipart/form-data">
			<!-- <table id="boardWrite">
						<colgroup>
							<col width="17%" />
							<col width="83%" />
						</colgroup>
				<th  class="ac">제목</th>
				<td><input id="q_title" name="q_title" class="inputTypeText" 
					maxLength="125" value="" type="text" /></td>
				
				<tr class="">
					<th scope="row">평점</th>
					<td><input id="point0" name="point"  value="5" type="radio" checked="checked" /><label
						for="point0"><span class="point5"><em><img
									src="/resources/image/star.png" /><img
									src="/resources/image/star.png" /><img
									src="/resources/image/star.png" /><img
									src="/resources/image/star.png" /><img
									src="/resources/image/star.png" /></em></span></label> <input id="point1"
						name="point"  value="4"
						type="radio" /><label for="point1"><span class="point4"><em><img
									src="/resources/image/star.png" /><img
									src="/resources/image/star.png" /><img
									src="/resources/image/star.png" /><img
									src="/resources/image/star.png" /></em></span></label> <input id="point2"
						name="point" value="3"
						type="radio" /><label for="point2"><span class="point3"><em><img
									src="/resources/image/star.png" /><img
									src="/resources/image/star.png" /><img
									src="/resources/image/star.png" /></em></span></label> <input id="point3"
						name="point" value="2"
						type="radio" /><label for="point3"><span class="point2"><em><img
									src="/resources/image/star.png" /><img
									src="/resources/image/star.png" /></em></span></label> <input id="point4"
						name="point"  value="1"
						type="radio" /><label for="point4"><span class="point1"><em><img
									src="/resources/image/star.png" /></em></span></label></td>
				</tr>
				<tr>
					<td colspan="2" class="clear"><script type="text/javascript"
							src="//editor.cafe24.com/js/nneditor.js"></script> <script
							type="text/javascript">
								NN.Config.instanceID = "q_content";
								NN.Config.value = "①키:<br />\n②몸무게:<br />\n③구매사이즈:<br />\n④상품후기:<br>";
								NN.Config.toolbarType = "simple";

								//Editor Height
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
							</script> <input type="hidden" id="content_hidden"
						  value="q_content" />

					</td>
				</tr>
				</tbody>
				<tbody class="">
					<tr>
						<th scope="row">첨부파일1</th>
						<td><input name="attach_file[]" type="file" id="q_imgfile"
							name="q_imgfile" /></td>
					</tr>
					<tr>
						<th scope="row">첨부파일2</th>
						<td><input name="attach_file[]" type="file" id="q_imgfile"
							name="q_imgfile" /></td>
					</tr>
					<tr>
						<th scope="row">첨부파일3</th>
						<td><input name="attach_file[]" type="file" id="q_imgfile"
							name="q_imgfile" /></td>
					</tr>
					<tr>
						<th scope="row">첨부파일4</th>
						<td><input name="attach_file[]" type="file" id="q_imgfile"
							name="q_imgfile" /></td>
					</tr>
					<tr>
						<th scope="row">첨부파일5</th>
						<td><input name="attach_file[]" type="file" id="q_imgfile"
							name="q_imgfile" /></td>
					</tr>
				</tbody>
				</table> -->
				
				
				<table id="boardWrite" class="table table-hover">
					<colgroup>
						<col width="17%" />
						<col width="83%" />
					</colgroup>
					
							
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

						<td><input type="file" id="q_imgfile" name="q_imgfile" />
						</td>
					</tr>
				</table>
				<div class="contentBtn">
				<input type=button class="btn btn-default" id="qnaInsertBtn"
					value="글쓰기" />
			</div>
			</form>
		</div>
	</div>
</body>
</html>