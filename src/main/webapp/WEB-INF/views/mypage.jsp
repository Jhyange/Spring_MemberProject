<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img src=/resources/${dto.imagepath} width="50px" height="50px">
	<br> ${dto.id}
	<br> ${dto.name}
	<br> ${dto.phone} - ${dto.phone1}- ${dto.phone2}
	<br> ${dto.email}
	<br> ${dto.post}
	<br> ${dto.address1}
	<br> ${dto.address2}
	<br>

</body>
</html>