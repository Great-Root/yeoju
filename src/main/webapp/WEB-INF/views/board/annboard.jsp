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
						<c:choose>
						<c:when test="${grade==1 }">
						<tr align="right">
							<th colspan="5" >
							<input type="button" value="공지작성"
			onclick="location.href='${contextPath}/admin/AnnwriteForm'">
							</th>
						</tr>
						</c:when>
						</c:choose>
					</tbody>
				</table>
</body>
</html>