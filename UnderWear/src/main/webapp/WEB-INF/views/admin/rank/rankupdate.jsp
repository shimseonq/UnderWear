<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
 <script type="text/javascript" src="/resources/include/js/common.js"></script>
  <script type="text/javascript" src="/resources/include/js/board3.js"></script>
	<script type="text/javascript">
	search = "<c:out value='${data.search}' />";
	start_date = "<c:out value='${data.start_date}' />";
	end_date = "<c:out value='${data.end_date}' />";
	keyword = "<c:out value='${data.keyword}' />";
	</script>
	
	

	
		<!--  <form id="detailForm" name="detailForm">   -->
		<h2 class="sub-header">회원 리스트</h2>
		<div class="table-responsive">	
			 <div class="well">
			
    		  <form class="form-inline" id="f_search">
         <h4><span class="label label-success">검색조건</span></h4>
         <div class="form-group">
            <select name="search" id="search" class="form-control">
               <option value="c_name">회원명</option>
              	<option value="rk_no">등급</option>
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
			
			
      <table class="table table-striped">
      <thead>
         <tr>
            <th class="tac">회원번호</th>
            <th class="tac">회원아이디</th>
            <th class="tac">회원명</th>
            <th class="tac">등급</th>
            <th class="tac">누적구입금액</th>
            <th class="tac">등급변경</th>

         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${not empty memberList}">
               <c:forEach var="member" items="${memberList}" varStatus="status">
                  <tr class="tac" data-c_num="${member.c_num}">
                     <td>${status.count}</td>
                     <td><span class="goDetail">${member.c_id}</span></td>
                     <td>${member.c_name}</td>
                     <td>${member.rk_rank}</td>
                     <td></td>
                      <td><input type="button" value="등급변경"/></td>
                  
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
   <!-- </form> -->
</div>
