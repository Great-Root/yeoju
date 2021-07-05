<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<!DOCTYPE html>
<html>
<head>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<link rel="shortcut icon" href="${contextPath}/resources/img/여주favicon.png" type="image/png">
<link rel="icon" href="${contextPath}/resources/img/여주favicon.png" type="image/png">
<link href="${pageContext.request.contextPath}/resources/css/member/login.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "${contextPath}/member/findpw",
				type : "POST",
				data : {
					userId : $("#userId").val(),
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>

<title>비밀번호 찾기</title>
</head>
<body>
	<div class="login-page">
		<div class="form">
		<a href="${contextPath}/">
			<img src="${contextPath}/resources/img/여주.png" width="110px" height="140px">
		</a>
			<h1 style="color: green; font-size: 30px;">find Password</h1>
			<div>
				<div>
					<input type="text" id="userId" name="userId" placeholder="회원가입한 아이디를 입력하세요" required aria-describedby="emailHelp">
					<input type="text" id="email" name="email" placeholder="회원가입한 이메일주소를 입력하세요" required aria-describedby="emailHelp">
				</div>
				<div>
					<button type="button" id="findBtn">비밀번호 찾기</button>
					<button type="button" onclick="javascript:window.location='${contextPath }/member/login'" >로그인</button>
					<button type="button" onclick="javascript:window.location='${contextPath }/'" >취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>