$(function() {
	// 로그아웃 클릭시
	$("#logout").click(function() {
		// 로그아웃 여부확인
		var message = confirm("정말로 로그아웃 하시겠습니까?");
		if (message == true) {
			alert("로그아웃되었습니다.");
			location.href = "/login/logout.do";

		} else {
			return false;
		}
	});
	// 마이페이지 클릭시
	/*
	 * $("#myPage").click(function() { location.href="/client/member/myPage.do";
	 * });
	 */
});
