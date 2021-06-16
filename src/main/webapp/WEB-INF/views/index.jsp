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
	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
	<c:import url="default/footer.jsp" />
</body>
<!-- 
<script>
var pageNo = 1;
$(document).ready(function(){
	initPage(pageNo);
});

$(function() {
	
	$(body).scroll() {
		pageNo += 1;
		initPage(pageNo);
=======
<c:set var="path" value="<%=request.getContextPath()%>"/>
<c:set var="userId" value=""/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
					html += '<div class ="div-e"><img alt="상품 이미지" src="${path}/goods/img/'+item.userId+'?fileName='+item.img+'" >'
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
>>>>>>> master
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
<style type="text/css">

	.div-a{
	position: relative; overflow: hidden;
	}
	.div-c{
	display:flex; flex-wrap: wrap;
	}
	.div-d {
	width: 196px;
    margin-right: 11px;
    margin-bottom: 11px;
    background-color: aqua;
	}
	.a-a {
	border: 1px solid rgb(238, 238, 238);
    background: rgb(255, 255, 255);
    display: block;
	}
	.div-e {
	position: relative;
    width: 100%;
    height: 300px;
	}
	.div-f{
	position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
	}
	.div-g{
	padding: 15px 10px;
    height: 80px;
	}
	.div-h {
	position: relative;
    font-size: 14px;
    padding-bottom: 20px;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
	}
	.div-i {
	 display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
    height: 20px;
	}
	.div-j {
	font-size: 16px;
    font-weight: 600;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
	}
	.div-j::after{
	 content: "원";
    font-size: 13px;
    margin-left: 3px;
	}

	
	.div-k {
	font-size: 12px;
    color: rgb(136, 136, 136);
	}
	img {
	width : 194px;
	height : 194px;
	}
	a {
	color: rgb(33, 33, 33);
    text-decoration: none;
    cursor: pointer;
	}
	.div-1 {
	position: relative;
    max-width: 65.375rem;
    margin: 0px auto;
    height: 208px;
    background: white;
	}
	
	img .d-block w-100 {
	height: 300px;
    margin: 0px auto;
	}
	.carousel-inner {
	width: 1030px;
	}
</style>


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
		<!-- <div class ="div-a" ><div class ="div-b"><div class ="div-c"> -->
					<span id="images"></span>
					<!-- <div class ="div-d" ><a class ="a-a" href ="#1">
					<div class ="div-e"><img alt="상품 이미지" src="../../resources/css/h1.jpg" >
					<div class ="div-f"></div>
					<div class ="div-g"><div class ="div-h">인텔9세대 i5 슈퍼가성비 게이밍컴퓨터</div>
					<div class ="div-i"><div class ="div-j">727,000</div>
					<div class ="div-k"><span>8분전</span></div></div></div></div></a></div>
					
					<div class ="div-d" >
						<a class ="a-a" href ="#5">
							<div class ="div-e">
								<img alt="상품 이미지" src="../../resources/img/unnamed.gif" >
								<div class ="div-f"></div>
								<div class ="div-g">
									<div class ="div-h">인텔9세대 i5 슈퍼가성비 게이밍컴퓨터--------------------------------------------------------------------------------------------------------------</div>
									<div class ="div-i">
										<div class ="div-j">727,000</div>
										<div class ="div-k">
										<span>8분전</span>
										</div>
									</div>
								</div>
							</div>
						</a>
					</div> -->
				<!-- </div>
			</div>
		</div> -->
	</section>

	<c:import url="default/footer.jsp" />
</body>
</html>