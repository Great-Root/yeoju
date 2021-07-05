<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="shortcut icon" href="resources/img/여주favicon.png" type="image/png">
<link rel="icon" href="resources/img/여주favicon.png" type="image/png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/member/modify.css" rel="stylesheet" />
</head>
<body>
<c:import url="../default/header.jsp" />
	<div class="form">
      <form action="${contextPath }/mypage/delete.do" method="post">
			<h1 style="color: green; font-size: 30px; text-align: center;">회원탈퇴</h1>
			<table>
				<tr>
					<td>
						탈퇴계정
					</td>
					<td align="center">
						<h5>${deleteInfo.userId}</h5> 
					</td>
				</tr>
				<tr>
					<td>
						비밀번호
					</td>
					<td style="padding: 0 1em;">
						<input size="40" type="password" name="pw" placeholder="비밀번호를 입력하시면 탈퇴됩니다.">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right" style=" padding: 0 1em;">
						<input type="submit" class="btn btn-outline-danger" value="회원탈퇴" style="margin-right: 0.7em;"> 
						<input type="button" class="btn btn-outline-success" value="취소" onclick="javascript:window.location='${contextPath }/'">
					</td>
				</tr>
			</table>
		</form>
   </div>
<c:import url="../default/footer.jsp" />
</body>
</html>