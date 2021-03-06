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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<c:import url="../default/header.jsp" />
	<c:choose>
					  <c:when test="${grade !=1}">
						<h1>관리자 전용 페이지 입니다</h1>
					 </c:when>
					  <c:otherwise>	
	<div  align="right"  style=" padding-right: 250px; ">
	<table  >
	<tr>
	<th>관리자 모드</th>
	<th><a href="logout">쇼핑몰로 이동</a></th>
	</tr>
	</table></div>
	<div class="container">
		<div class="row" style="padding: 40px;">
		<table class="table col" >
			<thead>
				<tr align="center" >
					<th><a href="adminlist">관리자 메뉴</a></th>
					<th><a href="memmanagement">회원 관리</a></th>
					<th><a href="commanagement">커뮤니티 관리</a></th>
				</tr>
			</thead>
		</table>
		</div>
		
		<table class="table table-striped col" style="margin-right: 50px; padding:5 5 5 5px; width:500px;" >
			<tbody>
					<tr>
						<th><a href="adminlist">관리자 목록</a></th>
						<th><a href="adminjoin_form">관리자 계정 생성/삭제</a></th>
						<th><a href="adminmodify_form">관리자 계정 수정</a></th>
					</tr>
			</tbody>
		</table>
		<div class="row" >
				<div style="width: 650px">
				<table class="table table-striped col" >
					<thead style="background-color: #4CAF50;">
						<tr>
							<th>아이디</th>
							<th style="min-width: 100px;">등록일</th>
							<th>최근 활동일</th>
							<th>최근 활동</th>
							<th>전화번호</th>
						</tr>
					</thead>
					<tbody>
				<c:forEach var="dto" items="${adminList}">
						<tr>	
							<td>${dto.id }</td> 
							<td>${dto.regDate }</td>
							<td>${dto.recentDate }</td>
							<td>${dto.recentAct }</td>
							<td>${dto.tel }</td>
						</tr>
			</c:forEach> 
					</tbody>
				</table>
				</div>
			</div>
	</div>
	</c:otherwise></c:choose>
	<c:import url="../default/footer.jsp" />
</body>
</html>