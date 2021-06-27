<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/member/login.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>로그인</title>
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
		<form action="${contextPath }/member/user_check" method="post">
			<div class="login-page">
			<div class="form">
			<a href="${contextPath}/">
			<img src="../../resources/img/test.png" width="110px" height="140px">
			</a>
			<h1 style="color: green; font-size: 30px;">login</h1>
			<div>
				<input type="text" name="userId" class="form-control" id="exampleInputEmail1" required aria-describedby="emailHelp" placeholder="ID">
			</div>
			
			<div>
				<input type="password" name="pw" class="form-control" id="exampleInputPassword1" required aria-describedby="emailHelp" placeholder="Password">
			</div>
			
				<div>
				<label style="white-space:nowrap;"><input type="checkbox" style="width: 15px; height: 15px;" name="autoLogin">로그인 유지</label>
				<!--  <label name="autoLogin" class="form-check-label" for="exampleCheck1">로그인 유지</label> -->
				</div>
			
			<button type="submit" style="size: 120px" class="btn btn-primary">로그인</button><br>
			
			<button type="button" id="find_id_btn" style="size: 60px" class="btn btn-primary">아이디 찾기</button>
			<button type="button" id="find_pw_btn" style="size: 60px" class="btn btn-primary">비밀번호 찾기</button>
			<button type="button" onclick="javascript:window.location='${contextPath }/'" >취소</button>
			</div>
			</div>
		</form>
	</div>

	


</body>
</html>