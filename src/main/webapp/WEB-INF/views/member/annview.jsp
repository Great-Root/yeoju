<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<link rel="shortcut icon" href="${contextPath}/resources/img/여주favicon.png" type="image/png">
<link rel="icon" href="${contextPath}/resources/img/여주favicon.png" type="image/png">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
	integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
	crossorigin="anonymous"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<c:import url="../default/header.jsp" />
	<div class="container">
		<h3>공지사항 게시판</h3>
		<div class="row" style="padding: 40px;">
		<table class="table table-bordered row">
	<tr>
		<th>글 번호</th><td>${personalData.writeNo }</td>
		<th>작성자</th><td>${personalData.userid }</td>
	</tr>
	<tr>
		<th>제 목</th><td>${personalData.title }</td>
		<th>작성일</th><td>${personalData.saveDate }</td>
	</tr>

	<tr>
		<th>내 용</th><td colspan="3">${personalData.content }</td>

		<tr>
		<td colspan="4" align="center">
			<c:choose>
			<c:when test="${personalData.userid==loginUser}">
			<form action="${contextPath }/member/QnABoardDelete" method="post">
			 <input type="hidden" name="writeNo" value="${personalData.writeNo}"> 
			<input type="submit" value="삭제하기" class="b btn btn-outline-secondary col"></form>
			</c:when></c:choose>
			<input type="button" class="b btn btn-outline-success col" onclick="location.href='${contextPath }/member/annBoardView'" value="리스트로 돌아가기">
		</td>
	</tr>
		</table>

		</div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html> 