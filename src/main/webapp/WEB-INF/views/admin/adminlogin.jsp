<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
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
</head>
<body>
<c:import url="../default/header.jsp" />
		<div align="center">
		<h1 style="color: green; font-size: 30px;">관리자 로그인</h1>
		<form action="${contextPath }/admin/admin_check" method="post">
			<div class="mb-3" style="width: 300px;">
				<label style="text-align: left" for="exampleInputEmail1" class="form-label">아이디</label> 
				<input type="text" name="id" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
			</div>
			
			<div class="mb-3" style="width: 300px;">
				<label style="text-align: left" for="exampleInputPassword1" class="form-label">비밀번호</label> 
				<input type="password" name="pw" class="form-control" id="exampleInputPassword1">
			</div>

			<c:if test="${result == 1 }">
				<div>ID 또는 비밀번호 틀림</div>
			</c:if>
			
			<button type="submit" style="size: 120px" class="btn btn-primary">로그인</button><br>
		</form>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>