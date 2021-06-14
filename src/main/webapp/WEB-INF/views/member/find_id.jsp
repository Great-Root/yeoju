<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

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
	<c:import url="../default/header.jsp" />
		<div align="center">
		<h1 style="color: green; font-size: 30px;">등록된 아이디</h1>
		<form action="${contextPath }/member/find_id.do" method="post">
		
			<h5>
					${ userId }
			</h5>
				
			<button type="button" id="loginBtn" >Login</button>
			
		</form>
	</div>
	<c:import url="../default/footer.jsp" />

</body>
</html>