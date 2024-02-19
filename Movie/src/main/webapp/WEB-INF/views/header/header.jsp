<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/style.css">
<title>Insert title here</title>
</head>
<body>
  <header>
    <nav>
      <div class="logo"><a href="/"><img src="/img/logo1.png"></a></div>
        <ul class="menu">
          <li><a href="main.html">홈</a></li>
          <li><a href="main.html">장르</a></li>
          <li><a href="/Board/ListPage?bt_no=1">게시판</a></li>
          <li><a href="/AiPage">찜한 리스트</a></li>
        </ul>
        <c:if test="${loginVo eq null and Cookie eq null }">
          <ul class="optionList">
            <li><a href="/User/JoinPage">회원가입</a></li>
            <li><a href="/User/LoginPage">로그인</a></li>
            <li style="width:8%;height:30px;"><a href="#"><img src="/img/ar.png"></a></li>
            <li style="width:8%;height:30px;"><a href="#"><img src="/img/se.png"></a></li>
          </ul>
        </c:if>
        
        <c:if test="${loginVo ne null and Cookie eq null}">      
        <ul class="optionList">
        	<li><a href="/User/LogOut" onclick="alert('로그아웃 되었습니다.')">로그아웃</a></li>
        	<li><b>${loginVo.u_nickname }</b></li>
            <li style="width:8%;height:30px;"><a href="#"><img src="/img/${loginVo.u_profileimg }"></a></li>
            <li style="width:8%;height:30px;"><a href="#"><img src="/img/ar.png"></a></li>
            <li style="width:8%;height:30px;"><a href="#"><img src="/img/se.png"></a></li>
          </ul>
         </c:if>
         
        <c:if test="${loginVo eq null and Cookie ne null}">
        <c:forEach var="cookieVo" items="${cookieVo }">
        <ul class="optionList">
        	<li><a href="/User/LogOut" onclick="alert('로그아웃 되었습니다.')">로그아웃</a></li>
        	<li><b>${cookieVo.u_nickname }</b></li>
            <li style="width:8%;height:30px;"><a href="#"><img src="/img/${cookieVo.u_profileimg }"></a></li>
            <li style="width:8%;height:30px;"><a href="#"><img src="/img/ar.png"></a></li>
            <li style="width:8%;height:30px;"><a href="#"><img src="/img/se.png"></a></li>
          </ul>
          </c:forEach>
         </c:if>
         
          <c:if test="${loginVo ne null and Cookie ne null}">      
        <ul class="optionList">
        	<li><a href="/User/LogOut" onclick="alert('로그아웃 되었습니다.')">로그아웃</a></li>
        	<li><b>${loginVo.u_nickname }</b></li>
            <li style="width:8%;height:30px;"><a href="#"><img src="/img/${loginVo.u_profileimg }"></a></li>
            <li style="width:8%;height:30px;"><a href="#"><img src="/img/ar.png"></a></li>
            <li style="width:8%;height:30px;"><a href="#"><img src="/img/se.png"></a></li>
          </ul>
         </c:if>
         
      </nav>
    </header>
</body>
</html>