<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <link rel="shortcut icon" href="../image/icon.png" />
        <link rel="apple-touch-icon" href="../image/icon.png" />
        <!-- 모바일 웹 페이지 설정 끝 -->
        
        <!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
        <!-- [if it IE 9] > <script src="../jshtml5shiv.js"></script> [endif] -->
      
       <link rel="stylesheet" type="text/css" href="/resources/include/css/board.css" />
        <link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
        
         <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
         <script type="text/javascript">
         	$(function() {
         			/* 수정 버튼 눌렀을 때 */
         		$("#updateFormBtn").click(function() {
         			goUrl = "/admin/notice/updateForm.do";
         			
         			$("#f_data").attr("action",goUrl);
						$("#f_data").submit();
         		});
         			/* 목록 버튼 눌렀을 때 */
         		$("#noticeListBtn").click(function() {
         			location.href="/admin/notice/noticeList.do"
         		});
         			/* 삭제 버튼 눌렀을 때 */
         		$("#boardDeleteBtn").click(function() {
					goUrl = "/admin/notice/noticeDelete.do";
         			
         			$("#f_data").attr("action",goUrl);
						$("#f_data").submit();
				})	
			})
         </script>
   </head>
     <body>
		<div class="contentContainer"><h2>관리자 게시판 상세보기</h2>
			<form id="f_data" name="f_data" method="post">
				<input type="hidden" name="n_no" value="${detail.n_no}" />
			</form>
			
				<!-- ======================= 비밀번호 확인 버튼 및 버튼 추가 시작 ======================= --> 
				<table id="boardPwdBut">
					<tr>
						<td id="btd2">
						<input type="button" id="updateFormBtn" value="수정" />
							<input type="button" id="boardDeleteBtn" value="삭제" />
							<input type="button" id="noticeListBtn" value="목록" />
						</td>
					</tr>
				</table>
				
				
				<!-- <table id="boardPwdBut">
					<tr>
						
					</tr>
				</table> -->
				
				<div class="contentTB">
					<table>
						<tbody>
							<colgroup>
								<col width="17%" />
								<col width="83%" />
							</colgroup>
							<tr>
								<td class="ac">작성자</td>
								<td>관리자</td>
								<td class="ac">작성일</td>
								<td>${detail.n_date}</td>
								<td class="ac">조회수</td>
								<td>${detail.n_hit }</td>
							</tr>
							<tr>
								<td class="ac">제목</td>
								<td colspan="3">${detail.n_title}</td>
							</tr>
							<tr>
								<td class="ac">내용</td>
								<td colspan="3">${detail.n_content}</td> 
							</tr>
							
						</tbody>
					</table>
					
					
				</div>
				
			</div>
			
			
		</body>
</html>