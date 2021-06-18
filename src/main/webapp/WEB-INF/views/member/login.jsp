<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#find_id_btn").click(function(){
			location.href="${contextPath }/member/find_id_form.do";
		})
		$("#find_pw_btn").click(function(){
			location.href="${contextPath }/member/findpw";
		})
	})

</script>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
		<div align="center">
		<h1 style="color: green; font-size: 30px;">로그인</h1>
		<form action="${contextPath }/member/user_check" method="post">
			<div class="mb-3" style="width: 300px;">
				<label style="text-align: left" for="exampleInputEmail1" class="form-label">아이디</label> 
				<input type="text" name="userId" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
			</div>
			
			<div class="mb-3" style="width: 300px;">
				<label for="exampleInputPassword1" class="form-label">비밀번호</label> 
				<input type="password" name="pw" class="form-control" id="exampleInputPassword1">
			</div>

			

			<div class="mb-3 form-check">
				<input type="checkbox" class="form-check-input" id="exampleCheck1">
				<label name="autoLogin" class="form-check-label" for="exampleCheck1">로그인 유지</label>
			</div>
			
			<button type="submit" style="size: 120px" class="btn btn-primary">로그인</button><br>
			
			<button type="button" id="find_id_btn" style="size: 60px" class="btn btn-primary">아이디 찾기</button>
			<button type="button" id="find_pw_btn" style="size: 60px" class="btn btn-primary">비밀번호 찾기</button>
			
		</form>
	</div>

	


</body>
</html>