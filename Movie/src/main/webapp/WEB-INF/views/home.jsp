<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/main.css" />
</head>
<body>
  <div id="main">
   <h2>Home -  ${ irum } 홈페이지</h2>
   <a href="/test">Test</a><br>
   <a href="/test?str=제니">Test2</a><br>   
   <a href="/List">게시물 목록</a><br>
   <a href="/WriteForm">새 글 쓰기</a><br>
  </div> 
</body>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
var ids = [
    <c:forEach items="${actor}" var="currentActor" varStatus="loop">
      ${currentActor.m_id}<c:if test="${not loop.last}">, </c:if>
    </c:forEach>
  ];

  var apiKey = "45ca9b752c974c166cebf49902c12bf0";

  // 각 m_id에 대한 API 요청을 보내기 위해 반복문을 사용합니다.
  async function saveAllData(ids) {
  var results = [];

  for (var i = 0; i < ids.length; i++) {
    var endPoint = "https://api.themoviedb.org/3/movie/" + ids[i] + "/credits?api_key=" + apiKey;

    try {
      var data = await $.ajax({
        url: endPoint,
        method: "GET"
      });

      var castDetails = data.cast.slice(0, 5).map(actor => ({
        name: actor.name,
        character: actor.character,
        profile_path: actor.profile_path,
        id: data.id
      }));

      // 각 API 호출에서 얻은 데이터를 결과 배열에 추가
      results.push(...castDetails);
    } catch (error) {
      console.error("에러 발생 ! : ", error);
    }
  }

  
  
  // 결과 배열을 서버로 보냄
  $.ajax({
    url: '/saveActor',
    method: 'POST',
    contentType: 'application/json',
    data: JSON.stringify(results),
    success: function(response) {
      console.log('success !', response);
    },
    error: function(error) {
      console.error('fail', error);
    }
  });
}

// 함수 호출
saveAllData(ids);
	
	
</script>
</html>



