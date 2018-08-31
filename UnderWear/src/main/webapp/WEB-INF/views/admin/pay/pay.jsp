<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>	
		
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
 <script type="text/javascript" src="/resources/include/js/common.js"></script>
  <script type="text/javascript" src="/resources/include/js/memberDetail.js"></script>
	<script type="text/javascript">
	 $(function() {
		 $(".goDetail").click(function() {
	         var c_num = $(this).parents("tr").attr("data-num");
	         $("#c_num").val(c_num);
	         //console.log("글번호 :"+b_num)
	         $("#detailForm").attr({
	            "method" : "get",
	            "action" : "/admin/member/memberDetail.do"
	         });
	         $("#detailForm").submit();
	      });
	 });

	</script>
		 <form id="detailForm" name="detailForm">  
		<h2 class="sub-header">판매 리스트</h2>
			

      <table class="table table-striped">
      <thead>
         <tr>
            <th class="tac">판매번호</th>
            <th class="tac">판매 물품</th>
            <th class="tac">회원아이디</th>
            <th class="tac">물품 가격</th>
            <th class="tac">판매 갯수</th>
             <th class="tac">총 판매 가격</th>
            <th class="tac">판매 날짜</th>
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${not empty payList}">
               <c:forEach var="pay" items="${payList}" varStatus="status">
                  <tr class="tac" data-p_no="${pay.pa_no }">
                  	<td>${pay.pa_no}</td>
                     <td>${pay.p_name}</td>
                     <td><span class="goDetail">${pay.c_id}</span></td>
                     <td>${pay.pr_01}</td>
                     <td>${pay.b_count}</td>
                     <td>${pay.pa_total}</td>
                       <td>${pay.pa_date}</td>
                  </tr>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="6" class="tac">판매된 물품이 존재하지 않습니다.
               </tr>
            </c:otherwise>
         </c:choose>
      </tbody>
   </table>
   </form>
	