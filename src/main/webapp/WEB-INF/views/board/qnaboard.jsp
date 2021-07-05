<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<style type="text/css">
.container
width: 50%;
height: 50%;
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
<div  class="container">
	<c:if test="${grade !=1 }">
	<h3>QNA 게시판</h3></c:if>
		<table class="table table-striped col" >
					<thead>
						<tr style="background-color: #4CAF50;">
							<th>No.</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody  style="background-color: white;">
				<c:if test="${QnABoardList.size() == 0 }">
						<tr> <th colspan="6">저장 데이터 없음</th> </tr>
					</c:if>
					<c:forEach var="dto" items="${QnABoardList }">
					<tr>
						<td>${dto.writeNo }</td>
					    <td><a href="qnaview?writeNo=${dto.writeNo }">${dto.title }</a></td>
						<td>${dto.userid }</td> 
						<td>${dto.saveDate }</td> 
					</tr>
					</c:forEach>	
						<tr align="right">
							<c:choose>
								<c:when test="${grade == 1 }">
								<td colspan="4">
									<c:forEach var="qnanum" begin="1" end="${repeat3 }">
										<a href="commanagement?qnanum=${qnanum }">${qnanum}</a>
									</c:forEach>
									</td>
								</c:when>	
								<c:otherwise >
								<td colspan="4" >
									<c:forEach var="qnanum" begin="1" end="${repeat3 }">
										<a href="qnaBoardView?qnanum=${qnanum }">${qnanum}</a>
									</c:forEach>
									<a href="${contextPath }/member/writeForm">QnA작성</a>
								</td>
								</c:otherwise>
							</c:choose>
						</tr>
				
					</tbody>
				</table>
				</div>
</body>
</html>