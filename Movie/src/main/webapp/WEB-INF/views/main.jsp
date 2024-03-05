<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr" dir="ltr">
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="/css/style.css">
  <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="https://kit.fontawesome.com/8041d3c83b.js" crossorigin="anonymous"></script>
  <script src="/js/script.js" defer="defer"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
  <title>Movie</title>
 <style>
    body{
      background-image: linear-gradient(to top, #434343 0%, #181818 30%);
    }
    #alarmIcon {
    position: relative;
    }
    .alram-counter {
      position: absolute;
      top: 0;
      right: 0;
      background-color: red;
      color: white;
      border-radius: 50%;
      padding: 2px 5px;
      font-size: 12px;
      border:1px solid red;
    }
    .alarmList{
      width:380px;height:30vh;
      border-radius:1px;
      margin-top:8vh;
      background-color:black;
      opacity:0.8;
      position:absolute;
      margin-left:74.5vw;
      display:none;
      overflow-y: auto;
      border-top:5px solid #4169E1;
    }
    .alarmList li{
      width:100%;height:8vh;
      background-color:black;
      border-bottom:1px solid#8c8c8c;
      opacity:0.8;line-height:8vh;
    }
    .alarmList li:hover{
      background-color:black;
      opacity:1;
    }
    .alarmList li:last-child{
      border:none;
    }
    #Poster-Area{
      width:90%;height:auto;
      min-height:210vh;
    }
    .poster-Slide1,.poster-Slide2,
    .poster-Slide3,.poster-Slide4{
      width:100%;height:50vh;
      overflow: hidden;
    }
    .poster-Title1,.poster-Title2,
    .poster-Title3,.poster-Title4{
      width:100%;height:10vh;
      line-height:10vh;
      font-size:20px;
      font-weight:bold;
      color:#c8c8c8;
      margin-left:1vw;
      cursor:default;
    }
    .btn-Area{
      width:10%;height:10vh;
      float:right;  
    }
    .prevBtn1,.nextBtn1,
    .prevBtn2,.nextBtn2,
    .prevBtn3,.nextBtn3,
    .prevBtn4,.nextBtn4{
      width:30%;height:10vh;
      font-size:3em;
      float:left;
      cursor:pointer;
      font-weight:lighter;
    }
    .prevBtn1:hover,.nextBtn1:hover,
    .prevBtn2:hover,.nextBtn2:hover,
    .prevBtn3:hover,.nextBtn3:hover,
    .prevBtn4:hover,.nextBtn4:hover{
      color:white;
      opacity:1;
      transition:0.8s;
    }
    .poster-Menu1,.poster-Menu2,
    .poster-Menu3,.poster-Menu4{
      width:100%;height:40vh;
    }
    .poster-Menu1 li,.poster-Menu2 li,
    .poster-Menu3 li,.poster-Menu4 li{
      width:16vmax;height:40vmin;
      float:left;margin-left:1vw;
      margin-top:2vh;
      background-color:black;
    }
    .poster-Menu1 li img:hover,.poster-Menu2 li img:hover,
    .poster-Menu3 li img:hover,.poster-Menu4 li img:hover{
      opacity:1;transition:0.8s;
    }
    .poster-Menu1 li img,.poster-Menu2 li img,
    .poster-Menu3 li img,.poster-Menu4 li img{
      width:100%;
      height:100%;
      opacity:0.6;
    }
    .poster-Menu li img::after {
    position: absolute;
    width: 100%;
    height: 100%;
    bottom: 0;
    background:linear-gradient(
      transparent, 
      rgba(20, 20, 20, 0) 20%,
      rgba(20, 20, 20, 0.2) 50%,
      rgba(20, 20, 20, 0.5)
    );
  }
  .movieDetail-area1{
      width:100%;height:320vh;
      background-color:rgba(0,0,0,0.5);
      display:none;
      position:absolute;
      z-index:99;
  }
  .movieDetial-exit-btn{
      width:2vw;height:5vh;
      float:right;
      margin-right:20vw;
      margin-top:100vh;
      font-size:2.5em;
  }
  .movieDetail-area{
        margin-top:100vh;
        background-color:black;
        width:40%;height:200vh;
        border-radius:15px;
        margin-left:30vw;
        overflow: hidden;
    }
    .movieDetail-img-area{
        width:100%;height:40vw;
        position: relative;
        overflow:hidden;
        opacity:0.7;
    }
    .movieDetail-img-area::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(to bottom, rgba(0, 0, 0, 0), #000000);
    }
    .movieDetail-img-area img{
        width:100%;height:80vh;
    }
    .movieDetail-title{
        width:100%;height:50vh; 
        z-index:99;background-color:black;
    }
    .movieDetail-log{
        width:70vw;height:20vh;
    }
    .movieTitle{
        width:35vw;
        font-size:2em;
        margin-left:1vw;
    }
    .movieDetail-fav{
        width:3vw;height:5vh;
        background-color:transparent;
        margin-right:1vw;
        font-size:1em;
        color:gray;
        border:none;
        float:right;
    }
    .movieDetail-fav:hover{
        color:darkgray;
    }
    .movieDetail-Genre,
    .movieDetail-releaseDate,
    .movieDetail-Ratings{  
        width:70vw;height:2vh;
        margin-top:2vh;
        margin-left:1vw;
    }
    .movieDetail-actor-area{
        width:100%;height:30vh;
        margin-top:1vh;
    }
    .movieDetail-actor{
        width:5vw;height:27vh;
        margin-top:3vh;
        margin-left:1vw;
        float:left;
    }
    .actor-img{
        width:5vw;height:14vh;
        overflow:hidden;
    }
    .actor-img img{
        width:100%;height:auto;
    }
    .actorName{
        width:100%;height:9vh;
        text-align:center;
        line-height:3vh;
    }
    .review{
        width:90%; min-height:40vh;
        background-color:black;
        margin-top:3vh;
        border-radius:10px;

    }
    .review-bar{
        width:90%; height:8vh;
        border-bottom:1px solid #8c8c8c;
        font-size:20px;color:white;
        line-height:7vh;font-weight:bold;
        padding-left:1vw;
    }
    .review-list{
        width:90%; height:20vh;
        margin-top:2vh;
        border-bottom:1px solid#8c8c8c;
    }
    .review-list-title{
        width:100%; height:6vh;
        color:white;
    }
    .review-title-img{
        width:3vw;height:6vh;
        border-radius:40px;
        float:left; overflow:hidden;
    }
    .review-title-img img{
        width:100%;height:auto;
    }
    .review-title-name{
        min-width:5vw;height:3vh;
        margin-top:3vh;margin-left:10px;
        float:left;
    }
    .review-list-detail{
        width:100%;height:14vh;
        padding:1%;
        color:white;
    }
    .review-text-area{
        width:90%;height:10vh;
        color:white;margin-top:2vh;
        border-radius:10px;padding:1%;
    }
    .review-textname{
        width:100%;height:3vh;
        margin-left:1%;
    }
    .review-text{
        width:75%;height:5vh;
        margin-left:1%;
        border:none;
        padding-left:5px;
        line-height:6vh;
        float:left;
        outline:none;
    }
    .review-text:focus{
        opacity:0.5;
    }
    .review-text-btn{
        width:5vw;height:5vh;
        background-color:gray;
        border:none;color:white;
        border-radius:5px;
        float:left;margin-left:2vw;
    }
  footer{
  width:100vw; height:20vh;
  float:bottom;cursor:default;
  background-color:#2b2a2a;
}
.footerarea{
  width:95vw;height:15vh; position:absolute;
  margin-left:5vw;margin-top:3vh;color:gray;
}
  </style>
</head>
<body>
  <div class="movieDetail-area1">
    <div class="movieDetial-exit-btn">X</div>
    <div class="movieDetail-area">
      <div class="movieDetail-img-area">
          
      </div>
      <div class="movieDetail-title">
          <div class="movieDetail-log">
              <div class="movieTitle">
              <button class="movieDetail-fav"><i class="fa-regular fa-star"></i></button>
          </div>
              <div class="movieDetail-Genre">장르&nbsp;&nbsp;:</div>
              <div class="movieDetail-releaseDate">개봉일&nbsp;&nbsp;:</div>
              <div class="movieDetail-Ratings">평점&nbsp;&nbsp;:&nbsp;
              <i class="fa-solid fa-star" style="color:red;"></i>&nbsp;0.00</div>
          </div>
          <div class="movieDetail-actor-area">
              <div class="movieDetail-actor">
                  <div class="actor-img">
                      
                  </div>
                  <div class="actorName"></div>
              </div>
          </div>
      </div>
      <div class="review">
          <div class="review-bar">Review</div>
          <div class="review-list">
              <div class="review-list-title">
                  <div class="review-title-img"></div>
                  <h4 class="review-title-name">
                  </h4>
              </div>
              <div class="review-list-detail">
                  리뷰내용이 여기에 담깁니다.
              </div>
          </div>
          <div class="review-text-area">
              <div class="review-textname">닉네임</div>
              <input type="text" name="" class="review-text" placeholder="댓글을 입력해주세요.">
              <button class="review-text-btn">등록</button>
          </div>
      </div> 
  </div>
</div>
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
    <!-- 슬라이드 형식으로 진행 -->
    <div id="Poster-Area">
        <div class="poster-Slide1">
          <div class="poster-Title1">인기있는 영화
            <div class="btn-Area">
              <div class="prevBtn1" >&#8249;</div>
              <div class="nextBtn1" >&#8250;</div>
            </div>
          </div>
          <ul class="poster-Menu1">
          <c:forEach var="movie" items="${poster}">
            <li><input type="hidden" class="m_no1" value="${movie.m_no }"><img src="https://image.tmdb.org/t/p/original${movie.m_img }" alt="슬라이드 1번" class="poster"></li>
          </c:forEach>
          </ul>
      </div>
      <div class="poster-Slide2">
        <div class="poster-Title2">애니메이션
          <div class="btn-Area">
            <div class="prevBtn2" >&#8249;</div>
            <div class="nextBtn2" >&#8250;</div>
          </div>
        </div>
        <ul class="poster-Menu2">
         <c:forEach var="ani" items="${Ani}">
          <input type="hidden" id="m_no2" value="${ani.m_no }">
          <li><img src="https://image.tmdb.org/t/p/original${ani.m_img }" alt="슬라이드 1번" class="poster"></li>
         </c:forEach>
        </ul>
    </div>
    <div class="poster-Slide3">
      <div class="poster-Title3">추천하는 영화
        <div class="btn-Area">
          <div class="prevBtn3" >&#8249;</div>
          <div class="nextBtn3" >&#8250;</div>
        </div>
      </div>
      <ul class="poster-Menu3">
        <c:forEach var="rec" items="${rec}">
         <input type="hidden" id="m_no3" value="${rec.m_no }">
        <li><img src="https://image.tmdb.org/t/p/original${rec.m_img }" alt="슬라이드 1번" class="poster"></li>
        </c:forEach>
      </ul>
    </div>
    <div class="poster-Slide4">
      <div class="poster-Title4">내가찜한 리스트
        <div class="btn-Area">
          <div class="prevBtn4" >&#8249;</div>
          <div class="nextBtn4" >&#8250;</div>
        </div>
      </div>
      <ul class="poster-Menu4">
        <li><a href=""><img src="img1/1.jpg" alt="슬라이드 1번" class="poster"></a></li>
      </ul>
    </div>
  </div>
    <footer id="end">
      <div class="footerarea">주식회사 Movie /
        사업자등록번호 :
        295-88-00023 /
        대표자 :
        ### /
        서울특별시 강남구 테헤란로 507, 1층, 2층(삼성동, WeWork빌딩) /
        전화 :
        02-455-9903 (평일 09:00 ~ 18:00) /
        이메일 :
        service@google.com
        <a href="/Cs/List">고객센터</a>
        </div>
    </footer>
  </body>
  <script>
$(".poster-Menu1 li").click(function(){
	$(".movieDetail-area1").fadeIn( 1000 );
	 var m_no = $(this).find('.m_no1').val();
	 var m_imgArea  =  $('.movieDetail-img-area');
	 var movieTitleArea = $('.movieTitle');
	 var movieDetail_genre  =  $('.movieDetail-Genre');
	 var movie_releaseDate  =  $('.movieDetail-releaseDate');
	 var rating  =  $('.movieDetail-Ratings');
	 var actor_imgArea = $('.movieDetail-actor-area');

	 actor_imgArea.empty();
	 rating.empty();
	 movie_releaseDate.empty();
	 movieDetail_genre.empty();
	 movieTitleArea.empty();
	 m_imgArea.empty();
	 
	$.ajax({
		url : '/Detail',
		method : 'GET',
		data : {m_no : m_no},
		success : function(response) {
			console.log(response);
			 
				if(response.length > 0 ) {
				var item  =  response[0];
				var m_img = item.m_img;
				var m_title = item.m_title;
				var genres_info = item.genres_info;
				var vote_average = item.m_vote_average;
				var m_release_date = item.m_release_date;
				m_imgArea.append("<img src='https://image.tmdb.org/t/p/original/" + m_img + "'>");
				movieTitleArea.append("<label style='font-weight:bolder;'>" + m_title + "</label>");
				movie_releaseDate.text("개봉일  : " + m_release_date);
				rating.html("평점 : <i class='fa-solid fa-star' style='color:red;'></i>&nbsp;" + vote_average);
                
				if (genres_info) {
                    var genres = genres_info.split(',');
                    genres.forEach(function(genre) {
                    	movieDetail_genre.append("<span>" + genre.trim() + "</span>&nbsp;&nbsp;");
                    });
                }
			}
			
			response.forEach(function(item) {
				var actor_img  =  item.profile_path;
				var actorName  =  item.name;
				var character  =  item.character;
				
				actor_imgArea.append("<div class='movieDetail-actor'><div class='actor-img'><img src='https://image.tmdb.org/t/p/original/" + actor_img + "'></div><div class='actorName'>" + actorName + "<br><label style='font-size:15px;opacity:0.5;'>" + character + "</label></div></div>");
				
			});
				
			 loadReviews(m_no);	
		},
		error : function(error) {
			console.error('ERROR', error);
		}
	});
});	


function loadReviews(m_no) {
   var reviewProfile  =  $('.review');
   reviewProfile.empty();
   
   var u_no;
   if ('${loginVo.u_no}' != null ) {
		u_no  =  '${loginVo.u_no}';
	} else {
		u_no  =  '${cookieVo_u_no}';
	}
   
	$.ajax({
		url : "/Review",
		method : "GET",
		data : {m_no : m_no},
		success : function(response) {
			
			var reviewBar  =  $("<div class='review-bar'>Review</div>");
			
			reviewProfile.append(reviewBar);
			
			response.forEach(function(review) {
			
				var reviewItem = $("<div class='review-list'><div class='review-list-title'>" +
					    "<div class='review-title-img'><img src='/img/" + review.u_profileimg + "'></div>" +
					    "<h4 class='review-title-name'>" + review.u_nickname + "</h4>" +
					    "</div>" +
					    "<div class='review-list-detail'>" + review.r_review + "</div></div>");
				
				reviewProfile.append(reviewItem);
				
		        });
			if(u_no == '') {
			var reviewTextArea = $("<div class='review-text-area'>" +
				    "<div class='review-textname'>댓글 입력</div><br>" +
				    "<input type='text' name='' class='review-text' placeholder='로그인이 필요합니다.' readonly>" + 
				    "</div>");
			reviewProfile.append(reviewTextArea);
		  } else {
			var reviewTextArea = $("<div class='review-text-area'>" +
					    "<div class='review-textname'>닉네임</div><br>" +
					    "<input type='text' name='' class='review-text' placeholder='댓글을 입력해주세요.'>" +
					    "<button class='review-text-btn' onclick='reviewWrite(" + m_no + ", " + u_no + ")'>등록</button>" +
					    "</div>");
			reviewProfile.append(reviewTextArea);
		  }
		},
		error : function(error) {
			console.error('ERROR', error);
		}
	});
};	

function reviewWrite(m_no, u_no) {
	 var r_review = $('.review-text').val();
	 
	 $.ajax({
		 url : '/ReviewWrite',
		 method : 'POST',
		 data : {m_no : m_no, u_no : u_no, r_review : r_review},
		 success : function(response) {
			 loadReviews(m_no);
			 alert('리뷰가 등록되었습니다.');
		 },
		 error : function(error) {
			 console.error('ERROR', error);
		 }
	 });
}


$(".movieDetial-exit-btn").click(function(){
	$(".movieDetail-area1").fadeOut(2000);
});
$(".poster-Menu2 li").click(function(){
	$(".movieDetail-area1").fadeIn( 2000 );
});
$(".movieDetial-exit-btn").click(function(){
	$(".movieDetail-area1").fadeOut(2000);
});
$(".poster-Menu3 li").click(function(){
	$(".movieDetail-area1").fadeIn( 2000 );
});
$(".movieDetial-exit-btn").click(function(){
	$(".movieDetail-area1").fadeOut(2000);
});
$(".poster-Menu4 li").click(function(){
	$(".movieDetail-area1").fadeIn( 2000 );
});
$(".movieDetial-exit-btn").click(function(){
	$(".movieDetail-area1").fadeOut(2000);
});
  $(document).ready(function() {
  const posterMenu = $('.poster-Menu1');
  let posters = $('.poster-Menu1 li');
  let posterIndex = 0;
  const postersPerPage = 5;
  const posterWidth = posters.first().width();

  function showPosters(startIndex) {

    posters.each(function(i) {
      const isVisible = i >= startIndex && i < startIndex + postersPerPage;

      if (isVisible) {
        $(this).stop().fadeIn(300);
      } else {
        $(this).stop().fadeOut(300);
      }
    });
  }

  function changeSlide(direction) {
    const currentGroupIndex = Math.floor(posterIndex / postersPerPage);
    let newGroupIndex = currentGroupIndex + direction;

    if (newGroupIndex >= Math.ceil(posters.length / postersPerPage)) {
      newGroupIndex = 0;
    }

    if (newGroupIndex < 0) {
      newGroupIndex = Math.floor(posters.length / postersPerPage) - 1;
    }

    posterIndex = newGroupIndex * postersPerPage;

    showPosters(posterIndex);
  }

  function updatePosters() {
    posters = $('.poster-Menu1 li');
    showPosters(posterIndex);
  }

  showPosters(posterIndex);

  $('.prevBtn1').on('click', function() {
    changeSlide(-1);
  });

  $('.nextBtn1').on('click', function() {
    changeSlide(1);
  });

  posterMenu.on('animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd', 
  function() {
    $(this).css('overflow', 'visible');
  });
});
/*첫번째 슬라이드 끝 */
$(document).ready(function() {
  const posterMenu = $('.poster-Menu2');
  let posters = $('.poster-Menu2 li');
  let posterIndex = 0;
  const postersPerPage = 5;
  const posterWidth = posters.first().width();

  function showPosters(startIndex) {

    posters.each(function(i) {
      const isVisible = i >= startIndex && i < startIndex + postersPerPage;

      if (isVisible) {
        $(this).stop().fadeIn(300);
      } else {
        $(this).stop().fadeOut(300);
      }
    });
  }

  function changeSlide(direction) {
    const currentGroupIndex = Math.floor(posterIndex / postersPerPage);
    let newGroupIndex = currentGroupIndex + direction;

    if (newGroupIndex >= Math.ceil(posters.length / postersPerPage)) {
      newGroupIndex = 0;
    }

    if (newGroupIndex < 0) {
      newGroupIndex = Math.floor(posters.length / postersPerPage) - 1;
    }

    posterIndex = newGroupIndex * postersPerPage;

    showPosters(posterIndex);
  }

  function updatePosters() {
    posters = $('.poster-Menu2 li');
    showPosters(posterIndex);
  }

  showPosters(posterIndex);

  $('.prevBtn2').on('click', function() {
    changeSlide(-1);
  });

  $('.nextBtn2').on('click', function() {
    changeSlide(1);
  });

  posterMenu.on('animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd', 
  function() {
    $(this).css('overflow', 'visible');
  });
});
/*2번째 슬라이드 끝*/ 
$(document).ready(function() {
  const posterMenu = $('.poster-Menu3');
  let posters = $('.poster-Menu3 li');
  let posterIndex = 0;
  const postersPerPage = 5;
  const posterWidth = posters.first().width();

  function showPosters(startIndex) {

    posters.each(function(i) {
      const isVisible = i >= startIndex && i < startIndex + postersPerPage;

      if (isVisible) {
        $(this).stop().fadeIn(300);
      } else {
        $(this).stop().fadeOut(300);
      }
    });
  }

  function changeSlide(direction) {
    const currentGroupIndex = Math.floor(posterIndex / postersPerPage);
    let newGroupIndex = currentGroupIndex + direction;

    if (newGroupIndex >= Math.ceil(posters.length / postersPerPage)) {
      newGroupIndex = 0;
    }

    if (newGroupIndex < 0) {
      newGroupIndex = Math.floor(posters.length / postersPerPage) - 1;
    }

    posterIndex = newGroupIndex * postersPerPage;

    showPosters(posterIndex);
  }

  function updatePosters() {
    posters = $('.poster-Menu3 li');
    showPosters(posterIndex);
  }

  showPosters(posterIndex);

  $('.prevBtn3').on('click', function() {
    changeSlide(-1);
  });

  $('.nextBtn3').on('click', function() {
    changeSlide(1);
  });

  posterMenu.on('animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd', 
  function() {
    $(this).css('overflow', 'visible');
  });
});
/*4번째 슬라이드 끝*/ 
$(document).ready(function() {
  const posterMenu = $('.poster-Menu4');
  let posters = $('.poster-Menu4 li');
  let posterIndex = 0;
  const postersPerPage = 5;
  const posterWidth = posters.first().width();

  function showPosters(startIndex) {

    posters.each(function(i) {
      const isVisible = i >= startIndex && i < startIndex + postersPerPage;

      if (isVisible) {
        $(this).stop().fadeIn(300);
      } else {
        $(this).stop().fadeOut(300);
      }
    });
  }

  function changeSlide(direction) {
    const currentGroupIndex = Math.floor(posterIndex / postersPerPage);
    let newGroupIndex = currentGroupIndex + direction;

    if (newGroupIndex >= Math.ceil(posters.length / postersPerPage)) {
      newGroupIndex = 0;
    }

    if (newGroupIndex < 0) {
      newGroupIndex = Math.floor(posters.length / postersPerPage) - 1;
    }

    posterIndex = newGroupIndex * postersPerPage;

    showPosters(posterIndex);
  }

  function updatePosters() {
    posters = $('.poster-Menu4 li');
    showPosters(posterIndex);
  }

  showPosters(posterIndex);

  $('.prevBtn4').on('click', function() {
    changeSlide(-1);
  });

  $('.nextBtn4').on('click', function() {
    changeSlide(1);
  });

  posterMenu.on('animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd', 
  function() {
    $(this).css('overflow', 'visible');
  });
});
updatePosters();


</script>
</html>