<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<!-- =================스크립트 정의 ======================= -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정 -->

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정. initial-scale는 초기비율-->

<!-- 아이콘 표시 -->
<link rel="shortcut icon" href="../image/icon.png" />
<link rel="apple-touch-icon" href="../image/icon.png" />

<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스c필터를 적용하면 된다. -->
<!-- [if It IE 9]>
    <script src="../js/html5shiv.js"></script>
 <![endif]-->
<style type="text/css">
.required {
	color: red;
}
</style>

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

 <script type="text/javascript" src="/resources/include/js/common.js"></script>  


<script type="text/javascript" src="/resources/include/js/adminQnaBoard.js"></script>
<script type="text/javascript">
search = "<c:out value='${data.search}' />";
start_date = "<c:out value='${data.start_date}' />";
end_date = "<c:out value='${data.end_date}' />";
keyword = "<c:out value= '${data.keyword}' />";

$(function() {

	//검색하고 나서 검색조건이랑 검색명  초기화 안되고 그대로 값 foward하는 부분
	var word = "${data.keyword}";
	var value = "";
	if (word != "") {
		$("#keyword").val("${data.keyword}");
		$("#search").val("${data.search}");

		/* ------------- 검색 항목 행당 단어 색깔 주기 ---------- */
		if ($("#search").val() != 'n_content') { /* 내용이 아닐때만 색깔을 변경할수 있게 하는 제어 */
			//contains()는 특정 텍스트를 포함한 요소반환
			if ($("#search").val() == 'n_title') {
				value = "#list tr td.goDetail"; /* #(아이디) list 하위에 tr 하위에 td 안에있는 .(클래스)goDetaul을 찾아간느 부분 */
			$(value + ":contains('" + word + "')").each(
					function() {
						var regex = new RegExp(word, 'gi'); //정규표현식 객체
						$(this).html(
								$(this).text().replace(
										regex,
										"<span class='required'>" + word
												+ "</span>"));
					});
		}
	}
	}
	/* 검색 대상이 변경될 때마다 처리 이벤트 */
	$('#search').change(function() {
		if ($("#search").val() == "all") {
			$("#keyword").val("전체 데이터 조회합니다.");
		} else if ($("#search").val() != "all") {
			$("#keyword").val("");
			$("#keyword").focus();
		}
	});


	// 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트
	$(".goDetail").click(function() {
		var n_no = $(this).parents("tr").attr("data-num");
		$("#n_no").val(n_no);
		console.log("글번호 : " + n_no);
		// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
		$("#detailForm").attr({
			"method" : "get",
			"action" : "/admin/notice/noticeDetail.do"
		})
		$("#detailForm").submit();
	})

	// 글쓰기 버튼 클릭 시
	$("#insertFormBtn").click(function() {
		
		location.href = "writeForm.do";

	});
});
/* 글쓰기 버튼 클릭 시 처리 이벤트 */
function goPage() {
	if ($("#search").val() == "all") {
		$("#keyword").val("");
	}

	$("#f_search").attr({
		"method" : "get",
		"action" : "/admin/notice/noticeList.do"
	});
	$("#f_search").submit();

}
</script>

</head>
<body>
<h2 class="sub-header">관리자 게시판 관리  페이지</h2>

<div class="table-responsive">
   <div class="well">
      <form class="form-inline" id="f_search">
         <h3><span class="label label-success">검색조건</span></h3>
         
         <div class="form-group">
            <select name="search" id="search" class="form-control">
               <option value="n_title">제목</option>
               <option value="n_content">내용</option>
               <option value="n_date">작성일자</option>
            </select>
         </div>
         
         <div class="form-group" id="textCheck">
            <input type="text" name="keyword" id="keyword" class="form-control" placeholder="검색어를 입력하세요.">   
         </div>
         
         <div class="form-group" id="dateCheck">
            <input type="date" name="start_date" id="start_date" class="form-control" placeholder="시작일자.">
            <input type="date" name="end_date" id="end_date" class="form-control" placeholder="종료일자.">
         </div>
         
         <button type="button" class="btn btn-primary" id="searchBtn">Search</button>
         <button type="button" class="btn btn-primary" id="allSearchBtn">All Search</button>
      </form>
   </div>
   
   
 <form name="detailForm" id="detailForm">
	<input type="hidden" id="n_no" name="n_no" />
<!-- 	hidden 값을 전달해 줌 -->
</form> 

<div class="titleAreaBoard">
		<h2>
			<span>관리자 공지사항</span>
		</h2>
	</div>

   <table class="table table-striped">
      <thead>
         <tr>
            <th class="tac">글 번호</th>
            <th class="tac">글 제목</th>
            <th class="tac">작성일</th>
            <th class="tac">작성자</th>
            <th class="tac">조회수</th>
         </tr>
      </thead>
      <tbody>
         <c:choose>
				<c:when test="${not empty noticeList}">
						<c:forEach var="notice" items="${noticeList}" varStatus="status">
							<tr class="tac" data-num="${notice.n_no}" align="center">
								<td>${notice.n_no}</td>
								<td class="goDetail tal">${notice.n_title}</td>
								<td class="content">관리자</td>
								<td>${notice.n_date}</td>
								<td>${notice.n_hit}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
      </tbody>
   </table>
   
   <nav aria-label="Page navigation">
			<ul class="pagination" id="pagination"></ul>
		</nav>
		<!-- =============================== 글쓰기 버튼 출력 시작 =============================== -->
		<div class="contentBtn">
			<button type="button" class="btn btn-primary" id="insertFormBtn">글쓰기</button>
		</div>
	</div>
</body>
</html>