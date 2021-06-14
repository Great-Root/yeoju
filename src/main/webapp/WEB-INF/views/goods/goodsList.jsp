<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 리스트</title>
<script>
	$(document).ready(function(){
		$("#btnAdd").click(function(){
			location.href="${path}/goods/write.do";
		});
		$("#btnEdit").click(function(){
			location.href="${path}/goods/edit.do";
		});
	});
</script>
</head>
<body>
	<h2>상품목록</h2>
	<c:if test="${sessionScope.adminId != null}"> 
		<button type="button" id="btnAdd">상품등록</button><br>
	</c:if>
	<table border="1">
		<tr>
			<th>상품ID</th>
			<th>상품이미지</th>
			<th>상품명</th>
			<th>가격</th>
		</tr>
		<c:forEach var="row" items="${list}">
		<tr>
			<td>
				${row.goodsId}
			</td>
			<td>
				<a href="${path}/goods/detail/${row.goodsId}">
					<img src="${path}/images/${row.goodsUrl}" width="120ox" height="110px">
				</a>
			</td>
			<td>
				<a href="${path}/goods/detail/${row.goodsId}">${row.goodsName}</a>
			<td align="center">
				<a href="${path}/goods/detail/${row.goodsId}">${row.goodsName}</a><br>
				<a href="${path}/goods/edit/${row.goodsId}">[상품편집]</a>
			</td>
			<td>
				<fmt:formatNumber value="${row.goodsPrice}" pattern="###,###,###"/>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>