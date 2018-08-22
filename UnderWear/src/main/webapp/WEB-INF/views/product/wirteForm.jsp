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
        
        <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
         
        <script type="text/javascript">
	        $(function() {
	     		$("#boardInsertBtn").click(function() {
	     			// 입력값 체크
	     			if (!chkSubmit($('#b_name'), "이름을")) return;
	     			else if (!chkSubmit($('#b_title'), "제목을")) return;
	     			else if (!chkSubmit($('#b_content'), "작성할 내용을")) return;
	     			/* else if (!chkSubmit($("#file"), "첨부파일을")) return;
	     			else if (!chkFile($("file"))) return; */
	     			else if (!chkSubmit($("#b_pwd"), "비밀번호를")) return;
	     			else {
	     				if($("#file").val() != "") {
	     					if(!chkFile($("#file"))) return;
	     				}
	     				$("#f_writeForm").attr({
	     					"method":"post",
	     					"action":"/board/boardInsert.do"
	     				})
	     				$("#f_writeForm").submit();
	     			}
	     		})
	     	})
        </script>
		
	</head>
		<body>
			<div class="contentContainer" >
				<div class="contentTB">
					<form id="f_writeForm" enctype="multipart/form-data">		<!-- enctype은 태그가 아닌 attr에서도 사용이 가능. 첨부파일 시 사용. -->
						<table id="boardWrite">
							<colgroup>
								<col width="17%" />
								<col width="83%" />
							</colgroup>
							<tr>
								<td class="ac">작성자</td>
								<td><input type="text" id="b_name" name="b_name" /></td>
							</tr>
							<tr>
								<td class="ac">글제목</td>
								<td><input type="text" id="b_title" name="b_title" /></td>
							</tr>
							<tr>
								<td class="ac vm">내용</td>
								<td><textarea name="b_content" id="b_content"></textarea></td>
							</tr>
							<tr>
								<td class="ac">첨부파일</td>
								<td><input type="file" id="file" name="file" /></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="password" id="b_pwd" name="b_pwd" /></td>
							</tr>
						</table>
						<input type="button" id="boardInsertBtn" value="글쓰기" />
					</form>
				</div>
			</div>
		</body>
</html>