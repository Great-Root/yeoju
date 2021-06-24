<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../default/header.jsp" />
		<h3>로그인 성공 (관리자${loginUser }님 환영합니다)</h3>
		<h5>*주의* 쇼핑몰로 이동 누를시 로그아웃</h5>
		<c:forEach var="dto" items="${adminList}">
		  
		</c:forEach>
		<button onclick="javascript:location.href='adminlist'">관리자 페이지로 이동</button>
	<c:import url="../default/footer.jsp" />
</body>
</html>