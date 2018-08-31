var keyword ="", search ="", start_date ="", end_date="";
$(function(){
   // 검색 대상이 변경될 때마다 처리 이벤트
   if(search!="q_date"){
	   $("#dateCheck").hide();		//달력 시작일자 종료 일자
	   var date = getDateFormat(new Date())
	   $("#start_date").val(date);
	   $("#end_date").val(date);
   }else{
	   $("#search").val(search);		//select 
	   $("#textCheck").hide();			//검색 창
	   $("#start_date").val(start_date);
	   $("#end_date").val(end_date);
   }
   if(keyword!=""){
	   $("#search").val(search);
	   $("#keyword").val(keyword);
   }
	
	$("#search").change(function() {
      if($("#search").val() != "q_date") {
    	  $("#dateCheck").hide(); //등록일 검색 화면 숨기기
    	  $("#textCheck").show(); //검색단어 화면 보이기.
      }if ($("#search").val() == "q_date") {   // all이 아닐시 키워드가 비어져있으면 경고창을 띄움.
    	  $("#textCheck").hide(); //검색단어 화면 보이기.
    	  $("#dateCheck").show(); //등록일 검색 화면 숨기기
    	 
      }
   });
   
   // 검색 버튼 클릭 시 처리 이벤트
   $("#searchBtn").click(function() {
	   	if($("#search").val()!="q_date"){
         if(!chkSubmit($("#keyword"), "검색어를")) return;
	   	}else if ($("#search").val()=="q_date"){
	   		if(!chkSubmit($("#start_date"),"시작날짜를")) return;
	   		else if(!chkSubmit($("#end_date"),"종료날짜를")) return;
	   		else if($("#start_date").val()>$("#end_date").val()){
	   			alert("시작날짜가 종료날짜보다 더 클 수 없습니다.");
	   			return;
	   		}
	   	}
      goPage();
   });
   
   /*엑셀 다운로드 버튼 클릭 시 처리 이벤트  */
   $("#excelDownBtn").click(function () {
	   $("#f_search").attr({
		   "method":"get",
		   "action":"/client/qna/qnaList.do"
	   });
	   $("#f_search").submit();
   });
   
   
   $("#allSearchBtn").click(function (){
	   $("#search > option.selected").val("");
	   $("#keyword").val("");
	   $("#start_date").val("");
	   $("#end_date").val("");
   });
   
});

//검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수.
function goPage() {
   $("#f_search").attr({
      "method":"get",
      "action":"/client/qna/qnaList.do"
   });
   $("#f_search").submit();
}