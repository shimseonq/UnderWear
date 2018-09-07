/*var c_id = "${login.c_id}";*/

$(function(){
	login();
}); 

function login(){
	if($("#loginAfter")!=null){
		$("#login").hide();
		$("#joinus").hide();
	}else{
		$("#login").show();
		$("#joinus").show();
	}
}