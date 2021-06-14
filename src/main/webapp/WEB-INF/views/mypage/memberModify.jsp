<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
<c:import url="../default/header.jsp" />
   <div style="width:700px; margin: 0 auto;">
      <form action="${contextPath }/mypage/memberModify" method="post">
			<table>
				<tr>
					<h1 style="color: green; font-size: 30px;">회원정보 수정</h1>
				</tr>
				<tr>
					<td>아이디&nbsp;&nbsp;&nbsp;<input size="30" type="text"	name="userId" value="${modifyInfo.userId}" readonly="readonly"><br>
						이름<input type="text" name="name" value="${modifyInfo.name}"> <br> 
						비밀번호<input size="30" type="password" name="pw" placeholder="영문,숫자,특수문자 포함 6~15자"><br> 
						전화번호<input size="15" type="text" id="tel" name="tel" value="${modifyInfo.tel}">
						<input size="30px" type="submit" value="인증요청"> <br>
						Email<input type="email" name="email" value="${modifyInfo.email}"> <br>
						주소(시/도)<input type="text"	name="addr1" value="${modifyInfo.addr1}"> <br>
						주소(동/면)<input	type="text" name="addr2" value="${modifyInfo.addr2}"><br>
						주소(상세주소)<input type="text" name="addr3" value="${modifyInfo.addr3}"> <br>
						성별
						<div class="form-check">
							<input class="form-check-input" type="radio" name="M" id="flexRadioDefault1"> 
								<label class="form-check-label" for="flexRadioDefault1">
								남 
								</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="W" id="flexRadioDefault2" checked>
								<label class="form-check-label" for="flexRadioDefault2">
								여 
								</label>
						</div> <br>
						<input type="submit" value="정보수정완료"> 
						<input type="button" value="로그인" onclick="javascript:window.location='login'">
					</td>
				</tr>
			</table>
		</form>
   </div>
<c:import url="../default/footer.jsp" />
</body>
</html>