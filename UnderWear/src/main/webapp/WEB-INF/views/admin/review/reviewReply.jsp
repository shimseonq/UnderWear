<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/board.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/reply.css" />

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
var replyNum, message = "작성 시 입력한 비밀번호를 입력해 주세요.", btnKind = "";		//전역변수
var butChk = 0;		// 수정버튼과 삭제버튼을 구별하기 위한 변수(전역변수)

$(function() {
	/* 기본덧글 목록 불러오기 */
	var rv_no = "${detail.rv_no}";			
	listAll(rv_no)
	 
			/* 덧글 내용 저장 이벤트 */
		$("#replyInsert").click(function() {
			
			// 작성자 이름에 대한 입력 여부 검사 
			if (!chkData("#rrp_id", "작성자를"))
				return;
			else if (!chkData("#rrp_content", "내용을"))
				return; /* chkData, chkSubmit 차이점 중요  */
			else {
				var insertUrl = "/reviewReply/replyInsert.do";
				/* 글 저장을 위한 Post 방식의 Ajax 연동 처리 */
				$.ajax({
					url : insertUrl, //전송url
					type : "post", //전송 시 method 방식
					headers : { //문서 타입 자체가 json 이라 Content-Type을 json으로 지정해야함 Content-Type지정할려면 headers 가 필요.
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					data : JSON.stringify({
						rv_no : rv_no,
						rrp_id : $("#rrp_id").val(),
						rrp_content : $("#rrp_content").val()
					}),
					error : function() { //실행시 오류가 발생했을 경우
						alert('시스템 오류 입니다. 관리자에게 문의하세요.');

					},
					success : function(resultData) {
						if (resultData == "SUCCESS") {
							alert("댓글 등록이 완료 되었습니다.");
							dataReset();
							listAll(rv_no);
						}
					}
				})
			}
		})
		
	
	/* "삭제하기" 버튼 클릭 처리  */
	$(document).on("click", ".delete_btn", function() {
	//	$(".reset_btn").click();
		var currLi = $(this).parents("li")		//나를 포함하는 상위 요소중에 li를 찾겟다
		replyNum=currLi.attr("data-num"); 		//댓글번호 꺼내오는부분
		btnKind="delBtn";
		
		if (btnKind == "upBtn") {
			updateForm(li);
		} else if(btnKind = "delBtn"){
			deleteBtn(rv_no);			//num값을 전달
		} 
		btnKind="";
	});
	
	
})
	
	// 댓글 목록 보여주는 함수
	function listAll(rv_no) {
		$("#comment_list").html("");
		var url = "/reviewReply/all/" + rv_no + ".do";
		$.getJSON(url, function(data) {
			console.log(data.length);

			$(data).each(function() {
				var rrp_no = this.rrp_no;
				var rrp_id = this.rrp_id;
				var rrp_content = this.rrp_content;
				var rrp_date = this.rrp_date;
				addNewItem(rrp_no, rrp_id, rrp_content, rrp_date);
			});
		}).fail(function() {
			alert("댓글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.")
		});
	}
	

	
	/* 새로운 글을 화면에 추가하기(보여주기) 위한 함수 */
	function addNewItem(rrp_no, rrp_id, rrp_content, rrp_date) {
		// 새로운 글이 추가될 li태그 객체
		var new_li = $("<li>"); // 태그 동적 생성.
		new_li.attr("data-num", rrp_no);
		new_li.addClass("comment_item"); // 클래스 추가.

		// 작성자 정보가 지정될 <p>태그
		var writer_p = $("<p>");
		writer_p.addClass("writer");

		// 작성자 정보의 이름
		var name_span = $("<span>");
		name_span.addClass("name");
		name_span.html(rrp_id + "님");

		// 작성일시
		var date_span = $("<span>");
		date_span.html(" / " + rrp_date + " ");

		// 수정하기 버튼
		var up_input = $("<input>");
		up_input.attr({
			"type" : "button",
			"value" : "수정하기"
		}); // 속성 추가.
		up_input.addClass("update_form");

		// 삭제하기 버튼
		var del_input = $("<input>");
		del_input.attr({
			"type" : "button",
			"value" : "삭제하기"
		});
		del_input.addClass("delete_btn");

		// 내용
		var content_p = $("<p>");
		content_p.html(rrp_content);

		// 조립하기 (중요). p태그에 만듬.
		writer_p.append(name_span).append(date_span).append(up_input).append(
				del_input); // name에 span, date에 span, up,del에 input 태그
		new_li.append(writer_p).append(content_p);
		$("#comment_list").append(new_li);
	}
	
	// 입력 폼 초기화
	function dataReset() {
		$("#rrp_id").val("");
		$("#rrp_pwd").val("");
		$("#rrp_content").val("");
	}

	
	/* 글 삭제를 위한 Ajax 연동 처리  */
	function deleteBtn(rv_no) {
		if(confirm("선택하신 댓글을 삭제 하시겠습니까??")){
			$.ajax({
				url : "/reviewReply/"+replyNum+".do",
				type : "delete",				//post,get아니여도  메서드방식으로 구분 method : delete 삭제, method : put 수정 
				headers : {
					//"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"	
					
				},
				dataType :"text",
				error : function(){
					alert('시스템 오류입니다. 관리자에게 문의하세요.');
				},
				success : function(result) {
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 완료되었습니다.");
						listAll(rv_no);
					}
				}
			})
		}
	}
</script>
</head>
<body>
<div id="replyContainer">
		<h1></h1>
		<div id="comment_write">
			<form id="comment_form">
				<div id="comment">
					<label for="rrp_id" class="tac">작성자</label> <input type="text"
						id="rrp_id" name="rrp_id" /> <label for="rrp_pwd" class="tac">비밀번호</label>
					<input type="password" id="rrp_pwd" name="rrp_pwd" /> <input
						type="button" id="replyInsert" value="저장하기" />

				</div>
				<div>
					<label for="rrp_content" class="tac">댓글 내용</label>
					<textarea id="rrp_content" name="rrp_content"></textarea>
				</div>
			</form>
		</div>
		<ul id="comment_list">
			<!--  여기에 동적 생성 요소가 들어가게 됨. -->
		</ul>
	</div>
</body>
</html>