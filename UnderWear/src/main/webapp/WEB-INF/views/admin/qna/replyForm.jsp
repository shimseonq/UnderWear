<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
      <!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정 -->
      
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
      <!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정. initial-scale는 초기비율 -->
      
      <!-- 모바일 웹 페이지 설정 -->
      <link rel="shortcut icon" href="../image/icon.png" />
      <link rel="apple-touch icon" href="../image/icon.png" />
      <!-- 모바일 웹 페이지 설정 끝 -->
      
      <!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
      <!-- [if lt IE 9]>
         <script src="../js/html5shiv.js"></script>
      <![endif] -->
   
      
      
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/board.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/common.css" />
        
     <script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
  	    
  	     $(function() {
		
  	    	 var conText = $("#q_content").val();
  	    	 $("#q_content").val("\n\n\n >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n\n\n\n" + conText);
		
  	    	 /* 답변 저장 버튼 클릭시 처리 이벤트 */
  	    	$("#boardInsert").click(function(){
  	    		if(!chkData("#q_title","제목을"))return;
  	    		else if(!chkData("#q_content","작성할 내용을"))return;
  	    		else{
  	    			$("#f_replyForm").attr({
  	    				"method" : "post",
  	    				"action" : "/admin/qna/replyInsert.do"
  	    			})
  	    			$("#f_replyForm").submit();
  	    		}
  	      });
  	   });
  		
  	    </script>
	</head>
	<body>
		 <div class="contentContainer">
            <div class="contentTit" ><h3>답변글 작성</h3></div>
            
            <div class="contentTB" > 
               <form id="f_replyForm" name="f_replyForm" enctype="multipart/form-data">
               <input type="hidden" name="q_no" value="${updateData.q_no }">
               <input type="hidden" name="repRoot" value="${updateData.repRoot}">
               <input type="hidden" name="repStep" value="${updateData.repStep}">
               <input type="hidden" name="repIndent" value="${updateData.repIndent}">
               
                  <table>
                     <colgroup>
                        <col width="17%" />
                        <col width="83%" />
                     </colgroup>
                    <tr>
								<td class="ac">글번호</td>
								<td>${updateData.q_no}</td>
								<td class="ac">작성일</td>
								<td>${updateData.q_date}</td>
							</tr>
                     <tr>
                        <td class="ac">글제목</td>
                        <td><input type="text" id="q_title" name="q_title" value="[답변]${updateData.q_title }"/></td>
                     </tr>
                     
                     <tr>
                        <td class="ac">내용</td>
                        <td><textarea name="q_content" id="q_content">${updateData.q_content }</textarea></td>
                     </tr>
                     
                     <tr >
							<td class="ac"><label for="exampleInputFile">파일 업로드</label></td>
							<td colspan="3"><input type="file" id="q_imgfile" name="q_imgfile" />
							<span id="imgView" >기존 이미지 파일명 : ${updateData.q_img}<span id="imgArea"></span></span></td>
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