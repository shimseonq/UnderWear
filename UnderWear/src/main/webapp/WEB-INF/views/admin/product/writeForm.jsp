<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
      	<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여 주도록 설정. -->
      
     	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
        <!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정.    initial-scale는 초기비율 -->
         
        <!-- 모바일 웹 페이지 설정 -->
        <link rel="shortcut icon" href="/resources/image/icon.png" />
        <link rel="apple-touch-icon" href="/resources/image/icon.png" />
        <!-- 모바일 웹 페이지 설정 끝 -->
        
        <!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
        <!-- [if it IE 9] > <script src="../jshtml5shiv.js"></script> [endif] -->
        
        <link rel="stylesheet" type="text/css" href="/resources/include/css/common.css"/>
        
        
        <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
         
        <script type="text/javascript">
			$(function() {
			   
			   //카테고리dep1 호출
			   var url = "/admin/product/bigCategory.do";
			   $.getJSON(url, function(data) {
			      //불러온 데이터 처리
			      $(data).each(function() {
			         var bigct_no = this.bigct_no;
			         var bigct_category = this.bigct_category;
			         console.log();
			         
			         var option = $("<option>");
			         var span = $("<span>");
			         option.attr("value",bigct_no);
			         span.html(bigct_category);
			         option.append(span);            
			         $("#big_category").append(option);
			      });
			      }).fail(function() {
			         alert("대분류 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
			   });
			   
			   $("#big_category").change(function() {  //on(이벤트, 대상, 콜백함수) 
				      //console.log($("#big_category > option:selected").val());
				      
				       var url = "/admin/product/smallCategory.do?bigct_no="+$("#big_category > option:selected").val();
				      $.getJSON(url, function(data) {
				         // 초기화
				         $("#small_category").html("");
				         $("#small_category").append("<option>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 선택하세요 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</option>");
				         //불러온 데이터 처리
				         $(data).each(function() {
				            var smallct_no = this.smallct_no;
				            var smallct_category = this.smallct_category;
				            
				            var option = $("<option>");
				            var span = $("<span>");
				            option.attr("value",smallct_no);
				            span.html(smallct_category);
				            option.append(span);            
				            $("#small_category").append(option);
				         });
				      }).fail(function() {
				         alert("소분류 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
				      }); 
				   });
			   
			  /*이미지 추가 버튼 클릭시 처리 이벤트 */
	           $("#fileBtn").click(function(){
				 var fileIndex =  $("input[type=file]").length;
				 console.log(fileIndex);
	             
				 var br = $("<br/>");
	              
	              $("#boardWrite tr:nth-child(12) td:eq(0)").attr("rowspan", fileIndex+1)
	              $("#boardWrite tr:nth-child(12) td:eq(1)").append("<input type='file' name='files["+ fileIndex + "]' class='gapBox' />");

	           }); 
			   
			   // 등록 버튼 클릭시
			   $("#productInsertBtn").click(function() {
				   alert("등록 하시겠습니까?");
			      /* 첨부파일 보낼때에는 post 방식에서 enctype="multipart/form-data" 속성을 설정하여야 한다. */                  
			      $("#f_writeForm").attr({
			    	  "method":"post",
			    	  "action":"/admin/product/productInsert.do",
			    	  "enctype":"multipart/form-data"});
			      $("#f_writeForm").submit();
			   })			   
			})//최상위 마지막

        </script>
		
	</head>
		<body>
			<div class="contentContainer" >
				<div class="contentTB">
					<form id="f_writeForm">		<!-- enctype은 태그가 아닌 attr에서도 사용이 가능. 첨부파일 시 사용. -->
						<table id="boardWrite">
							<colgroup>
								<col width="17%" />
								<col width="83%" />
							</colgroup>
							<tr>
								<td class="ac">대분류</td>
								<td>
									<select id="big_category" name="bigct_no">
										<option>----- 선택 하세요 -----</option>
										<!-- <option value="드로우즈" data-target="#man-1">드로우즈</option>
										<option value="삼각" data-target="#man-1">삼각</option>
										<option value="트렁크" data-target="#man-1">트렁크</option> -->
										<!-- <option value="브라" data-target="#woman-1">브라</option>
										<option value="팬티" data-target="#woman-2">팬티</option> -->
									</select>
								</td>
							</tr>
							<tr>
								<td class="ac">소분류</td>
								<td><select id="small_category" name="smallct_no">
									<option>----- 선택 하세요 -----</option>
									<!-- <option value="풀컵" data-target="#woman1">풀컵</option>
									<option value="3/4" data-target="#woman1">3/4</option>
									<option value="1/2" data-target="#woman1">1/2</option> -->
								</select>
								</td>
							</tr>
							<tr>
								<td class="ac vm">상품명</td>
								<td><input type="text" name="p_name" id="p_name" placeholder="상품명을 입력 하세요." /></td>
							</tr>
							<tr>
								<td class="ac vm">상품 재고량</td>
								<td><input type="text" name="p_inventory" id="p_inventory" placeholder="재고량을 입력 하세요" /></td>
							</tr>
							<tr>
								<td class="ac vm">상품 가격</td>
								<td><input type="text" name="pr_no" id="pr_no" placeholder="가격을 입력 하세요" /></td>
							</tr>
							<tr>
								<td class="ac vm">상품 컬러</td>
								<td><input type="text" name="p_color" id="p_color" placeholder="색상을 입력 하세요" /></td>
							</tr>
							<tr>
								<td class="ac vm">상품 사이즈</td>
								<td><input type="text" name="p_size" id="p_size" /></td>
							</tr>
							<tr>
								<td class="ac vm">상품 성별</td>
								<td><input type="text" name="p_gender" id="p_gender" /></td>
							</tr>
							<tr>
								<td class="ac vm">상품 등록일</td>
								<td><input type="date" name="p_date" id="p_date" /></td>
							</tr>
							<tr>
								<td class="ac vm">상품 설명</td>
								<td><textarea cols="100" rows="30" name="p_content" id="p_content" placeholder="상품 설명을 입력 하세요." ></textarea></td>
							</tr>
							<tr>
								<td class="ac vm">상품 썸네일</td>
								<td><input type="text" name="p_image" id="p_image" /></td>
							</tr>
							<tr>
								<td class="ac vm">상품 이미지</td>
								<!-- <td colspan="5"><input type="file" id="files" name="files[0]" /> -->
								<!-- <span id="imgView">기존 이미지 파일명 : ${writeForm.img_image}<span id="imgArea" ></span></span> -->
								<!-- <input type="button" id="imgInsertBtn" name="imgInsertBtn" value="추가" /> -->
								<!-- </td> -->
								<td><button type="button" id="fileBtn">추가</button></td>
							</tr>
						</table>
						<input type="button" id="productInsertBtn" value="글쓰기" />
					</form>
				</div>
			</div>
		</body>
</html>