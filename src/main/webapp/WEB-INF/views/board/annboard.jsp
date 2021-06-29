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
						</tr>
						
					</thead>
					<tbody>
					<c:if test="${AnnBoardList.size() == 0 }">
						<tr> <th colspan="6">저장 데이터 없음</th> </tr>
					</c:if>
					<c:forEach var="dto" items="${AnnBoardList }">
					<tr>
						<td>${dto.writeNo }</td>
					    <td><a href="annview?writeNo=${dto.writeNo }">${dto.title }</a></td>
						<td>${dto.userid }</td> 
						<td>${dto.saveDate }</td> 
					</tr>
					</c:forEach>
						<tr align="right">
						<c:choose>
						<c:when test="${grade==1 }">
							<td colspan="4">
									<c:forEach var="annnum" begin="1" end="${repeat2 }">
										<a href="commanagementann?annnum=${annnum }">${annnum}</a>
									</c:forEach>
									<input type="button" value="공지작성"
			onclick="location.href='${contextPath}/admin/AnnwriteForm'">
							
							</td>
					
						</c:when>
						<c:otherwise>
							<td colspan="4">
									<c:forEach var="annnum" begin="1" end="${repeat2 }">
										<a href="annBoardView?annnum=${annnum }">${annnum}</a>
									</c:forEach>
							</td>
						</c:otherwise>
						</c:choose>
						</tr>
					</tbody>
				</table>
</body>
</html>