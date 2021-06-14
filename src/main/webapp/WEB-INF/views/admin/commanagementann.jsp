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
		<label class="col" >공지사항</label>
		<table class="col" style="float: left;">
		<tr><th><a href="commanagement">Q&A</a></th><th><a href="commanagementann">공지사항</a></th></tr>
		</table></div>
		<table class="table table-striped col" >
					<thead>
						<tr>
							<th>No.</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
					<!--<c:if test="${adminAnnBoardList.size() == 0 }">
						<tr> <th colspan="6">저장 데이터 없음</th> </tr>
					</c:if>
					<c:forEach var="dto" items="${adminAnnBoardList }">
					<tr>
						<td>${dto.writeNo }</td>
					    <td><a href="${contextPath }/board/contentView?writeNo=${dto.writeNo }">${dto.title }</a></td>
						<td>${dto.id }</td> 
						<td>${dto.saveDate }</td> 
						<td>${dto.hit }</td>
					</tr>
					</c:forEach>-->
						<tr>
							<td>1</td>
							<td>이누공</td>
							<td>아이디가져오기</td>
							<td>sysdate</td>
							<td>hit가져오는법연습해야징</td>
						</tr>
						
					</tbody>
				</table>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>