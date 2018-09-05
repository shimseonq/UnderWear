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
	
	function boxForm(){      
	      var values = document.getElementsByName("item");
	         for(var i = 0; i<values.length; i++){
	            if(values[i].checked){ 
	               checkB.push(values[i].value);   
	            }
	         }
	         var output = "";
	         for (var i = 0; i < checkB.length; ++i){
	        	 output+=checkB[i];
	        	 //if(i<checkB.length-1) output+=","
	         //   output = output + "<input type='hidden' name='b_no' value='"+checkB[i]+"'/>"; 
	         }
	         
	         $("#b_number").val(checkB);
	         console.log($("#b_number").val());
	         //return output;
	   }

</script>

<h2 class="sub-header">판매내역 리스트</h2>

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
   
   <table class="table table-striped">
      <thead>
         <tr>
        	<th class="tac"></th>
            <th class="tac">판매번호</th>
            <th class="tac">판매물품</th>
            <th class="tac">색깔</th>
            <th class="tac">사이즈</th>
            <th class="tac">수량</th>
            <th class="tac">결제 방법</th>
            <th class="tac">금액</th>
            <th class="tac">판매날짜</th>           	           
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${not empty saleList}">
               <c:forEach var="sale" items="${saleList }" varStatus="status">
                  <tr class="tac" data-num="${sale.sa_no}">
                  <td><input type="checkbox" name="item" id="item" value="${sale.sa_no}"/></td>
                     <td>${sale.sa_no}</td>
                     <td>${sale.p_name}</td>
                     <td>${sale.p_color}</td>
                     <td>${sale.p_size}</td>
                     <td>${sale.b_count}</td>
                     <td>${sale.pa_payway}</td>
                     <td>${sale.sa_money}</td>
                     <td>${sale.sa_date}</td>                  
                  </tr>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="4" class="tac">판매 내역이 존재하지않습니다.</td>
               </tr>
            </c:otherwise>
         </c:choose>
      </tbody>
   </table>
</div>