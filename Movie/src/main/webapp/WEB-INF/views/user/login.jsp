<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/css/style.css">
  <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="/js/script.js" defer="defer"></script>
  <script src="https://kit.fontawesome.com/8041d3c83b.js" crossorigin="anonymous"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
  <style>
body{
    background-color:#181818;
}
.logo{
  width:100%;height:7vh;
  margin-top:10vh;
  margin-left:0%;
  color: #4169E1; font-size:3em;
  text-align: center;font-weight:bold;
}
#LogMain{
    width:25vw;height:70vh;
    background-color:#181818;
    /* border:2px solid#c8c8c8; */
    border-radius: 10px;
    position:absolute;
    margin-top:20vh; 
    margin-left:37vw;
}
.LogTitle{
    width:100%;height:7vh;
    text-align:center;
    font-size:2em; opacity:0.8;
    padding-top:2vh;
    padding-bottom:2vh;
    cursor:pointer;
    color:white;
}
.loginMenu{
  width:22vw;
  margin-left:1vw;
}
.logbox{
  width:21vw;height:6vh;
  border:none;font-size:15px;
  padding-left:1vw;
  background-color:rgb(68, 68, 68);
  opacity:0.8;
}
.form-input{
  width:21vw;height:6vh;
  border:none;font-size:15px;
  padding-left:1vw;
  opacity:0.8;
  background-color:rgb(68, 68, 68);
}
.logch{
  width:7vw; height:3vh;margin-left:0.7vw;
  line-height:3vh; text-align:left;
  font-size:15px; color:#888;
  margin-bottom:2vh;
  margin-top:1vh;
}
.logcheck{
  width:1.5vw;height:1.5vh;
  border:1px solid #4169E1;
  border-radius:50px;
}
.subbox{
  width:22vw;height:5vh;
  background-color:#4169E1;
  border:none; margin-left:1vw;
  font-size:1.5em; color:white;
  font-weight:bold;cursor:pointer;
}
.foundlist{
  width:21vw;height:4vh;
  margin-top:2.5vh;
}
.foundlist li{
  width:6vw;height:auto;
  padding:2%;float:left;
  text-align:center;
  opacity:0.5;
}
.foundlist li:hover{
  opacity:1;
  transition:0.5s;
}
.input {
  position: relative;
  
}

.eyes {
  position: absolute;
  line-height:6vh;
  top: 0;bottom: 0;right:0;
  font-size: 22px; opacity:0.5;
  margin-right:1vw;
  cursor: pointer;
}
</style>
      <title>Movie</title>
  </head>
  <body>
    <div class="logo"><a href="/">Movie</a></div>
  <div id="bob">
    <div id="LogMain">
      <div class="LogTitle">로그인</div>
      <form action="/User/Login" method="POST">
      <ul class="loginMenu">
        <li><input type="text" name="u_id" placeholder="아이디" class="logbox"></li>
        <li><div class="input password"><input type="password" name="u_pw" id="password" placeholder="비밀번호" class="form-input">
          <div class="eyes"><i class="fa-solid fa-eye"></i></div></div></li>
      </ul>
      <div class="logch"><input type="checkbox" name="useCookie"  class="logcheck">로그인 저장</div>
      <div><input type="submit" id="loginBtn" class="subbox" value="로그인"></div>
      </form>
      <ul class="foundlist">
      <li><a href="/User/FindIdPage">아이디 찾기</a></li> 
      <li><a href="/User/FindPwPage">비밀번호 찾기</a></li> 
      <li><a href="join.html">회원가입</a></li>
      </ul>
    </div>
  </div>
    <!-- <footer>
      1
    </footer> -->
  </body>
  <script>
  $(function(){
  // 눈표시 클릭 시 패스워드 보이기
  $('.eyes').on('click',function(){
    $('.input.password').toggleClass('active');

    if( $('.input.password').hasClass('active') == true ){
    	$(this).find('.fa-eye').attr('class',"fas fa-eye-slash").parents('.input').find('#password').attr('type',"text");
    				// i 클래스                // 텍스트 보이기 i 클래스
    }
    else{
    	$(this).find('.fa-eye-slash').attr('class',"fas fa-eye").parents('.input').find('#password').attr('type','password');
    }
  });
});
  document.getElementById("loginBtn").addEventListener("click", function(event) {
		var u_id  =  document.getElementById("u_id").value;
		var u_pw  =  document.getElementById("u_pw").value;
		
		if(u_id.trim() == "" || u_pw.trim() == "") {
			alert("아이디와 비밀번호를 정확히 입력해주세요.");
			event.preventDefault();
		}
		
	});

	var urlParams  =  new URLSearchParams(window.location.search);
	var loginFail  =  urlParams.get('loginFail');

	if (loginFail) {
		alert(decodeURIComponent(loginFail));
	}
</script>
</html>

