<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr" dir="ltr">
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="/css/style.css">
  <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="script.js" defer="defer"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
  <title>Movie</title>
  <style>
    body{
        min-height:100vh;
    }
    #area1{
        margin-top:2vh;
    }
    #chatarea{
        width:99.5vw;height:91vh;
    }
    .chatlog{
        width:55vw;height:80vh;
        background-color:rgb(36, 36, 36);
        border-radius:5px 5px 0px 0px;
        padding-top:2%;
    }
    .chattingarea{
        width:55vw;height:7vh;
    }
    .chat{
        width:50vw;height:5vh;
        border:1px solid#c8c8c8;
        border-radius:20px;
        font-size:15px;
        padding-left:3%;
        margin-top:1vh;
    }
    .Aititle{
        width:45vw;height:4vh;
        line-height:4vh;
        font-weight:bold;
        font-size:16px;
    }
    .Ai{
        width:45vw;min-height:5vh;
        text-align:center;
        border-radius:10px;
        background-color:white;
        line-height:5vh;
        color:black;
    }
    .metitle{
        width:45vw;height:4vh;
        line-height:4vh;
        font-weight:bold;
        font-size:16px;
    }
    .me{
        width:45vw;min-height:5vh;
        text-align:center;
        border-radius:10px;
        background-color:#4169E1;
        line-height:5vh;
    }
    .sendbtn{
        width:3vw;height:5vh;
        position:absolute;
        margin-top:1vh;
        border-radius:10px;
        background-color:#4169E1;
        color:white;
        border:none;
    }
    .sendbtn:hover{
        font-weight:bold;
    }
    .mearea{
        margin-top:2vh;
    }
  </style>
</head>
  <script>	
  var ws;
  

  
  function wsOpen() {
	  ws  =  new WebSocket("ws://" + location.host + "/chat/" + $("#chr_no").val());
	  wsEvt();
  }
  
  $(document).ready(function() {
	  
	  wsOpen();
 	  $("#chattingarea").show();
  });
  
  function wsEvt() {
	  ws.onopen  =  function(data) {
	 console.log('WebSocket connection opened');
		  
	  }
	  
	  ws.onmessage  =  function(data) {
		  var chr_msg  =  data.data;
		  if(chr_msg != null && chr_msg.trim() != '') {
			  var m  =  JSON.parse(chr_msg);
			  if(m.type  ==  "getId") {
				  var si  =  m.sessionId != null ? m.sessionId : "";
				  if(si != '') {
					  $("#sessionId").val(si); 
				  }
			  } else if(m.type == "message") {
				  if(m.sessionId == $("#sessionId").val()) {
					  $("#me123").append("<div class='metitle'>You</div><div class='me' id='message'>" + m.chr_msg + "</div>");
				  } else {
					  $(".aiarea").append("<div class='Aititle'>상담사</div><div class='Ai' id='aiResponse'>" + m.chr_msg + "</div>");
				  }
			  } else {
				  console.warn("unknown type!");
			  }
		  }
	  }	  
	  document.addEventListener("keypress", function(e) {
		  if(e.which  ==  13) {
			  send();
		  }
	  });
  }
  
  function send() {
	   
	  var option = {
			  type : "message",
			  chr_no : $("#chr_no").val(),
	  		  sessionId : $("#sessionId").val(),
	  		  chr_msg : $("#messageInput").val(),
	  		  u_no : '${loginVo.u_no}'
	  }
	  saveMessageToDB(option);
	  
	  ws.send(JSON.stringify(option))
	  $("#messageInput").val("");
  }

  
  function saveMessageToDB(option) {
	  $.ajax({
		  url : "/Cs/SaveMessage",
		  method : "POST",
		  data : JSON.stringify(option),
		  contentType : "application/json",
		  success : function(response) {
			  console.log("success");
		  },
		  error : function(error) {
			  console.error("error", error);
		  }
	  });
  }
  
  </script>
<body>
<%@include file="/WEB-INF/views/header/header.jsp" %>
<input type="hidden" id="chr_no" value="${chr_no }">
  
            <input type="hidden" id="sessionId" value="${loginVo.u_no }">
            
    <div id="area1">
        <div id="chatarea">
          
            <div class="chatlog">
            <c:forEach var="msg" items="${msgList}">
            
             <c:choose>
             <c:when test="${msg.u_no ne loginVo.u_no}">
            <div class="aiarea">
                <div class="Aititle">상담사</div>
                <div class="Ai" id="aiResponse">${msg.chr_msg } </div>
            </div>
            <div class="mearea" id="me123">
            </div>
            </c:when>
            <c:otherwise>
            <div class="mearea" id="me123">
                <div class="metitle">You</div>
                <div class="me" id="message">${msg.chr_msg }</div>
            </div>
            </c:otherwise>
            </c:choose>
            
            
            
            
            </c:forEach>
            </div>
            
            <div class="chattingarea">
                
                    <input type="text" id="messageInput" name="" placeholder="원하시는 질문을 적어주세요." class="chat">
                    <button id="sendBtn" class="sendbtn" type="button" onclick="send()">send</button>
                
            </div>
        </div>
    </div>
   <script>
		   
   
   </script>
</body>