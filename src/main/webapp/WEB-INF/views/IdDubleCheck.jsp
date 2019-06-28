<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
</head>
<body>
<div id="result"></div>
<input type="button" id="btn" value="확인">
	
	<script>	
 if (${idcheck} == true) {
	document.getElementById("result").innerHTML="${id} 는 사용불가합니다.";

	} else {
	document.getElementById("result").innerHTML="${id} 는 사용가능합니다.";
	}
	</script>
	
<script>
		document.getElementById("btn").onclick = function() {
			if (${idcheck}== true) {
				opener.document.getElementById("id").value = "";
			}else{
				opener.$("#id").prop("flag","true");
			}
			window.close();
		}
	</script>
</body>
</html>