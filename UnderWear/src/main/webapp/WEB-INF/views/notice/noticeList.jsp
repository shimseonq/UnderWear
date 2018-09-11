<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
.required {
	color: red;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript">
	$(function() {
		// 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트
		$(".goDetail").click(function() {
			var n_no = $(this).parents("tr").attr("data-num");
			$("#n_no").val(n_no);
			console.log("글번호 : " + n_no);

			// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/notice/noticeDetail.do"
			})
			$("#detailForm").submit();
		})

	})
</script>

<form name="detailForm" id="detailForm">
	<input type="hidden" id="n_no" name="n_no" />
	<!-- hidden 값을 전달해 줌 -->
</form>


		<div class="titleAreaBoard">
		<h2>
			<span>공지사항</span>
		</h2>
	</div>
	<div class=container>
		<table border="1" summary="공지사항 입니다" class="table table-hover">
			<caption>공지사항 목록</caption>

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
	</div>
	
	
	