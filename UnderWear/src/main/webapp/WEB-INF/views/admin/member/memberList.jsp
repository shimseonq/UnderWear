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
		<h2 class="sub-header">회원 리스트</h2>
			

      <table class="table table-striped">
      <thead>
         <tr>
            <th class="tac">회원번호</th>
            <th class="tac">회원아이디</th>
            <th class="tac">회원명</th>
            <th class="tac">회원이메일</th>
            <th class="tac">회원휴대폰</th>
             <th class="tac">회원집주소</th>
            <th class="tac">등록일</th>
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${not empty memberList}">
               <c:forEach var="member" items="${memberList}" varStatus="status">
                  <tr class="tac" data-c_num="${member.c_num }">
                     <td>${status.count}</td>
                     <td><span class="goDetail">${member.c_id}</span></td>
                     <td>${member.c_name}</td>
                     <td>${member.c_email}</td>
                     <td>${member.c_phone}</td>
                       <td>${member.c_address}</td>
                      <td>${member.c_date}</td>
                  </tr>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="6" class="tac">등록된 회원이 존재하지않습니다.
               </tr>
            </c:otherwise>
         </c:choose>
      </tbody>
   </table>
   </form>
	