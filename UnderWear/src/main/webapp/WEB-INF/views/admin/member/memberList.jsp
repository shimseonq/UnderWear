<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>	
	<h2 class="sub-header">게시판 리스트</h2>
			   
      <table class="table table-striped">
      <thead>
         <tr>
            <th class="tac">회원번호</th>
            <th class="tac">회원아이디</th>
            <th class="tac">회원명</th>
            <th class="tac">회원이메일</th>
            <th class="tac">회원휴대폰</th>
            <th class="tac">등록일</th>
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${not empty memberList}">
               <c:forEach var="member" items="${memberList }" varStatus="status">
                  <tr class="tac" data-idx="${member.idx }">
                     <td>${status.count}</td>
                     <td><span class="goDetail">${member.userId}</span></td>
                     <td>${member.userName}</td>
                     <td>${member.email}</td>
                     <td>${member.phone}</td>
                      <td>${member.joinDate}</td>
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
	