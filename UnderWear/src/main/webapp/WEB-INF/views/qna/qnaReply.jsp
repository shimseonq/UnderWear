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
	var q_no = "${detail.q_no}";			
	listAll(q_no)
	
			/* 덧글 내용 저장 이벤트 */
		$("#replyInsert").click(function() {
			// 작성자 이름에 대한 입력 여부 검사 
			if (!chkData("#c_id", "작성자를"))
				return;
			else if (!chkData("#c_pwd", "비밀번호"))
				return;
			else if (!chkData("#qrp_content", "내용을"))
				return; /* chkData, chkSubmit 차이점 중요  */
			else {
				var insertUrl = "/qnaReply/replyInsert.do";
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
						q_no : q_no,
						c_id : $("#c_id").val(),
						c_pwd : $("#c_pwd").val(),
						qrp_content : $("#qrp_content").val()
					}),
					error : function() { //실행시 오류가 발생했을 경우
						alert('시스템 오류 입니다. 관리자에게 문의하세요.');

					},
					success : function(resultData) {
						if (resultData == "SUCCESS") {
							alert("댓글 등록이 완료 되었습니다.");
							dataReset();
							listAll(q_no);
						}
					}
				})
			}
		})
		
		/* "수정하기" 버튼 클릭 처리 */
		$(document).on("click", ".update_form", function() {
			$(".reset_btn").click();
			var currLi = $(this).parents("li")
			replyNum=currLi.attr("data-num"); 		//수정대상의 번호 data-num(댓글번호를 담아놓음)
			pwdReset(this);
			pwdView(currLi);					//비밀번호 보여주는부분
			btnKind="upBtn";
			
		});
	
	/* 댓글 수정 위한  "수정완료" 버튼 클릭시 Ajax연동처리 */
	$(document).on("click", ".update_btn", function() {
		var r_num = $(this).parents("li").attr("data-num");
		var r_content = $("#content").val();
		if(!chkData("#content","댓글 내용을"))return;
		
		else{
			$.ajax({
				url:'/qnaReply/'+qrp_no+".do",
				type:"put",
				headers:{"Content-Type":"application/json",
						"X-HTTP-Method-Override":"PUT"	
				},
				data:JSON.stringify({
					qr_content:qr_content
				}),
				dataType:"text",
				error:function(){
					alert('시스템 오류입니다. 관리자에게 문의하세요.');
				},
				success:function(result){
					console.log("result :" + result);
					if(result == "SUCCESS"){
						alert("수정이 완료되었습니다");
						listAll(q_no);
					}
				}
			});
		}
		
	});
	
	/* 수정화면에서 수정취소 버튼(초기화버튼) 클릭 시 처리 이벤트 */
	$(document).on("click",".reset_btn", function(){
		btnKind="";
		
		var conText = $(this).parents("li").find("textarea").html();
		conText = conText.replace(/(\r\n|\r|\n)/g, "<br />");
		$(this).parents("li").find("input[type='button']").show();
		
		var conArea = $(this).parents("li").children().eq(1);
		conArea.html(conText);
	});
	
	/* 비밀번호 체크 화면에서 "취소" 버튼 클릭 시 처리 이벤트 */
	$(document).on("click", ".pwdResetBut", function() {
		$(this).parent().parent().html(""); //현재에 부모(from)의 부모(div)의 html를 지워라("");
		pwdReset(this);
	});
	
	/* 비밀 번호 확인 버튼 클릭 시 처리 이벤트  */
	$(document).on("click",".pwdCheckBut", function(){
		var li = $(this).parents("li");
		var form = $(this).parents("form");
		var pwd = form.find(".passwd");
		var msg = form.find(".msg");
		var result = 0;
		
		if(!formCheck(pwd, msg, "비밀번호를")) return;
		else {
			$.ajax({
				url:"/qnaReply/qnaPwdCheck.do",
				type:"post",
				data:"qrp_no="+replyNum+"&r_pwd="+pwd.val(),
				dataType:"text",
				error:function(){
					alert('시스템 오류입니다 관리자에게 문의하세요');
				},
				success:function(resultData){		//0과 1 반환받음
					console.log("btnKind :" + btnKind);
				
					if(resultData==0){				//일치하지 않는 경우
						msg.addClass("msg_error");		//경고 표시로 색깔 줌a
						msg.text("입력한 비밀번호가 일치하지 않습니다");
						
												
						//pwdConfirm=0;
					}else if(resultData==1){		//일치하는 경우
						console.log("resultData :" + resultData);
						pwdReset(form);
						
						
						if (btnKind == "upBtn") {
							updateForm(li);
						} else if(btnKind = "delBtn"){
							deleteBtn(q_no);			//num값을 전달
						} 
						btnKind="";
					}
				}
			})
		}
		});
})

	function pwdReset(target) {
		$("li .pwdArea").not(this).html("");
		$(target).parents("li").find(".pwdArea").html("");
	}

	// 댓글 목록 보여주는 함수
	function listAll(q_no) {
		$("#comment_list").html("");
		var url = "/qnaReply/all/" + q_no + ".do";
		$.getJSON(url, function(data) {
			console.log(data.length);

			$(data).each(function() {
				var qrp_no = this.qrp_no;
				var c_id = this.c_id;
				var qrp_content = this.qrp_content;
				var qrp_date = this.qrp_date;
				addNewItem(qrp_no, c_id, qrp_content, qrp_date);
			});
		}).fail(function() {
			alert("댓글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.")
		});
	}
	
	/* 수정 폼 화면 구현 함수  */
	function updateForm(currLi) {
		var conArea = currLi.children().eq(1);		//<li>안에 있는 2번째 <p>태그 , 즉 내용부분을 가져온다.
		var conText = conArea.html();				//html()아무것도 없으면 설정하라 ,가 아니라 읽어오라! 라는 뜻 
		console.log("conText :"+ conText);
		
		conText = conText.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
		
		
		currLi.find("input[type='button']").hide()		//버튼을 숨긴다
		conArea.html("");				//내용 부분을 초기화
		
		var update_area = $("<span>");
		update_area.addClass("update_area");
		
		var textarea=$("<textarea>");
		textarea.attr({"name":"content","id":"content"});
		textarea.html(conText);
		
		var update_btn = $("<input>");
		update_btn.attr({"type" : "button", "value" : "수정완료"});
		update_btn.addClass("update_btn");
		
		var reset_btn = $("<input>");
		reset_btn.attr({"type":"button", "value":"수정취소"});
		reset_btn.addClass("reset_btn");
		
		update_area.append(textarea).append(update_btn).append(reset_btn);
		conArea.html(update_area);
			
	}
	
	/* 새로운 글을 화면에 추가하기(보여주기) 위한 함수 */
	function addNewItem(qrp_no, c_id, qrp_content, qrp_date) {
		// 새로운 글이 추가될 li태그 객체
		var new_li = $("<li>"); // 태그 동적 생성.
		new_li.attr("data-num", qrp_no);
		new_li.addClass("comment_item"); // 클래스 추가.

		// 작성자 정보가 지정될 <p>태그
		var writer_p = $("<p>");
		writer_p.addClass("writer");

		// 작성자 정보의 이름
		var name_span = $("<span>");
		name_span.addClass("name");
		name_span.html(c_id + "님");

		// 작성일시
		var date_span = $("<span>");
		date_span.html(" / " + qrp_date + " ");

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
		content_p.html(qrp_content);

		// 조립하기 (중요). p태그에 만듬.
		writer_p.append(name_span).append(date_span).append(up_input).append(
				del_input); // name에 span, date에 span, up,del에 input 태그
		new_li.append(writer_p).append(content_p);
		$("#comment_list").append(new_li);
	}
	
	// 입력 폼 초기화
	function dataReset() {
		$("#r_name").val("");
		$("#r_pwd").val("");
		$("#r_content").val("");
	}

	//비밀번호 체크를 화면 구현 함수
	function pwdView(area) {
		//$(".pwdResetBut").click();
		var pwd_div = $("<div>");
		pwd_div.addClass("pwdArea");

		var pwd_form = $("<form>");
		pwd_form.attr("name", "f_pwd");

		var pwd_label = $("<label>");
		pwd_label.attr("for", "passwd");
		pwd_label.html("비밀번호 : ");

		var pwd_input = $("<input>");
		pwd_input.attr({
			"type" : "password",
			"name" : "passwd"
		});
		pwd_input.addClass("passwd");
		pwd_input.prop("autofocus", "autofocus");

		var pwd_check = $("<input>");
		pwd_check.attr({
			"type" : "button",
			"value" : "확인"
		});
		pwd_check.addClass("pwdCheckBut");

		var pwd_reset = $("<input>");
		pwd_reset.attr({
			"type" : "button",
			"value" : "취소"
		});
		pwd_reset.addClass("pwdResetBut");

		var pwd_span = $("<span>");
		pwd_span.addClass("msg");
		pwd_span.html(message);

		pwd_form.append(pwd_label).append(pwd_input).append(pwd_check).append(
				pwd_reset).append(pwd_span);
		pwd_div.append(pwd_form)
		area.append(pwd_div);
	}
	
	/* 글 삭제를 위한 Ajax 연동 처리  */
	function deleteBtn(q_no) {
		if(confirm("선택하신 댓글을 삭제 하시겠습니까??")){
			$.ajax({
				url : "/qnaReply/"+replyNum+".do",
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
						listAll(q_no);
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
					<label for="c_id" class="tac">작성자</label> <input type="text"
						id="c_id" name="c_id" /> <label for="c_pwd" class="tac">비밀번호</label>
					<input type="password" id="c_pwd" name="c_pwd" /> <input
						type="button" id="replyInsert" value="저장하기" />

				</div>
				<div>
					<label for="qrp_content" class="tac">댓글 내용</label>
					<textarea id="qrp_content" name="qrp_content"></textarea>
				</div>
			</form>
		</div>
		<ul id="comment_list">
			<!--  여기에 동적 생성 요소가 들어가게 됨. -->
		</ul>
	</div>
</body>
</html>