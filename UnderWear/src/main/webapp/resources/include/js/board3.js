var keyword = "", search = "", start_date = "", end_date = "";

$(function() {
   
   if (search != "c_date") {
      $("#dateCheck").hide();
      var date = getDateFormat(new Date())
      $('#start_date').val(date);
      $('#end_date').val(date);
   } else {
      $("#search").val(search);
      $("#textCheck").hide();
      $("#start_date").val(start_date);
      $("#end_date").val(end_date);
      
      if(keyword != ""){
         $("#search").val(search);
         $("#keyword").val(keyword);
      }

   }
   
   /* 검색 대상이 변경될 때마다 처리 이벤트 */
   $('#search').change(function() {
      if ($("#search").val() != "c_date") {
         $("#dateCheck").hide(); // 등록일 검색 화면 숨기기
         $("#textCheck").show(); // 검색 단어 화면 보이기
      }
      if ($("#search").val() == "c_date") {
         $("#textCheck").hide();
         $("#dateCheck").show();
      }
   });

   /* 검색 버튼 클릭 시 처리 이벤트 */
   $("#searchBtn").click(function() {
      if ($("#search").val() != "c_date") {
         if (!chkSubmit($("#keyword"), "검색어를"))
            return;
      } else if ($("#search").val() == "c_date") {
         if (!chkSubmit($("#start_date"), "시작날짜를"))
            return;
         else if (!chkSubmit($("#end_date"), "종료날짜를"))
            return;
         else if ($("#start_date").val() > $("#end_date").val()) {
            alert("시작날짜가 종료날짜보다 더 클 수 없습니다.");
            return;
         }
      }
      goPage();
   });

   $("#allSearchBtn").click(function() {
      $("#search > option:selected").val("");
      $("#keyword").val("");
      $("#start_date").val("");
      $("#end_date").val("");

      goPage();
   });
   
   /*엑셀 다운로드 버튼 클릭 시 처리 이벤트 */
   $("#excelDownBtn").click(function() {
      $("#f_search").attr({
         "method" : "get",
         "action" : "/admin/board/boardExcel.do"
      });
      $("#f_search").submit();
      
   });
});

/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수 */
function goPage() {

   $("#f_search").attr({
      "method" : "get",
      "action" : "/admin/member/memberList.do"
   });
   $("#f_search").submit();
}