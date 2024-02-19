<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/style.css">
  <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="/js/script.js" defer="defer"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
    body{
        min-height:100vh;
    }
    #findemailarea{
        width:35vw;height:50vh;
        margin-top:10vh;
        background-color:rgb(36, 36, 36);
        border-radius:10px;
    }
    .findemailtitle{
        width:35vw;height:10vh;
        text-align:center;
        line-height:10vh;
        opacity:0.8;
        cursor:default;
    }
    .findarea1{
        width:35vw;height:35vh;
        text-align:center;
    }
    .lable1{
        width:100%;height:8vh;
        line-height:7vh;
        font-size:20px;
        cursor:default;
    }
    #findarea3{
        width:15vw;height:5vh;
    }
    #findarea3 li{
        width:50%;font-size:17px;
        text-align:center;
        float:left;
    }
    #findarea3 li:hover{
        opacity:0.5;
        transition:0.2s;
    }
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header/header.jsp" %>
<div id="findemailarea">
    <div class="findemailtitle"><h1>비밀번호 변경</h1></div>
    <div class="findarea1">
    <div class="lable1">새로운 비밀번호를 입력해주세요.</div>
    <form id="changePw">
    <input type="hidden" name="u_id" value="${u_id }" id="u_id">
    <input type="text" id="u_pw" name="u_pw" autocomplete="on" placeholder="비밀번호" class="ship3"><Br><Br>
    <span id=pwdcheck_1></span>
    <input type="text" id="u_pwck" autocomplete="on" placeholder="비밀번호확인" class="ship3"><Br>
    <span id="pwdcheck_2"></span>
    <button type="submit" name="findBtn" id="findBtn" class="Shipbtn1">비밀번호 변경</button>
    </form>
    </div>
    <ul id="findarea3">
        <li><a id="a1" href="main.html">메인 화면</a></li>
        <li><a href="findid.html">아이디 찾기</a></li>
    </ul>
</div>
</body>
<script>
$("#u_pw")
.blur(
		function() {
			let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

			if ($("#u_pw").val() == "") {
				$("#pwdcheck_1").text("비밀번호를 입력하세요.");
				user_pwd1 = false;
			} else if (!pwdCheck.test($("#u_pw").val())) {
				$("#pwdcheck_1").text(
						"문자,숫자,특수문자를 포함한 8글자 이상 사용하여주세요");
				$("#pwdcheck_1").css("color", "red");
				$("#u_pw").val("");
				user_pwd1 = false;
			} else {
				$("#pwdcheck_1").text("안전한 비밀번호 입니다");
				$("#pwdcheck_1").css("color", "green");
				user_pwd1 = true;
			}
}); // pw1 blur end


$("#u_pwck").blur(
		function() {
			if ($("#u_pwck").val() == "") {
				$("#pwdcheck_2").css("color", "red");
				$("#pwdcheck_2").text("필수정보입니다");
				user_pw2 = false;
			} else if (user_pwd1 == true
					&& $("#u_pw").val() == $("#u_pwck").val()) {
				$("#pwdcheck_2").css("color", "blue");
				$("#pwdcheck_2").text("비밀번호 일치");
				user_pw2 = true;
			} else {
				$("#pwdcheck_2").text("다시 확인해주세요");
				$("#pwdcheck_2").css("color", "red");
				$("#u_pwck").val("");
				user_pw2 = false;
			}
		}); // pw2 blur end 
		
$("#changePw").on("submit", function (event) {
			event.preventDefault();
			var u_pw  =  $("#u_pw").val();
			var u_id  =  $("#u_id").val();
			console.log(u_id)
			
			$.ajax({
				url : "/User/ChangePw",
				type : "POST",
				data : {u_pw : u_pw, u_id : u_id},
				success : function () {
					alert("비밀번호 변경이 완료되었습니다.");
					window.location.replace("/User/LoginPage");
				},
				error : function() {
					alert("비밀번호 변경이 실패하였습니다.");
				}
			});
		});
		
</script>
</html>