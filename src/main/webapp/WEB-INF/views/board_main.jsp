<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>게시판</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<style>
div {
	box-sizing: border-box;
	text-align: center;
}

#text {
	width: 100%;
	height: auto;
	line-height: 850px;
	box-sizing: border-box;
}

#index, #write {
	background-color: bisque;
	margin: 5px;
	border: 0;
	outline: 1;
}

#top, #header {
	background-color: bisque;
}

#foot {
	text-align: right;
	padding: 0px;
}

</style>
</head>
<body>
	<div class="container border mt-5" id=wrapper>
		<header>
			<div class="row" id="top">
				<div class=" logo col-lg-12 col-md-12 col-sm-12">
					<b>B O A R D</b>
				</div>
			</div>
		</header>
		<navi>
		<div class="row" id="header">
			<div
				class=" logo col-lg-1 col-md-1 col-sm-1 col-1 order-lg-1 order-md-2 order-2">No</div>
			<div
				class=" logo col-lg-5 col-md-12 col-sm-12 col-12 order-lg-2 order-md-1 order-1">title</div>
			<div
				class="logo col-lg-1  col-md-5 col-sm-5 col-5 order-lg-3 order-md-3 order-3">writer</div>
			<div
				class=" logo col-lg-3 col-md-4 col-sm-4  col-4 order-lg-4 order-md-4 order-4">date</div>
			<div
				class=" logo col-lg-2 col-md-2 col-sm-2 col-2 order-lg-5 order-md-5 order-5">조회수</div>

		</div>
		</navi>
		<main>
		<div class="row">
			<div class="  col-lg-12 col-md-12 col-sm-12" id="text2">



				<c:forEach var="dto" items="${list}">
					<form action="SelcontentProc" id="form">
						<div class="row" id="listbox">
							<div
								class="  col-lg-1 col-md-1 col-sm-1 col-1 order-lg-1 order-md-2 order-2">
								<input type="hidden" value="${dto.seq}" name="seq" id="seq"
									readonly>
							</div>
							<div
								class=" col-lg-5 col-md-12 col-sm-12 col-12 order-lg-2 order-md-1 order-1 writetitle"
								name="title">
								<script>
									console.log("${dto.imgpath}")
								</script>


								<c:if test="${dto.imgpath !='null'}">
									<img src="/resources/${dto.imgpath}" width=50px height=50px>
								</c:if>
								${dto.title}




							</div>
							<div
								class=" col-lg-1  col-md-5 col-sm-5 col-5 order-lg-3 order-md-3 order-3"
								name="writer">${dto.writer}</div>
							<div
								class=" col-lg-3 col-md-4 col-sm-4  col-4 order-lg-4 order-md-4 order-4"
								name="writedate">${dto.now}</div>
							<div
								class="  col-lg-2 col-md-2 col-sm-2 col-2 order-lg-5 order-md-5 order-5"
								name="viewcount">${dto.viewcount}</div>
						</div>
					</form>
				</c:forEach>

			</div>
		</div>
		</main>
		
		<footer>
			<div class="row">
				<div class=" logo col-lg-12 col-md-12 col-sm-12" id="foot">
					<div id="navi">${navi}</div>
					<input type="button" value="글쓰기" id="write"><input
						type="button" value="메인" id="index">
						<input type="button" id="chat" >
					<script>
						document.getElementById("write").onclick = function() {
							location.href = "Writeboard";
						}
						document.getElementById("index").onclick = function() {
							location.href = "index";
						}
						$(".writetitle").on("click", function() {
							$(this).parent().parent().submit();
						})
						$("#chat").on("click", function() {
							window.open("chat", "",
							"width=500px,height=700px");
						})
					</script>
				</div>
			</div>
		</footer>
	</div>
	
	<script>
/* var socket=new WebSocket("ws://192.168.60.8/WebSocket");
socket.onmessage=function(evt){
	window.open("message?msg="+evt.data, "",
	"width=500px,height=300px");
	
	
}

$("#send").on("click",function(){
	
	var msg=$("#input").val();
	$("#input").val("");
	socket.send(msg);
}) */
</script>
	
</body>
</html>