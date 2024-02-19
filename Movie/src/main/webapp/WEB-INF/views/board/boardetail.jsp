<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/style.css">
  <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="script.js" defer="defer"></script>
    <script src="https://kit.fontawesome.com/8041d3c83b.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
<title>Movie</title>
<style>
     body{
        color:black;
    }
    #boarddetail{
        width:100%; min-height:200vh;
        margin-top:5vh;
       	color:black;
    }
    #detaillist{
        width:70%;min-height:200vh;
        height:auto;
        background-color:white;
        border-radius:10px;
    }
    .detailList-title{
        width:90%;height:23vh;
        border-bottom:1px solid#c8c8c8;
    }
    .detailList-title li{
        width:100%;height:7vh;
    }
    .detailList-title li:first-child{
        color:#4169E1;
        line-height:14vh;
    }
    .detailList-title li img{
        width:3vw;height:8vh;
    }
    .board-select{
        width:20vw;height:4.5vh;
        color:black;
        margin-top:2vh;
        padding-left:5px;
        border:1px solid#a7a7a7;
    }
    select option[value=""][disabled] {
	    display: none;
    }
    .detailList-img{
        width:5%;height:100%;
        border-radius:100px;
        margin-top:1px;
        margin-left:5px;
        float:left; overflow:hidden;
    }
    .detailList-img img{
        width:auto;height:100%;
    }
    .detailList-detail{
        width:90%;height:auto;
        min-height:200vh;
        margin-top:2vh;
        padding:1%;
        border:1px solid#c8c8c8;
        border-top:none;
        border-bottom:none;
    } 
    .detailList-detail-img{
        width:40vw;max-height:40vh;
        height:auto;margin-bottom:2vh;
    }
    .detailList-detail-img img{
        width:100%;height:auto;
    }
    #comment{
        width:70%; min-height:40vh;
        background-color:white;
        margin-top:1vh;
        border-radius:10px;
    }
    .commentbar{
        width:90%; height:5vh;
        border-bottom:1px solid #8c8c8c;
        font-size:20px;color:black;
        line-height:7vh;font-weight:bold;
        padding-left:1vw;
    }
    .commentlist{
        width:90%; height:20vh;
        margin-top:2vh;
        border-bottom:1px solid#8c8c8c;
    }
    .commentlist-title{
        width:100%; height:6vh;
        border-bottom:1px solid #c8c8c8;
        color:black;
    }
    .commentitle-img{
        width:3vw;height:6vh;
        border-radius:40px;
        float:left; overflow:hidden;
    }
    .commentitle-img img{
        width:100%;height:auto;
    }
    .commentitle-name{
        min-width:5vw;height:3vh;
        margin-top:3vh;margin-left:10px;
        float:left;
    }
    .comentlist-detail{
        width:100%;height:14vh;
        padding:1%;
        color:black;
    }
    .commenttext-area{
        width:80%;height:10vh;
        color:black;margin-top:2vh;
        border:2px solid#c8c8c8;
        border-radius:10px;padding:1%;
    }
    .commenttextname{
        width:100%;height:3vh;
        margin-left:1%;
    }
    .commenttext{
        width:80%;height:7vh;
        margin-left:1%;
        border:none;
        padding-left:5px;
        line-height:6vh;
        float:left;
        outline:none;
    }
    .commenttext:focus{
        opacity:0.5;
    }
    .commenttext-btn{
        width:3vw;height:3vh;
        background-color:#4169E1;
        border:none;color:white;
        border-radius:5px;
        margin:1%;
        margin-top:5vh;
    }
    .detailList-btn{
        width:10vw;height:6vh;
        margin-top:5vh;
        
    }
    .fav-btn,.good-btn{
        width:4vw;height:6vh;
        font-size:2em;
        color:Gray;
        text-align:center;
        line-height:6vh;
        border:none;
        float:left;
        
    }
    .good-btn{
        margin-left:1vw;
    }
    .fav-btn:hover
    ,.good-btn:hover{
        color:#4169E1;
        transition:0.5s;
    }
    
    .regis-Title-exbtn{
        width:4vw;
        margin-right:0.5vw;
        color:#8c8c8c;
    }
    .regis-Title-exbtn:hover{
        color:black;
    }
    
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header/header.jsp" %>	
    <div id="boarddetail">
        <div id="detaillist">
        <c:forEach var="detail" items="${boardDetail }">
            <ul class="detailList-title">
                <li>
                <a href="#">> ${detail.bt_name } 게시판</a>
                </li>
                <li>
                    <h1 style="line-height:9vh;">
                    ${detail.b_title}</h1>
                </li>
                <li style="line-height:4vh; margin-top:1vh;">
                    <div class="detailList-img"><a href="#"><img src="/img/${detail.u_profileimg }"></a></div>
                    작성자 : ${detail.u_nickname}<br>작성일 : ${detail.b_writedate}, 조회수 : ${detail.b_readcount }회
                    <c:if test="${loginVo.u_no eq detail.u_no or cookieVo.u_no eq detail.u_no  }">
                    <button class="every-btn" onclick="ReWrite();">수정</button>
                    <button class="every-btn" onclick="Delete();">삭제</button>
                    </c:if>
                </li>
            </ul>
            <div class="detailList-detail">
                ${detail.b_content }<br>
                <c:forEach var="file" items="${file }">
                <c:if test="${file.b_file ne null }">
                <div class="detailList-detail-img">
                <img src="/img/${file.b_file }">
                </div>
                </c:if>
                </c:forEach>
            </div>
            <div class="detailList-btn">
                <div class="fav-btn"><i class="fa-regular fa-star"></i>
                <i class="fa-solid fa-star" style="display:none;"></i></div>
                <div class="good-btn"><i class="fa-regular fa-thumbs-up"></i>
                <i class="fa-solid fa-thumbs-up" style="display:none;"></i></div>
            </div>
            </c:forEach>
        </div>
        
        <div id="comment">
            <div class="commentbar">댓글</div>
            <c:forEach var="comt" items="${comtList }">
            <input type="hidden" id="b_no" value="${comt.b_no }">
            <div class="commentlist">
            <c:if test="${comt.bc_comt eq null }">
                <div class="commentlist-title">
                    
                    <h4 class="commentitle-name">닉네임</h4>
                </div>
                <div class="comentlist-detail">
                   	댓글을 입력해주세요.
                </div>
                </c:if>
                <c:if test="${comt.bc_comt ne null }">
                <div class="commentlist-title">
                    <div class="commentitle-img"><img src="/img/${comt.u_profileimg }"></div>
                    <h4 class="commentitle-name">${comt.u_nickname }</h4>
                </div>
                <div class="comentlist-detail">
                    ${comt.bc_comt }
                </div>
                </c:if>
            </div>
            
                </c:forEach>
             <c:if test="${loginVo eq null and Cookie eq null }">
            <div class="commenttext-area">
                <div class="commenttextname">댓글 입력</div>
                <textarea name="bc_comt" class="commenttext" placeholder="로그인이 필요합니다." readonly></textarea>
            </div>
            </c:if>
            <c:if test="${loginVo ne null and Cookie eq null or loginVo eq null and Cookie ne null }">
          
            <div class="commenttext-area">
            
            <c:if test="${loginVo ne null or cookieVo eq null }">
                <div class="commenttextname">${loginVo.u_nickname}</div>
                </c:if>
                <c:if test="${loginVo eq null or cookieVo ne null }">
                <div class="commenttextname">${cookieVo.u_nickname}</div>
                </c:if>
                <textarea name="bc_comt" id="bc_comt" class="commenttext" placeholder="댓글을 입력해주세요."></textarea>
                <button class="commenttext-btn" onclick="WriteComment()">등록</button>
            </div>
            </c:if>
        </div>
    </div>
   
</body>

<script>

$(document).ready(function() {
	var u_no;
	var b_no  =  $('#b_no').val();
	
	if ('${loginVo.u_no}' != null ) {
		u_no  =  '${loginVo.u_no}';
	} else {
		u_no  =  '${cookieVo_u_no}';
	}
	
	$.ajax({
		url : "/Board/FindFav",
		method : "GET",
		data : {u_no : u_no, b_no : b_no},
		success : function(response) {
			console.log(response)
			if(response == 0 ) {
				$(".fav-btn").empty().append(
				$("<a>").attr("href", "javascript:void:(0)").on("click", function() {
					boardFav(u_no, b_no);
				}).append(
					$("<i>").addClass("fa-regular fa-star")		
				 )		
				);
			} else {
				$(".fav-btn").empty().append(
					$("<a>").attr("href","javascript:void(0)").on("click", function() {
						boardUnFav(u_no, b_no);
					}).append(
						$("<i>").addClass("fa-solid fa-star")		
					)		
				);
			}
		},
		error : function(error) {
			console.error('ERROR', error);
		}
		
	});
	
	
	$.ajax({
		url : "/Board/FindLike",
		method : "GET",
		data : {u_no : u_no, b_no : b_no},
		success : function(response) {
			console.log(response)
			if(response == 0 ) {
				$(".good-btn").empty().append(
				$("<a>").attr("href", "javascript:void:(0)").on("click", function() {
					boardLike(u_no, b_no);
				}).append(
					$("<i>").addClass("fa-regular fa-thumbs-up")		
				 )		
				);
			} else {
				$(".good-btn").empty().append(
					$("<a>").attr("href","javascript:void(0)").on("click", function() {
						boardUnLike(u_no, b_no);
					}).append(
						$("<i>").addClass("fa-solid fa-thumbs-up")		
					)		
				);
			}
		},
		error : function(error) {
			
			console.error('ERROR', error);
		}
		
	});
});


function boardLike(u_no, b_no) {
	$.ajax({
		url : "/Board/Like",
		method : "POST",
		data : {u_no : u_no, b_no : b_no},
		success : function(response) {
			console.log('success', response);
			$(".good-btn").empty().append(
					$("<a>").attr("href","javascript:void(0)").on("click", function() {
						boardUnLike(u_no, b_no);
					}).append(
						$("<i>").addClass("fa-solid fa-thumbs-up")		
					)		
				);
			},
		error : function() {
			alert("로그인이 필요합니다.");
			console.error("ERROR", error);
		}
	});
}

function boardUnLike(u_no, b_no) {
	$.ajax({
		url : "/Board/UnLike",
		method : "POST",
		data : {u_no : u_no, b_no : b_no},
		success : function(response) {
			console.log('success', response);
			$(".good-btn").empty().append(
					$("<a>").attr("href", "javascript:void:(0)").on("click", function() {
						boardLike(u_no, b_no);
					}).append(
						$("<i>").addClass("fa-regular fa-thumbs-up")		
					 )		
					);
		},
		error : function() {
			alert("로그인이 필요합니다.");
			console.error("ERROR", error);
		}
	});
}

function boardFav(u_no, b_no) {
	$.ajax({
		url : "/Board/Fav",
		method : "POST",
		data : {u_no : u_no, b_no : b_no},
		success : function(response) {
			console.log('success', response);
			$(".fav-btn").empty().append(
					$("<a>").attr("href","javascript:void(0)").on("click", function() {
						boardUnFav(u_no, b_no);
					}).append(
						$("<i>").addClass("fa-solid fa-star")		
					)		
				);
			},
		error : function() {
			alert("로그인이 필요합니다.");
			console.error("ERROR", error);
		}
	});
}

function boardUnFav(u_no, b_no) {
	$.ajax({
		url : "/Board/UnFav",
		method : "POST",
		data : {u_no : u_no, b_no : b_no},
		success : function(response) {
			console.log('success', response);
			$(".fav-btn").empty().append(
					$("<a>").attr("href", "javascript:void:(0)").on("click", function() {
						boardFav(u_no, b_no);
					}).append(
						$("<i>").addClass("fa-regular fa-star")		
					 )		
				);
		},
		error : function() {
			alert("로그인이 필요합니다.");
			console.error("ERROR", error);
		}
	});
}

function WriteComment() {
	var u_no;
	var b_no  =  $('#b_no').val();
	var bc_comt  =  $('#bc_comt').val();  
	
	if ('${loginVo.u_no}' != null ) {
		u_no  =  '${loginVo.u_no}';
	} else {
		u_no  =  '${cookieVo_u_no}';
	}
	
	var bc_comt  =  $('#bc_comt').val();
	
	if (bc_comt.trim() === '') { 
        alert("댓글을 입력해주세요.");
        return; 
    }
	
	$.ajax({
		url : "/Board/WriteComment",
		method : "POST",
		data : {u_no : u_no, b_no : b_no, bc_comt : bc_comt},
		success : function(response) {
			alert("댓글이 등록되었습니다.");
			location.reload();
		},
		error : function(error) {
			console.error("ERROR", error);
		}
	});
	
}	

function ReWrite() {
	var u_no;
	var b_no  =  $('#b_no').val();
	
	if ('${loginVo.u_no}' != null ) {
		u_no  =  '${loginVo.u_no}';
	} else {
		u_no  =  '${cookieVo_u_no}';
	}
	location.href="/Board/ReWritePage?u_no=" + u_no + "&b_no=" + b_no;
	
}

function Delete() {
    var b_no = $('#b_no').val(); 

    
    var u_no;
    if ('${loginVo.u_no}' != null) {
        u_no = '${loginVo.u_no}';
    } else {
        u_no = '${cookieVo_u_no}';
    }

    
    var confirmDelete = confirm("게시물을 삭제하시겠습니까?");
    if (confirmDelete) {
    
        location.href = "/Board/BoardDelete?u_no=" + u_no + "&b_no=" + b_no;
    } else {
        
        return;
    }
}


</script>
</html>