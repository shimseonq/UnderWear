<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style type="text/css">
.required {
	color: red;
}

.rCount {
   font-size: 10px;
   color: red;
   }
</style>

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

 <script type="text/javascript" src="/resources/include/js/common.js"></script>  

<script type="text/javascript" src="/resources/include/js/adminReviewBoard.js"></script>

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
			if ($("#search").val() != 'rv_content') { /* 내용이 아닐때만 색깔을 변경할수 있게 하는 제어 */
				//contains()는 특정 텍스트를 포함한 요소반환
				if ($("#search").val() == 'rv_title') {
					value = "#list tr td.goDetail"; /* #(아이디) list 하위에 tr 하위에 td 안에있는 .(클래스)goDetaul을 찾아간느 부분 */
				} else if ($("#search").val() == 'c_name') {
					value = "#list tr td.c_name";
				}
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
			var rv_no = $(this).parents("tr").attr("data-num");
			$("#rv_no").val(rv_no);
			console.log("글번호 : " + rv_no);

			//입력 양식 enter 제거 
			$("#keyword").bind("keydown",function(event){
				if(event.ketCode ==13){
					event.preventDefault();
				}
			});
			// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/review/reviewDetail.do"
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
				"action" : "/review/reviewList.do"
			});
			$("#f_search").submit();
	}
</script>

<%-- ======================== 검색 부분 ======================== --%>
	
	<div class="well">
		<form class="form-inline" id="f_search">
			<h3>
				<span class="label label-success">검색조건</span>
			</h3>
			<div class="form-group">
				<select id="search" name="search" class="form-control">
					<option value="rv_title">제목</option>
					<option value="c_name">작성자</option>
					<option value="rv_content">내용</option>
					<option value="rv_date">작성일자</option>
				</select>
			</div>

			<div class="form-group" id="textCheck">
				<input type="text" id="keyword" name="keyword" class="form-control"
					placeholder="검색어를 입력해 주세요.">
			</div>

			<div class="form-group" id="dateCheck">
				<input type="date" id="start_date" name="start_date"
					placeholder="시작일자" class="form-control"> <input type="date"
					id="end_date" name="end_date" placeholder="종료일자"
					class="form-control">
			</div>

			<button class="btn btn-primary" id="searchBtn">Search</button>
			<button class="btn btn-primary" id="allSearchBtn">All Search</button>
		</form>
	</div>
	<!-- --------------------------------------------------------------------------------------------------- -->

<form name="detailForm" id="detailForm">
	<input type="hidden" id="rv_no" name="rv_no" />
	<!-- hidden 값을 전달해 줌 -->
</form>

		<div class="titleAreaBoard">
			<h2>
				<span>후기 게시판</span>
			</h2>
		</div>

	<div class=container>
		<table border="1" summary="게시판 목록 입니다" class="table table-hover">
			<caption>후기 게시판 목록</caption>

				<tr align="center">
					<th scope="col" class="number">NO.</th>
					<th scope="col" class="subject">TITLE</th>
					<th scope="col" class="writer">WRITER</th>
					<th scope="col" class="date ">DATE</th>
					<th scope="col" class="hit ">HITS</th>
				</tr>

			<tbody id="list">
				<!-- 데이터 출력 -->
				<c:choose>
					<c:when test="${not empty reviewList}">
						<c:forEach var="review" items="${reviewList}" varStatus="status">
							<tr class="tac" data-num="${review.rv_no}" align="center">
								<td>${review.rv_no}</td>
								<td><span class="goDetail tal">${review.rv_title} </span>
								<c:if test="${review.rCount>0 }"><span class="rCount">[${review.rCount}]</span></c:if></td>
								<td class="content">${review.c_name }</td>
								<td>${review.rv_date}</td>
								<td>${review.rv_hit}</td>
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
			</div>

