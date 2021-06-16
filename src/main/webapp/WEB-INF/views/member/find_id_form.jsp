<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾는 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	
</script>
<script type="text/javascript">
</script>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
		<div align="center">
		<h1 style="color: green; font-size: 30px;">아이디 찾기</h1>
		<form action="${contextPath }/member/find_id.do" method="post">
			<div class="mb-3" style="width: 300px;">
				<label style="text-align: left" for="exampleInputEmail1" class="form-label">Email</label> 
				<input type="text" name="email" class="form-control" id="email" required aria-describedby="emailHelp">
			</div>
			
			<button type="submit" style="size: 120px" class="btn btn-primary">아이디 찾기</button><br>
			<button type="button" onclick="javascript:window.location='${contextPath }/'" class="btn btn-primary">취소</button>
		</form>
	</div>
</body>
</html>