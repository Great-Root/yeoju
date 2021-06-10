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
	<div class="container">
		
		<div class="row" style="padding: 40px;">
		<table class="table col" >
			<thead>
				<tr align="center" >
					<th><a href="adminlist">admin</a></th>
					<th><a href="memmanagement">회원 관리</a></th>
					<th><a href="commanagement">커뮤니티 관리</a></th>
					<th><a href="statistic">통계</a></th>
				</tr>
			</thead>
		</table>
		</div>
		<div class="row" >
				<table class="table table-striped col" style="margin-right: 50px; padding:5 5 5 5px; width:20%;" >
					<tbody>
						<tr>
							<th><a href="adminlist">관리자 목록</a></th>
						</tr>
						<tr>
							<th><a href="adminjoin">관리자 계정 생성/삭제</a></th>
						</tr>
						<tr>
							<th><a href="adminmodify">관리자 계정 수정</a></th>
						</tr>
					</tbody>
				</table>
				 <div class="col">	<h6 align="center">계정 삭제</h6></div>
						<div class="dropdown">
				  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
				    	계정 선택
				  </button>
				  
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				   	<c:forEach var="dto" items="${admindel}">
	
				   		 <li><a class="dropdown-item" href="#">${dto.id }</a></li>
				 
				    </c:forEach>
				    	<li><a class="dropdown-item" href="#">얘</a></li>
				       <li><a class="dropdown-item" href="#">Another action</a></li>
				  </ul>
				</div>
			</div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>