<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }" />
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
<c:import url="../default/header.jsp"/>
<div class="wrap">
<div style="width:300px; margin: 0 auto;">
<form action="${contextPath }/member/modify" enctype="multipart/form-data" method="post">
	<input type="hidden" name="writeNo" value="${personalData.writeNo }">
	글쓴이 <input type="text" value="${personalData.userid}"><hr>
	제목 <input type="text" size="30" name="title" value="${personalData.title}"><hr>
	내용 <textarea rows="5" cols="30" name="content">${personalData.content}</textarea>
	<input type="submit" value="수정">
	<input type="button" onclick="history.back()" value="돌아가기">
	</form>	
</div>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>




