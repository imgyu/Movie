<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${loginVo eq null and Cookie ne null}">
<c:forEach var="cookieVo" items="${cookieVo }">
<a href="/Cs/CsPage?chr_no=1&u_no=${cookieVo.u_no }">계정 문의</a>
<a href="/Cs/CsPage?chr_no=2&u_no=${cookieVo.u_no }">영화 문의</a>
<a href="/Cs/CsPage?chr_no=3&u_no=${cookieVo.u_no }">기타 문의</a>
</c:forEach>
</c:if>

<c:if test="${loginVo ne null and Cookie eq	 null}">
<a href="/Cs/CsPage?chr_no=1&u_no=${loginVo.u_no }">계정 문의</a>
<a href="/Cs/CsPage?chr_no=2&u_no=${loginVo.u_no }">영화 문의</a>
<a href="/Cs/CsPage?chr_no=3&u_no=${loginVo.u_no }">기타 문의</a>
</c:if>
</body>
</html>