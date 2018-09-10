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
     		
     		 /* 수정 버튼 클릭 시 처리 이벤트 */
     	      $("#updateFormBtn").click(function() {
     	         $("#pwdChk").show();
     	         $("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color", "red");
     	         butChk = 1;
     	      });

     	      /* 삭제 버튼 클릭 시 처리 이벤트 */
     	      $("#boardDeleteBtn").click(function() {
     	         $("#pwdChk").show();
     	         $("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color", "red");
     	         butChk = 2;
     	      });

     	 	$("#boardListBtn").click(function() {
     			location.href="/review/reviewList.do"
     		});
     	 	
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
              			$("#pwdChk").show();
              			goUrl = "/review/reviewDelete.do"
              				$("#msg").text("작성 시 입력한 비밀번호를 입력해 주세요.").css("color","#000099");
                  		butChk=2;
              		}else{
              			alert("댓글 존재 시 게시물 삭제할 수가 없습니다. \n 댓글 삭제 후 다시 시도해 주세요.");
              			return;
              		}	
              		
              	 }
              	 });
            });
        	 
        		
               	/* 비밀번호 입력 양식 enter 제거 */
              	$("#passwd").bind("keydown",function(event){
              		if(event.keyCode == 13){
              			event.preventDefault();
              		}
              	});
               	
              	 /* 비밀 번호 확인 버튼 클릭 시 처리 이벤트 */
                $("#pwdBtn").click(
                      function() {
                    	  if ($("#c_pwd").val().replace(/\s/g, "") == "") {
                              $("#msg").text("비밀번호를 입력해 주세요.").css("color", "red");
                              $("#c_pwd").focus();
                              return;
                         } else {
                            console.log("확인");
                            $.ajax({
                               url : "/review/pwdConfirm.do", // 전송 url
                               type : "post", // 전송 시 method 방식
                               data : $("#f_pwd").serialize(), // 폼 전체 데이터 전송. 전달 할 데이터 값(파라미터값), 번호와 비밀번호이용 시 "b_num="+$("#b_num").val+"c_pwd="+$("#c_pwd").val(),
                               dataType : "text", // url에 대한 응답 받을 데이터 타입
                               error : function() { // 실행 시 오류가 발생 하였을 경우.
                                  alert("시스템 오류 입니다. 관리에게 문의하세요.");
                               },
                               success : function(resultData) { // 정상적으로 실행이 되었을 경우.
                                  var goUrl = ""; // 이동할 경로를 저장할 변수.
                                  if (resultData == "실패") { // 일치하지 않는 경우.
                                     $("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.")
                                           .css("color", "red");
                                     $("#c_pwd").select();
                                  } else if (resultData == "성공") { // 일치할 경우.
                                     $("#msg").text("");
                                     if (butChk == 1) {
                                        goUrl = "/review/updateForm.do";
                                     } else if (butChk == 2) {
                                        goUrl = "/review/reviewDelete.do";
                                     }
                                     $("#f_data").attr("action", goUrl);
                                     $("#f_data").submit();
                                  }
                               }
                            });
                         }
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
                     <label for="c_pwd">비밀번호 : </label> <input type="password"
                        name="c_pwd" id="c_pwd" /> <input type="button" id="pwdBtn"
                        value="확인" /> <span id="msg"></span>
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