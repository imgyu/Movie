<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr" dir="ltr">
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="/css/style.css">
  <script src="/js/script.js" defer="defer"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
  <title>Movie</title>
</head>
<style>
  .ship{
  width:35%;min-height:110vh;
  height:auto;
  background-color: #282828;
  margin-top:2%;
}
.shipTitle{
  width:100%; padding-top:10%;
  text-align:center;
  font-size:20px; color:#c8c8c8;
}
.shipT2{
  opacity:0.8;
}
.ship2{
  width:100%; padding:5%;
}
.ship li{
  padding:1%;
  color:#c8c8c8;
  opacity:0.8;
}
.ship3{
  background-color:#181818;
  border:1px solid #181818;
  font-size:20px;color:#686868;
  width:70%; height:2vh;
  padding:3%;
}
/* .Shipbtn{
  width:100vw; height:4vh;
  background-color:blue;
  border:1px solid #585858;
  font-size:17px;
  margin-left:1%;
  color:#c8c8c8;
} */
.password-message {
  color: red;
  font-size:17px;
}
.join{
  width:90%;height:5vh;
  border:1px solid#383838;
  background-color:#383838;
  font-size:20px;color:#c7c7c7;
  padding:1%;text-align:center;
  margin-bottom:2vh;
}
</style>
<body>
<%@include file="/WEB-INF/views/header/header.jsp" %>
    <div id="wrap">
      <div class="ship">
      <div class="shipTitle">
        <div class="shipT1"><h1>회원가입</h1></div>
        <div class="shipT2"><br><br>회원가입 후 많은 영화를 추천 받아보세요.</div>
      </div>
      <form action="/User/Join" method="post" onsubmit="validateForm();">
      <ul class="ship2">
        <!-- 아이디 -->
        <li><input type="text" name="u_id" placeholder="아이디" class="ship3" id="u_id" required>
        <button type="button" onclick="checkId();" class="Shipbtn">중복 확인</button></li>
        <li>영문 소문자 또는 영문 소문자, 숫자 조합 6~12 자리</li>
        <!-- 비밀번호 -->
        <li><br><input type="password" name="u_pw" placeholder="비밀번호" id="password1" class="ship3" required ></li>
        <li><span id=pwdcheck_1></span></li>
        <!-- 비밀번호 확인 -->
        <li><input type="password" name="u_pw2" placeholder="비밀번호확인" id="password2" class="ship3" required></li>
        <li><span id=pwdcheck_2></span></li>
        <li id="password-message2" class="password-message">영문 소문자 또는 영문 대문자, 숫자 조합 8~16 자리</li>
        <!-- 이메일 -->
        <li><br><input type="text" name="u_email" placeholder="1234@example.com" class="ship3" id="u_email" required>
        <button type="button" onclick="checkEmail();" class="Shipbtn" id="sendEmail">인증 번호</button></li>
        <!-- 이메일 입력 -->
        <li id="number1" style="display : none;"><br><input type="text" name="number" id="number" placeholder="인증번호 입력" class="ship3">
        <button type="button" name="comfirmBtn" id="confirmBtn" onclick="confirmNumber();">이메일 인증</button></li>
        <br><li><input type="text" id="confirm" name="confirm" style="display : none;" value=""></li>
        <!-- 생일 -->
        <li><input type="date" name="u_bday"  class="ship3" required></li>
        <!-- 닉네임 -->
        <li><input type="text" name="u_nickname" id="u_nickname" placeholder="닉네임" class="ship3" onBlur="nickname();" required></li>
        <li><span id=nick></span></li>
        <!-- 이름 -->
        <li><input type="text" name="u_name" placeholder="이름" class="ship3" required></li>
        <!-- 회원정보 DB 전송 -->
        <li style="margin-top:5%;"><input type="submit" value="가입하기" class="join"></li>
        
      </ul>
      </form>
    </div>
    </div>
  </body>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script>
  $("#password1")
  .blur(
	   function() {
		let pwdCheck  =  /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		
		if($("#password1").val() == "") {
			$("#pwdcheck_1").text("비밀번호를 입력하세요.");
			u_pwd1 = false;
		} else if (!pwdCheck.test($("#password1").val())) {
			$("#pwdcheck_1").css("color", "red");
			$("#pwdcheck_1").text("영문 소문자 또는 영문 대문자, 숫자 조합 8~16 자리 사용하여주세요.");
			$("#password1").val("");
			u_pwd1 = false;
		} else {
			$("#pwdcheck_1").text("안전한 비밀번호입니다.");
			$("#pwdcheck_1").css("color", "green");
			u_pwd1 = true;
		}
		
	  }); // password1 완료 
  
  
  $("#password2").blur(
	function() {
		if($("#password2").val() == "") {
			$("#pwdcheck_2").css("color", "red");
			$("#pwdcheck_2").text("필수정보입니다.");
			u_pwd2  =  false;
		} else if (u_pwd1 == true && $("#password1").val() == $("#password2").val()) {
			$("#pwdcheck_2").css("color", "green");
			$("#pwdcheck_2").text("비밀번호 일치");
			u_pwd2  =  true;
		} else {
			$("#pwdcheck_2").text("비밀번호를 다시 확인해주세요.");
			$("#pwdcheck_2").css("color", "red");
			$("#password2").val("");
			u_pwd2  =  false;
		}
	}); //비밀번호 체크 완료
  
 function checkId(event) {
	 var u_id  =  $("#u_id").val();
	 if (u_id == "") {
		 alert("아이디를 입력해주세요.");
		 event.preventDefault();
	 }
	 
	 $.ajax({
		 url : "/User/IdCheck",
		 type : "GET",
		 data : { u_id : u_id },
		    success : function(result) {
		    	if(result == 0) {
		    		alert("중복되지 않은 아이디입니다.");
		    		idYes  =  true;
		    	} else {
		    		alert("아이디를 다시 입력해주세요.");
		    		idYes  =  false;
		    		$("#u_id").val("");
		    	}
		    	$("#u_id").prop("readonly", idYes);
		    },
		    error : function(){
		    	alert("error");
		    }
	 });
 } // IdCheck 완
 
 function checkEmail() {
	 var u_email  =  $("#u_email").val();
	 
	 $.ajax({
		 url : "/User/EmailCheck",
		 type : "GET",
		 data : { u_email : u_email },
		 success : function (result) {
			 if (result == 0) {
				 sendNumber();
				 idYes  =  true;
			 } else {
				 alert ("중복된 이메일 입니다.");
				 idYes  =  false;
				 $("#u_email").val("");
			 }
			 $("#u_email").prop("readonly", idYes);
		 },
		 error : function() {
			 alert("error");
		 }
	 });	 
 }
 
 function sendNumber() {
	 $("#number1").show();
	 $.ajax({
		 url : "/User/Mail",
		 type : "POST",
		 dataType : "JSON",
		 data : { "u_email" : $("#u_email").val()},
		 success : function(data) {
			 alert("인증번호 발송");
			 $("#confirm").attr("value", data);
		 }
	 });
 }
 	
 function confirmNumber() {
	 var number1 = $("#number").val();
	 var number2 = $("#confirm").val();
	 
	 if(!number1) {
		 alert("인증번호를 입력하세요.");
	 } else if (number1 == number2) {
		 alert("인증되었습니다.");
	 } else {
		 alert("번호가 일치하지 않습니다.");
	 }	 
 }
 
 function nickname() {
	 var u_nickname  =  $("#u_nickname").val();
	 
	 var check  =  /^[가-힣a-zA-Z0-9]*[가-힣]+[가-힣a-zA-Z0-9]*|[a-zA-Z0-9]*[a-zA-Z]+[가-힣a-zA-Z0-9]*|[a-zA-Z0-9]*[0-9]+[가-힣a-zA-Z0-9]*$/;
	 if (!check.test(u_nickname)) {
		 $("#nick").text("1자 이상 10자 이하로 입력해 주세요");
		 return;
	 }
	 
	 $.ajax({
		 url : "/User/NickCheck",
		 type : "GET",
		 data : { u_nickname : u_nickname},
		 success : function (result) {
			 if (result == 0) {
				 $("#nick").text("중복되지 않은 닉네임입니다.")
				 $("#nick").css("color", "green");
			 } else {
				 $("#nick").text("닉네임을 다시 입력해주세요.");
				 $("#nick").css("color", "red");
				 $('#u_nickname').val("");
			 }
		 },
		 error : function () {
			 alert("error");
		 }
	 });	 
 }
 
 $("#u_nickname").blur(nickname);
 	
 var isIdChecked = false;

 function validateForm() {
     var requiredFields = document.querySelectorAll('input[required]');
     for (var i = 0; i < requiredFields.length; i++) {
         if (requiredFields[i].value.trim() === '') {
             alert("필수 입력란을 작성하세요.");
             return false;
         }
     }

     if (!$('#u_id').prop('readonly')) {
         alert('아이디 중복 체크를 먼저 진행하세요');
         return false;
     }

     // 이메일 인증 버튼 미클릭 시 알림
     if ($('#number1').css('display') === 'none') {
     alert('이메일 인증을 먼저 진행해주세요.');
     return false;
 }

     return true;
 }
 
 $('form').submit(function (event) {
     event.preventDefault(); // 기본 동작 중단

     if (!validateForm()) {
         return;
     }

     // AJAX로 서버에 폼 데이터 전송
     $.ajax({
         url: '/User/Join',
         type: 'POST',
         data: new FormData(this),
         contentType: false,
         processData: false,
         success: function (response) {
             // 가입 성공 시
             alert('회원가입이 완료되었습니다.');
             // 다른 동작 수행 (예: 페이지 이동 등)
             window.location.href = '/';
         },
         error: function (xhr, status, error) {
             // 가입 실패 시
             alert('회원가입에 실패했습니다. 다시 시도해주세요.');
             console.error(xhr, status, error);
         }
     });
 });
  
 
</script>
</html>