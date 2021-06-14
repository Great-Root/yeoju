<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 등록</title><br>
<script>
	$(document).ready(function(){
		$("#addBtn").click(function(){
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
			} else if (img == "") {
				alert("상품 사진을 입력해주세요");
				img.focus();
			}
			document.form1.action = "${path}/goods/insert.do";
			document.form1.submit();
		});
	});
	
</script>
</head>
<body>
<c:import url="../default/header.jsp"/>
	<h2>상품 등록</h2><br>
	<form action="" id="form1" name="form1" enctype="multipart/form-data" method="post">
		<table border="1">
			<tr>
				<td>상품 사진 선택</td>
				<td><input type="file" name="img" id="img"></td>
				<td><input type="file" name="img" id="img"></td>
				<td><input type="file" name="img" id="img"></td>
			</tr>
			<tr>
				<td>상품 제목</td>
				<td><input type="text" name="goodsName" id="goodsName"></td>
			</tr>
			<tr>
				<td>상품 설명</td>
				<td><textarea rows="5" cols="60" name="goodsInfo" id="goodsInfo">상품 설명을 입력해주세요</textarea></td>
			</tr>
			<tr>
				<td>연관태그(선택사항)</td>
				<td><textarea rows="5" cols="25">#태그 입력</textarea></td>
			</tr>
			<tr>
				<td>상품 가격</td>
				<td><input type="text" name="goodsPrice" id="goodsPrice"></td>
			</tr>
			<tr>
				<td>기타정보</td>
				<td><textarea rows="5" cols="60" name="" id="">기타 정보를 입력하세요</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="취소" onClick="javascript:history.back(-1)">
					<input type="button" value="상품 등록 완료" id="addBtn">
					<input type="button" value="목록" onclick="location.href='${path}/goods/list.do';">
				</td>
			</tr>
		</table>
	</form>
<c:import url="../default/footer.jsp"/>
</body>
</html>