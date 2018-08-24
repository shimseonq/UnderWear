 $(function() {
	 $(".goDetail").click(function() {
         var idx = $(this).parents("tr").attr("data-num");
         $("#idx").val(idx);
         //console.log("글번호 :"+b_num)
         $("#detailForm").attr({
            "method" : "get",
            "action" : "/admin/member/memberDetail.do"
         });
         $("#detailForm").submit();
      });
 });
