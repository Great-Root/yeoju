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
	$(document).ready(function(){
		$mypageBtn = $(".myBtn");
		requestList($("#sellingBtn"));
	});
	// URL 추가 하는 곳
	function getUrl(e) {
		switch (e.attr('id')) {
		  case 'sellingBtn':
		    return 'sellGoods';
		  case 'heartBtn':
		    return 'heartPage';
		}
	}
	// 상품 이미지 세팅하는 코드
	function setCard(item) {
		html = '<div class ="div-d" ><a class ="a-a" href ="${path}/goods/detail/'+item.goodsId+'">'
		html += '<div class ="div-e"><img alt="상품 이미지" src="https://www.greatroot.net/img/download?fileName='+item.imgFileName+'" >'
		html += '<div class ="div-f"></div>'
		html += '<div class ="div-g"><div class ="div-h">'+item.goodsName+'</div>'
		html += '<div class ="div-i"><div class ="div-j">'+item.goodsPrice+'</div>'
		html += '<div class ="div-k"><span>8분전</span></div></div></div></div></a></div>'
		return html
	}
	// 버튼 활성화 코드
	function activeBtn(btn) {
		btn.removeClass('btn-secondary');
		btn.addClass('btn-primary');
	}
	// 버튼 비활성화 코드
	function inActiveBtn(btn) {
		btn.removeClass('btn-primary');
		btn.addClass('btn-secondary');
	}
	// 버튼선택 코드 : 전체 비활성화, 매개변수로 들어온 버튼만 활성화
	function selectBtn(btn) {
		inActiveBtn($mypageBtn);
		activeBtn(btn);
	}
	// URL 비동기방식(Ajax) 요청 코드
	function requestList(e) {
		selectBtn($(e));
		$.ajax({
			url : "mypage/"+getUrl($(e)),
			type : "GET",
			dataType : "json",
			success : function(list) {
				html = ''
					$.each(list,function(index, item) {
						html += setCard(item)
					})
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
<body>
	<c:import url="../default/header.jsp" />
	<main class="container d-flex ">
		<div class="card shadow-sm me-3" style="width:200px; min-width: 200px;">
			<img src="resources/img/default.png" class="card-img-top rounded"
				alt="...">
			<div class="card-body">
				<h5 class="card-title">ID : ${userInfo.userId}</h5>
				<a href="mypage/memberModify/${userInfo.userId}"
					class="btn btn-primary">회원정보 수정</a>
				<p class="card-text">${userInfo.regDate}시작</p>
				<div class="mb-3">
					<label for="exampleFormControlTextarea1" class="form-label">자기소개</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="3"></textarea>
				</div>
			</div>
		</div>
		<div class ="div-a" >
		<section class="text-center mb-2">
			<a class="text-light myBtn btn" id="sellingBtn" onclick="requestList(this)" >판매상품</a>
			<a class="text-light myBtn btn" id="heartBtn" onclick="requestList(this)">찜 상품</a>
		</section>
			<div class ="div-b">
				<div class ="div-c" id="imges" style="min-width: 1100px;">
				</div>
			</div>
		</div>
	</main>
	<c:import url="../default/footer.jsp" />
</body>
</html>