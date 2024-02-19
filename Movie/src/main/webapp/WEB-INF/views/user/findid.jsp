<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        width:35vw;height:30vh;
        text-align:center;
    }
    .lable1{
        width:100%;height:8vh;
        line-height:7vh;
        font-size:20px;
        cursor:default;
    }
    #findarea2{
        width:15vw;height:5vh;
    }
    #findarea2 li{
        width:50%;font-size:17px;
        text-align:center;
        float:left;
    }
    #findarea2 li:hover{
        opacity:0.5;
        transition:0.2s;
    }
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header/header.jsp" %>
<div id="findemailarea">
    <div class="findemailtitle"><h1>아이디찾기</h1></div>
    <div class="findarea1">
    <div class="lable1">가입하신 이메일을 입력해주세요</div>
    <input type="text" id="u_email" autocomplete="on" placeholder="example@google.com" class="ship3"><Br>
    <button type="button" name="findBtn" id="findBtn" onclick="SendId()" class="Shipbtn1">이메일 인증</button>
    </div>
    <ul id="findarea2">
        <li><a id="a1" href="main.html">메인 화면</a></li>
        <li><a href="findpw.html">비밀번호 찾기</a></li>
    </ul>
</div>
</body>
<script>
    function SendId() {
        var u_email  =  $("#u_email").val();
        $.ajax({
            url : "/User/SendId",
            type : "POST",
            data : {u_email : u_email },
            success : function() {
                alert("이메일이 전송되었습니다.");
            },
            error : function() {
                alert("이메일을 다시 입력해주세요.");
            }
        });
    }
</script>
</html>