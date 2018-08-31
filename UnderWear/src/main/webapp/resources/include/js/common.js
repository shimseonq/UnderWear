/* 함수명 : chkData(유효성 체크 대상, 메시지 내용)
 * 예시 : if(!chkData("#keyword", 검색어를")) return;
 * */
function chkData(item, msg) {
	if($(item).val().replace(/\s/g, "") == "") {	// 객체에 대한 표현.
		alert(msg + " 입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}

/*formCheck(유효성 체크 대상, 출력 영역, 메시지 내용)*/
function formCheck(main, item, msg) {
	if(main.val().replace(/\s/g, "") == "") {
		item.html(msg + " 입력해 주세요.");
		main.val("");
		return false;
	} else {
		return true;
	}
}

/* 함수명 : chkSubmit(유효성체크대상, 메시지 내용)
 * 출력 영역 : alert로.
 * 예시 : if(!chkSumbit($("#keyword"), "검색어를")) return;*/
function chkSubmit(item, msg) {
	if (item.val().replace(/\s/g, "") == "") {
		alert(msg + " 입력해 주세요.");
		item.val("");
		item.focus();
		return false;
	} else {
		return true;
	}
}

/* 함수명 : chkFile(파일명)
 * 설명 : 이미지 파일 여부를 확인하기 위해 확장자 확인 함수.
 * */
function chkFile(item) {
	/* 배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우 -1 반환)
	 * jQuery.inArray(찾을 값, 검색 대상의 배열)
	 */
	var ext = item.val().split('.').pop().toLowerCase();		// 배열중의 마지막 원소. 대소문자 둘다 올 수 있으니 소문자로 변환.
	if (jQuery.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {	// 입력된 값이 맞지 않을 시(-1) false를 반환.
		alert("gif, png, jpg, jpeg 파일만 업로드 할수 있습니다.");
		return false;
	} else {
		return true;
	}
}

/* 함수명: checkForm(유효성 체크 대상, 메시지 내용)
 * 출력영역 : placeholder 속성을 이용.
 * 예시 : if(!chksubmit($('#keyword), "검색어를")) return;
 */
function checkForm(item, msg) {
	var message = "";
	if(item.val().replace(/\s/g, "") == ""){
		message = msg + "입력해 주세요.";
		item.attr("placeholder",message);
		return false;
	}else{
		return true;
	}
}

/* 함수명 : getDate Format(날짜 데이터
 * 설명 : dataValue의 값을 년-월-일 형식(예시 : 2018-01-01)으로 반환
 */ 
function getDateFormat(dateValue) {
	var year = dateValue.getFullYear();
	
	var month = dateValue.getMonth()+1;
	month = (month<10) ? "0"+month : month;
	
	var day = dateValue.getDate();
	day = (day<10) ? "0" + day : day;
	
	var result = year+"-"+month+"-"+day;
	return result;
	
}

/* 배열 : 유효성 체크시 필요한 정규식으로 배열을 초기화.
 * pattern = [아이디 , 비밀번호 , 핸드폰번호]
 * 함수명 : inputVerify(배열 인덱스번호, 비교할 값, 출력영역) 
 */
var pattern = [
	"((?=.*[a-zA-Z])(?=.*[0-9]).{6,10})",
	"((?=.*[a-zA-Z])(?=.*[0-9@#$%]).{8,12})",
	"^\\d{3}-\\d{3,4}-\\d{4}"
	];

function inputVerify(index, data, printarea) {
	var data_regExp = new RegExp(pattern[index]);
	var match = data_regExp.exec($(data).val());
	if(match==null){
		$(printarea).html("입력값이 형식에 맞지 않습니다. 다시 입력해 주세요.");
		$(data).val("");
		return false;
	}else{
		return true;
	}
}

 
