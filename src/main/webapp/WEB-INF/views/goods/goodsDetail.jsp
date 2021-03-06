<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
<c:set var="path" value="<%=request.getContextPath()%>" />
<link rel="shortcut icon" href="${path}/resources/img/여주favicon.png" type="image/png">
<link rel="icon" href="${path}/resources/img/여주favicon.png" type="image/png">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script>

	$(document).ready(function(){
		initHeart();
		$("#regTime").html(timeForToday(${regTime}));
		$("#modiBtn").click(function(){
			location.href = "${path}/goods/edit?goodsId=${dto.goodsId}";	
		});
		$doneBtn = $("#doneBtn"); 
		opa = $(".opa");
		$doneBtn.click(function(){
			if(${loginUser != null}){
				$.ajax('${path}/goods/soldout.do?goodsId=${dto.goodsId}', {
		              method: 'GET',
		              success: function () {
		            	  isSoldOut();
		              },
		              error: function () {
		            	  alert('실패')
		              }
		        });
			}else{
				alert('로그인을 해주세요~');
			}
		});
		function isSoldOut() {
			$.ajax('${path}/goods/isSoldout/${dto.goodsId}', {
	              method: 'GET',
	              success: function (result) {
	            	btnStyle(result,$doneBtn);
	            	btnStyle(result,opa);
	              },
	              error: function () {
	            	  alert('실패')
	              }
	        });
		}
		function btnStyle(result, btn) {
			if(result){
				btn.css('opacity','0.5');
				$("#soldOut").show();
			}else{
				btn.css('opacity','1');
				$("#soldOut").hide();
			}
		}
		$heartBtn = $("#heartBtn");
		$heartBtn.click(function () {
			if(${loginUser != null}){
				$.ajax('${path}/goods/heart.do?goodsId=${dto.goodsId}', {
		              method: 'GET',
		              success: function (result) {
		            	btnClass(result);
						heartNum();
		              },
		              error: function () {
		            	  alert('실패')
		              }
		        });
			}else{
				alert('로그인을 해주세요~');
			}
		});
		isSoldOut();
	});
		function heartNum() {
			$.ajax('${path}/goods/heartNum.do/${dto.goodsId}', {
	              method: 'GET',
	              success: function (heartNum) {
	            	  $("#heartNum").html(heartNum);
	              },
	              error: function () {
	            	  alert('실패');
	              }
	        });
		}
		function isheart() {
			$.ajax('${path}/goods/isheart.do/${dto.goodsId}', {
	              method: 'GET',
	              success: function (result) {
					btnClass(result);
	              },
	              error: function () {
	            	  alert('실패')
	              }
	        });
		}
		function btnClass(result) {
      	  if(result){
    		  $heartBtn.addClass('bg-danger');
    	  }else{
    		  $heartBtn.removeClass('bg-danger');
    	  }
		}
		function initHeart() {
			isheart();
			heartNum();
		}
		//시간
		function timeForToday(value){
			const today=new Date();
			const timeValue=new Date(value);
			console.log(timeValue);
			const betweenTime = Math.floor((today.getTime() - timeValue.getTime())/1000/60);
			if(betweenTime<1) return '방금전';
			if(betweenTime<60){
				return betweenTime+`분전`;
			}
			
			const betweenTimeHour = Math.floor(betweenTime / 60);
			if(betweenTimeHour < 24){
				return betweenTimeHour+`시간전`;
			}
			
			const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
			if(betweenTimeDay < 365){
				return betweenTimeDay+`일전`;
			}
			
			return `${Math.floor(betweenTimeDay / 365)}년전`;
		}

</script>
<style type="text/css">
.carousel-inner>.carousel-item>img {
	width: 640px;
	height: 430px;
}

.goods-width1st {
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
	background: rgb(255, 255, 255);
}

.goods-width2nd {
	width: 1024px;
}

.goods-back {
	display: block;
	padding: 30px 0px
}

.goods-1 {
	display: flex;
	padding: 30px 0px;
}

.goods1-1 {
	margin-right: 40px;
	flex-shrink: 0;
	width: 430px;
	height: 430px;
}

.goods1-2 {
	-webkit-box-flex: 1;
	flex-grow: 1;
}

.goods2 {
	-webkit-box-flex: 1;
	flex-grow: 1;
}

.goods2-1 {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	-webkit-box-pack: justify;
	justify-content: space-between;
}

.goods2-2 {
	padding-bottom: 30px;
	border-bottom: 1px solid rgb(238, 238, 238);
	width: 100%;
}

.goods-title {
	font-size: 24px;
	margin-bottom: 25px;
	font-weight: 600;
	line-height: 1.4;
	overflow: hidden;
}

.goods2-3 {
	display: flex;
	-webkit-box-pack: justify;
	justify-content: space-between;
	align-items: flex-end;
}

.goods-price {
	font-size: 40px;
	font-weight: 500;
}

.goods-price span {
	font-size: 28px;
	font-weight: 400;
	margin-left: 5px;
}

.goods2-4 {
	height: 30px;
	margin-top: 15px;
	margin-bottom: 25px;
	display: flex;
	-webkit-box-pack: justify;
	justify-content: space-between;
}

.goods2-5 {
	height: 100%;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
}

.likes {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	color: rgb(204, 204, 204);
	font-size: 16px;
	height: 100%;
}

.likes img {
	margin-right: 5px;
}

.likesCont::after {
	content: "";
	width: 1px;
	height: 12px;
	border-right: 1px solid rgb(238, 238, 238);
	margin-left: 10px;
	margin-right: 10px;
}

.goods2-7 {
	display: flex;
	margin-bottom: 25px;
}

.goods2-8 {
	position: relative;
	width: 90px;
	padding-left: 15px;
	color: rgb(153, 153, 153);
}

.goods2-8::before {
	content: "";
	position: absolute;
	top: 7px;
	left: 6px;
	width: 3px;
	height: 3px;
	border-radius: 50%;
	background: rgb(204, 204, 204);
}

.goods2-9 {
	position: relative;
	display: flex;
}

.goods3 {
	display: flex;
	-webkit-box-pack: justify;
	justify-content: space-between;
}

.goods3-1 {
	position: relative;
}

.goods3>* {
	flex: 1 1 0%;
	font-weight: 600;
	margin-right: 10px;
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
	height: 56px;
	font-size: 18px;
	-webkit-box-align: center;
	align-items: center;
}

.goods3-2 {
	width: 100%;
	height: 100%;
	font-weight: 600;
	background: rgb(204, 204, 204);
	color: rgb(255, 255, 255);
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	line-height: 1;
}
.goods3-2:hover {
	opacity: 0.8;
}

.goods3-2 span {
	margin-left: 5px;
}

.goods3-3 {
	position: absolute;
	bottom: -50px;
	left: 0px;
	width: 100%;
	border: 1px solid rgb(51, 51, 51);
	font-size: 14px;
	height: 38px;
	display: none;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	font-weight: 500;
}

.goods3-3 img {
	margin-right: 6px;
}

.goods3-4 {
	background: #9FC93C; 
	border: 1px solid #9FC93C; 
	color: rgb(255, 255, 255);
}
.goods3-4:hover {
	opacity: 0.8;
}

.goods3-5 {
	background: #47C83E; 
	border: 1px solid #47C83E; 
	color: rgb(255, 255, 255);
}
.goods3-5:hover {
	opacity: 0.8;
}

.goods4 {
	display: block;
}

.goods4-1 {
	font-size: 18px;
	padding: 48px 0px 16px;
	border-bottom: 1px solid rgb(238, 238, 238)
}

.goods4-2 {
	margin-top: 30px;
}

.goods4-3 {
	white-space: pre-wrap;
	margin: 40px 0px;
	line-height: 1.5;
}

.goods5 {
	margin-top: 10px;
}

.goods5-1 {
	padding: 60px 0px 15px;
	font-size: 18px;
	border-bottom: 1px solid rgb(238, 238, 238);
}

.goods5-2 {
	border-right: 1px solid rgb(238, 238, 238);
	border-bottom: 1px solid rgb(238, 238, 238);
	border-left: 1px solid rgb(238, 238, 238);
}

.goods5-3 {
	width: 100%;
	padding: 20px;
	height: 80px;
	border-bottom: 1px solid rgb(238, 238, 238)
}

.goods-text {
	width: 100%;
	height: 100%;
	resize: none;
	font-size: 13px;
	line-height: 1.5;
}

textarea {
	-webkit-font-smoothing: antialiased;
	direction: ltr;
	text-align: left;
	color: rgb(33, 33, 33);
	letter-spacing: -0.5px;
	outline: 0px;
	border: 0px;
}

.goods5-4 {
	display: flex;
	width: 100%;
	height: 50px;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: justify;
	justify-content: space-between;
	padding: 0px 10px;
}

}
.goods5-5 {
	margin-left: 10px;
	font-size: 12px;
	color: rgb(136, 136, 136);
}

.goods5-6 {
	border: 1px solid rgb(238, 238, 238);
	height: 32px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	padding: 0px 20px;
	font-size: 13px;
	color: rgb(136, 136, 136);
}

.goods6 {
	padding-top: 25px;
}

.goods6-1 {
	display: flex;
	width: 100%;
}

.goods6-2 {
	display: block;
	margin-right: 15px;
}

.goods6-3 {
	width: 100%;
	border-bottom: 0px solid rgb(238, 238, 238);
}

.goods6-4 {
	display: flex;
	width: 100%;
	-webkit-box-pack: justify;
	justify-content: space-between;
	color: rgb(136, 136, 136);
	margin-bottom: 10px;
	-webkit-box-align: center;
	align-items: center;
}

.goods6-5 {
	font-size: 13px;
	color: rgb(204, 204, 204);
}

.goods6-6 {
	margin-bottom: 20px;
	line-height: 1.5;
	white-space: pre-wrap;
}

.goods6-7 {
	display: flex;
	margin-bottom: 20px;
}

.goods6-8 {
	color: rgb(136, 136, 136);
	font-size: 13px;
	display: flex;
	-webkit-box-align: unset;
	align-items: unset;
	margin-right: 25px;
	position: relative;
	cursor: pointer;
}

.goods6-8 img {
	margin-right: 4px;
}

.goods6-8::after {
	content: "";
	width: 1px;
	height: 13px;
	position: absolute;
	border-right: 1px solid rgb(238, 238, 238);
	top: 1px;
	right: -14px;
}

.goods6-9 {
	color: rgb(136, 136, 136);
	font-size: 13px;
	display: flex;
	-webkit-box-align: unset;
	align-items: unset;
	margin-right: 25px;
	position: relative;
	cursor: pointer;
}

.goods6-9 img {
	margin-right: 4px;
}

.goods6-9::after {
	content: "";
	width: 1px;
	height: 13px;
	position: absolute;
	border-right: 1px solid rgb(238, 238, 238);
	top: 1px;
	right: -14px;
}
.goods6-10 {
color: rgb(136, 136, 136);
	font-size: 13px;
	display: flex;
	-webkit-box-align: unset;
	align-items: unset;
	margin-right: 25px;
	position: relative;
	cursor: pointer;
}
.goods6-10::after {
	content: "";
	width: 1px;
	height: 13px;
	position: absolute;
	border-right: 1px solid rgb(238, 238, 238);
	top: 1px;
	right: -14px;
}
.goods6-10 img {
	margin-right: 4px;
}
.goods7 {
	display: flex;
	margin-bottom: 20px;
}
.goods-width3rd {
	display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    background: rgb(255, 255, 255);
}
.goods-width4th {
    width: 1024px;
}
</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<c:import url="../default/header.jsp" />
	<div class="goods-width1st">
		<div class="goods-width2nd">
			<div class="goods-back">
				<div class="goods-1">
					<div class="goods1-1">
						<div id="carouselExampleIndicators" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>

							<div class="carousel-inner">
								<div class="carousel-item active">
									<img
										src="https://www.greatroot.net/img/download?fileName=${dto.imgFileName}"
										class="d-block w-100 opa" alt="...">
								</div>
								<div class="carousel-item">
									<img
										src="https://www.greatroot.net/img/download?fileName=${dto.imgFileName}"
										class="d-block w-100 opa" alt="...">
								</div>
								<div class="carousel-item">
									<img
										src="https://www.greatroot.net/img/download?fileName=${dto.imgFileName}"
										class="d-block w-100 opa" alt="...">
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
					<div class="goods2">
						<div class="goods2-1">
							<div class="nothing01">
								<div class="goods2-2">
									<div class="goods-title">${dto.goodsName}<span id="soldOut" style="display: none;">(판매완료)</span></div>
									<div class="goods2-3">
										<div class="goods-price">
											<fmt:formatNumber value="${dto.goodsPrice}" type="number"/> <span>원</span>
										</div>
									</div>
								</div>
								<div class="nothing02">
									<div class="goods2-4">
										<div class="goods2-5">
											<div class="likes">
												<img alt="뷰 수" width="21" height="13"
													src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAaCAYAAADMp76xAAAAAXNSR0IArs4c6QAABAdJREFUWAm9mFtIFFEYx9tZ11UW1tLoaoGEPShqq3ahgogyIgnqQXqIgih6qKgEH4JIqCgIIoowIrSn6i0irOxCQdAN7wb2IiSlSUZuGJGyumu/b9lZZo8zs7ObdeBwvvNd/uc/53zznWFcs9Js7e3tczVNWzs1NbUKiErGfJfLNYcxVyCRg8g/GAeZdiC3eTyeN2VlZd/Enm5zpRLY09Pjm5yc3EnMbghUMbpTiYd8BP8X9Dt+v/9uYWHhz1TixdcR4YGBgezh4eFD+J+gz5XAGWijYFzKycm5nArxpIQ5+hqAr9AXzgBJM4ggqXWyvLz8uplR1VkShmgOR3iVo9+jBv2LOWs9pu+H+JAdvilhyC4j6AldxqSNhT7g1Oh2u59mZWV9loDx8fGl4XB4C+IBHrpIdA7ad7C2V1RUvLPynUa4u7s7wIvVQsB8qyCDfgK5jgUaWChs0MdFyLo7OjoOo7hI98QN1sJvsHaB+cDMJYFwV1fXCnblJY5+M2dFN8GOVgcCgWeK3nQKdhXYDzE6IR2GdA2k76lgmq7o7OxcBGAzcydkJazOKVlxjvnWieyguTmZ25y21PiEFt3h/v7+rJGRkddYyhOsFhOe/gMvR6lVGliEzZL0YGPep5DTw16vd2VJScmAjhnd4WAweBaFI7KxwEaVLCQyIHOafB2ULrLo9IVkjMU0GnVJ5PmhUOim0UejIqwGuNaoTCZLNVB9yNFTkUikHqzF0kUWnepnFqv6GOdgbWYDDuo6jaduYOLWFU5Gvgk+qX4A73ei08ue6ms3B/ui3LbiozExLUd2AOxSQnWx850h2+f8/PyQYGksfoRxMhVguRRUf06qyYnOLFaNM87BjdAP0KMbq1Fu2phcMDolk2M3WIIbOGf5JjgD1hfpIosuwYmJWazqo8yvGG++6NH29vZmjo2NPcdxveJsOoXQ/yprXcKpsrLyt04kWtaKi4tDPp9vB0T6dIPdSN4Xxa5bO7dpNomR2GkGEwVchjIyMrYbyYpbwstDGSqkHL0CdJ4Jhqr6l1ezfNhvhGynumj8ahYDOSc7vI7+UeZJmke+DajjR3lAy7IoNvERX/CcfEd8pRBsMCMrfBJ2WCdITi8gpx8xD+g6u1FyGvtff15KSlLjt5aWllpumClhIdfX1+cdHR09D0gtu2TpZ/cgKdqasrOzj/M+/bKLS0qEb4JN5PU1QJbbAaVrY0M+UQKPkY73nWAkJSwgkoe84fsQ6+lLRDcD7Stkz3FV35Aq5RTPEWEdLFavt7HQXnTVPEimbnM4ThDbQtytvLy85oKCgnGHcXG3lAjHoxAogbNJlTWIq6VDQn6k5DLmih+y/EgJMsqPlFaOvZW3/y0v1A+xp9v+ADhPuomDsZuZAAAAAElFTkSuQmCC">
												<div class="likesCont">${dto.viewCount}</div>
											</div>
											<div class="likes">
												<img alt="시간" width="16" height="16"
													src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAuRJREFUWAnFV01rE1EUzUwSMWATENpFRNyIi0YI+eiui4LoogWFgkvBH6Dgpip+dONKgivdC3XlpkWELkTQRVw1H4QwWQmhLrKwq1IwxHyM54zvDck4mc6bTO3AY97MO/eeM/e9d+c+LeLzqlQq8Wg0ujIajW6ZprkIs7SmaRfQN9HvsOG5pev6h+Fw+LVYLPb9uNaOAzUajYXBYPAcPHeATR2HF+OHEPMuFou9yGazP71spgowDONMt9t9BOMNtDkvJx5jRxgrJRKJl5lM5rcbzlVArVabR6i3YbDsZhTgXRlTs57P5w+ctv8IAPkiwr2LdskJnuUZU7KPtgoRrXE/EwL45SDeC5tcEgoRS+OR0OUg55xhPyly8tA3OcgleW0BYsEpzTnm9THaknTm874suCy4JYBbDU9c7UoXvugzwllRMvoL3hCcEUsA9zneB91qAfgjc4IzojPD4UuYZP7rRU5y60yvYPab4cIUmSK3ztweplcVX+TWEYqMilGYWHJzEabDdKroK60jO52aAHLbiUhReShwTIHJNcBiYqYLX/IxoIMOIxBYANLweRIXCoWb2FJrEPJdUUiHa8BQNLLh2EY7+IM+a7fbZ3O53G4ymbwKf08B+GWDPDrAtrR6vX4dNdwnD5yfoR9w9hCReE9ws9m82Ov1XqF728sYUbuhMR0CxEoljGz4DdPyQP6gqtXqXayxt1NEHOL9vFWQAPgawHtTgEqvEQm4Mrcg5An6VxDdL24OMPYGEbtvCeCvsd/vcwGF+UdkZRyFmHMuAo7i8fhlVsxWHhClc8kFOMur1BRy+izJct1ORCydMVCehdGnbVlwWXBbAOt2zNs6wrbv05EyjL7JMX5GsAXQG6tVgFZPQgR90vd4RUzOCQFCRAtAFpphTkeZPkE+cSZwFSBEHGCerqG/icbjVdCLtpv05fxy6dDahvLB7X5qh1OnGMfxnFUUj+dWLYHtJo/nBhaZ0vH8D6NELRJSWvu9AAAAAElFTkSuQmCC">
												<div class="likesCont"><span id="regTime"></span></div>
											</div>
										</div>
									</div>
									<div class="goods2-6">
										<div class="goods2-7">
											<div class="goods2-8">판매자</div>
											<div class="goods2-9">${dto.userId}</div>
										</div>
									</div>
									<div class="goods2-6">
										<div class="goods2-7">
											<div class="goods2-8">등록날짜</div>
											<div class="goods2-9"><fmt:formatDate value="${dto.regDate}" pattern="yyyy-MM-dd"/> </div>
										</div>
									</div>
									<div class="goods2-6">
										<div class="goods2-7">
											<div class="goods2-8">카테고리</div>
											<div class="goods2-9">${dto.name}</div>
										</div>
									</div>
								</div>
							</div>
							<div class="goods3">
								<div class="goods3-1">
									<button class="goods3-2" id="heartBtn">
										<img alt="찜하트" width="16" height="16"
											src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9IiNGRkYiIGZpbGwtcnVsZT0ibm9uemVybyIgZD0iTTcuMDA1IDEuMDQ1aC4yMzNjLjI4LjIyOC41MzcuNDkuNzYyLjc3Ny4yMjUtLjI4OC40ODEtLjU0OS43NjItLjc3N2guMjMzYTYuMTYgNi4xNiAwIDAgMC0uMDktLjExM0M5LjY4NC4zNDQgMTAuNjI4IDAgMTEuNiAwIDE0LjA2NCAwIDE2IDIuMTEgMTYgNC43OTZjMCAzLjI5Ni0yLjcyIDUuOTgxLTYuODQgMTAuMDYyTDggMTZsLTEuMTYtMS4xNTFDMi43MiAxMC43NzcgMCA4LjA5MiAwIDQuNzk2IDAgMi4xMSAxLjkzNiAwIDQuNCAwYy45NzIgMCAxLjkxNi4zNDQgMi42OTUuOTMyYTYuMTYgNi4xNiAwIDAgMC0uMDkuMTEzeiIvPgo8L3N2Zz4K">
										<span>찜</span> <span id="heartNum">0</span>
									</button>
								</div>
								<c:if test="${loginUser == dto.userId}">
									<button class="goods3-4" id="modiBtn">수정하기</button>
									<button class="goods3-5" id="doneBtn">판매완료</button>
								</c:if>
							</div>
						</div>
				</div>
			</div>
			
		</div>
	</div>
	</div>
	<div class ="goods-width3rd">
		<div class ="goods-width4th">
			<div class="goods4">
				<div class="goods4-1">상품정보</div>
				<div class="nothing03">
					<div class="goods4-2">
						<div class="goods4-3">${dto.goodsInfo}</div>
					</div>
				</div>

				<div class="goods5">
					<div class="goods5-1">
						상품문의 <span style="color: rgb(247, 47, 51);" class="procCnt">${fn:length(dto.goodsCommentsList)}</span>
					</div>
					<div class="goods5-2">
						<div class="goods5-3">
						<c:if test="${loginUser != null }">
							<textarea rows="" cols="" placeholder="상품 문의 입력"
								class="goods-text"></textarea>
						</c:if>
						</div>
						<div class="goods5-4">
							<div class="goods5-5">
								<em class="charCnt">0</em> / 100
							</div>
							
							<button class="goods5-6">
								<img alt="" width="15" height="16"
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAgCAYAAAAFQMh/AAAAAXNSR0IArs4c6QAABFdJREFUSA3Nl11MVEcUgPfnIj8B1kRi4AFI9cEiITFGfZXUYNWKxJ9CtBqC0WCMuoEGgfIPBsVsU7MpVdRV0qZpgkZLjU2qrYD6oCTw4A+YoGktTQhiIE1hC7td8Dsb7ua6ruxd2IdOMsy5Z84535wzM/cuRkOYW0tLS8zw8PCR6enpfKPRaCH865mZmRuKolysrKx8qeKMqhCO0WazJUxMTNwBlAF0gJjXkBGNHzN+wHi4pqbme2GFDexwOOIGBwf/JHgccW0pKSm1BQUFkwKRVl9fv4cqnDWZTNbq6urWsIA7OjqUrq6uH4DmwFDI7nRtbW2Zl6j509DQ8JHH42k3m83rzBr9vMS2tjZzT0+PlG9LVFTURrJahvxZZmZmdGdn56/aoCzwd/Qr0a0yaSdClQXa39//HRlm4fvH5ORkc0xMzKdk3kU/Ttan/GOS7RXsc+YNxtnU19fXSuBNERERWfHx8euBucfHx38LAv8PO8u8wAKtq6u7TIBsMthYUVHRW1xcPBoZGbmBhTjngrMVW7F5FfLhAmrkhDoYd3I3s7ib3QTytebm5tiRkZGbKBbHxsZucDqdUtr19NMs9CH6K4zHQgLjLNALOOdKpkAf+IgaQV4iQ0ND7aiW+sE9QG+npaVl6y61QCnvOcY8oJveBxV+YWGhMzU1NRvxLyk75e0Wf9rfsv+5ubkeXRnPQr8h0F7KuxnofQEEa5z6RZz6XvzTgV7nuuWXlpb+I3667jFvm69xzAf6CdB7wYDqfEZGRgnQ3QJNTEzMs1qt/6pzQUtNee04FwDfCvSu6hhsxK+EEp9UoZTfrfWZE8wL4CuMD7Cn2VVVVZ1ax7lkDmAxi5VT7M3UHyq+7wWzYhvzh+g5QO+IsZ6Gn5VMv5wLKnGUQMHItAn9EZxz+IzdDmQTSAf0KJmeCQYV33cyBir7YmVuO9BfAgEC6SjvYaB2PVDxf+s6seITOJfgvAOovH10NfwKMTxL/1FOb6A99Q/kKzWZ1jF5nIO0iz3VDSXTAyw2JKgswpsxH+hdHIg2AoyQ7QDjIAu4zAJu+a9U+wx0P7YX0enOVPX37jHQJBQu+nkCyX3bhq5SNQo0Ut58bC4wFzJU4nlLDWwNcj/lrhIlmXxB0OUiB2rM72X+EtVp17un/nHUPRZwrzpJ0BUEnZJSIqch/8xh65B5dHtYaOtCoBLHJN9Pxg8J9EQUs20ZwQ8CdaDfhywfCAPlzUP+FvGn+WY6G9+gjI2NreaBV7HpqU+pKJ8DSIiOju52u92LXS7XM6C7BcpCFgwVjkJWUmYDXx5fxnwMfL8q7Ha7a2pqygxQoDcWmqmwpAl4LeN4WVnZy/LyckNTU1McoJVkJz9D00dHR9PFkOfepKQkXS8HsQ/WjJzkAYwS6A/IKB1Asjghexie0x+he2GxWOxFRUVDMheOJqd6EV3usMhX2etHjI+Tk5Ofav8FQRfe1tjYuCS8Ef/n0d4Ah7Y0Xn+VgFMAAAAASUVORK5CYII=">
								등록
							</button>

						</div>
					</div>
				</div>
				<div class="goods6">
					<c:forEach var="comments" items="${dto.goodsCommentsList}">
						<div class="goods6-1" commentId="${comments.commentId}" commentId2 ="${comments.commentId2 }">
							<a class="goods6-2" href="#"> <img alt="프로필 사진" width="48"
								height="48" style="border-radius: 50%; border-style: none;"
								src="${contextPath}/mypage/profileDownload/${comments.userId}">
							</a>
							<div class="goods6-3">
								<div class="goods6-4">
									<div class="goods6-5">${comments.userId}</div>
									<div class="goods6-6">${comments.regDate}</div>
								</div>
								<div class="goods6-7">${comments.content}</div>
								<div class="goods7">
									<div class="goods6-8">
										<img alt="댓글달기 버튼" width="17" height="14"
											src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAcCAYAAAAEN20fAAAAAXNSR0IArs4c6QAABIFJREFUSA2tl0lok0EUx5M0tVYpsVvqRhQFe6gH0VKkWrFKl1TrQaSggsvR/eAKoiJCbxZRwV0Ul4N6UbCLbU314EatC0b0oJY0Rg1aEcS0DWn9vfRLnH79EmPNwMt787b5z8z7ZiZmUwLN5XJZ+/r6ivr7+xfhPn9gYGAi3G42m7OQf8D99L9Aj5Cb8XtQVVXVSz/hZo7n2dTUZA+FQptJvpEBs+P5qjb8f9I/Q0wdgLyqLZZsCERWoLe3dx+JdkGjteB++EvonnAG+2qxWL4ij2YF8vCbhG4BfCG6DMhEPwg7YbPZ9hQXFwdEF6sNA9LS0jIjGAxeJeEcCSKZDzoJnaqoqJAtiNtkEj09PdU4ySTmijOxr1NSUlaXl5c/jxU8BEhjY2MBwS4ol2CZTa3D4agtKCjoi5Ugnp6tdbJaZ8k3kXyyXeVOp/OhUUwUiKwEBXkfpzzIQ2A1QbIV/9WYXBZgLpJkKTmlsBdVVlZ26JNaRAFiC9txCTEPx3epqaklyQAhuRm02263LyfvTcaxAep6e3v7GLGpLQwE1NtwKsLwi710lpWVeVSn/5ULCwuDbHENYJ6Qa5rf7z+gz2l2u92jPB6PDyDZfAVbmMFxvVNDQ0O7XpdIn1UtVP2kBlmRDgBZIAdjfYrYrV6vt0pAYPDyVZyIGFSOPfwFqbqRyAzsZlJyvmwifiVUF8ljBWGN1rkAmFDEoHK2a8jMVNu/yoA4R4wAWQX9AUJnBiStaZAN/2Wlng7XjkzDSfuMVekkeiagmLt5QDJZIYcIKDuFG7VEa0RfE0a5NN07xpva1tYmR8Vn0VlRjBUhPT1djmvDhk9SakRJ7hOZa0Tur0EgLE0XA+VzmE1A+UEc9C2ZNaLlFgCmtLQ0ubHDTVZEzox8inYa3BBIMmtkcFjTdHigtLQ0ugtSI61QGbRMk2FDW6I1MjTKZDKqGXLlyw6wE7dVfwFyBarFuIrDbafRBYctmTWyTgNwXeNhZpWHCyhvM1h1V1fXbrSHVAeRk1Ujra2tUyjQrayGj1P8hjpO+PYFyFSAuDFYGXQONfFKdUqGTH6zTJhcTkCs4ZSVSzbawpcee9mJZi80iqJtqK+vl2JKagPEURI6WY1bTPSyPnkYiCjZoiM41YF8MryNC2q23nmkfUAcJnYz9Dg3N3cl+cOnqZovCkSUrMx2nI4KGOgRYPbxdkhVA0YikytF4sh9kyfBL6Mc0ReaamRrVtA/DWVCH6FjGRkZp0tKSr4jx23Nzc22zMzMoDqg9m9AHtzZgFrC6t/RJzEEIk5U+CRO2/2IawlOg4dIJJffXegt5EffjW6sDEBf3hqLkYvQf6MgD+bk5JyTRxE2E5Obi60RWzrdDYA5L/pIiwkk4sCrfHwgENhIkqXoZpHorzGRWGK68b8GKBf0DKCy5TegLHxO8oTcHlm5hJNKckDlcA7MQ5wM2UkoS93DID/gPj79Fwz2Htt6+E643K4xG0DfQKv5lDv+CUjMjAYG7f/NYgDK6302fDp8HFy2WQpXVusj/AMT2PEbeA0W2gj2azwAAAAASUVORK5CYII=">
										댓글달기
									</div>
									<c:if test="${loginUser == comments.userId }">
									<div class="goods6-9">
										<img alt="댓글삭제 버튼" width="14" height="14"
											src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAANpJREFUSA1jZCAB7N+/n+Xr16+1QC3J////lwZpZWRkfAqk5nJzczc7Ojr+AYkRA1iIUQRTA7IUaGEdjA+ioQ6oA8qBuPUgghjARIwiJDXJIDYzM7O7r68vIwiD2FB5sBySWrxMkiyGBa+Xl9cumKkwNkwOJk6IZty8efN/QopoIU+Sj2nhALiZoBCgZijgMm/AfDxqMTyu0RnocUWIj64fnT8a1OghQjP+aFDTLGjRDR4NavQQoRl/5AU10Y09UPsKOdwJ8ZHVYmOPvKAeMB/jjGNqtrsGVRwDANq3T3QbKT/vAAAAAElFTkSuQmCC">
										댓글 삭제
									</div>
									</c:if>
									
								</div>
							</div>
						</div>
					</c:forEach>
					<input type="hidden" id="loginUser" value="${loginUser}" />
				</div>
			</div>
		</div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
<script>
var parentCommentId = "";
$(document).ready(function() {
	isLogin();
});

$(function() {
	
	function now() {
		var date = new Date();
		var m = date.getMonth()+1;
		var d = date.getDate();
		var h = date.getHours();
		return date.getFullYear()+'-'+(m>9?m:'0'+m)+'-'+(d>9?d:'0'+d);
	}
	$(".goods-text").keyup(function() {
	    if($(".goods-text").val().length > 100) {
	        alert("100자 초과 되었습니다.");
	        $(".goods-text").val($(".goods-text").val().substr(0,100));
	    } else {
	        $(".charCnt").text($(".goods-text").val().length);
	    }
	});
	
	 $(document).on("click",".goods5-6", function(){
		
		if(parentCommentId == "") {
			var param = {
				"goodsId" : ${dto.goodsId},
				"userId"  : '${loginUser}',
				"content" : $(".goods-text").val()
			};
			console.log(param);
			$.ajax({
				url : "/comments/insertComment",
				type : "GET",
				data : param,
				success : function(data){
					alert("댓글 작성 성공");
					//append 소스
					var html = 
						'<div class ="goods6-1" commentId =' + data + '>'
						+ 	'<a class ="goods6-2" href="#">'
						+   '<img alt="프로필 사진" width="48" height="48" style ="border-radius: 50%;  border-style: none;" src="${contextPath}/mypage/profileDownload/${loginUser}">'
						+   '</a>'
						+   '<div class ="goods6-3">'
						+   '<div class ="goods6-4">'
						+   '<div class ="goods6-5">' + param.userId + '</div>'
						+   '<div class ="goods6-6">' + now() +'</div>'
						+   '</div>'
						+   '<div class="goods6-7">' + param.content + '</div>'
						+   '<div class = "goods7">'
						+   '<div class ="goods6-8">'
						+   '<img alt="댓글달기 버튼" width="17" height="14" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAcCAYAAAAEN20fAAAAAXNSR0IArs4c6QAABIFJREFUSA2tl0lok0EUx5M0tVYpsVvqRhQFe6gH0VKkWrFKl1TrQaSggsvR/eAKoiJCbxZRwV0Ul4N6UbCLbU314EatC0b0oJY0Rg1aEcS0DWn9vfRLnH79EmPNwMt787b5z8z7ZiZmUwLN5XJZ+/r6ivr7+xfhPn9gYGAi3G42m7OQf8D99L9Aj5Cb8XtQVVXVSz/hZo7n2dTUZA+FQptJvpEBs+P5qjb8f9I/Q0wdgLyqLZZsCERWoLe3dx+JdkGjteB++EvonnAG+2qxWL4ij2YF8vCbhG4BfCG6DMhEPwg7YbPZ9hQXFwdEF6sNA9LS0jIjGAxeJeEcCSKZDzoJnaqoqJAtiNtkEj09PdU4ySTmijOxr1NSUlaXl5c/jxU8BEhjY2MBwS4ol2CZTa3D4agtKCjoi5Ugnp6tdbJaZ8k3kXyyXeVOp/OhUUwUiKwEBXkfpzzIQ2A1QbIV/9WYXBZgLpJkKTmlsBdVVlZ26JNaRAFiC9txCTEPx3epqaklyQAhuRm02263LyfvTcaxAep6e3v7GLGpLQwE1NtwKsLwi710lpWVeVSn/5ULCwuDbHENYJ6Qa5rf7z+gz2l2u92jPB6PDyDZfAVbmMFxvVNDQ0O7XpdIn1UtVP2kBlmRDgBZIAdjfYrYrV6vt0pAYPDyVZyIGFSOPfwFqbqRyAzsZlJyvmwifiVUF8ljBWGN1rkAmFDEoHK2a8jMVNu/yoA4R4wAWQX9AUJnBiStaZAN/2Wlng7XjkzDSfuMVekkeiagmLt5QDJZIYcIKDuFG7VEa0RfE0a5NN07xpva1tYmR8Vn0VlRjBUhPT1djmvDhk9SakRJ7hOZa0Tur0EgLE0XA+VzmE1A+UEc9C2ZNaLlFgCmtLQ0ubHDTVZEzox8inYa3BBIMmtkcFjTdHigtLQ0ugtSI61QGbRMk2FDW6I1MjTKZDKqGXLlyw6wE7dVfwFyBarFuIrDbafRBYctmTWyTgNwXeNhZpWHCyhvM1h1V1fXbrSHVAeRk1Ujra2tUyjQrayGj1P8hjpO+PYFyFSAuDFYGXQONfFKdUqGTH6zTJhcTkCs4ZSVSzbawpcee9mJZi80iqJtqK+vl2JKagPEURI6WY1bTPSyPnkYiCjZoiM41YF8MryNC2q23nmkfUAcJnYz9Dg3N3cl+cOnqZovCkSUrMx2nI4KGOgRYPbxdkhVA0YikytF4sh9kyfBL6Mc0ReaamRrVtA/DWVCH6FjGRkZp0tKSr4jx23Nzc22zMzMoDqg9m9AHtzZgFrC6t/RJzEEIk5U+CRO2/2IawlOg4dIJJffXegt5EffjW6sDEBf3hqLkYvQf6MgD+bk5JyTRxE2E5Obi60RWzrdDYA5L/pIiwkk4sCrfHwgENhIkqXoZpHorzGRWGK68b8GKBf0DKCy5TegLHxO8oTcHlm5hJNKckDlcA7MQ5wM2UkoS93DID/gPj79Fwz2Htt6+E643K4xG0DfQKv5lDv+CUjMjAYG7f/NYgDK6302fDp8HFy2WQpXVusj/AMT2PEbeA0W2gj2azwAAAAASUVORK5CYII=">'
						+	'댓글달기'
			            +   '</div>'
						+   '<div class ="goods6-9">'
						+   '<img alt="댓글삭제 버튼" width="14" height="14" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAANpJREFUSA1jZCAB7N+/n+Xr16+1QC3J////lwZpZWRkfAqk5nJzczc7Ojr+AYkRA1iIUQRTA7IUaGEdjA+ioQ6oA8qBuPUgghjARIwiJDXJIDYzM7O7r68vIwiD2FB5sBySWrxMkiyGBa+Xl9cumKkwNkwOJk6IZty8efN/QopoIU+Sj2nhALiZoBCgZijgMm/AfDxqMTyu0RnocUWIj64fnT8a1OghQjP+aFDTLGjRDR4NavQQoRl/5AU10Y09UPsKOdwJ8ZHVYmOPvKAeMB/jjGNqtrsGVRwDANq3T3QbKT/vAAAAAElFTkSuQmCC">'
						+	'댓글 삭제'
						+   '</div>'
						+   '</div>'
						+   '</div>'
						+   '</div>'
					$(".goods6").append(html);
					$(".goods-text").val("");	
					$('.procCnt').text(parseInt($('.procCnt').text())+1);
					$(".charCnt").text("0");	
					parentCommentId ="";
				},error : function(e){
					alert("댓글 작성 실패")
				}
			});
		} else {
			
			var param = {
				"goodsId" : ${dto.goodsId},
				"commentId" : parentCommentId,
				"userId"  : '${loginUser}',
				"content" :	$(".goods-text").val(),
			};
			console.log(param);
			$.ajax({
				url : "/comments/insertComment2",
				type : "GET",
				data : param,
				success : function(data){
					alert("대댓글 작성 성공");
					//append 소스
					var html = 
						'<div class ="goods6-1" commentId =' + parentCommentId + ' commentId2 =' + data + '>'
						+ 	'<a class ="goods6-2" href="#">'
						+   '<img alt="프로필 사진" width="48" height="48" style ="border-radius: 50%;  border-style: none;" src="${contextPath}/mypage/profileDownload/${loginUser}">'
						+   '</a>'
						+   '<div class ="goods6-3">'
						+   '<div class ="goods6-4">'
						+   '<div class ="goods6-5">' + param.userId + '</div>'
						+   '<div class ="goods6-6">' + now()+'</div>'
						+   '</div>'
						+   '<div class="goods6-7">' + param.content + '</div>'
						+   '<div class = "goods7">'
						+   '<div class ="goods6-8">'
						+   '<img alt="댓글달기 버튼" width="17" height="14" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAcCAYAAAAEN20fAAAAAXNSR0IArs4c6QAABIFJREFUSA2tl0lok0EUx5M0tVYpsVvqRhQFe6gH0VKkWrFKl1TrQaSggsvR/eAKoiJCbxZRwV0Ul4N6UbCLbU314EatC0b0oJY0Rg1aEcS0DWn9vfRLnH79EmPNwMt787b5z8z7ZiZmUwLN5XJZ+/r6ivr7+xfhPn9gYGAi3G42m7OQf8D99L9Aj5Cb8XtQVVXVSz/hZo7n2dTUZA+FQptJvpEBs+P5qjb8f9I/Q0wdgLyqLZZsCERWoLe3dx+JdkGjteB++EvonnAG+2qxWL4ij2YF8vCbhG4BfCG6DMhEPwg7YbPZ9hQXFwdEF6sNA9LS0jIjGAxeJeEcCSKZDzoJnaqoqJAtiNtkEj09PdU4ySTmijOxr1NSUlaXl5c/jxU8BEhjY2MBwS4ol2CZTa3D4agtKCjoi5Ugnp6tdbJaZ8k3kXyyXeVOp/OhUUwUiKwEBXkfpzzIQ2A1QbIV/9WYXBZgLpJkKTmlsBdVVlZ26JNaRAFiC9txCTEPx3epqaklyQAhuRm02263LyfvTcaxAep6e3v7GLGpLQwE1NtwKsLwi710lpWVeVSn/5ULCwuDbHENYJ6Qa5rf7z+gz2l2u92jPB6PDyDZfAVbmMFxvVNDQ0O7XpdIn1UtVP2kBlmRDgBZIAdjfYrYrV6vt0pAYPDyVZyIGFSOPfwFqbqRyAzsZlJyvmwifiVUF8ljBWGN1rkAmFDEoHK2a8jMVNu/yoA4R4wAWQX9AUJnBiStaZAN/2Wlng7XjkzDSfuMVekkeiagmLt5QDJZIYcIKDuFG7VEa0RfE0a5NN07xpva1tYmR8Vn0VlRjBUhPT1djmvDhk9SakRJ7hOZa0Tur0EgLE0XA+VzmE1A+UEc9C2ZNaLlFgCmtLQ0ubHDTVZEzox8inYa3BBIMmtkcFjTdHigtLQ0ugtSI61QGbRMk2FDW6I1MjTKZDKqGXLlyw6wE7dVfwFyBarFuIrDbafRBYctmTWyTgNwXeNhZpWHCyhvM1h1V1fXbrSHVAeRk1Ujra2tUyjQrayGj1P8hjpO+PYFyFSAuDFYGXQONfFKdUqGTH6zTJhcTkCs4ZSVSzbawpcee9mJZi80iqJtqK+vl2JKagPEURI6WY1bTPSyPnkYiCjZoiM41YF8MryNC2q23nmkfUAcJnYz9Dg3N3cl+cOnqZovCkSUrMx2nI4KGOgRYPbxdkhVA0YikytF4sh9kyfBL6Mc0ReaamRrVtA/DWVCH6FjGRkZp0tKSr4jx23Nzc22zMzMoDqg9m9AHtzZgFrC6t/RJzEEIk5U+CRO2/2IawlOg4dIJJffXegt5EffjW6sDEBf3hqLkYvQf6MgD+bk5JyTRxE2E5Obi60RWzrdDYA5L/pIiwkk4sCrfHwgENhIkqXoZpHorzGRWGK68b8GKBf0DKCy5TegLHxO8oTcHlm5hJNKckDlcA7MQ5wM2UkoS93DID/gPj79Fwz2Htt6+E643K4xG0DfQKv5lDv+CUjMjAYG7f/NYgDK6302fDp8HFy2WQpXVusj/AMT2PEbeA0W2gj2azwAAAAASUVORK5CYII=">'
						+	'댓글달기'
			            +   '</div>'
						+   '<div class ="goods6-9">'
						+   '<img alt="댓글삭제 버튼" width="14" height="14" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAANpJREFUSA1jZCAB7N+/n+Xr16+1QC3J////lwZpZWRkfAqk5nJzczc7Ojr+AYkRA1iIUQRTA7IUaGEdjA+ioQ6oA8qBuPUgghjARIwiJDXJIDYzM7O7r68vIwiD2FB5sBySWrxMkiyGBa+Xl9cumKkwNkwOJk6IZty8efN/QopoIU+Sj2nhALiZoBCgZijgMm/AfDxqMTyu0RnocUWIj64fnT8a1OghQjP+aFDTLGjRDR4NavQQoRl/5AU10Y09UPsKOdwJ8ZHVYmOPvKAeMB/jjGNqtrsGVRwDANq3T3QbKT/vAAAAAElFTkSuQmCC">'
						+	'댓글 삭제'
						+   '</div>'
						+   '</div>'
						+   '</div>'
						+   '</div>'
					$(".goods6-1[commentId="+parentCommentId+"]:eq(0)").after(html);
					$(".goods-text").val("");	
					$('.procCnt').text(parseInt($('.procCnt').text())+1);
					$(".charCnt").text("0");	
					parentCommentId ="";
				},error : function(e){
					alert("댓글 작성 실패")
				}
			});
		}
	});
	
	$(document).on("click", ".goods6-9", function(){
		var commentId2 = $(this).parents(".goods6-1").attr("commentId2");
		if(commentId2 == "" || commentId2 == null) {
			var commentId = $(this).parents(".goods6-1").attr("commentId");
			var param = {
				"commentId" : parseInt(commentId)
			};
			$.ajax({
				url : "/comments/deleteComment",
				type : "GET",
				data : param,
				success : function(data){
					alert("댓글 삭제 성공")
					$(".goods6-1[commentId="+commentId+"]").remove();
					$('.procCnt').text($(".goods6").find(".goods6-1").length);
				},error : function(){
					alert("댓글 삭제 실패1")
				}
			});
		} else {
			
			var param = {
				"commentId2" : parseInt(commentId2)
			};
			$.ajax({
				url : "/comments/deleteComment2",
				type : "GET",
				data : param,
				success : function(data){
					alert("댓글 삭제 성공")
					$(".goods6-1[commentId2="+commentId2+"]").remove();
					$('.procCnt').text($(".goods6").find(".goods6-1").length);
				},error : function(){
					alert("댓글 삭제 실패2")
				}
			});
		}
	});
	
	$(document).on("click",".goods6-8", function() {
	   $(".goods-text").val("@" + $(this).parents(".goods6-3").find(".goods6-5").text() + " : ");
	   parentCommentId = $(this).parents(".goods6-1").attr("commentId");
	});
	
	
})

function isLogin() {
	if($("#loginUser").val() == "") { // if loginUser 값이 Null 값이면
		$(".goods7").css('display',"none"); //.goods7 -> 댓글 달기, 댓글 삭제 버튼(비활성화)
	}
} 


</script>
</html>
