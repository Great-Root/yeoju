<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
	<c:import url="../default/header.jsp" />
		<div align="center">
		<h1 style="color: green; font-size: 30px;">아이디 찾기</h1>
		<form action="${contextPath }/member/find_id.do" method="post">
			<div class="mb-3" style="width: 300px;">
				<label style="text-align: left" for="exampleInputEmail1" class="form-label">Email</label> 
				<input type="text" name="email" class="form-control" id="email" required aria-describedby="emailHelp">
			</div>
			
			<button type="submit" style="size: 120px" class="btn btn-primary">아이디 찾기</button><br>
			
		</form>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>