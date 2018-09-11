<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>

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
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript" src="/resource0s/include/js/adminProduct.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript">
		search = "<c:out value='${data.search}' />";
		start_date = "<c:out value='${data.start_date}' />";
		end_date = "<c:out value='${data.end_date}' />";
		keyword = "<c:out value='${data.keyword}' />";
		</script>
		
		<script type="text/javascript">
			$(function() {
				// 검색 후 검색 대상과 검색 단어 출력
				var word = "${data.keyword}";
				var value= "";
				if (word != "") {
					$("#keyword").val("<c:out value = '${data.keyword}' />");
					$("#search").val("<c:out value = '${data.search}' />");
					
					if ($("#search").val() != 'p_code') {
						// :contains()는 특정 텍스트를 포함한 요소 반환
						if($("#search").val() == 'p_name') {
							value = "#list tr td.goAdminDetail";
						} else if ($("#p_gender").val() == '') {
							value = "#list tr td.p_date";
						}
						$(value+":contains('"+word+"')").each(function() {
							var regex = new RegExp(word, 'gi');		// 정규표현식 객체
							$(this).html($(this).text().replace(regex, "<span class='required'>" +word+ "</span>"));
						});
					}
				};
				
				// 검색 대상이 변경될 때마다 처리 이벤트
				$("#search").change(function() {
					if($("#search").val() == "all") {
						$("#keyword").val("전체 데이터를 조회 합니다.");
					} else if ($("#search").val() != "all") {		// all이 아닐 시 키워드가 비어져 있으면 경고창을 띄움.
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				
				// 검색 버튼 클릭 시 처리 이벤트
				$("#searchData").click(function() {
					if ($("#search").val() != "all") {
						if (!chkSubmit($("#keyword"), "검색어를")) return;
					}
					goPage();
				});
				
				// 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트
				$(".goAdminDetail").click(function() {
					var p_code = $(this).parents("tr").attr("data-num");
					$("#p_code").val(p_code);
					console.log("상품코드 : " + p_code);
					// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
					$("#detailForm").attr({
						"method" : "get",
						"action" : "/admin/product/productDetail.do"
					})
					$("#detailForm").submit();
				});
				
				$("#insertFormBtn").click(function() {
					location.href="/admin/product/writeForm.do";
				});
			});
			
			// 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 함수 처리.
			function goPage() {
				if($("#search").val() == "all") {
					$("#keyword").val("");
				}
				$("#f_search").attr({
					"method":"get",
					"action":"/admin/product/productList.do"
				});
				$("#f_search").submit();
			}
			
		</script>

</head>
<body>
	<!-- =============================== 검색 하는 부분 =============================== -->
	<div id="productSearch">
		<form id="f_search" name="f_search">
			<table summary="검색">
				<colgroup>
				<tr>
					<td id="btd1"><label>검색 조건</label> <select id="search" name="search">
							<option value="all">전체</option>
							<option value="p_code">상품코드</option>
							<option value="p_name">상품명</option>
							<option value="p_date">상품 등록일</option>

					</select> <input type="text" id="keyword" name="keyword" value="검색어를입력하세요.">
						<input type="button" id="searchData" value="검색"></td>
				</tr>
			</table>
		</form>
	</div>

	<form name="detailForm" id="detailForm">
		<input type="hidden" id="p_code" name="p_code" />
		<!-- hidden 값을 전달해 줌 -->
	</form>
	<table border="1" class="table table-condensed">
		<thead>
			<tr>
				<td>상품코드</td>
				<td>상품명</td>
				<td>재고량</td>
				<td>색상</td>
				<td>사이즈</td>
				<td>등록일</td>
				<td>성별</td>
				<td>가격</td>
				<td>대분류</td>
				<td>소분류</td>
			</tr>

		</thead>
		<tbody id="list">
			<!-- 데이터 출력 -->
			<c:choose>
				<c:when test="${not empty productList}">
					<c:forEach var="product" items="${productList}" varStatus="status">
						<tr class="tac" data-num="${product.p_code}">
							<td>${product.p_code}</td>
							<td class="goAdminDetail tal">${product.p_name}</td>
							<td>${product.p_inventory}</td>
							<td>${product.p_color}</td>
							<td>${product.p_size}</td>
							<td>${product.p_date}</td>
							<td>${product.p_gender}</td>
							<td>${product.pr_01}</td>
							<td>${product.bigct_category}</td>
							<td>${product.smallct_category}</td>
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

	<!-- =============================== 상품 등록 버튼 출력 시작 =============================== -->
	<div class="contentBtn">
		<input type="button" value="상품등록" id="insertFormBtn" />
	</div>


</body>
</html>