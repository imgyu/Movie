<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/style.css">
  <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
<title>Movie</title>
<style>
    body{
        min-height:90vh;
    }
    #boardarea{
        width:70vw;min-height:120vh;
        margin-top:5vh;
        /* border:1px solid; */
    }
    .top-search-area{
        width:60vw;height:4vh;
        margin-top:3vh;
    }
    #top-search{
        width:15vw;height:4vh;float:right;
    }
    .top-searchbtn-blue{
        width:3vw;height:4vh;
        background-color:#4169E1;
        opacity:0.7;border:none;
        color:white;float:right;
    }
    .top-searchbtn-blue:hover{
        opacity:1;transition:0.5s;
    }
    .boardtitle{
        width:70vw;height:5vh;
        margin-top:10vh;
    }
    .bdtitle{
        width:50vw;height:5vh;
        margin-left:9vw;
    }
    .bdtitle li{
        width:23%;height:auto;
        font-size:20px;line-height:5vh;
        font-weight:bold;float:left;
        text-align:center;
        padding-left:1%;padding-right:1%;
    }
    .bdtitle li:hover{
        color:#4169E1;
        transition:0.5s;
    }
    .boardList{
        margin-top:2vh;
    }
    /* 공지 게시판 리스트 */
    .noclist{
        width:60vw; height:80vh;text-align:center;
        border-top:1px solid#8c8c8c;
        border-bottom:1px solid#8c8c8c;
        background-color:rgb(36, 36, 36);
    }
    .noclist-th-name{
        border-bottom:1px solid #8c8c8c;
        width:10vw; 
    }
    .noclist-th-date{
        width:7vw;
        border-bottom:1px solid #8c8c8c;
    }
    .noclist-th-title{
        border-bottom:1px solid #8c8c8c;
        width:40vw;
    }
    .noclist tbody tr{
        height:3vh;
    }
    .noclist tbody tr:hover{
        color:#4169E1;
        transition:0.3s;
    }
    /* 리스트 끝 */
    .bottom-search-area{
        width:50vw;height:4vh;
        margin-top:2vh;
    }
    #bottom-search{
        width:47vw;height:4vh;float:right;
    }
    .bottom-searchbtn-blue{
        width:3vw;height:4vh;
        background-color:#4169E1;
        opacity:0.7;border:none;
        color:white;float:right;
    }
    .bottom-searchbtn-blue:hover{
        opacity:1;transition:0.5s;
    }
    /* 페이징 css */
    #page{
        width:60vw;height:6vh;
        margin-top:1vh;
        text-align:center;
        font-size:18px;
    }
    .page-num-log{
        height:6vh;
    }
    .page-num-log li{
        float:left;
        text-align: center;
    }
    .page-num-log a{
        display: block;
        color: #96a0ad;
        padding: 2px 0.5vw;
        margin-left: 3px;
        width: 1vw;
        height:3vh;
        line-height: 30px;
        -moz-border-radius: 100%;
        -webkit-border-radius: 100%;
        border-radius: 100%;
    }
    .page-num-log a:hover{
        background-color:#4169E1;
        color: #ffffff;
    }
    .page-num-log a:active{
        background-color:#4169E1;
        color: #ffffff;
    }
    .firstpage{
        margin-left:12vw;
        margin-right:1.5vw;
    }
    .lastpage{
        margin-left:1.5vw;
    }
    .firstpage:hover,.prev-arrow:hover,
    .lastpage:hover,.next-arrow:hover{
        color: #4169E1;
        font-weight:bold;
    }
    .page-num-log :active{
        cursor: default;
        color: #ffffff;
        outline: none;
    }
    .registration-btn{
        width:2vw;height:4vh;
        background-color:#4169E1;
        font-size:17px;border:none;
        color:white;float:left;
        border-radius:5px;
        opacity:0.7;
    }
    .registration-btn:hover{
        opacity:1;
    }
</style>
</head>
<body>
  <%@include file="/WEB-INF/views/header/header.jsp" %>	
    <div id="boardarea">
        <div class="boardtitle">
            <ul class="bdtitle">
                <li><a href="javascript:void(0)" class="board-link" data-board="1">공지 게시판</a></li>
                <li><a href="javascript:void(0)" class="board-link" data-board="2">추천 게시판</a></li>
                <li><a href="javascript:void(0)" class="board-link" data-board="3">자유 게시판</a></li>
                <li><a href="javascript:void(0)" class="board-link" data-board="4">질문 게시판</a></li>
            </ul>
        </div>
        <div class="top-search-area">
            <button type="submit" class="top-searchbtn-blue" onclick="">검색</button>
            <input id="top-search" type="search" placeholder="검색어를 입력해주세요." name="">
            <button class="registration-btn" onclick="location.href='/Board/RegisterPage'">+</button>
        </div>
        <div class="boardList">
            <table class="noclist">
            <thead>
                <tr>
                <th class="noclist-th-title">제목</th>
                <th class="noclist-th-name">닉네임</th>
                <th class="noclist-th-date">등록일</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="board" items="${board }">
                <tr>
                <th><a href="/Board/Detail?u_no=${board.u_no }&b_no=${board.b_no }">${board.b_title }</a></th>
                <td>${board.u_nickname}</td>
                <td>${board.b_writedate }</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        </div>
        <div class="bottom-search-area">
            <button type="submit" class="bottom-searchbtn-blue" onclick="">검색</button>
            <input id="bottom-search" type="search" placeholder="검색어를 입력해주세요." name="">
        </div>
        <div id="page">
        
        	<c:set var="bt_no" value="${bt_no }" />
        	<c:set var="startPage" value="${pg.startPage}" />
        	<c:set var="endPage" value="${pg.endPage }" />
        	<c:set var="nowPage" value="${pg.nowPage }" />
        	
            <ul class="page-num-log">
            
            <c:if test="${pg.startPage gt 1 }">
             <li class="firstpage"><a href="/Board/ListPage?bt_no=${bt_no }&nowPage=1" >처음 페이지</a></li>
             <li class="lastpage"><a href="/Board/ListPage?bt_no=${bt_no }&nowPage=${pg.startPage - 1}" >마지막 페이지</a></li>
            </c:if>
             
            <c:forEach var="pageNumber" begin="${pg.startPage }" end="${pg.endPage }" step="1">
             <c:choose>
               <c:when test="${pageNumber eq pg.nowPage }">
                 <li class="num"><strong>${pageNumber }</strong></li>
               </c:when>
               <c:otherwise>
                 <a href="/Board/ListPage?bt_no=${bt_no }&nowPage=${pageNumber}" class="num">${pageNumber }</a>
               </c:otherwise>
             </c:choose>
            </c:forEach>
            
            <c:if test="${pg.nowPage ne endPage }">
			 <li class="next-arrow"><a href="/Board/ListPage?bt_no=${bt_no }&nowPage=${pg.nowPage + 1 }" >️➡</a></li>       
			 <li class="prev-arrow"><a href="/Board/ListPage?bt_no${bt_no }&nowPage=${pageNumber }"></a>⬅</li>
            </c:if>
            </ul>
        </div>
    </div>
</body>
<script>

$(document).ready(function() {

    $(".board-link").click(function(event) {
		
    	event.preventDefault();
        var bt_no  =  $(this).data("board");

        $.ajax({
            url : "/Board/List",
            method : "GET",
            data : { bt_no : bt_no },
            success : function(response) {
                var tableBody  =  $(".boardList > table > tbody");
                tableBody.empty();
                console.log("response : ", response.boardList);
                
                
               	    response.boardList.forEach(function(item) {
                	var row  =  $("<tr>");
                	row.append($("<th>").html("<a href='/Board/Detail?u_no=" + item.u_no + "&b_no=" + item.b_no +"'>" + item.b_title + "</a>"));
                	row.append($("<th>").text(item.u_nickname));
                	row.append($("<th>").text(item.b_writedate));
                	tableBody.append(row);
                }); 
               	    
               	var pagingBody  =  $("#page > ul.page-num-log ");
               	var pg  =  response.pg;
               	console.log(pg);
               	pagingBody.empty();
               	if(pg.startPage != 1) {
               	pagingBody.append('<li class="firstpage"><a href="/Board/ListPage?bt_no=' + bt_no + '&nowPage=1">처음 페이지</a></li>');
               	pagingBody.append('<li class="lastpage"><a href="/Board/ListPage?bt_no=' + bt_no + '&nowPage=' + (pg.startPage - 1) + '">마지막 페이지</a></li>');
               	}
             // 페이지 번호 링크 설정
               	for (var pageNumber = pg.startPage; pageNumber <= pg.endPage; pageNumber++) {
               	    if (pageNumber === pg.nowPage) {
               	        pagingBody.append('<li><strong class="num">' + pageNumber + '</strong></li>');
               	    } else {
               	        pagingBody.append('<li><a href="/Board/ListPage?bt_no=' + bt_no + '&nowPage=' + pageNumber + '" class="num">' + pageNumber + '</a></li>');
               	    }
               	}
               	
             // 다음 페이지와 이전 페이지 링크 설정
               	if (pg.nowPage !== pg.endPage) {
               	    pagingBody.append('<li class="next-arrow"><a href="/Board/ListPage?bt_no=' + bt_no + '&nowPage=' + (pg.nowPage + 1) + '">️➡</a></li>');
               	}
               	if (pg.nowPage !== pg.startPage) {
               	    pagingBody.append('<li class="prev-arrow"><a href="/Board/ListPage?bt_no=' + bt_no + '&nowPage=' + (pg.nowPage - 1) + '">⬅</a></li>');
               	}
             
            },
            error : function(error) {
                console.error("Error", error);
            }
        });
    });     
});

</script>
</html>