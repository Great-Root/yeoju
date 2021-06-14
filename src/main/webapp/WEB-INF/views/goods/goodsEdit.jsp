<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세/삭제</title>
<script>
	$(document).ready(function(){
		$("#editBtn").click(function(){
			var goodsName = $("#goodsName").val();
			var goodsPrice = $("#goodsPrice").val();
			var goodsInfo = $("#goodsInfo").val();
			var img = $("#img").val();
			
			if(goodsName == "") {
				alert("상품명을 입력해주세요");
				goodsName.foucs();
			} else if (goodsPrice == "") {
				alert("상품 가격을 입력해주세요");
				goodsPrice.focus();
			} else if (goodsInfo == "") {
				alert("상품 설명을 입력해주세요");
				goodsInfo.focus();
			}  else if (img == "") {
				alert("상품 사진을 입력해주세요");
				img.focus();
			} 
			document.form1.action = "${path}/goods/update.do";
			document.form1.submit();
		});
		$("#deleteBtn").click(function(){
			if(confirm("상품을 삭제하시겠습니까?")){
				document.form1.action = "${path}/goods/delete.do";
				document.form1.submit();
			}
		});
		$("#listBtn").click(function(){
			location.href = "${path}/goods/list.do";	
		});
	});
</script>
</head>
<body>
<c:import url="../default/header.jsp"/>
	<h2>상품 정보/삭제</h2>
	<form action="" id="form1" name="form1" enctype="multipart/form-data" method="post">
		<table border="">
			<tr>
				<td>상품 이미지</td>
				<td>
					<img src="${path}/images/${dto.GoodsUrl}" height="300px" width="310px">
					<br>
					<input type="file" id="img" name="img">
				</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" id="goodsName" name="goodsName" value="${dto.goodsName}"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" id="goodsPrice" name="goodsPrice" value="${dto.goodsPrice}"></td>
			</tr>
			<tr>
				<td>상품소개</td>
				<td><textarea id="goodsInfo" name="goodsInfo" rows="5" cols="60">${dto.goodsInfo}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="goodsId" value="${dto.goodsId}">
					<input type="button" id="editBtn" value="수정">
					<input type="button" id="deleteBtn"value="삭제">
					<input type="button" id="listBtn" value="상품목록">	
				</td>	
			</tr>
		</table>
	</form>
<c:import url="../default/footer.jsp"/>
</body>
</html> 