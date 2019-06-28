<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	background-color: bisque;
	width: 600px;
	height: auto;
	margin-top: 20px;
	padding: 20px;
}

#btn {
	text-align: center;
}

#wrapper {
	width: 100%;
	height: 100%;
	float: left;
}

#checkpwbox {
	width: 50%;
	height: 50%;
	float: left;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>

</head>
<body>

	<center>
		<table>
			<tr>
				<th colspan="2">회원가입정보
			</tr>

			<tr>
			<tr>
		<form action="Joinproc1" method="post" enctype="multipart/form-data" id="form">
				<td class="menu">프로필사진
				<input type=file name="image" id="imageInp"></td>
			</tr>
		<tr>
				<td><img id="newImg" src="#" alt="프로필 이미지 미설정" width="50px"
					height="60px" />
					<td>
			</tr>
			
			<tr><td>
			</tr>
			<script>
				function readURL(input) {
					if (input.files && input.files[0]) {
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

			<td>★아이디

				<td><input type="text" id="id" name="id" required
				placeholder="영대소문자 및 숫자 포함 5글자이상" flag="false" regexflag="false">
				<!-- <input type="button"
						id="idcheck" value="중복확인" flag="false">  -->
				<p id="idresult"></p> <!-- 아이디 중복확인 ajax --> <script>
					$("#id").on("input", function() {
						var idtestString = $("#id").val();
						var regex = /^[A-Za-z0-9]{5,}$/g;
						var result = regex.exec(idtestString);
						if (result == null) {
							$("#id").attr("regexflag", "false");
							$("#idresult").html("조건을 충족시켜주세요");

						} else {
							$("#id").attr("regexflag", "true");
							$.ajax({
								url : "idajax.do",
								type : "post",
								data : {
									id : $("#id").val()
								}
							}).done(function(resp) {
								console.log(resp);
								if (resp == "true") {
									$("#idresult").html("중복된아이디");
									$("#id").attr("flag", "false");
								} else {
									$("#idresult").html("사용가능한아이디");
									$("#id").attr("flag", "true");
								}
							})

						}
					})
				</script></tr>
			
			<tr>
				<td>★ 비밀번호
				
				<td><input type="password" id="pw" name="pw"
					placeholder="비밀번호8글자이상 입력하시오">
			
			</tr>
			<tr>
				<td>★비밀번호 확인
				
				<td><div id="wrapper">
						<div id="checkpwbox">
							<input type="password" id="checkpw" required>
						</div>
						<div id="result" flag="false"></div>
					</div>
			
			</tr>
			<tr>
				<td>★ 이름
				
				<td><input type="text" name="name" required id="name">
			
			</tr>
			<tr>
				<td>전화번호
				
				<td><input type="text" name="phone" id="phone"> -<input type="text" name="phone1" id="phone1">
			<input type="text" name="phone2" id="phone2">
			</tr>
			<tr>
				<td>이메일
				
				<td><input type="text" name="email" id="email">
			
			</tr>
			<tr>
					<td>우편번호
					<td><input type="text" id="postcode" placeholder="우편번호"
						readonly name="post" readonly> <input type="button"
						value="찾기" id="search"><br>
				</tr>
				<tr>
					<td>주소 1</td>
					<td><input type="text" id="address1" placeholder="주소" readonly
						name="address1" readonly></td>
				</tr>
				<tr>
					<td>주소 2</td>
					<td><input type="text" id="address2" placeholder="상세주소"
						name="address2"></td>
				</tr>
			<tr>
				<td colspan="2" id="btn"><input type="button" id="join"
					value="회원가입">
					<button>다시입력</button> <input type=button id="back" value="돌아가기">
			
			</tr>

		</table>
	</center>
	</form>

	<script>
		document.getElementById("back").onclick = function() {
			location.href = "index.member";
		}
	</script>
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
	<script>
		$("#join")
				.on(
						"click",
						function() {
							if ($("#id").attr("flag") == "true"
									&& $("#id").attr("regexflag") == "true") {
								var pwtestString = $("#checkpw").val();
								var regex = /^[0-9a-zA-z]{8,}$/g;
								var result = regex.exec(pwtestString);
								console.log(result);
								if (result == null) {
									alert('비밀번호조건을 다시 충족시켜주세요');
								} else {
									if ($("#result").attr("flag") == "true") {
										var nametestString = $("#name").val();
										var regex = /^[A-Za-z0-9가-힇]+$/g;
										var result = regex.exec(nametestString);
										console.log(result);
										if (result == null) {
											alert('이름 입력 조건을 충족시키시오');
										} else {

											var phoneString = $("#phone1").val();
												
											var regex = /^[0-9]{3,4}$/g;
											var result = regex
													.exec(phoneString);
											console.log(result);
											if (result == null) {
												alert('번호 조건을 확인하시오');
											} else {
												var emailString = $("#email").val();
													
												var regex = /^[a-z]\w+@[A-Za-z0-9]+(\.[A-za-z0-9]+)+$/g;
												var result = regex.exec(emailString);
												console.log(result);
												if (result == null) {
													alert('메일 조건을 확인하시오');
												} else {
													if ($("#address1").val() != null &&$("#address2").val() != null)
														$("#form").submit();
												}
											}

										}

									}
								}

							} else {
								alert('사용불가능한아이디입니다 조건을 확인하시오');
							}
						})
	</script>


	<!-- window.open으로 idcheck
		<script>
		document.getElementById("idcheck").onclick = function() {
			window.open("IdDubleCheck?id=" + $("#id").val(), "",
					"width=500px,height=100px");
		}
	</script>
 -->
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