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
				<tr align="center" >
					<th><a href="adminlist">관리자 메뉴</a></th>
					<th><a href="memmanagement">회원 관리</a></th>
					<th><a href="commanagement">커뮤니티 관리</a></th>
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
							<th><a href="adminjoin_form">관리자 계정 생성/삭제</a></th>
						</tr>
						<tr>
							<th><a href="adminmodify_form">관리자 계정 수정</a></th>
						</tr>
					</tbody>
				</table>
				 <div class="col">	<h6 align="center">계정 삭제</h6></div>
						<div class="dropdown ">
				  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
				    	계정 선택
				  </button>
				  
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					
				   	  <li><a class="dropdown-item" href="admindelete" >100</a></li>
				    <li><a class="dropdown-item" href="admindelete" >1200</a></li>
				    	<li><a class="dropdown-item" href="admindelete" >1300</a></li>
				    	<li><a class="dropdown-item" href="admindelete" >4100</a></li>
				    		
				  </ul>
				</div>
			</div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>