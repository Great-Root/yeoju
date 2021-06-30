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
	<div  align="right"  style=" padding-right: 250px; ">
	<table  >
	<tr>
	<th>관리자 모드</th>
	<th><a href="/">쇼핑몰로 이동</a></th>
	</tr>
	</table></div>
	<div class="container">
		<div class="row" style="padding: 40px;">
		<table class="table col" >
			<thead>
				<tr  >
					<th><a href="adminlist">관리자 메뉴</a></th>
					<th><a href="memmanagement">회원 관리</a></th>
					<th><a href="commanagement">커뮤니티 관리</a></th>
				</tr>
			</thead>
		</table>
		</div>
		<h1>===${userId }회원님의 정보===</h1>
		<table class="table table-striped col" style="width: 80%;">
					<tbody>
							<c:forEach var="detaildto" items="${detailList }">
								<tr><th>이름</th><td>${detaildto.name }</td></tr>
								<tr><th>성별</th><td>	${detaildto.gender }
								<tr><th>생년월일</th><td>${detaildto.birth }</td></tr>
								<tr><th>우편번호</th><td>${detaildto.addr1 }</td> </tr>
								<tr><th>주소</th><td>${detaildto.addr2 }</td> </tr>
								<tr><th>상세주소</th><td>${detaildto.addr3 }</td> </tr>
								<tr><th>전화번호</th><td>${detaildto.tel }</td></tr>
							</c:forEach>
							<c:forEach var="dto" items="${memberInfo}"> 	
								
								<tr><th>이메일</th><td>${dto.email }</td></tr>
							</c:forEach> 
					</tbody>
				</table>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>