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
	function readURL(input) {
		var file = input.files[0]	//파일에 대한 정보
		if(file != ''){
			var reader = new FileReader();
			reader.readAsDataURL(file);	//읽고
			reader.onload = function (e) {	//로드한 값을 표현한다.
				$("#preview").attr('src',e.target.result);
			}
		}
		
	}
	
</script>
</head>
<body>
<c:import url="../default/header.jsp"/>
<main class="container d-flex flex-wrap align-items-center justify-content-center">
<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 bg-light">
	<div class="row">
		<h2 class="text-center">상품 등록</h2><br>
	</div>
	<form action="" id="form1" name="form1" enctype="multipart/form-data" method="post">
	<div class="row">
		<div class="col">
			<div class="text-center">
			  <img src="https://www.greatroot.net/img/download?fileName=default.png" class="img-thumbnail img-fluid rounded" id="preview" width="500" alt="...">
			</div>
				<div class="mb-3">
				  <label for="formFile" class="form-label">상품 사진 선택</label>
				  <input class="form-control" type="file" id="img" name="imgFile" onchange="readURL(this)">
				</div>
		</div>
		<div class="col">
				<input class="form-control mb-2" type="text" placeholder="상품명"  name="goodsName" id="goodsName" aria-label="상품명 입력칸">
				<input class="form-control mb-2" type="text" placeholder="상품가격"  name="goodsPrice" id="goodsPrice" aria-label="상품가격">
				<div class="mb-3">
				  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="상품 설명을 입력해주세요"  name="goodsInfo" id="goodsInfo"></textarea>
				</div>
		</div>
	</div>
				<div class="row">
					<div class="col d-flex justify-content-center">
						<input type="button" class="btn btn-primary mx-3" value="상품 등록 완료" id="addBtn"> 
						<input type="button" class="btn btn-secondary mx-3" value="목록" onclick="location.href='${path}/goods/list.do';">
						<input type="button" class="btn btn-danger mx-3" value="취소" onClick="javascript:history.back(-1)"> 
					</div>
				</div>
			</form>
	</div>
	</main>
<c:import url="../default/footer.jsp"/>
</body>
</html>