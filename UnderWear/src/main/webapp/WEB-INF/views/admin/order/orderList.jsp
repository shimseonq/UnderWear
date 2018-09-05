<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>


<!-- =================스크립트 정의 ======================= -->
<!-- <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/include/js/common.js"></script> -->
<script type="text/javascript" src="/resources/include/js/board.js"></script>
<script type="text/javascript">
	search = "<c:out value='${data.search}' />";
	start_date = "<c:out value='${data.start_date}' />";
	end_date = "<c:out value='${data.end_date}' />";
	keyword = "<c:out value='${data.keyword}' />";

	var checkB = [];

	$(function() {
		$("#update").click(function() {
			boxForm();
			$("#order_list").attr({
				"method" : "get",
				"action" : "/admin/order/deliveryUpdate.do"
			});
			console.log("클릭");
			/* $("#order_list").submit(); */
		});
	});

	function boxForm() {
		var values = document.getElementsByName("item");
		for (var i = 0; i < values.length; i++) {
			if (values[i].checked) {
				checkB.push(values[i].value);
			}
		}
		var output = "";
		for (var i = 0; i < checkB.length; ++i) {
			output += checkB[i];
			//if(i<checkB.length-1) output+=","
			//   output = output + "<input type='hidden' name='b_no' value='"+checkB[i]+"'/>"; 
		}

		$("#o_number").val(checkB);
		console.log($("#o_number").val());
		//return output;
	}
</script>

<h2 class="sub-header">주문내역 리스트</h2>

<div class="table-responsive">
   <div class="well">
      <form class="form-inline" id="f_search">
         <h3><span class="label label-success">검색조건</span></h3>
         <div class="form-group">
            <select name="search" id="search" class="form-control">
               <option value="b_title">제목</option>
               <option value="b_content">내용</option>
               <option value="b_name">작성자</option>
               <option value="b_date">작성일자</option>
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
         <button type="button" class="btn btn-primary" id="excelDownBtn">Excel Down</button>   
      </form>
   </div>
   <form name="order_list" id="order_list">
    	<input type='hidden' name='o_number' id="o_number" />
     <!--   <script >document.write(b_noCheck);</script> -->
    </form> 
   <table class="table table-striped">
      <thead>
         <tr>
         	<th class="tac"><!-- <input type="button" id="update" name="update" value="배송정보 변경"/> --></th>
            <th class="tac">주문번호</th>
            <th class="tac">아이디</th>
            <th class="tac">상품명</th>
            <th class="tac">단가</th>
            <th class="tac">갯수</th>
            <th class="tac">총 금액</th>
            <th class="tac">주문인</th>
            <th class="tac">연락처</th>
            <th class="tac">주소</th>
            <th class="tac">주문일자</th>
            <th class="tac">배송상태</th>            	           
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${not empty orderList}">
               <c:forEach var="orders" items="${orderList }" varStatus="status">
                  <tr class="tac" data-num="${orders.o_no}">
                  	<td><input type="checkbox" name="item" id="item" value="${orders.o_no}"/></td>
                     <td>${orders.o_no}</td>
                     <td>${orders.c_id}</td>
                     <td>${orders.p_name}</td>
                     <td>${orders.pr_01}</td>
                     <td>${orders.b_count}</td>
                     <td>${orders.total}</td>
                     <td>${orders.o_deliveryname}</td>
                     <td>${orders.o_deliveryphone}</td>
                     <td>${orders.o_deliveryaddress}</td>
                     <td>${orders.o_date}</td>
                     <td>${orders.o_delivery}</td>
                  </tr>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="4" class="tac">주문 내역이 존재하지않습니다.</td>
               </tr>
            </c:otherwise>
         </c:choose>
      </tbody>
   </table>
</div>