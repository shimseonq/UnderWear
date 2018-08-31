<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style type="text/css">
.required {
	color: red;
}
</style>


<script type="text/javascript">
	$(function() {
		// 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트
		$(".goDetail").click(function() {
			var rv_no = $(this).parents("tr").attr("data-num");
			$("#rv_no").val(rv_no);
			console.log("글번호 : " + rv_no);

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
	})
</script>

<form name="detailForm" id="detailForm">
	<input type="hidden" id="rv_no" name="rv_no" />
	<!-- hidden 값을 전달해 줌 -->
</form>

<div module="Board_ListPackage_1002">
	<div module="board_title_1002">
		<div class="titleAreaBoard">
			<h2>
				<span>후기 게시판</span>
			</h2>
		</div>
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
								<td class="goDetail tal">${review.rv_title}</td>
								<td class="content">관리자</td>
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
		
		<!-- =============================== 글쓰기 버튼 출력 시작 =============================== -->
		<div class="contentBtn">
			<button type="button" class="btn btn-primary" id="insertFormBtn">글쓰기</button>
		</div>
	</div>