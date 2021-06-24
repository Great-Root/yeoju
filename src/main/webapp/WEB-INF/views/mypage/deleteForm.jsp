<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/member/modify.css" rel="stylesheet" />
</head>
<body>
<c:import url="../default/header.jsp" />
	<div class="form">
      <form action="${contextPath }/mypage/delete.do" method="post">
			<table>
				<tr>
					<h1 style="color: green; font-size: 30px; text-align: center;">회원탈퇴</h1>
				</tr>
				<tr>
					<td>아이디&nbsp;&nbsp;&nbsp;<input size="40" type="text" name="userId" value="${deleteInfo.userId}" readonly="readonly"><br>
						비밀번호<input size="40" type="password" name="pw" placeholder="비밀번호를 입력하시면 탈퇴됩니다."><br> 
						<div align="right">
							<input type="submit" value="회원탈퇴"> 
							<input type="button" value="취소" onclick="javascript:window.location='${contextPath }/'">
						</div>
					</td>
				</tr>
			</table>
		</form>
   </div>
<c:import url="../default/footer.jsp" />
</body>
</html>