<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<c:choose>
<c:when test="${id eq null}">
"로그인" 
<form action="login" method="post">
<input type="text" placeholder="아이디를 입력하시오" name="id"><br>
<input type="text" placeholder="비밀번호를 입력하시오" name="pw"><br>
<input type="submit" value="로그인"> 
</form>
<input type="button" value="회원가입 " id="join">
${msg}
<script>
$("#join").on("click",function(){
	$(location).attr("href","joinform");
})

</script>
</c:when>
<c:otherwise>


${id}님 환영합니다 
<input type="button" value="update" id="update">
<input type="button" value="mypage " id="mypage">
<input type="button" value="board" id="board">
<input type="button" value="logout" id="logout">

<script>

$("input").on("click",function(){
	$(location).attr("href",$(this).val());
})
</script>

</c:otherwise>
</c:choose>
</body>
</html>