<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
.valid, .invalid { 
	font-size: 11px;
	font-weight: bold; 
}

.valid { color: green; }

.invalid { color: red; }	
</style>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>

</script>


</head>

<body>
<c:import url="../default/header.jsp" />
  <div align="center">
		<h1 style="color: green; font-size: 30px;">회원가입</h1>
		 <form action="${contextPath }/member/register" method="post">
		 
			<div class="mb-3" style="width: 300px;">
				<label style="text-align: left" for="exampleInputEmail1" class="form-label">아이디</label> 
				<input type="text" name="userId" class="form-control" id="userId" aria-describedby="emailHelp">
				<button type="button" id="btn-id" style="size: 60px" class="btn btn-primary">중복확인</button><br>
				<div class='valid'>아이디를 입력하세요. (영문 소문자, 숫자만 입력 가능)</div>
			</div>
			
			<div class="mb-3" style="width: 300px;">
				<label style="text-align: left" for="exampleInputPassword1" class="form-label">비밀번호</label> 
				<input type="password" name="pw" placeholder="영문,숫자,특수문자 포함 6~15자" class="form-control" id="exampleInputPassword1">
			</div>
			
			<div class="mb-3" style="width: 300px;">
				<label style="text-align: left" for="exampleInputPassword1" class="form-label">전화번호</label> 
				<input type="text" name="tel" class="form-control" id="exampleInputPassword1">
				<button type="button" style="size: 60px" class="btn btn-primary">인증요청</button>
			</div>

			
			
			<button type="submit" style="size: 60px" class="btn btn-primary">회원가입</button>
			<button type="button" onclick="javascript:window.location='login'" style="size: 60px" class="btn btn-primary">로그인</button><br>
			
			<a href="#">아이디 찾기</a>&nbsp;<a href="#">비밀번호 찾기</a>
		</form>
	</div>
<c:import url="../default/footer.jsp" />


	
</body>
</html>