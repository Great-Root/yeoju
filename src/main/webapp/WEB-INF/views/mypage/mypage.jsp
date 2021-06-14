<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function sellGoods() {
		$
				.ajax({
					url : "mypage/sellGoods",
					type : "GET",
					dataType : "json",
					success : function(list) {

						let html = '<div class="row d-flex justify-content-start">'
						$
								.each(
										list,
										function(index, item) {
											html += '<div class="col-6 col-sm-3 mb-3">'
											html += '<div class="card" style="width: 18rem; height: 100%;">'
											html += '<img src="'
													+ item.img
													+ '" class="card-img-top" style="width: 100%; max-height: 200px;" alt="...">'
											html += '<div class="card-body"><p class="card-text">가격 : price 원</p></div></div></div>'
										})
						html += '</div>'
						$("#imges").html(html)
					},
					error : function() {
						alert("문제 발생!!!");
					}
				})
	}

	function heartPage() {
		$
				.ajax({
					url : "mypage/heartPage",
					type : "GET",
					dataType : "json",
					success : function(list) {

						let html = '<div class="row d-flex justify-content-start">'
						$
								.each(
										list,
										function(index, item) {
											html += '<div class="col-6 col-sm-3 mb-3">'
											html += '<div class="card" style="width: 18rem; height: 100%;">'
											html += '<img src="'
													+ item.img
													+ '" class="card-img-top" style="width: 100%; max-height: 200px;" alt="...">'
											html += '<div class="card-body"><p class="card-text">가격 : price 원</p></div></div></div>'
										})
						html += '</div>'
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
	<div class="row">
		<div class="col-3" style="padding: 50px;">
			<div class="card mx-auto" style="width: 18rem;">
				<img src="https://www.greatroot.net/img/download/0"
					class="card-img-top rounded" alt="...">
				<div class="card-body">
					<h5 class="card-title">ID : userId</h5>
					<a href="mypage/memberModify?userId=aaa" class="btn btn-primary">회원정보
						수정</a>
					<p class="card-text">regDate시작</p>
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label">자기소개</label>
						<textarea class="form-control" id="exampleFormControlTextarea1"
							rows="3"></textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="col" style="padding: 50px;">
			<div class="container">
				<div class="row d-flex justify-content-center text-center mb-3">
					<div class="col-1 w-50 h3">
						<a class="btn btn-primary" onclick="sellGoods()">판매상품</a>
					</div>
					<div class="col-1 w-50 h3">
						<a class="btn btn-primary" onclick="heartPage()">찜상품</a>
					</div>
				</div>
				<div class="row d-flex justify-content-start">
					<span id="imges"></span>
					<div class="album py-5 bg-light">
						<div class="container">
							<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
								<div class="col">
									<div class="card" style="width: 18rem;">
										<img src="https://www.greatroot.net/img/download/0"
											class="card-img-top" alt="...">
										<div class="card-body">
											<h5 class="card-title">Card title</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>
											<a href="#" class="btn btn-primary">Go somewhere</a>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>