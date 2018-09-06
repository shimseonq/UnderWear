<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
        
 <script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
	
  <script type="text/javascript">
         var butChk = 0;	
         $(function() {
        	 $("#pwdChk").hide();
        		/* 첨부 파일 이미지 보여주기 위한 속성 추가 */
     	 	var file = "<c:out value='${detail.rv_img}' />";		
     		if(file != "") {
     			$("#fileImage").attr({
     				src:"/uploadStorage/review/${detail.rv_img}",
     				width:"450px",
     				height:"200px"
     			});
     		} 
     		
     	   //삭제 버튼 클릭시 (댓글달려있을 경우) 처리 이벤트
            $("#boardDeleteBtn").click(function() {
        
               $.ajax({
              	 url:"/review/replyCount.do",
              	 type:"post",
              	 data:"rv_no="+$("#rv_no").val(),
              	 dataType:"text",
              	 error:function(){
              		 alert('시스템 오류입니다 . 관리자에게 문의하세요.')
              	 },
              	 success : function(resultData){
              		 //console.log("result :" + ly);
              		if(resultData==0){		/* 댓글이 0개일때 */
              			goUrl = "/review/reviewDelete.do"
              		}else{
              			alert("댓글 존재 시 게시물 삭제할 수가 없습니다. \n 댓글 삭제 후 다시 시도해 주세요.");
              			return;
              		}	
              		
              		$("#f_data").attr("action", goUrl);
					$("#f_data").submit();
              	 }
              	 });
            });
        	 
        		$("#boardListBtn").click(function() {
         			location.href="/review/reviewList.do"
         		});
        		
               	/* 비밀번호 입력 양식 enter 제거 */
              	$("#passwd").bind("keydown",function(event){
              		if(event.keyCode == 13){
              			event.preventDefault();
              		}
              	});
               	
              	$("#updateFormBtn").click(function() {
        				 $("#f_data").attr({
        					 "method" : "post",
        					 "action" : "/review/updateForm.do"
        				 })
        				 $("#f_data").submit();
        		});
              	
       		}); 
         </script>
</head>
<body>
<div class="contentContainer">
			<div class="contentTit"> <h3>글상세</h3></div>
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="rv_no" value="${detail.rv_no }">
				<input type="hidden" name="rv_img" id="rv_img" value="${detail.rv_img}">		<!-- hidden 현재 가지고 있는 값을 그대로 전달해 주겠다 -->
			</form>
			
				<!-- ====== 비밀번호 확인 버튼 및 버튼 추가 종료 ====== -->
				<table id="boardPwdBut">
			<tr>
				<td id="btd1">
					<div id="pwdChk">
						<form name="f_pwd" id="f_pwd">
							<input type="hidden" name="rv_no" id="rv_no" value="${detail.rv_no}" />
							<label for="c_pwd" id="c_pwd">비밀번호 : </label> <input
								type="password" name="c_pwd" id="c_pwd" /> <input type="button"
								id="pwdBtn" value="확인" /> <span id="msg"></span>
						</form>
					</div>
				</td>

					<td id="btd2"><input type="button" id="updateFormBtn"
					value="수정" /> <input type="button" id="boardDeleteBtn" value="삭제" />
				
					<input type="button" id="boardListBtn" value="목록" /></td>
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
								<td>${detail.rv_no }<span> (조회수 : ${detail.rv_hit }) </span></td>
								<td class="ac">작성일</td>
								<td>${detail.rv_date }</td>
							</tr>
							
							<tr>
								<td class="ac">제목</td>
								<td colspan="3">${detail.rv_title }</td>
							</tr>
							
							<tr>
								<td class="ac">작성자</td>
								<td colspan="3"> ${detail.c_name }</td>
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
				
				  < <jsp:include page="reviewReply.jsp"></jsp:include> 
			</div>
</body>
</html>