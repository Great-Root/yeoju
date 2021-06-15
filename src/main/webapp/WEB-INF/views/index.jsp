<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여주마켓</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
</head>
<body>
	<c:import url="default/header.jsp" />
	<div class="wrap content" style ="background-color: pink;">
		<table class="mainTable" style="width:450px; margin: 0 auto;">
			<tr>
				<td>
					<h3>
						내 사전에 불가능은 없다.<br> 불가능은 소극적인 자의 환영이며<br> 비겁한 자의 도피처 이다.<br>
						
					</h3>
				</td>
			</tr>
			<tr>
				<td>
					<h3 class="name">- 나폴레옹</h3>
				</td>
			</tr>
		</table>
	</div>
	
	<c:import url="default/footer.jsp" />
</body>

<script>
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

</html>