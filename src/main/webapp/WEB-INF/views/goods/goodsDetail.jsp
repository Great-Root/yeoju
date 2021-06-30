<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>
	$(document).ready(function(){
		var goodsId = $("#goodsId").val()
		$("#modiBtn").click(function(){
			location.href = "${path}/goods/edit/"+goodsId;	
		});
		$("#delBtn").click(function(){
			if(confirm("상품을 삭제하시겠습니까?")){
				document.form1.action = "${path}/goods/delete.do";
				document.form1.submit();
			}
		});
		$("#listBtn").click(function(){
			location.href = "${path}/goods/list.do";	
		});
	});
</script>
<style type="text/css">
 .carousel-inner> .carousel-item> img {
  width : 640px;
  height : 430px;
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
	
	.goods-back{
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
	.goods2{
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
	.goods2-2{
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
	.goods3 > * {
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
	
	}
	.goods3-5{
	
	}
	.goods4{
	    display: block;
	}
	.goods4-1{
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
	.goods5-1{
	padding: 60px 0px 15px;
    font-size: 18px;
    border-bottom: 1px solid rgb(238, 238, 238);
	}
	.goods5-2{
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
	.goods6-2{
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
	.goods6-7{
	    display: flex;
    margin-bottom: 20px;
	}
	.goods6-8{
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
	.goods7 {
	display: flex;
    margin-bottom: 20px;
	}
</style>
</head>
<body>

<c:import url="../default/header.jsp"/>
	<div class ="goods-width1st">
	<div class ="goods-width2nd">
	<div class ="goods-back">
	<div class ="goods-1">
	<div class ="goods1-1">
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
	
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://www.greatroot.net/img/download?fileName=${dto.imgFileName}" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://www.greatroot.net/img/download?fileName=${dto.imgFileName}" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://www.greatroot.net/img/download?fileName=${dto.imgFileName}" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
	</div>
	</div>
	<div class ="goods2">
		<div class ="goods2-1">
			<div class="nothing01">
				<div class ="goods2-2">
					<div class="goods-title">${dto.goodsName}</div>
					<div class ="goods2-3">
						<div class="goods-price">
						${dto.goodsPrice}
						<span>원</span>
						</div>
					</div>
				</div>
				<div class ="nothing02">
					<div class ="goods2-4">
						<div class ="goods2-5">
							<div class ="likes">
								<img alt="좋아요 수" 
								width="16" height="16"
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAjhJREFUWAnFl1uPKUEUhbdCxF2Iu7h78f9/ixdexANeSNxCkJnz1ZwSRncrM0OvhK6ufVmrdiu1O/DxD/INq9VKFouFbDYbOR6PEggEJBKJSDqdlkKhIKFQ6FvE1+3pdJL5fC7EHw4HIXU4HJZEIiHZbFZSqdRdXOBaAEHj8VjW6/Wdo5kIBoNSLBalVCppYcxDNJvNNPn5fDaud9dkMimNRkMvxhgvAna7nQyHQ2EVNmBV3W5Xu45GI10tmziq1+v1JBaLaXctANLBYKDLbZPE+MTjcT3cbrdmyurKY+n3+/pRKiImk8nT5MRB/Cw5cfyu4ARqv9/LcrnUN+/8ghNuxcBhI7xcC5xwK7aMX4BbsfX8AtzKa9++Whjcij8WvwC3Yk/6BbiV+TPxQwTcKpPJ+MGtOeFWHBB+PAY44VYctZxu7waccOuzIJ/Pv7UKrB5OoAUopfQ5/a4q0BPAeRHAgG4nl8vpyVd+wQGXwZeM/3f1el2i0aix/fmV3HBc40YAZel0Oq4933Xgs2M6IXKb0pv4GwFM0ny22+1Lv2ccf3Pl195qtW56QZPvTgAG9mez2fwTEZCTy6kjhstRAAba6FqtxvBXIAe53OAqgADeASqVilvsw3liyeEFTwEElstl/fFK4mSzjXsogOSshBcRW+BrWzkrARBXq1UrEZDjawtrAUYEpXXDs+TkeUoAAZTWScRPyMnn/JqLxQPm+U6nU+2FIDPnEeZourycOlofTF4LeODqav4EUxqvNxGf2nsAAAAASUVORK5CYII=">
								<div class="likesCont">0</div>
							</div>
							<div class ="likes">
								<img alt="뷰 수" 
								width="21" height="13"
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAaCAYAAADMp76xAAAAAXNSR0IArs4c6QAABAdJREFUWAm9mFtIFFEYx9tZ11UW1tLoaoGEPShqq3ahgogyIgnqQXqIgih6qKgEH4JIqCgIIoowIrSn6i0irOxCQdAN7wb2IiSlSUZuGJGyumu/b9lZZo8zs7ObdeBwvvNd/uc/53zznWFcs9Js7e3tczVNWzs1NbUKiErGfJfLNYcxVyCRg8g/GAeZdiC3eTyeN2VlZd/Enm5zpRLY09Pjm5yc3EnMbghUMbpTiYd8BP8X9Dt+v/9uYWHhz1TixdcR4YGBgezh4eFD+J+gz5XAGWijYFzKycm5nArxpIQ5+hqAr9AXzgBJM4ggqXWyvLz8uplR1VkShmgOR3iVo9+jBv2LOWs9pu+H+JAdvilhyC4j6AldxqSNhT7g1Oh2u59mZWV9loDx8fGl4XB4C+IBHrpIdA7ad7C2V1RUvLPynUa4u7s7wIvVQsB8qyCDfgK5jgUaWChs0MdFyLo7OjoOo7hI98QN1sJvsHaB+cDMJYFwV1fXCnblJY5+M2dFN8GOVgcCgWeK3nQKdhXYDzE6IR2GdA2k76lgmq7o7OxcBGAzcydkJazOKVlxjvnWieyguTmZ25y21PiEFt3h/v7+rJGRkddYyhOsFhOe/gMvR6lVGliEzZL0YGPep5DTw16vd2VJScmAjhnd4WAweBaFI7KxwEaVLCQyIHOafB2ULrLo9IVkjMU0GnVJ5PmhUOim0UejIqwGuNaoTCZLNVB9yNFTkUikHqzF0kUWnepnFqv6GOdgbWYDDuo6jaduYOLWFU5Gvgk+qX4A73ei08ue6ms3B/ui3LbiozExLUd2AOxSQnWx850h2+f8/PyQYGksfoRxMhVguRRUf06qyYnOLFaNM87BjdAP0KMbq1Fu2phcMDolk2M3WIIbOGf5JjgD1hfpIosuwYmJWazqo8yvGG++6NH29vZmjo2NPcdxveJsOoXQ/yprXcKpsrLyt04kWtaKi4tDPp9vB0T6dIPdSN4Xxa5bO7dpNomR2GkGEwVchjIyMrYbyYpbwstDGSqkHL0CdJ4Jhqr6l1ezfNhvhGynumj8ahYDOSc7vI7+UeZJmke+DajjR3lAy7IoNvERX/CcfEd8pRBsMCMrfBJ2WCdITi8gpx8xD+g6u1FyGvtff15KSlLjt5aWllpumClhIdfX1+cdHR09D0gtu2TpZ/cgKdqasrOzj/M+/bKLS0qEb4JN5PU1QJbbAaVrY0M+UQKPkY73nWAkJSwgkoe84fsQ6+lLRDcD7Stkz3FV35Aq5RTPEWEdLFavt7HQXnTVPEimbnM4ThDbQtytvLy85oKCgnGHcXG3lAjHoxAogbNJlTWIq6VDQn6k5DLmih+y/EgJMsqPlFaOvZW3/y0v1A+xp9v+ADhPuomDsZuZAAAAAElFTkSuQmCC">
								<div class="likesCont">0</div>
							</div>
							<div class ="likes">
								<img alt="시간" 
								width="16" height="16"
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAuRJREFUWAnFV01rE1EUzUwSMWATENpFRNyIi0YI+eiui4LoogWFgkvBH6Dgpip+dONKgivdC3XlpkWELkTQRVw1H4QwWQmhLrKwq1IwxHyM54zvDck4mc6bTO3AY97MO/eeM/e9d+c+LeLzqlQq8Wg0ujIajW6ZprkIs7SmaRfQN9HvsOG5pev6h+Fw+LVYLPb9uNaOAzUajYXBYPAcPHeATR2HF+OHEPMuFou9yGazP71spgowDONMt9t9BOMNtDkvJx5jRxgrJRKJl5lM5rcbzlVArVabR6i3YbDsZhTgXRlTs57P5w+ctv8IAPkiwr2LdskJnuUZU7KPtgoRrXE/EwL45SDeC5tcEgoRS+OR0OUg55xhPyly8tA3OcgleW0BYsEpzTnm9THaknTm874suCy4JYBbDU9c7UoXvugzwllRMvoL3hCcEUsA9zneB91qAfgjc4IzojPD4UuYZP7rRU5y60yvYPab4cIUmSK3ztweplcVX+TWEYqMilGYWHJzEabDdKroK60jO52aAHLbiUhReShwTIHJNcBiYqYLX/IxoIMOIxBYANLweRIXCoWb2FJrEPJdUUiHa8BQNLLh2EY7+IM+a7fbZ3O53G4ymbwKf08B+GWDPDrAtrR6vX4dNdwnD5yfoR9w9hCReE9ws9m82Ov1XqF728sYUbuhMR0CxEoljGz4DdPyQP6gqtXqXayxt1NEHOL9vFWQAPgawHtTgEqvEQm4Mrcg5An6VxDdL24OMPYGEbtvCeCvsd/vcwGF+UdkZRyFmHMuAo7i8fhlVsxWHhClc8kFOMur1BRy+izJct1ORCydMVCehdGnbVlwWXBbAOt2zNs6wrbv05EyjL7JMX5GsAXQG6tVgFZPQgR90vd4RUzOCQFCRAtAFpphTkeZPkE+cSZwFSBEHGCerqG/icbjVdCLtpv05fxy6dDahvLB7X5qh1OnGMfxnFUUj+dWLYHtJo/nBhaZ0vH8D6NELRJSWvu9AAAAAElFTkSuQmCC">
								<div class="likesCont">1분 전</div>
							</div>
						</div>
					</div>
							<div class ="goods2-6">
								<div class ="goods2-7">
									<div class ="goods2-8">
										상품상태
									</div>
									<div class ="goods2-9">중고</div>
								</div>
							</div>
							<div class ="goods2-6">
								<div class ="goods2-7">
									<div class ="goods2-8">
										배송비
									</div>
									<div class ="goods2-9">배송비 별도</div>
								</div>
							</div>
							<div class ="goods2-6">
								<div class ="goods2-7">
									<div class ="goods2-8">
										교환여부
									</div>
									<div class ="goods2-9">교환불가능</div>
								</div>
							</div>
				</div>
			</div>
			<div class="goods3">
				<div class ="goods3-1">
					<button class ="goods3-2">
						<img alt="찜하트" width="16" height="16"
						src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9IiNGRkYiIGZpbGwtcnVsZT0ibm9uemVybyIgZD0iTTcuMDA1IDEuMDQ1aC4yMzNjLjI4LjIyOC41MzcuNDkuNzYyLjc3Ny4yMjUtLjI4OC40ODEtLjU0OS43NjItLjc3N2guMjMzYTYuMTYgNi4xNiAwIDAgMC0uMDktLjExM0M5LjY4NC4zNDQgMTAuNjI4IDAgMTEuNiAwIDE0LjA2NCAwIDE2IDIuMTEgMTYgNC43OTZjMCAzLjI5Ni0yLjcyIDUuOTgxLTYuODQgMTAuMDYyTDggMTZsLTEuMTYtMS4xNTFDMi43MiAxMC43NzcgMCA4LjA5MiAwIDQuNzk2IDAgMi4xMSAxLjkzNiAwIDQuNCAwYy45NzIgMCAxLjkxNi4zNDQgMi42OTUuOTMyYTYuMTYgNi4xNiAwIDAgMC0uMDkuMTEzeiIvPgo8L3N2Zz4K">
						<span>찜</span>
						<span>0</span>
					</button>
					<!-- 
					<div class="3-3">
						<img alt=""  width="14" height="14"
						src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNCIgaGVpZ2h0PSIxNCIgdmlld0JveD0iMCAwIDE0IDE0Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjMzMzIiBzdHJva2Utd2lkdGg9IjEuNSIgZD0iTTIuMTA2IDdsMy42NjMgNCA3LjAxNS04IiBvcGFjaXR5PSIuNDA2Ii8+Cjwvc3ZnPgo=">
					</div>
					 -->
				</div>
				<button class="3-4" 
				 style="background: rgb(255, 164, 37);
   				 border: 1px solid rgb(243, 150, 20);
    			 color: rgb(255, 255, 255);">연락하기</button>
				<button class ="3-5"
				style ="background: rgb(247, 0, 0);
   				border: 1px solid rgb(223, 0, 0);
    			color: rgb(255, 255, 255);"
				>바로구매</button>
			</div>
		</div>
	</div>
	</div>
	</div>
	<div class ="goods4">
		<div class ="goods4-1">상품정보</div>
		<div class="nothing03">
			<div class="goods4-2">
				<div class="goods4-3">${dto.goodsInfo}</div>
			</div>
		</div>
		
		<div class ="goods5">
			<div class ="goods5-1">
				상품문의
				<span style ="color: rgb(247, 47, 51);" class="procCnt">0</span>
			</div>
			<div class="goods5-2">
				<div class ="goods5-3">
					<textarea rows="" cols="" placeholder ="상품 문의 입력" class="goods-text"></textarea>
				</div>
				<div class="goods5-4">
					<div class="goods5-5">
					<em class="charCnt">0</em> / 100
					</div>
					<button class ="goods5-6">
						<img alt=""  width="15" height="16"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAgCAYAAAAFQMh/AAAAAXNSR0IArs4c6QAABFdJREFUSA3Nl11MVEcUgPfnIj8B1kRi4AFI9cEiITFGfZXUYNWKxJ9CtBqC0WCMuoEGgfIPBsVsU7MpVdRV0qZpgkZLjU2qrYD6oCTw4A+YoGktTQhiIE1hC7td8Dsb7ua6ruxd2IdOMsy5Z84535wzM/cuRkOYW0tLS8zw8PCR6enpfKPRaCH865mZmRuKolysrKx8qeKMqhCO0WazJUxMTNwBlAF0gJjXkBGNHzN+wHi4pqbme2GFDexwOOIGBwf/JHgccW0pKSm1BQUFkwKRVl9fv4cqnDWZTNbq6urWsIA7OjqUrq6uH4DmwFDI7nRtbW2Zl6j509DQ8JHH42k3m83rzBr9vMS2tjZzT0+PlG9LVFTURrJahvxZZmZmdGdn56/aoCzwd/Qr0a0yaSdClQXa39//HRlm4fvH5ORkc0xMzKdk3kU/Ttan/GOS7RXsc+YNxtnU19fXSuBNERERWfHx8euBucfHx38LAv8PO8u8wAKtq6u7TIBsMthYUVHRW1xcPBoZGbmBhTjngrMVW7F5FfLhAmrkhDoYd3I3s7ib3QTytebm5tiRkZGbKBbHxsZucDqdUtr19NMs9CH6K4zHQgLjLNALOOdKpkAf+IgaQV4iQ0ND7aiW+sE9QG+npaVl6y61QCnvOcY8oJveBxV+YWGhMzU1NRvxLyk75e0Wf9rfsv+5ubkeXRnPQr8h0F7KuxnofQEEa5z6RZz6XvzTgV7nuuWXlpb+I3667jFvm69xzAf6CdB7wYDqfEZGRgnQ3QJNTEzMs1qt/6pzQUtNee04FwDfCvSu6hhsxK+EEp9UoZTfrfWZE8wL4CuMD7Cn2VVVVZ1ax7lkDmAxi5VT7M3UHyq+7wWzYhvzh+g5QO+IsZ6Gn5VMv5wLKnGUQMHItAn9EZxz+IzdDmQTSAf0KJmeCQYV33cyBir7YmVuO9BfAgEC6SjvYaB2PVDxf+s6seITOJfgvAOovH10NfwKMTxL/1FOb6A99Q/kKzWZ1jF5nIO0iz3VDSXTAyw2JKgswpsxH+hdHIg2AoyQ7QDjIAu4zAJu+a9U+wx0P7YX0enOVPX37jHQJBQu+nkCyX3bhq5SNQo0Ut58bC4wFzJU4nlLDWwNcj/lrhIlmXxB0OUiB2rM72X+EtVp17un/nHUPRZwrzpJ0BUEnZJSIqch/8xh65B5dHtYaOtCoBLHJN9Pxg8J9EQUs20ZwQ8CdaDfhywfCAPlzUP+FvGn+WY6G9+gjI2NreaBV7HpqU+pKJ8DSIiOju52u92LXS7XM6C7BcpCFgwVjkJWUmYDXx5fxnwMfL8q7Ha7a2pqygxQoDcWmqmwpAl4LeN4WVnZy/LyckNTU1McoJVkJz9D00dHR9PFkOfepKQkXS8HsQ/WjJzkAYwS6A/IKB1Asjghexie0x+he2GxWOxFRUVDMheOJqd6EV3usMhX2etHjI+Tk5Ofav8FQRfe1tjYuCS8Ef/n0d4Ah7Y0Xn+VgFMAAAAASUVORK5CYII=">
						등록
					</button>
					
				</div>
			</div>
		</div>
		<div class ="goods6">
			<div class ="goods6-1">
				<a class ="goods6-2" href="#">
					<img alt="프로필 사진" width="48" height="48" style ="border-radius: 50%;  border-style: none;"
					src="https://i.pinimg.com/736x/cc/bb/a8/ccbba8a07844293be3ab6a55453ec6bc.jpg">
				</a>
				<div class ="goods6-3">
					<div class ="goods6-4">
						<div class ="goods6-5">아이디</div>
						<div class ="goods6-6">1주전</div>
					</div>
					<div class="goods6-7"> 네고 좀 해주시죠??ㅎㅎ</div>
					<div class = "goods7">
					<div class ="goods6-8">
						<img alt="댓글달기 버튼" width="17" height="14"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAcCAYAAAAEN20fAAAAAXNSR0IArs4c6QAABIFJREFUSA2tl0lok0EUx5M0tVYpsVvqRhQFe6gH0VKkWrFKl1TrQaSggsvR/eAKoiJCbxZRwV0Ul4N6UbCLbU314EatC0b0oJY0Rg1aEcS0DWn9vfRLnH79EmPNwMt787b5z8z7ZiZmUwLN5XJZ+/r6ivr7+xfhPn9gYGAi3G42m7OQf8D99L9Aj5Cb8XtQVVXVSz/hZo7n2dTUZA+FQptJvpEBs+P5qjb8f9I/Q0wdgLyqLZZsCERWoLe3dx+JdkGjteB++EvonnAG+2qxWL4ij2YF8vCbhG4BfCG6DMhEPwg7YbPZ9hQXFwdEF6sNA9LS0jIjGAxeJeEcCSKZDzoJnaqoqJAtiNtkEj09PdU4ySTmijOxr1NSUlaXl5c/jxU8BEhjY2MBwS4ol2CZTa3D4agtKCjoi5Ugnp6tdbJaZ8k3kXyyXeVOp/OhUUwUiKwEBXkfpzzIQ2A1QbIV/9WYXBZgLpJkKTmlsBdVVlZ26JNaRAFiC9txCTEPx3epqaklyQAhuRm02263LyfvTcaxAep6e3v7GLGpLQwE1NtwKsLwi710lpWVeVSn/5ULCwuDbHENYJ6Qa5rf7z+gz2l2u92jPB6PDyDZfAVbmMFxvVNDQ0O7XpdIn1UtVP2kBlmRDgBZIAdjfYrYrV6vt0pAYPDyVZyIGFSOPfwFqbqRyAzsZlJyvmwifiVUF8ljBWGN1rkAmFDEoHK2a8jMVNu/yoA4R4wAWQX9AUJnBiStaZAN/2Wlng7XjkzDSfuMVekkeiagmLt5QDJZIYcIKDuFG7VEa0RfE0a5NN07xpva1tYmR8Vn0VlRjBUhPT1djmvDhk9SakRJ7hOZa0Tur0EgLE0XA+VzmE1A+UEc9C2ZNaLlFgCmtLQ0ubHDTVZEzox8inYa3BBIMmtkcFjTdHigtLQ0ugtSI61QGbRMk2FDW6I1MjTKZDKqGXLlyw6wE7dVfwFyBarFuIrDbafRBYctmTWyTgNwXeNhZpWHCyhvM1h1V1fXbrSHVAeRk1Ujra2tUyjQrayGj1P8hjpO+PYFyFSAuDFYGXQONfFKdUqGTH6zTJhcTkCs4ZSVSzbawpcee9mJZi80iqJtqK+vl2JKagPEURI6WY1bTPSyPnkYiCjZoiM41YF8MryNC2q23nmkfUAcJnYz9Dg3N3cl+cOnqZovCkSUrMx2nI4KGOgRYPbxdkhVA0YikytF4sh9kyfBL6Mc0ReaamRrVtA/DWVCH6FjGRkZp0tKSr4jx23Nzc22zMzMoDqg9m9AHtzZgFrC6t/RJzEEIk5U+CRO2/2IawlOg4dIJJffXegt5EffjW6sDEBf3hqLkYvQf6MgD+bk5JyTRxE2E5Obi60RWzrdDYA5L/pIiwkk4sCrfHwgENhIkqXoZpHorzGRWGK68b8GKBf0DKCy5TegLHxO8oTcHlm5hJNKckDlcA7MQ5wM2UkoS93DID/gPj79Fwz2Htt6+E643K4xG0DfQKv5lDv+CUjMjAYG7f/NYgDK6302fDp8HFy2WQpXVusj/AMT2PEbeA0W2gj2azwAAAAASUVORK5CYII=">
						댓글달기
					</div>
					<div class ="goods6-8">
						<img alt="댓글삭제 버튼" width="14" height="14"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAANpJREFUSA1jZCAB7N+/n+Xr16+1QC3J////lwZpZWRkfAqk5nJzczc7Ojr+AYkRA1iIUQRTA7IUaGEdjA+ioQ6oA8qBuPUgghjARIwiJDXJIDYzM7O7r68vIwiD2FB5sBySWrxMkiyGBa+Xl9cumKkwNkwOJk6IZty8efN/QopoIU+Sj2nhALiZoBCgZijgMm/AfDxqMTyu0RnocUWIj64fnT8a1OghQjP+aFDTLGjRDR4NavQQoRl/5AU10Y09UPsKOdwJ8ZHVYmOPvKAeMB/jjGNqtrsGVRwDANq3T3QbKT/vAAAAAElFTkSuQmCC">
						댓글 삭제
					</div>
					</div>
				</div>
			</div>
			<div class ="goods6-1">
				<a class ="goods6-2" href="#">
					<img alt="프로필 사진" width="48" height="48" style ="border-radius: 50%;  border-style: none;"
					src="https://i.pinimg.com/736x/cc/bb/a8/ccbba8a07844293be3ab6a55453ec6bc.jpg">
				</a>
				<div class ="goods6-3">
					<div class ="goods6-4">
						<div class ="goods6-5">아이디</div>
						<div class ="goods6-6">1주전</div>
					</div>
					<div class="goods6-7"> 네고 좀 해주시죠??ㅎㅎ</div>
					<div class = "goods7">
					<div class ="goods6-8">
						<img alt="댓글달기 버튼" width="17" height="14"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAcCAYAAAAEN20fAAAAAXNSR0IArs4c6QAABIFJREFUSA2tl0lok0EUx5M0tVYpsVvqRhQFe6gH0VKkWrFKl1TrQaSggsvR/eAKoiJCbxZRwV0Ul4N6UbCLbU314EatC0b0oJY0Rg1aEcS0DWn9vfRLnH79EmPNwMt787b5z8z7ZiZmUwLN5XJZ+/r6ivr7+xfhPn9gYGAi3G42m7OQf8D99L9Aj5Cb8XtQVVXVSz/hZo7n2dTUZA+FQptJvpEBs+P5qjb8f9I/Q0wdgLyqLZZsCERWoLe3dx+JdkGjteB++EvonnAG+2qxWL4ij2YF8vCbhG4BfCG6DMhEPwg7YbPZ9hQXFwdEF6sNA9LS0jIjGAxeJeEcCSKZDzoJnaqoqJAtiNtkEj09PdU4ySTmijOxr1NSUlaXl5c/jxU8BEhjY2MBwS4ol2CZTa3D4agtKCjoi5Ugnp6tdbJaZ8k3kXyyXeVOp/OhUUwUiKwEBXkfpzzIQ2A1QbIV/9WYXBZgLpJkKTmlsBdVVlZ26JNaRAFiC9txCTEPx3epqaklyQAhuRm02263LyfvTcaxAep6e3v7GLGpLQwE1NtwKsLwi710lpWVeVSn/5ULCwuDbHENYJ6Qa5rf7z+gz2l2u92jPB6PDyDZfAVbmMFxvVNDQ0O7XpdIn1UtVP2kBlmRDgBZIAdjfYrYrV6vt0pAYPDyVZyIGFSOPfwFqbqRyAzsZlJyvmwifiVUF8ljBWGN1rkAmFDEoHK2a8jMVNu/yoA4R4wAWQX9AUJnBiStaZAN/2Wlng7XjkzDSfuMVekkeiagmLt5QDJZIYcIKDuFG7VEa0RfE0a5NN07xpva1tYmR8Vn0VlRjBUhPT1djmvDhk9SakRJ7hOZa0Tur0EgLE0XA+VzmE1A+UEc9C2ZNaLlFgCmtLQ0ubHDTVZEzox8inYa3BBIMmtkcFjTdHigtLQ0ugtSI61QGbRMk2FDW6I1MjTKZDKqGXLlyw6wE7dVfwFyBarFuIrDbafRBYctmTWyTgNwXeNhZpWHCyhvM1h1V1fXbrSHVAeRk1Ujra2tUyjQrayGj1P8hjpO+PYFyFSAuDFYGXQONfFKdUqGTH6zTJhcTkCs4ZSVSzbawpcee9mJZi80iqJtqK+vl2JKagPEURI6WY1bTPSyPnkYiCjZoiM41YF8MryNC2q23nmkfUAcJnYz9Dg3N3cl+cOnqZovCkSUrMx2nI4KGOgRYPbxdkhVA0YikytF4sh9kyfBL6Mc0ReaamRrVtA/DWVCH6FjGRkZp0tKSr4jx23Nzc22zMzMoDqg9m9AHtzZgFrC6t/RJzEEIk5U+CRO2/2IawlOg4dIJJffXegt5EffjW6sDEBf3hqLkYvQf6MgD+bk5JyTRxE2E5Obi60RWzrdDYA5L/pIiwkk4sCrfHwgENhIkqXoZpHorzGRWGK68b8GKBf0DKCy5TegLHxO8oTcHlm5hJNKckDlcA7MQ5wM2UkoS93DID/gPj79Fwz2Htt6+E643K4xG0DfQKv5lDv+CUjMjAYG7f/NYgDK6302fDp8HFy2WQpXVusj/AMT2PEbeA0W2gj2azwAAAAASUVORK5CYII=">
						댓글달기
					</div>
					<div class ="goods6-8">
						<img alt="댓글삭제 버튼" width="14" height="14"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAANpJREFUSA1jZCAB7N+/n+Xr16+1QC3J////lwZpZWRkfAqk5nJzczc7Ojr+AYkRA1iIUQRTA7IUaGEdjA+ioQ6oA8qBuPUgghjARIwiJDXJIDYzM7O7r68vIwiD2FB5sBySWrxMkiyGBa+Xl9cumKkwNkwOJk6IZty8efN/QopoIU+Sj2nhALiZoBCgZijgMm/AfDxqMTyu0RnocUWIj64fnT8a1OghQjP+aFDTLGjRDR4NavQQoRl/5AU10Y09UPsKOdwJ8ZHVYmOPvKAeMB/jjGNqtrsGVRwDANq3T3QbKT/vAAAAAElFTkSuQmCC">
						댓글 삭제
					</div>
					</div>
				</div>
			</div>
			<div class ="goods6-1">
				<a class ="goods6-2" href="#">
					<img alt="프로필 사진" width="48" height="48" style ="border-radius: 50%;  border-style: none;"
					src="https://i.pinimg.com/736x/cc/bb/a8/ccbba8a07844293be3ab6a55453ec6bc.jpg">
				</a>
				<div class ="goods6-3">
					<div class ="goods6-4">
						<div class ="goods6-5">아이디</div>
						<div class ="goods6-6">1주전</div>
					</div>
					<div class="goods6-7"> 네고 좀 해주시죠??ㅎㅎ</div>
					<div class = "goods7">
					<div class ="goods6-8">
						<img alt="댓글달기 버튼" width="17" height="14"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAcCAYAAAAEN20fAAAAAXNSR0IArs4c6QAABIFJREFUSA2tl0lok0EUx5M0tVYpsVvqRhQFe6gH0VKkWrFKl1TrQaSggsvR/eAKoiJCbxZRwV0Ul4N6UbCLbU314EatC0b0oJY0Rg1aEcS0DWn9vfRLnH79EmPNwMt787b5z8z7ZiZmUwLN5XJZ+/r6ivr7+xfhPn9gYGAi3G42m7OQf8D99L9Aj5Cb8XtQVVXVSz/hZo7n2dTUZA+FQptJvpEBs+P5qjb8f9I/Q0wdgLyqLZZsCERWoLe3dx+JdkGjteB++EvonnAG+2qxWL4ij2YF8vCbhG4BfCG6DMhEPwg7YbPZ9hQXFwdEF6sNA9LS0jIjGAxeJeEcCSKZDzoJnaqoqJAtiNtkEj09PdU4ySTmijOxr1NSUlaXl5c/jxU8BEhjY2MBwS4ol2CZTa3D4agtKCjoi5Ugnp6tdbJaZ8k3kXyyXeVOp/OhUUwUiKwEBXkfpzzIQ2A1QbIV/9WYXBZgLpJkKTmlsBdVVlZ26JNaRAFiC9txCTEPx3epqaklyQAhuRm02263LyfvTcaxAep6e3v7GLGpLQwE1NtwKsLwi710lpWVeVSn/5ULCwuDbHENYJ6Qa5rf7z+gz2l2u92jPB6PDyDZfAVbmMFxvVNDQ0O7XpdIn1UtVP2kBlmRDgBZIAdjfYrYrV6vt0pAYPDyVZyIGFSOPfwFqbqRyAzsZlJyvmwifiVUF8ljBWGN1rkAmFDEoHK2a8jMVNu/yoA4R4wAWQX9AUJnBiStaZAN/2Wlng7XjkzDSfuMVekkeiagmLt5QDJZIYcIKDuFG7VEa0RfE0a5NN07xpva1tYmR8Vn0VlRjBUhPT1djmvDhk9SakRJ7hOZa0Tur0EgLE0XA+VzmE1A+UEc9C2ZNaLlFgCmtLQ0ubHDTVZEzox8inYa3BBIMmtkcFjTdHigtLQ0ugtSI61QGbRMk2FDW6I1MjTKZDKqGXLlyw6wE7dVfwFyBarFuIrDbafRBYctmTWyTgNwXeNhZpWHCyhvM1h1V1fXbrSHVAeRk1Ujra2tUyjQrayGj1P8hjpO+PYFyFSAuDFYGXQONfFKdUqGTH6zTJhcTkCs4ZSVSzbawpcee9mJZi80iqJtqK+vl2JKagPEURI6WY1bTPSyPnkYiCjZoiM41YF8MryNC2q23nmkfUAcJnYz9Dg3N3cl+cOnqZovCkSUrMx2nI4KGOgRYPbxdkhVA0YikytF4sh9kyfBL6Mc0ReaamRrVtA/DWVCH6FjGRkZp0tKSr4jx23Nzc22zMzMoDqg9m9AHtzZgFrC6t/RJzEEIk5U+CRO2/2IawlOg4dIJJffXegt5EffjW6sDEBf3hqLkYvQf6MgD+bk5JyTRxE2E5Obi60RWzrdDYA5L/pIiwkk4sCrfHwgENhIkqXoZpHorzGRWGK68b8GKBf0DKCy5TegLHxO8oTcHlm5hJNKckDlcA7MQ5wM2UkoS93DID/gPj79Fwz2Htt6+E643K4xG0DfQKv5lDv+CUjMjAYG7f/NYgDK6302fDp8HFy2WQpXVusj/AMT2PEbeA0W2gj2azwAAAAASUVORK5CYII=">
						댓글달기
					</div>
					<div class ="goods6-8">
						<img alt="댓글삭제 버튼" width="14" height="14"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAANpJREFUSA1jZCAB7N+/n+Xr16+1QC3J////lwZpZWRkfAqk5nJzczc7Ojr+AYkRA1iIUQRTA7IUaGEdjA+ioQ6oA8qBuPUgghjARIwiJDXJIDYzM7O7r68vIwiD2FB5sBySWrxMkiyGBa+Xl9cumKkwNkwOJk6IZty8efN/QopoIU+Sj2nhALiZoBCgZijgMm/AfDxqMTyu0RnocUWIj64fnT8a1OghQjP+aFDTLGjRDR4NavQQoRl/5AU10Y09UPsKOdwJ8ZHVYmOPvKAeMB/jjGNqtrsGVRwDANq3T3QbKT/vAAAAAElFTkSuQmCC">
						댓글 삭제
					</div>
					</div>
				</div>
			</div>
			<div class ="goods6-1">
				<a class ="goods6-2" href="#">
					<img alt="프로필 사진" width="48" height="48" style ="border-radius: 50%;  border-style: none;"
					src="https://i.pinimg.com/736x/cc/bb/a8/ccbba8a07844293be3ab6a55453ec6bc.jpg">
				</a>
				<div class ="goods6-3">
					<div class ="goods6-4">
						<div class ="goods6-5">아이디</div>
						<div class ="goods6-6">1주전</div>
					</div>
					<div class="goods6-7"> 네고 좀 해주시죠??ㅎㅎ</div>
					<div class = "goods7">
					<div class ="goods6-8">
						<img alt="댓글달기 버튼" width="17" height="14"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAcCAYAAAAEN20fAAAAAXNSR0IArs4c6QAABIFJREFUSA2tl0lok0EUx5M0tVYpsVvqRhQFe6gH0VKkWrFKl1TrQaSggsvR/eAKoiJCbxZRwV0Ul4N6UbCLbU314EatC0b0oJY0Rg1aEcS0DWn9vfRLnH79EmPNwMt787b5z8z7ZiZmUwLN5XJZ+/r6ivr7+xfhPn9gYGAi3G42m7OQf8D99L9Aj5Cb8XtQVVXVSz/hZo7n2dTUZA+FQptJvpEBs+P5qjb8f9I/Q0wdgLyqLZZsCERWoLe3dx+JdkGjteB++EvonnAG+2qxWL4ij2YF8vCbhG4BfCG6DMhEPwg7YbPZ9hQXFwdEF6sNA9LS0jIjGAxeJeEcCSKZDzoJnaqoqJAtiNtkEj09PdU4ySTmijOxr1NSUlaXl5c/jxU8BEhjY2MBwS4ol2CZTa3D4agtKCjoi5Ugnp6tdbJaZ8k3kXyyXeVOp/OhUUwUiKwEBXkfpzzIQ2A1QbIV/9WYXBZgLpJkKTmlsBdVVlZ26JNaRAFiC9txCTEPx3epqaklyQAhuRm02263LyfvTcaxAep6e3v7GLGpLQwE1NtwKsLwi710lpWVeVSn/5ULCwuDbHENYJ6Qa5rf7z+gz2l2u92jPB6PDyDZfAVbmMFxvVNDQ0O7XpdIn1UtVP2kBlmRDgBZIAdjfYrYrV6vt0pAYPDyVZyIGFSOPfwFqbqRyAzsZlJyvmwifiVUF8ljBWGN1rkAmFDEoHK2a8jMVNu/yoA4R4wAWQX9AUJnBiStaZAN/2Wlng7XjkzDSfuMVekkeiagmLt5QDJZIYcIKDuFG7VEa0RfE0a5NN07xpva1tYmR8Vn0VlRjBUhPT1djmvDhk9SakRJ7hOZa0Tur0EgLE0XA+VzmE1A+UEc9C2ZNaLlFgCmtLQ0ubHDTVZEzox8inYa3BBIMmtkcFjTdHigtLQ0ugtSI61QGbRMk2FDW6I1MjTKZDKqGXLlyw6wE7dVfwFyBarFuIrDbafRBYctmTWyTgNwXeNhZpWHCyhvM1h1V1fXbrSHVAeRk1Ujra2tUyjQrayGj1P8hjpO+PYFyFSAuDFYGXQONfFKdUqGTH6zTJhcTkCs4ZSVSzbawpcee9mJZi80iqJtqK+vl2JKagPEURI6WY1bTPSyPnkYiCjZoiM41YF8MryNC2q23nmkfUAcJnYz9Dg3N3cl+cOnqZovCkSUrMx2nI4KGOgRYPbxdkhVA0YikytF4sh9kyfBL6Mc0ReaamRrVtA/DWVCH6FjGRkZp0tKSr4jx23Nzc22zMzMoDqg9m9AHtzZgFrC6t/RJzEEIk5U+CRO2/2IawlOg4dIJJffXegt5EffjW6sDEBf3hqLkYvQf6MgD+bk5JyTRxE2E5Obi60RWzrdDYA5L/pIiwkk4sCrfHwgENhIkqXoZpHorzGRWGK68b8GKBf0DKCy5TegLHxO8oTcHlm5hJNKckDlcA7MQ5wM2UkoS93DID/gPj79Fwz2Htt6+E643K4xG0DfQKv5lDv+CUjMjAYG7f/NYgDK6302fDp8HFy2WQpXVusj/AMT2PEbeA0W2gj2azwAAAAASUVORK5CYII=">
						댓글달기
					</div>
					<div class ="goods6-8">
						<img alt="댓글삭제 버튼" width="14" height="14"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAANpJREFUSA1jZCAB7N+/n+Xr16+1QC3J////lwZpZWRkfAqk5nJzczc7Ojr+AYkRA1iIUQRTA7IUaGEdjA+ioQ6oA8qBuPUgghjARIwiJDXJIDYzM7O7r68vIwiD2FB5sBySWrxMkiyGBa+Xl9cumKkwNkwOJk6IZty8efN/QopoIU+Sj2nhALiZoBCgZijgMm/AfDxqMTyu0RnocUWIj64fnT8a1OghQjP+aFDTLGjRDR4NavQQoRl/5AU10Y09UPsKOdwJ8ZHVYmOPvKAeMB/jjGNqtrsGVRwDANq3T3QbKT/vAAAAAElFTkSuQmCC">
						댓글 삭제
					</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<div class="col">
			<input class="form-control mb-2" type="text" placeholder="상품명"  name="goodsName" id="goodsName" value="${dto.goodsName}" aria-label="상품명 입력칸" readonly="readonly">
			<input class="form-control mb-2" type="text" placeholder="상품가격"  name="goodsPrice" id="goodsPrice" value="${dto.goodsPrice}" aria-label="상품가격" readonly="readonly">
			<div class="mb-3">
			  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="상품 설명을 입력해주세요"  name="goodsInfo" id="goodsInfo" readonly="readonly">${dto.goodsInfo}</textarea>
			</div>
		</div>
	</div>
		<div class="row">
			<div class="col d-flex justify-content-center">
				<input type="button" class="btn btn-primary mx-3" value="상품 내용 수정" id="modiBtn"> 
				<input type="button" class="btn btn-secondary mx-3" value="목록" onclick="location.href='${path}/';">
				<input type="button" class="btn btn-danger mx-3" value="상품 삭제 하기" id="delBtn"> 
			</div>
		</div>
	</form>
	</div>
</div>
</div>
<c:import url="../default/footer.jsp"/>
</body>
<script>
$(function() {
	$(".goods-text").keyup(function() {
	    if($(".goods-text").val().length > 100) {
	        alert("100자 초과 되었습니다.");
	        $(".goods-text").val($(".goods-text").val().substr(0,100));
	    } else {
	        $(".charCnt").text($(".goods-text").val().length);
	    }
	});
	
	
	
})

</script>
</html>
<!-- 
	<div class ="goods-width1st">
	<div class="goods-width2nd">
	<div class ="goods-back">
	<div class ="goods-1">
		<div class ="goods1-1">
			<div class ="goods2">
				<div class ="goods2-1">
					<img alt="제품사진" src="https://media.bunjang.co.kr/product/155870256_1_1623768060_w856.jpg" class ="goodsImage1">
					<img alt="제품사진" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxDK8gBwlcneHAMl-NZ0pgCg1lOQYtHwPfzA&usqp=CAU" class ="goodsImage2">
				</div>
				<div class ="1"></div>
				<button class ="buttonNext" direction ="next">
					<img alt="next" width="12" height="22" 
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAsCAYAAAB/nHhDAAAAAXNSR0IArs4c6QAAAQVJREFUWAntl9EJg0AQRMV/7SGFaDE2kSaSbkwn6SIV+HV5Q7IgeiCRXcFwC8PJobPrzK3nVVV0pJSu4BKWB3LFC3QhSSAelYGYwOCeBNIa3IHFjYs6ItEAsd5C8QBNRJIeYvmheAJ/80X6JWcIMh/iFkgmRTF/e60gUzF/Wya7A7mWna+vQOl8E2g9Is//dv4x5q9FdZiZd77/+v0UmBzqzFNQ/XxnHPN37ZhVNwPt5xZ+JsPYgJgNCuJlo/U7BMg/AnkHYn4SIJ6bKXnafBk/zkJUzFxrhiznNVPdaHHezvQ7+aDFoWb6HECoWp0ZY6ZWPOQxn1lrJxIoQo+xsQdxe5Oo8Q2tG8U3KxMfPwAAAABJRU5ErkJggg==">
					옆으로 씨발년아
				</button>
				<button>
					<img alt="" width="16" height="16"
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAqBJREFUWAntlk9LFlEUxp0yyFRERKjADxC5CIncpIuWQUHt2pQfIFolEi3cuPMD1DcIWkRBS/FdFNIiWvUF7I9F0R/KQjKdfo+eA/O+c2fmzuvYygeeuddzn/PcM3+85016SpCm6RDLF+FleBqehAPwI3wHW/BJkiQvGZsDGw/AefgTxuAFouluKkg6kzCaIPYYjmXWPjDX3equ1+FxeApOwV7ouM/kFk9k0wO1Rja/BH9BxzKTKZgrVMbEh+Es/AodLSb9tTY2swkSffMN5jOxJmhH4BJ0PGISLDroiVjv/I1la/Pa75OcXvjQPDTMBTcLBRHPK8MwE9LExMjvg6/M5wfjaGUeoiHoX/tyZUKFAK9J6FiskO98SNdczXi+MiFCgM9T81ytlCN8YOI1xvgPp8QZnxvmqeFMibTnEIs64YQW/7/p7nTP1+yrdP+gqQrQ8SrokGkKaxhtm9mJMlMVoLNd0AnXCHiSWxhtmJn7B71VgBqLoOO1EfDeBzE6ZmbuH/RWAf7odbY3hazX+zJTFaAmI+jMH96d7vmq9i38hc92ZkUXNj0LHbNFutg4RkfhWzNcispDrH4uqKuNRCUViMi/IyPDlQJZexjxtGcwqqtle3y7uOQv8/ljXisl0vwSSfcsUYO6Wl9eVRxBr5v4AoV1OF6sDqyQcAS2oENdbTIgbQuh0TvXY/c732b+HdYrQK4k9UP9mMhCjeU6HIOHTTfI/BxcgP7BMU1/62L4xNhVEQmJc1D9vBNbBPxXU+faCoFxeDez0F0RdpejGC3C1Yxh53STgD7aq8px8Hd0EVHtF0O1VHU1NRad7TpedcI959z/xpiDiiC4YAufGS+gfZ0T7megzpPYtzoOivBHe/AkCp7ETY//19Fex21t+g8EN1dBluPf8gAAAABJRU5ErkJggg==">
					"확대"
				</button>
			</div>
		</div>
		<div class ="goods1-2">
		뭐보냐
		</div>
	</div>
	</div>
	</div>
	</div>
 -->