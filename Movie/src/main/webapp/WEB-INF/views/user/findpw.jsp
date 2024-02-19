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
    <div class="findemailtitle"><h1>비밀번호 찾기</h1></div>
    <div class="findarea1">
    <div class="lable1">가입하신 아이디와 이메일을 입력해주세요</div>
    <input type="text" id="u_id" autocomplete="on" placeholder="ID" class="ship3"><br><Br>
    <input type="text" id="u_email" autocomplete="on" placeholder="example@google.com" class="ship3"><Br>
    <input type="text" id="number" name="number" placeholder="인증번호 입력" class="ship3" style="display: none;"><br>
    <input type="text" id="Confirm" name="Comfirm" style="display: none;" value="" class="ship3">
    <button type="button" name="findBtn" id="findBtn"  class="Shipbtn1">이메일 인증</button> <button type="button" name="confirm" id="confirm"  class="Shipbtn1" onclick="confirmNumber()" style="display: none;">인증번호 인증</button>
    </div>
    <ul id="findarea3">
        <li><a id="a1" href="main.html">메인 화면</a></li>
        <li><a href="findid.html">아이디 찾기</a></li>
    </ul>
</div>
</body>
<script>
var prevId  =  "";


$("#u_id").on("focusout", function() {
	var u_id  =  $("#u_id").val();
	
	if(u_id !== prevId) {
	$.ajax({
		url : "/User/FindId",
		type : "POST", 
		data : {u_id : u_id},
		success : function() {
			alert("아이디가 확인되었습니다.");
		},
		error : function() {
			alert("아이디가 확인되지않습니다.");
		}
	});
		prevId  =  u_id;
	}
});


$("#findBtn").on("click", function () {
    var u_email = $("#u_email").val();
    var u_id = $("#u_id").val();

    $.ajax({
        url: "/User/SendEmail",
        type: "GET",
        data: { u_id: u_id, u_email: u_email },
        success: function (data) {
            $("#number").show();
            alert("인증번호가 전송되었습니다.");
            $("#Confirm").attr("value", data);
			
            $("#findBtn").hide();
            $("#confirm").show();
            
          
        },
        error: function () {
            alert("인증번호를 다시 입력해주세요.");
        }
    });
});
	
	function confirmNumber() {
		var number1  =  $("#number").val();
		var number2  =  $('#Confirm').val();
		var u_id     =  $("#u_id").val();
		if(!number1) {
			alert("인증번호를 입력하세요.");
		} else if(number1 == number2) {
			alert("인증되었습니다.");
			location.href = "/User/ChangePage?u_id=" + u_id;
		}  else {
			alert("인증번호가 일치하지 않습니다.");
		}
	}
	
    
</script>
</html>