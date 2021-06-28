<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<c:import url="../default/header.jsp"/>
<div class="wrap">
<div style="width:300px; margin: 0 auto;">
<form action="${contextPath }/admin/modify" enctype="multipart/form-data" method="post">
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