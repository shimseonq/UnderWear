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
	var checkB=[];
	var butChk = 0;	
	$(function() {
	
		    	/* qj튼 클릭 시 처리 이벤트 */
		      	$("#updateBtn").click(function(){
		      		boxForm();
		      		$("#rank_list").attr({
		      		"method":"get",
		      		"action":"/admin/rank/rankPaysUpdate.do"
		      	}),
		    	//console.log($("#o_number").val());
		      	$("#rank_list").submit()
		   });
	
	})
	
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
		//return output;
	}
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
			
	<form name="rank_list" id="rank_list">
    	<input type='hidden' name="o_number" id="o_number" />	
      <table class="table table-striped">
      <thead>
         <tr>
         	<th><input type="button" id="updateBtn" value="등급 업데이트"/>
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
            <c:when test="${not empty memberRank}">
               <c:forEach var="member" items="${memberRank}" varStatus="status">
                  <tr class="tac" data-c_num="${member.c_num}">
                  <td><input type="checkbox" name="item" class="item" value="${member.c_num}"/></td>
                     <td>${member.c_id}</td>
                     <td><span class="goDetail">${member.c_birth}</span></td>
                     <td>${member.c_date}</td>                    
                     <td>${member.sa_total}</td>
                     <td>${member.rk_rank}</td>
                      <td>                  
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
   </form>/
   <!-- </form> -->
</div>