<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<link rel="shortcut icon" href="${contextPath}/resources/img/여주favicon.png" type="image/png">
<link rel="icon" href="${contextPath}/resources/img/여주favicon.png" type="image/png">
</head>
<body>
	<c:import url="../default/header.jsp" />
	<h3>공지사항 게시판</h3>
	<c:import url="../board/annboard.jsp" />	

	<c:import url="../default/footer.jsp" />
</body>
</html> 