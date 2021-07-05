<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="shortcut icon" href="resources/img/여주favicon.png" type="image/png">
<link rel="icon" href="resources/img/여주favicon.png" type="image/png">
<link
	href="${pageContext.request.contextPath}/resources/css/member/modify.css"
	rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function daumPost() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 도로 명일 경우 R, 지번일 경우 J 의 값을 가지고 있다.
				console.log("data.userSelectedType : " + data.userSelectedType)
				console.log("data.roadAddress : " + data.roadAddress)
				console.log("data.jibunAddress : " + data.jibunAddress)
				console.log("data.zonecode(우편번호) : " + data.zonecode)
				addr = ""
				if (data.userSelectedType == 'R') {
					addr = data.roadAddress
				} else {
					addr = data.jibunAddress
				}
				$("[name=addr1]").val(data.zonecode)
				$("[name=addr2]").val(addr)
				$("[name=addr3]").attr("readonly", false);
				$("[name=addr3]").focus()
			}
		}).open();
	}

	$(function() {
		$("#modifyForm").submit(function() {
			var name_rule = /^[가-힝a-zA-Z]{2,}$/;
			var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var tel_rule = /^\d{2,3}\d{3,4}\d{4}$/;
			var birth_rule = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;

			if ($("#name").val() == null || $("#name").val() == "") {
				alert("이름을 입력해주세요.");
				$("#name").focus();
				return false;
			}
			if(!name_rule.test($("#name").val())){
				alert("이름 형식에 맞게 입력해주세요.");
				return false;
			}
			if ($("#pw").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			}else if($("#pw").val() !== $("#pw2").val()){
					alert("비밀번호가 다릅니다.");
					$("#pw").val("").focus();
					$("#pw2").val("");
					return false;
			} else if ($.trim($("#pw").val()) !== $("#pw").val() || $.trim($("#email").val()) !== $("#email").val()) {
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
			
			if ($("#tel").val() == null || $("#tel").val() == "") {
				alert("전화번호를 입력해주세요.");
				$("#tel").focus();
				return false;
			}
			if(!tel_rule.test($("#tel").val())){
				alert("전화번호 형식에 맞게 입력해주세요.");
				return false;
			}
			if ($("#email").val() == null || $("#email").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;
			}
			if(!email_rule.test($("#email").val())){
				alert("이메일을 형식에 맞게 입력해주세요.");
				return false;
			}
			if ($("#birth").val() == null || $("#birth").val() == "") {
				alert("생년월일을 입력해주세요.");
				$("#birth").focus();
				return false;
			}
			if(!birth_rule.test($("#birth").val())){
				alert("생년월일 형식에 맞게 입력해주세요.");
				return false;
			}
			
		});
	});
</script>

</head>
<body>
	<c:import url="../default/header.jsp" />
	<div class="form">
		<form id="modifyForm" action="${contextPath }/mypage/modify" method="post">
					<h1 style="color: green; font-size: 30px; text-align: center;">회원정보 수정</h1>
					<hr>
			<table>
				<tr>
					<td style="width: 70px;">
						아이디
					</td>
					<td>
						<h5>${modifyInfo.userId}</h5>
						<input size="40" type="hidden" name="userId" value="${modifyInfo.userId}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>
						이름
					</td>
					<td>
						<input type="text" id="name" name="name" size="40" value="${modifyInfo.name}">
					</td>
				</tr>
				<tr>
					<td>
						비밀번호
					</td>
					<td>
						<input type="password" id="pw" name="pw" size="40" placeholder="8자리 이상 입력해주세요">
					</td>
				</tr>
				<tr>
					<td>
						
					</td>
					<td>
						<input type="password" id="pw2" name="pw2" size="40" placeholder="확인을 위해 비밀번호를 다시 입력해주세요">
					</td>
				</tr>
				<tr>
					<td>
						Email
					</td>
					<td>
						<input type="email" size="40" id="email" name="email" value="${modifyInfo.email}">
					</td>
				</tr>
				<tr>
					<td>
						생년월일
					</td>
					<td>
						<input type="text" id="birth" name="birth" size="40" placeholder="ex)19960621" value="${modifyInfo.birth}"><br>
					</td>
				</tr>
				<tr>
					<td>
						전화번호
					</td>
					<td>
						<input type="text" id="tel" name="tel" size="40" placeholder="'-'없이 번호만 입력해주세요" value="${modifyInfo.tel}">
					</td>
				</tr>
				<tr>
					<td>
						성별
					</td>
					<td>
						<input type="radio" id="gender" name="gender" value="남" checked>
						남 <input type="radio" id="gender" name="gender" value="여">여
					</td>
				</tr>
				<tr>
					<td>
						우편번호
					</td>
					<td>
						<input id="addr1" name="addr1" readonly="readonly" value="${modifyInfo.addr1}">
						<input type="button" onclick="daumPost()" value="우편번호 검색">
					</td>
				</tr>
				<tr>
					<td>
						주소
					</td>
					<td>
						<input id="addr2" name="addr2" size="40px" readonly="readonly" value="${modifyInfo.addr2}">
					</td>
				</tr>
				<tr>
					<td>
						상세주소
					</td>
					<td>
						<input id="addr3" name="addr3" size="40px" readonly="readonly" value="${modifyInfo.addr3}">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="right">
							<input type="submit" class="btn btn-outline-success" value="정보수정완료" style="margin-right: 0.7em;"> 
							<input type="button" class="btn btn-outline-danger" value="회원 탈퇴" onclick="location.href='${contextPath}/mypage/delete/${modifyInfo.userId}'">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>