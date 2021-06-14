<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 완료</title>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
	<c:import url="../default/header.jsp" />
		<h3>로그인 성공 (${loginUser }님 환영합니다)</h3>
		<a href="../">메인 페이지로 이동</a>
	<c:import url="../default/footer.jsp" />
</body>
</html>