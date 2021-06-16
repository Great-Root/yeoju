<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여주마켓</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function listGoods() {
		$.ajax({
			url : "goods/list.do",
			type : "GET",
			dataType : "json",
			success : function(list) {
				html = '<div class="album py-5 bg-light"><div class="container"><div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">'
				$.each(list,function(index, item) {
					html += '<div class="col"><div class="card shadow-sm">'
					html += '<img src="https://www.greatroot.net/img/download?fileName='+item.img+'" width="100%" class="card-img-top" alt="...">'
					html += '<div class="card-body">'
					html += '<h5 class="card-title">'+item.goodsName+'</h5>'
					html += '<p class="card-text">'+item.goodsPrice+'</p>'
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
	var pageNo = 1;
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
	}
</script>
<body onload="listGoods()">
	<c:import url="default/header.jsp" />
	<main class="container d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start p-3">
		<div class="row g-3">
			<div class="col-md-8">
				<span id="imges"></span>
			</div>
		</div>
	</main>
	<c:import url="default/footer.jsp" />
</body>
</html>