<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/style.css">
  <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="/js/script.js" defer="defer"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <script src="https://kit.fontawesome.com/8041d3c83b.js" crossorigin="anonymous"></script>
<title>Movie</title>
<style>
    body{
        background-image: linear-gradient(to top, #434343 0%, #181818 80%);
        
    }
    #registration{
        width:60vw;min-height:200vh;
        height:auto;
        /* border:1px solid #8c8c8c; */
        background-color:white;
        margin-top:3vh;
    }
    #regis-Titlearea{
        width:54vw;height:5vh;
        border-bottom:2px solid#8c8c8c;
        margin-top:2vh;
    }
    .regis-Title{
        width:20vw;height:6vh;
        font-weight:bold;
        font-size:20px;
        color:black;
        float:left;
        padding-top:1vh;
        cursor:default;
    }
    .regis-Titlebtn,.regis-Title-exbtn{
        width:2.5vw;height:3.5vh;
        border:1px solid#c8c8c8;
        margin-top:1vh;
        border-radius:5px;
        color:#2c4eb4;
        font-weight:bold;
        float:right;
        cursor:pointer;
    }
    .regis-Titlebtn{
        border:none;
    }
    .regis-Title-exbtn{
        width:4vw;
        margin-right:1vw;
        color:#8c8c8c;
    }
    .regis-Title-exbtn:hover{
        color:black;
    }
    #regis-Boardarea{
        width:60vw;height:auto;
        min-height: 102vh; /* 최대 높이를 뷰포트 높이로 제한 */
        overflow: hidden;
    }
    .regis-area-Title{
        width:54vw;height:16vh;
        border:1px solid #8c8c8c;
        border-radius:5px;
        margin-top:2vh;
    }
    .board-select,.board-text-box{
        width:20vw;height:4.5vh;
        color:black;
        margin-top:2vh;
        margin-left:2vw;
        padding-left:5px;
        border:1px solid#a7a7a7;
    }
    .board-text-box{
        color:rgb(68, 68, 68);
    }
    select option[value=""][disabled] {
	    display: none;
    }
    .rgis-detail{
        width:54vw;min-height:200vh;
        height:auto;
        border:1px solid#8c8c8c;
        border-radius:5px;
        margin-top:2vh;
    }
    .rgis-toolbar{
        width:54vw;height:6.5vh;
        border-bottom:1px dashed#8c8c8c;
        color:#8c8c8c;
    }
    .img-toolbar{
        width:3vw;height:5vh;
        text-align:center;
        font-size:20px;
        padding:5px;
        float:left;
        overflow-y: hidden;
    }
    .img-toolbar:hover{
        color:#2c4eb4;
    }
   .text-detail{
        width:52vw;min-height:200vh;
        height:auto;
        padding:10px;border:none;
        vertical-align:top;
    }
    .text-detail img{
        max-width: 40vw; 
        max-height: 50vh; 
        display: block;
    }
    .image-container {
        width:10vw;
        max-height: 50vh;
        position: relative;
        margin:10px;
        margin-bottom:30px;
        text-align: center;
    }

    .delete-button {
        position: absolute;
        background-color:#2c4eb4;
        color: #8c8c8c;
        font-size:15px;
        font-weight:bolder;
        border: none;
        cursor: pointer;
        display: none;
        margin-left:5px;
        bottom:0;
        border:1px solid#c8c8c8;
        opacity:0.5;
    }

    .image-container:hover .delete-button{
        display: block;color:white;
        background-color:#2c4eb4;
    }
    .image-container:hover .preview-image {
        transition:0.8s;
        border:1px dashed #385bc5;
    }
    .preview-image {
        max-width: 40vw;
        max-height: 50vh;
        display: inline-block;
        margin: 5px;
    }
    .preview-img:hover{
        opacity:0.1;
    }
    .text-area{
  		width: 52vw;
        min-height: 50px;
  		height: auto;
        border:none;
        outline:none;
		resize: none;
    }
    .text-detail:focus,
    .board-text-box:focus,
    .board-select:focus{
        outline:none;
    }
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header/header.jsp" %>	
    <div id="registration">
        <div id="regis-Titlearea">
            <div class="regis-Title">게시판 등록</div>
            <button class="regis-Titlebtn" onclick="Board();">등록</button>
            <button class="regis-Title-exbtn" onclick="testBoard();">임시등록</button>
            
        </div>
        <div id="regis-Boardarea">
            <div class="regis-area-Title">
                <select name="Board" class="board-select">
                    <option value="NO" disabled selected>게시판을 선택해주세요.</option>
                    <option value="1">공지게시판</option>
                    <option value="2">추천게시판</option>
                    <option value="3">자유게시판</option>
                    <option value="4">질문게시판</option>
                </select>
                <input type="text" placeholder="제목을 입력해주세요." class="board-text-box" id="b_title">
            </div>
            <div class="rgis-detail">
                <div class="rgis-toolbar">
                    <div class="img-toolbar">
                    <a href="#" onclick="document.getElementById('file').click();"><i class="fa-solid fa-image"></i><input type="file" style="display: none;" id="file" onchange="readURL(this)"  multiple><br>
                    <lable style="font-size:12px;">사진</lable></a>
                    </div>
                </div>
                <div class="text-detail">
                <textarea class="text-area" rows="1" name="content" id="b_content"
                placeholder="내용을 입력하세요." oninput="autoResize(this)"></textarea>
               	<div class="image-container"></div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
    
    function readURL(input) {
        if (input.files && input.files.length > 0) {
        	var previewContainer = $(".image-container");
            for( var i = 0; i < input.files.length; i++ ) {
            	var reader = new FileReader();
            	reader.onload = function(e) {
            		var img = $('<div class="image-container"><img src="' + e.target.result + '" class="preview-image" id="b_file"><button class="delete-button" onclick="deleteImage(this)">X</button></div>');
            		
            		previewContainer.append(img);
            	};
            	reader.readAsDataURL(input.files[i]);
            }
        }
    }

    function deleteImage(button) {
        $(button).parent('.image-container').remove();
    }

    function autoResize(textarea) {
        textarea.style.height = 'auto';
        textarea.style.height = (textarea.scrollHeight) + 'px';
    }
    
	function testBoard() {
		
	var u_no;
	var selectElement  =  $(".board-select");
	var bt_no  =  selectElement.val();
	var b_title = $("#b_title").val();
	var b_content = $("#b_content").val();
	
	
	if(bt_no == "NO") {
		alert("게시판 종류를 선택해주세요.");
		return false;
	}
	
	if(b_title == '' ) {
		alert("제목을 입력하여주세요.");
		return false;
	}
	
	 
	if ('${loginVo.u_no}' != null ) {
		u_no  =  '${loginVo.u_no}';
	} else {
		u_no  =  '${cookieVo_u_no}';
	}
	
	 var formData = new FormData();
	    formData.append('u_no', u_no);
	    formData.append('bt_no', bt_no);
	    formData.append('b_title', b_title);
	    formData.append('b_content', b_content);
	    
	    var fileData  =  new FormData();
	    var files = $("#file")[0].files;
	    for (var i = 0; i < files.length; i++) {
	        
	        fileData.append('b_file', files[i]); // 파일 자체를 추가합니다.
	    }
	   		fileData.append('b_content', b_content);
	   		for (var i = 0; i < files.length; i++) {
	   		    console.log("File Name: " + files[i].name);
	   		}
	   		
	$.ajax({
		url : "/Board/TestBoard",
		method : "POST",
		data : formData,
		contentType : false,
        processData: false,
		success : function() {
			
			$.ajax({
				url : "/Board/TestFileInsert",
				method : "POST",
				data : fileData,
				contentType : false,
		        processData: false,
				success : function() {
					
				},
				error : function() {
					console.error("ERROR", error);
				}
			});				
			alert('게시물 등록이 완료되었습니다.');
			location.href="/Board/ListPage?bt_no=1";
		},
		error : function() {
			console.error("ERROR", error);
		}
	});
}
	
	function Board() {
		
		var u_no;
		var selectElement  =  $(".board-select");
		var bt_no  =  selectElement.val();
		var b_title = $("#b_title").val();
		var b_content = $("#b_content").val();
		
		
		if(bt_no == "NO") {
			alert("게시판 종류를 선택해주세요.");
			return false;
		}
		
		if(b_title == '' ) {
			alert("제목을 입력하여주세요.");
			return false;
		}
		
		 
		if ('${loginVo.u_no}' != null ) {
			u_no  =  '${loginVo.u_no}';
		} else {
			u_no  =  '${cookieVo_u_no}';
		}
		
		 var formData = new FormData();
		    formData.append('u_no', u_no);
		    formData.append('bt_no', bt_no);
		    formData.append('b_title', b_title);
		    formData.append('b_content', b_content);
		    
		    var fileData  =  new FormData();
		    var files = $("#file")[0].files;
		    for (var i = 0; i < files.length; i++) {
		        
		        fileData.append('b_file', files[i]); // 파일 자체를 추가합니다.
		    }
		   		fileData.append('b_content', b_content);
		   		for (var i = 0; i < files.length; i++) {
		   		    console.log("File Name: " + files[i].name);
		   		}
		   		
		$.ajax({
			url : "/Board/WriteBoard",
			method : "POST",
			data : formData,
			contentType : false,
	        processData: false,
			success : function() {
				
				$.ajax({
					url : "/Board/FileInsert",
					method : "POST",
					data : fileData,
					contentType : false,
			        processData: false,
					success : function() {
						
					},
					error : function() {
						console.error("ERROR", error);
					}
				});				
				alert('게시물 등록이 완료되었습니다.');
			},
			error : function() {
				console.error("ERROR", error);
			}
		});
	}
	
	
    
</script>
</body>

</html>