<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여주마켓</title>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<c:set var="userId" value=""/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/list.css">

</head>
<body onload="listGoods()">
	<c:import url="default/header.jsp" />
<div class ="div-1">
<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
    <a href ="#1">
      <img src="https://media.bunjang.co.kr/images/nocrop/617974702.jpg" class="d-block w-100" alt="...">
    </a>
    </div>
    <div class="carousel-item">
    	<a href="#2">
      <img src="https://media.bunjang.co.kr/images/nocrop/645571250.jpg" class="d-block w-100" alt="...">
    	</a>
    </div>
    <div class="carousel-item">
    	<a href ="#3">
      <img src="https://media.bunjang.co.kr/images/nocrop/650140922.jpg" class="d-block w-100" alt="...">
    	</a>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>
	<section class ="section01" style ="width:1035px; margin:auto; padding : 3.5rem 0px 1.5rem;">
		<h2>오늘의 상품 추천</h2>
		<span id="images"></span>
	</section>
	<c:import url="default/footer.jsp" />
</body>
<script type="text/javascript">
	function listGoods() {
		$.ajax({
			url : "goods/list.do",
			type : "GET",
			dataType : "json",
			success : function(list) {
				html = '<div class ="div-a" ><div class ="div-b"><div class ="div-c">'
				$.each(list,function(index, item) {
					html += '<div class ="div-d" ><a class ="a-a" href ="${path}/goods/detail/'+item.goodsId+'">'
					html += '<div class ="div-e"><img alt="상품 이미지" src="https://www.greatroot.net/img/download?fileName='+item.imgFileName+'" >'
					html += '<div class ="div-f"></div>'
					html += '<div class ="div-g"><div class ="div-h">'+item.goodsName+'</div>'
					html += '<div class ="div-i"><div class ="div-j">'+item.goodsPrice+'</div>'
					html += '<div class ="div-k"><span>8분전</span></div></div></div></div></a></div>'
				})
				html += '</div></div></div>'
				$("#images").html(html)
			},
			error : function() {
				alert("문제 발생!!!");
			}
		})
	}
	/* var pageNo = 1;
	$(document).ready(function(){
		initPage(pageNo);
	});

	$(function() {
		
		$(body).scroll() {
			pageNo += 1;
			initPage(pageNo);
		}
	});
		
	function initPage(pageNo) {
		
		var param = {
			"pageNo" : pageNo
		};
		
		// 데이터를 불러온다.
		$.ajax({
			type : "GET",
			data : param,
			url : "",
			success : function(data) {
				lodingList(data);
			},
			error : function(data2) {
			
			}
		});
	}

	function lodingList(data) {
		var html = '';
		for(var i : data) {
			html = '<tr>'
				 + '<td>'
				 +	'<h3>'
				 +	data.title
				 +	'</h3>'
				 + '</td>'
				 + '</tr>'
		}
		$(".mainTable").append(html);
	} */
</script>
</html>