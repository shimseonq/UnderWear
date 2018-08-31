<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여 주도록 설정. -->

<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정.    initial-scale는 초기비율 -->

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../image/icon.png" />
<link rel="apple-touch-icon" href="../image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->

<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
<!-- [if it IE 9] > <script src="../jshtml5shiv.js"></script> [endif] -->

<!-- <link rel="stylesheet" type="text/css"
   href="/resources/include/css/board.css" /> -->
<link rel="stylesheet" type="text/css"
   href="/resources/include/css/common.css" />

<script type="text/javascript"
   src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
   var butChk = 0;
   $(function() {
      $("#pwdChk").hide();

      /* 첨부 파일 이미지 보여주기 위한 속성 추가 */
      var file = "<c:out value='${detail.q_img}' />";
      if (file != "") {
         $("#fileImage").attr({
            src : "/uploadStorage/qna/${detail.q_img}",
            width : "450px",
            height : "200px"
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
         location.href = "/qna/qnaList.do"
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
                     url : "/qna/pwdConfirm.do", // 전송 url
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
                              goUrl = "/qna/updateForm.do";
                           } else if (butChk == 2) {
                              goUrl = "/qna/qnaDelete.do";
                           }
                           $("#f_data").attr("action", goUrl);
                           $("#f_data").submit();
                        }
                     }
                  });
               }
            });

   })
</script>

</head>
<body>
   <div class="contentContainer">
      <h2>문의 게시판 상세보기</h2>
      <form id="f_data" name="f_data" method="post">
         <input type="hidden" name="q_no" value="${detail.q_no}" /> <input
            type="hidden" name="q_img" id="q_img" value="${detail.q_img}" />
      </form>

      <!-- ======================= 비밀번호 확인 버튼 및 버튼 추가 시작 ======================= -->
      <table id="boardPwdBut">
         <tr>
            <td id="btd1">
               <div id="pwdChk">
                  <form name="f_pwd" id="f_pwd">
                     <input type="hidden" name="q_no" id="q_no" value="${detail.q_no}" />
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
               <td class="ac">글번호</td>
               <td>${detail.q_no }<span> (조회수 : ${detail.q_hit })</span></td>
               <td class="ac">작성일</td>
               <td>${detail.q_date }</td>
            </tr>
            <tr>
               <td class="ac">제목</td>
               <td colspan="3">${detail.q_title}</td>
            <tr>
               <td class="ac">글번호</td>
               <td>${detail.q_no }<span> <%-- (조회수 : ${detail.readcnt }) --%>
               </span></td>
               <td class="ac">작성일</td>
               <td>${detail.q_date }</td>
            </tr>
            <tr>
               <td class="ac">내용</td>
               <td colspan="3">${detail.q_content}</td>
            </tr>
            <c:if test="${detail.q_img != ''}">
               <tr>
                  <td class="ac vm">첨부파일 이미지</td>
                  <td colspan="3"><img id="fileImage"></td>
               </tr>
            </c:if>
            </tbody>
         </table>

      </div>
      <%-- <jsp:include  page="qnaReply.jsp" ></jsp:include>  --%>
   </div>

</body>
</html>