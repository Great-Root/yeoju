<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function setProfile() {
		
	}
	function sellGoods() {
		$.ajax({
			url : "mypage/sellGoods",
			type : "GET",
			dataType : "json",
			success : function(list) {
				html = '<section class="text-center container  mb-2"><a class="btn btn-primary text-light" onclick="sellGoods()">판매상품</a>' 
				html += '<a class="btn btn-secondary text-light" onclick="heartPage()">찜 상품</a></section>'
				html += '<div class ="div-a" ><div class ="div-b"><div class ="div-c">'
					$.each(list,function(index, item) {
						html += '<div class ="div-d" ><a class ="a-a" href ="${path}/goods/detail/'+item.goodsId+'">'
						html += '<div class ="div-e"><img alt="상품 이미지" src="https://www.greatroot.net/img/download?fileName='+item.imgFileName+'" >'
						html += '<div class ="div-f"></div>'
						html += '<div class ="div-g"><div class ="div-h">'+item.goodsName+'</div>'
						html += '<div class ="div-i"><div class ="div-j">'+item.goodsPrice+'</div>'
						html += '<div class ="div-k"><span>8분전</span></div></div></div></div></a></div>'
					})
					html += '</div></div></div>'
				$("#imges").html(html)
			},
			error : function() {
				alert("문제 발생!!!");
			}
		})
	}

	function heartPage() {
		$.ajax({
			url : "mypage/heartPage",
			type : "GET",
			dataType : "json",
			success : function(list) {
				html = '<section class="text-center container mb-2"><a class="btn btn-secondary text-light" onclick="sellGoods()">판매상품</a>' 
				html += '<a class="btn btn-primary text-light" onclick="heartPage()">찜 상품</a></section>'
				html += '<div class ="div-a" ><div class ="div-b"><div class ="div-c">'
					$.each(list,function(index, item) {
						html += '<div class ="div-d" ><a class ="a-a" href ="${path}/goods/detail/'+item.goodsId+'">'
						html += '<div class ="div-e"><img alt="상품 이미지" src="https://www.greatroot.net/img/download?fileName='+item.imgFileName+'" >'
						html += '<div class ="div-f"></div>'
						html += '<div class ="div-g"><div class ="div-h">'+item.goodsName+'</div>'
						html += '<div class ="div-i"><div class ="div-j">'+item.goodsPrice+'</div>'
						html += '<div class ="div-k"><span>8분전</span></div></div></div></div></a></div>'
					})
					html += '</div></div></div>'
				$("#imges").html(html)
			},
			error : function() {
				alert("문제 발생!!!");
			}
		})
	}
</script>
<link rel="stylesheet" type="text/css" href="resources/css/list.css">
</head>
<body onload="sellGoods()">
	<c:import url="../default/header.jsp" />
	<main
		class="container d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start p-3">
		<div class="row g-3">
			<div class="col-md-2">
				<div class="card shadow-sm" style="width: 200px;">
					<img
						src="resources/img/default.png"
						class="card-img-top rounded" alt="..." onload="setProfile()">
					<div class="card-body">
						<h5 class="card-title">ID : ${userInfo.userId}</h5>
						<a href="mypage/memberModify/${userInfo.userId}" class="btn btn-primary">회원정보
							수정</a>
						<p class="card-text">${userInfo.regDate}시작</p>
						<div class="mb-3">
							<label for="exampleFormControlTextarea1" class="form-label">자기소개</label>
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="3"></textarea>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-8">
			<section class ="section01" style ="width:1035px; margin:auto; padding : 0px 0px 1.5rem;">
			<span id="imges"></span>
			</section>
			</div>
		</div>
	</main>
	<c:import url="../default/footer.jsp" />
</body>
</html>