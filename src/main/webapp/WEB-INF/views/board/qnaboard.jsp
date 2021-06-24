<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
				<c:if test="${QnABoardList.size() == 0 }">
						<tr> <th colspan="6">저장 데이터 없음</th> </tr>
					</c:if>
					<c:forEach var="dto" items="${QnABoardList }">
					<tr>
						<td>${dto.writeNo }</td>
					    <td><a href="qnaview?writeNo=${dto.writeNo }">${dto.title }</a></td>
						<td>${dto.userid }</td> 
						<td>${dto.saveDate }</td> 
						<td>${dto.hit }</td>
					</tr>
					</c:forEach>	
					<c:choose>
					<c:when test="${grade != 1 }">
					<tr>
						<td colspan="6" align="right">
							<a href="${contextPath }/member/writeForm">글작성</a>
						</td>
					</tr>
					</c:when>
				
					<c:otherwise>
					</c:otherwise></c:choose>
					</tbody>
				</table>
</body>
</html>