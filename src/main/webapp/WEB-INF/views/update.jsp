<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
</head>
<body>

	<form action="updateform" method="post" id="form">
		<img src="/resources/${result.imagepath}" width="150px" height="150px">
		<br> <input type=hidden value="${result.id}" name=id> 
		<table border="1">
		<tr>
		<td>
		★
		비밀번호</td><td> <input type="password" id="pw" name="pw"
			placeholder="비밀번호8글자이상 입력하시오"> </td>
			</tr>
			
			<tr>
			<td>
			★비밀번호 확인
</td><td>
		<div id="wrapper">
			<div id="checkpwbox">
				<input type="password" id="checkpw" required>
			</div>
			<div id="result" flag="false"></div>
		</div>
</td>
</tr>
<tr>
<td>
		이름</td><td> <input type=text value="${result.name}" name=name id="name"><br>
	</td>
	</tr>
	<tr><td>
		전화번호 </td><td><input type=text value="${result.phone}" name=phone id="phone">
		
		- <input type=text value="${result.phone1}" name=phone1 id=phone1>
		- <input type=text value=" ${result.phone2}" name=phone2 id="phone2">
		</td>
		</tr>
		<tr>
		<td>이메일</td><td><input type=text value="  ${result.email}" name=email id="email"><br>
		</td>
		</tr>
		
		<tr><td>주소</td><td><input type=text value="  ${result.post}" name=post id="postcode">
		
		<input type="button" value="찾기" id="search">
		 <input
			type=text value=" ${result.address1}" name=address1 id="address1">
		
		
		<input type=text value="  ${result.address2}" name=address2 id=""></td>
		</tr>
		</table>
		<input type="submit" id="updateinfo" value="수정">
	</form>
	<!-- 비밀번호 일치 불일치  -->
	<script>
		document.getElementById("checkpw").oninput = function() {
			var pw1 = document.getElementById("pw").value;
			var pw2 = document.getElementById("checkpw").value;

			if (pw1 == pw2) {
				document.getElementById("result").innerHTML = "패스워드일치";
				result.style.color = "green";
				$("#result").attr("flag", "true");
			}

			else {
				document.getElementById("result").innerHTML = "불일치";
				result.style.color = "#e66178";
				$("#result").attr("flag", "flase");
			}
		}
	</script>

	<!--회원가입  -->




	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		document.getElementById("search").onclick = searchAddress;

		function searchAddress() {
			new daum.Postcode(
					{
						oncomplete : function(data) {

							var roadAddr = data.roadAddress;
							var extraRoadAddr = '';

							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}

							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}

							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							document.getElementById("postcode").value = data.zonecode;
							document.getElementById("address1").value = roadAddr;

							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}
							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>
</body>
</html>