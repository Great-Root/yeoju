<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
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
		<div class="wrap">
	<div style="width:400px; margin: 0 auto;">
	<form action="${contextPath }/member/writeSave" method="post" enctype="multipart/form-data">
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
			onclick="location.href='${contextPath}/member/qnaview'">
	</form>
	</div>
</div>


	<c:import url="../default/footer.jsp" />
</body>
</html> 