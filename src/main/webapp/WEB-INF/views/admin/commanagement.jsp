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
		<label class="col" >Q&A</label>
		<table class="col" style="float: left;">
		<tr><th><a href="commanagement">Q&A</a></th><th><a href="commanagementann">공지사항</a></th></tr>
		</table></div>
		<table class="table table-striped col" >
					<thead>
						<tr>
							<th>아이디</th>
							<th>등록일</th>
							<th>최근 활동일</th>
							<th>최근 활동</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>John</td>
							<td>Doe</td>
							<td>john@example.com</td>
							<td>john@example.com</td>
							<td>john@example.com</td>
						</tr>
						<tr>
							<td>Mary</td>
							<td>Moe</td>
							<td>mary@example.com</td>
							<td>john@example.com</td>
							<td>john@example.com</td>
							
						</tr>
						<tr>
							<td>July</td>
							<td>Dooley</td>
							<td>july@example.com</td>
							<td>john@example.com</td>
							<td>john@example.com</td>
						</tr>
					</tbody>
				</table>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>