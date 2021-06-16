<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾은 결과 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
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
		<div align="center">
		<h1 style="color: green; font-size: 30px;">등록된 아이디</h1>
		<form action="${contextPath }/member/find_id.do" method="post">
		
			<h5>
					${ userId }
			</h5>
				
			<button type="button" id="loginBtn" class="btn btn-primary">Login</button>
			<button type="button" onclick="javascript:window.location='${contextPath }/'" class="btn btn-primary">Cancel</button>
			
		</form>
	</div>

</body>
</html>