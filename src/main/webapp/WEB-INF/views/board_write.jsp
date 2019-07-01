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
	border: 1px solid black;
}

#wrapper {
	width: 800px;
	height: 1000px;
	border: 1px solid gray;
	margin: 20px;
}

#title {
	width: 100%;
	height: 6%;
	float: left;
	margin: 0px;
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
	height: 17%;
	text-align: right;
}

#contents {
	box-sizing: border-box;
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

	<form action="WriteProc" id="form" enctype="multipart/form-data"
		method="post">
		<div id="wrapper">
			<div id="title">
				<input type="text" placeholder="제목을 입력하시오" id="titletext"
					name="title">

			</div>
			<div id="contents"contenteditable=true >
			

			</div>

			<div id="btn">
			<input type="hidden" value="" id="hidden" name="context">
				<input type="button" value="작성" id="write"> <input type=file
					name="image" id="imageInp">
			</div>
	</form>
	<script>
		document.getElementById("write").onclick = function() {
			$("#hidden").attr("value",$("#contents").html());
			document.getElementById("form").submit();
		}
	</script>

	<script>
		$("#imageInp")
				.on(
						"change",
						function() {
							var form = new FormData(document
									.getElementById("form"));
							$
									.ajax({
										url : "/asJson",
										type : 'post',
										data : form,
										contentType : false,
										processData : false,
										 type:"post",
										success : function(response) {
											/* var result=JSON.parse(response); */
											console.log(response.filename);
											$("#contents")		.append(
															"<img id='newImg' src=/resources"+response.filename+" alt='프로필 이미지 미설정' width='150px' height='160px'  >");
										
										},
										error : function(er) {
											alert(er);
										}
									});
						});
	</script>
</body>
</html>