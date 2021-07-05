<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾은 결과 페이지</title>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<link rel="shortcut icon" href="${contextPath}/resources/img/여주favicon.png" type="image/png">
<link rel="icon" href="${contextPath}/resources/img/여주favicon.png" type="image/png">
<link href="${pageContext.request.contextPath}/resources/css/member/login.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='../member/login';
		})
	})
</script>
</head>
<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
		<div class="login-page">
		<div class="form">
		<a href="${contextPath}/">
			<img src="${contextPath}/resources/img/여주.png" width="110px" height="140px">
		</a>
		<h1 style="color: green; font-size: 30px;">find ID</h1>
		<form action="${contextPath }/member/find_id.do" method="post">
		
			<h5>
					${ userId }
			</h5>
				
			<button type="button" id="loginBtn" class="btn btn-primary">로그인</button>
			<button type="button" onclick="javascript:window.location='${contextPath }/'" class="btn btn-primary">취소</button>
			
		</form>
		</div>
	</div>

</body>
</html>