<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
        <link rel="stylesheet" type="text/css" href="/resources/include/css/board.css" />
        
        <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
  	    <script type="text/javascript" src="/resources/include/js/common.js"></script>  <!-- 유효성 검사 js -->
  	    <script type="text/javascript">
  	  $(function() {
  		
	    	 var conText = $("#q_content").val();
	    	 $("#q_content").val("\n\n\n\n >>>>>>>>>>>>>>>>>>>>>기존글 사용>>>>>>>>>>>>>>>>>>>>>\n\n\n" + conText);
		
	    	 /* 답변 저장 버튼 클릭시 처리 이벤트 */
	    	$("#boardInsert").click(function(){
	    		if(!chkData("#q_title","글 제목을"))return;
	    		else if(!chkData("#q_content","작성할 내용을"))return;
	    		else{ $("#f_replyForm").attr({
	     			 "method":"post",
					 "action":"/qna/insertReply.do"
	     		 });
	     		$("#f_replyForm").submit(); // function 종결문
	    		}
	         
	      });
	   });
</script>

</head>
<body>
<div class="contentContainer">
		<div class="contentTB">

			<form id="f_replyForm" name = "f_replyForm "enctype="multipart/form-data">
			<input type="hidden" name="q_no" value="${detail.q_no }">
               <input type="hidden" name="repRoot" value="${detail.repRoot}">
               <input type="hidden" name="repStep" value="${detail.repStep}">
               <input type="hidden" name="repIndent" value="${detail.repIndent}">
			
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
					
					
				</table>
			</form>
		</div>
		
		<div class="contentBtn">
               <input type="button" value="저장" class="but" id="boardInsert" />
               <input type="button" value="목록" class="but" id="boardListBtn" />
            </div>
	</div>
</body>
</html>