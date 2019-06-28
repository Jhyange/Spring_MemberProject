<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>webchat</title>
<style>
div{
border:1px solid black;
box-sizing:border-box;
}
.container{
width:400px;
height:500px;
margin:0 auto;

}
.contents{
width:100%;
height:85%;
overflow-y:auto;
}
.control{
width:100%;
height:15%;
box-sizing: border-box;
float:left;
}
.control>input[type=text]
{
height:100%;
width:80%;
box-sizing: border-box;
float:left;
}
.control>input[type=button]
{
height:100%;
width:20%;
box-sizing: border-box;
float:left;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
</head>
<body>
<div class="container">
<div class="contents"><br>
</div>
<div class="control">
<input type=text id="input">
<input type=button id="send" value="send">
</div>
</div>
<script>
var socket = new WebSocket("ws://192.168.60.8/WebSocket");

socket.onmessage = function(evt) {

	
	$(".contents").append(evt.data+"<br>"); 
}


$("#send").on("click", function() {

	var msg = $("#input").val();
	$("#input").val("");
	socket.send(msg);

})

$("#input").keydown(function(key) {

	if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
		var msg = $("#input").val();
		$("#input").val("");
		socket.send(msg);
	 
	}

});

</script>

</body>
</html>