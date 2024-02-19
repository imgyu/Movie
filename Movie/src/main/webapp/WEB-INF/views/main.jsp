<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr" dir="ltr">
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="/css/style.css">
  <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="/js/script.js" defer="defer"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
  <title>Movie</title>
 <style>
 body{
   background-image: linear-gradient(to top, #434343 0%, #181818 30%);
   }
 </style>
</head>
<body>
<%@include file="/WEB-INF/views/header/header.jsp" %>
    <div id="slide">
      <div class="slideimg">
        <div class="image-wrapper">
          <img src="/img/1.jpg" class="active">
          <img src="/img/2.jpg" >
          <img src="/img/3.jpg">
          <img src="/img/4.jpg">
          <img src="/img/5.jpg">
          <img src="/img/6.jpg">
          <img src="/img/7.jpg">
          <img src="/img/8.jpg">
          <img src="/img/9.jpg">
          <img src="/img/10.jpg">
        </div>
         <div class="content-wrapper">
        <div class="Slidefont">
        <h1 class="active">다시 돌아올 두 번의 기회는 없다고<br>생각하고 삶을 살아야 해<br><br>-영화&nbsp'어바웃타임'&nbsp중</h1>
        <h1 class="active">싸늘하다. 가슴에 비수가 날아와 꽂힌다.<br>
          하지만 걱정하지 마라 손은 눈보다 빠르니까.<br><br>-영화&nbsp'타짜'&nbsp중</h1>
        <h1 class="active">두려움은 당신을 감옥에 가두지만<br>희망은 당신을 자유롭게 만든다.<br><br>-영화&nbsp'쇼생크탈출'&nbsp중</h1>
        <h1 class="active">너는 계획이 다있구나<br><br>-영화&nbsp'기생충'&nbsp중</h1>
        <h1 class="active">"3000"만큼 사랑해<br><br>-영화&nbsp'어벤져스 : 엔드게임'&nbsp중</h1>
        <h1 class="active">지금까지 이런 맛은 없었다.<br>이것은 갈비인가 통닭인가.<br><br>-영화&nbsp'극한직업'&nbsp중</h1>
        <h1 class="active">정직한 사람은 두려운 것이 없는 법이지.<br>
          그래서 난 최선을 다해 두려워하지 않으려고 해.<br><br>-영화&nbsp'캐치미 이프 유캔'&nbsp중</h1>
        <h1 class="active">인간이라는 병,<br>이것에는 마취제가 항상 필요한 법이야<br><br>-영화&nbsp'보헤미안 랩소디'&nbsp중</h1>
        <h1 class="active">호의가 계속되면<br>그게 권리인 줄 알아<br><br>-영화&nbsp'부당거래'&nbsp중</h1>
        <h1 class="active">우리가 진정 무엇인지 보여주는 것은<br>우리의 능력이 아니라 우리가 만드는 선택이다<br><br>-영화&nbsp'해리포터 시리즈'&nbsp중</h1>
        </div>
      </div>
      </div>
    </div>
    
    <div id="imgsilde">
      <div class="Slides" id="slides">
        <div class="slideTi">TV영화</div>
        <div id="prevBtn">&#8249;</div>
        <ul class="SlideMenu1">
        <c:forEach var="poster" items="${poster }">
          <li><img src="https://image.tmdb.org/t/p/original${poster.m_img }" alt="1"></li>
          </c:forEach>
        </ul>
        <div id="nextBtn">&#8250;</div>
      </div>
    </div>
    
    <footer id="end">
      4
    </footer>
  </body>
</html>
