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
				html = '<section class="text-center container"><a class="btn btn-primary text-light" onclick="sellGoods()">판매상품</a>' 
				html += '<a class="btn btn-secondary text-light" onclick="heartPage()">찜 상품</a></section>'
				html += '<div class="album py-5 bg-light"><div class="container"><div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">'
				$.each(list,function(index, item) {
					html += '<div class="col"><div class="card shadow-sm">'
					html += '<img src="https://www.greatroot.net/img/download?fileName=default.png" width="100%" class="card-img-top" alt="...">'
					html += '<div class="card-body">'
					html += '<h5 class="card-title">Card title</h5>'
					html += '<p class="card-text">Some quick example text to build on the card title and make up the bulk of the cards content.</p>'
					html += '<a href="#" class="btn btn-primary">Go somewhere</a></div></div></div>'
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
			html = ''
				html = '<section class="text-center container"><a class="btn btn-secondary text-light" onclick="sellGoods()">판매상품</a>' 
				html += '<a class="btn btn-primary text-light" onclick="heartPage()">찜 상품</a></section>'
				html += '<div class="album py-5 bg-light"><div class="container"><div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">'
				$.each(list,function(index, item) {
					html += '<div class="col"><div class="card shadow-sm">'
					html += '<img src="https://www.greatroot.net/img/download?fileName=default2.gif" width="100%" class="card-img-top" alt="...">'
					html += '<div class="card-body">'
					html += '<h5 class="card-title">Card title</h5>'
					html += '<p class="card-text">Some quick example text to build on the card title and make up the bulk of the cards content.</p>'
					html += '<a href="#" class="btn btn-primary">Go somewhere</a></div></div></div>'
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
<body onload="sellGoods()">
	<c:import url="../default/header.jsp" />
	<main
		class="container d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start p-3">
		<div class="row g-3">
			<div class="col-md-3">
				<div class="card shadow-sm">
					<img
						src="resources/img/default.png"
						width="100%" class="card-img-top rounded" alt="..." onload="setProfile()">
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

			<span id="imges"></span>
			</div>
		</div>
	</main>
	<c:import url="../default/footer.jsp" />
</body>
</html>