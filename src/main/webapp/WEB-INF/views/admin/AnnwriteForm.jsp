<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<c:import url="../default/header.jsp" />
		<div class="wrap">
	<div style="width:400px; margin: 0 auto;">
	<form action="${contextPath }/admin/writeSave" method="post" enctype="multipart/form-data">
		<b>작성자</b><br>
		<input type="text" name="id" size="50" value="${loginUser }" readonly>
		<hr>
		<b>제목</b><br>
		<input type="text" size="50" name="title" ><hr>
		<b>내용</b><br>
		<textarea rows="10" cols="50" name="content"></textarea>
		<hr>
		<input type="submit" value="글쓰기">
		<input type="button" value="목록이동"
			onclick="location.href='${contextPath}/admin/commanagementann'">
	</form>
	</div>
</div>
		
	
	<c:import url="../default/footer.jsp" />
</body>
</html>