<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
div {
	box-sizing: border-box;
	text-align: center;
	overflow: hidden;
}

#wrapper {
	width: 800px;
	height: 800px;
	border: 1px solid gray;
	margin: 20px;
}

#title {
	width: 100%;
	height: 6%;
	float: left;
	margin-bottom: 5px;
}

#write, #list {
	margin-top: 10px;
	background-color: bisque;
	border: 0;
	outline: 1;
}

#contents {
	width: 100%;
	height: 87%;
	float: left;
}

#btn {
	width: 100%;
	height: 7%;
	text-align: right;
}

#contents {
	text-align: right;
}

#titletext {
	width: 100%;
	height: 100%;
	padding: 10px;
}

textarea {
	width: 100%;
	height: 100%;
	padding: 10px;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
</head>
<body>
	<center>
		<form action="WriteProc" id="form" enctype="multipart/form-data"
			method="post">
			<div id="wrapper">
				<div id="title">
					<input type="text" placeholder="제목을 입력하시오" id="titletext"
						name="title"> 
				
				</div>
				<div id="contents">
				<img id="newImg" src="#" alt="프로필 이미지 미설정"
						width="50px" height="60px" />
					<textarea placeholder="내용을 입력하시오" name="context">
					
					
					</textarea>
				</div>
			
					<input type=file name="image" id="imageInp">
			
				<div id="btn">
					<input type="button" value="작성" id="write"> <input
						type="button" value="목록" id="list">
				</div>
			</div>
	</center>
	</form>
	<script>
		document.getElementById("write").onclick = function() {
			document.getElementById("form").submit();
		}
		document.getElementById("list").onclick = function() {
			location.href = "SelboardProc.board?currentPage=1";
		}
	</script>

	<script>
	function readURL(input) {
		if (input.files && input.files[0]) { //ajax를 사용해서 해당 controller에서 보내서 그 값을 reposne로 담아와서 
			                     //body부분은 divtextcontents로 바꿔서 그곳에 appen를 사요하여 이미지 태그 자체를 보낸다 
			                     //aop이용해서 board못들어오도록
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#newImg').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$("#imageInp").change(function() {
		readURL(this);
	});
	</script>
</body>
</html>