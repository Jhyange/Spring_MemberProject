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
	overflow: hidden;
}

#wrapper {
	width: 800px;
	height: 800px;
	border: 1px solid gray;
}

#title {
	width: 100%;
	height: 7%;
	text-align: center;
	padding: 20px;
	float: left;
}

#contents {
	width: 100%;
	height: 85%;
	float: left;
	border: 1px solid black;
}

#btn {
	width: 100%;
	height: 8%;
	text-align: right;
	box-sizing: border-box;
	margin-right: 15px;
	float: left;
}

#btn1 {
	width: 93%;
	height: 100%;
	float: left;
	box-sizing: border-box;
	float: left;
	margint-top: 0px;
}

#contents {
	padding: 20px;
	text-align: left;
}

#update, #del, #list {
	margin-top: 10px;
	background-color: bisque;
	border: 0;
	outline: 1;
}

#update {
	margin-left: 15px;
}

#titletext {
	width: 100%;
	height: 100%;
}

#reply {
	margin-top: 30px;
	width: 800px;
	border: 1px solid black;
}

#replytextbox {
	width: 100%;
	border: 1px solid black;
}

#replytext {
	width: 90%;
	margin-right: 15px;
}

#replydel {
	border: 0;
	outline: 1;
}
</style>
</head>
<body>
	<center>
		<form action="WriteProc" id="form">
			<div id="wrapper">
				<div id="title">
					
				${list.title}
				
				</div>
				<div id="contents">${list.context}</div>
				
				<div id="btn">
					<input type="button" value="목록" id="list">
					<c:choose>
					<c:when test="${list.writer eq id}"> <input type="button" value="삭제" id="del">
					</c:when>
						<c:otherwise>  </c:otherwise>
					</c:choose>
				</div>
			</div>
		</form>

	</center>

	<script>
		document.getElementById("list").onclick = function() {
			location.href = "board";
		}
		
	
	</script>
</body>
</html>