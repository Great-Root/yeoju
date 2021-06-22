<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 등록</title>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function(){
		var goodsId = $("#goodsId").val()
		$("#modiBtn").click(function(){
			location.href = "${path}/goods/edit/"+goodsId;	
		});
		$("#delBtn").click(function(){
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
<main class="container d-flex flex-wrap align-items-center justify-content-center">
<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 bg-light">
	<div class="row">
		<h2 class="text-center">상품 상세 페이지</h2><br>
	</div>
	<form action="" id="form1" name="form1" enctype="multipart/form-data" method="post">
	<input type="hidden" name="goodsId" id="goodsId" value="${dto.goodsId}">
	<div class="row">
		<div class="col">
			<div class="text-center">
			  <img src="https://www.greatroot.net/img/download?fileName=${dto.imgFileName}" class="img-thumbnail img-fluid rounded" id="preview" width="500" alt="...">
			</div>
		</div>
		<div class="col">
			<input class="form-control mb-2" type="text" placeholder="상품명"  name="goodsName" id="goodsName" value="${dto.goodsName}" aria-label="상품명 입력칸" readonly="readonly">
			<input class="form-control mb-2" type="text" placeholder="상품가격"  name="goodsPrice" id="goodsPrice" value="${dto.goodsPrice}" aria-label="상품가격" readonly="readonly">
			<div class="mb-3">
			  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="상품 설명을 입력해주세요"  name="goodsInfo" id="goodsInfo" readonly="readonly">${dto.goodsInfo}</textarea>
			</div>
		</div>
	</div>
		<div class="row">
			<div class="col d-flex justify-content-center">
				<input type="button" class="btn btn-primary mx-3" value="상품 내용 수정" id="modiBtn"> 
				<input type="button" class="btn btn-secondary mx-3" value="목록" onclick="location.href='${path}/';">
				<input type="button" class="btn btn-danger mx-3" value="상품 삭제 하기" id="delBtn"> 
			</div>
		</div>
	</form>
	</div>
	</main>
<c:import url="../default/footer.jsp"/>
</body>
</html>