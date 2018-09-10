<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text.css"
   href="/resources/include/css/common.css" />
<link rel="stylesheet" type="text.css"
   href="/resources/include/css/board.css" />

<script type="text/javascript"
   src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">

$(function() {
   $("#reviewInsertBtn").click(function() {
      // 입력값 체크
       if (!chkSubmit($('#rv_title'), "제목을")) return;
      else if (!chkSubmit($('#rv_content'), "작성할 내용을")) return;
      
      /*  else if (!chkSubmit($("#rv_imgfile"), "첨부파일을")) return;
      else if (!chkFile($("rv_imgfile"))) return; */
      else {
         if ($("#rv_imgfile").val() != "") {
            if (!chkFile($("#rv_imgfile")))
               return;
         }
         $("#f_writeForm").attr({
            "method" : "post",
            "action" : "/review/reviewInsert.do"
         })
         $("#f_writeForm").submit();
      }
   })
})
</script>
</head>
<body>
<div class="contentContainer">
      <div class="contentTB">

         <form id="f_writeForm" enctype="multipart/form-data">
         <input type="hidden" name="o_no" value="${review.o_no}" />
          <table id="boardWrite">
                  <colgroup>
                     <col width="17%" />
                     <col width="83%" />
                  </colgroup>
                  
            <tr class="form-group">
                  <td><label for="exampleInputEmail1">글제목</label></td>
                  <td><input type="text" class="form-control" id="rv_title"
                     name="rv_title" /></td>
               </tr>
               
               <tr class="form-group">
                  <td><label for="exampleInputPassword1">글 내용</label></td>
                  <td><script type="text/javascript"
                     src="//editor.cafe24.com/js/nneditor.js"></script> <script
                     type="text/javascript">
                        NN.Config.instanceID = "rv_content";
                        NN.Config.value = "①키:<br />\n②몸무게:<br />\n③구매사이즈:<br />\n④상품후기:<br>";
                        NN.Config.toolbarType = "simple";
                        NN.Config.height = 400;

                        var rv_content = new NNEditor();
                        rv_content.build();

                        if (typeof $Editor != "object") {
                           $Editor = {
                              _obj : {},

                              push : function(obj, id) {
                                 this._obj[id] = obj;
                              },

                              get : function(id) {
                                 return this._obj[id];
                              },

                              reset : function(id) {
                                 this._obj[id].getText().value = "";
                                 this._obj[id].getIFDoc().body.innerHTML = this._obj[id].Config.START_HTML;
                              },

                              contents : function(id, context) {
                                 this._obj[id].getText().value = context;
                                 this._obj[id].getIFDoc().body.innerHTML = this._obj[id].view
                                       .parsing(2);
                              }
                           };
                        }
                        $Editor.push(rv_content, "rv_content");
                     </script> <input type="hidden" id="rv_content"
                    value="rv_content" /></td>
               </tr>
               <tr class="form-group">
                  <td><label for="exampleInputFile">파일 업로드</label></td>

                  <td><input type="file" id="rv_imgfile" name="rv_imgfile" />
                  </td>
               </tr>
            </table>
            <div class="contentBtn">
            <input type=button class="btn btn-default" id="reviewInsertBtn"
               value="글쓰기" />
         </div>
         </form>
      </div>
   </div>
</body>
</html>