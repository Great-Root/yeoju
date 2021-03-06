<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="<%= request.getContextPath() %>"/>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>

<style type="text/css">
.footer {
	display: flex;
	flex-direction: column;
	-webkit-box-align: center;
	align-items: center;
	background: rgb(255, 255, 255);
	margin-top: 1em;
}

.footer1 {
	width: 100%;
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
	border-top: 1px solid rgb(238, 238, 238);
	border-bottom: 1px solid rgb(238, 238, 238);
}

.footer2 {
	height: 64px;
	width: 1024px;
	display: flex;
	-webkit-box-pack: justify;
	justify-content: space-between;
	-webkit-box-align: center;
	align-items: center;
}

.footer2>a {
	-webkit-box-flex: 1;
	flex-grow: 1;
	text-align: center;
}

.footer2-1 {
	display: block;
	font-size: 13px;
	color: rgb(77, 77, 77);
	position: relative;
	text-decoration: none;
	cursor: pointer;
}

.footer2-1::after {
	content: "";
	position: absolute;
	top: 0px;
	right: 0px;
	width: 1px;
	height: 14px;
	border-right: 1px solid rgb(204, 204, 204);
	box-sizing: border-box;
}

.footer3 {
	padding: 32px 0px 90px;
	width: 1024px;
}

.footer3-1 {
	display: block;
	-webkit-box-pack: justify;
	justify-content: space-between;
	margin-bottom: 36px;
}

.logoLocation {
	margin-bottom: 10px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
}

.intro {
	line-height: 3.57;
	letter-spacing: -0.8px;
}

.footer3-2 {
	width: 1024px;
	font-size: 13px;
	color: rgb(153, 153, 153);
}

.footer3-3 {
	line-height: 1.57;
	margin-bottom: 24px;
}
</style>
</head>
<body>

	<div class="footer">
		<c:choose>
			<c:when test="${grade ==1}">
			</c:when>
			<c:otherwise>
				<div class="footer1">
					<div class="footer2">
						<a class="footer2-1" href="${path}/member/annBoardView">????????????</a> <a
							class="footer2-1" href="${path}/member/qnaBoardView">Q&A</a> <a
							class="footer2-1" href="#">????????????</a> <a class="footer2-1" href="#">????????????
							??????</a>
					</div>
				</div>
			</c:otherwise>

		</c:choose>
		<div class="footer3">
			<div class="footer3-1">
				<div class="nothing">
					<div class="logoLocation">
						<img alt="" style="width: 200px; height: 70px;"
							src="${path}/resources/img/yeojuLogo.png">
					</div>
					<div class="intro">
						<b>?????????, ???????????? ?????? ????????? ???????????? ???????????? ????????? ????????? ????????????.</b>
					</div>
				</div>
				<div class="footer3-2">
					<div class="footer3-3">
						????????????: ????????? | ???????????????????????????: ????????? | ??????: ??????????????? ????????? ????????? <br> ?????????????????????:
						123-45-67895 <br> ??????/???????????????: 1234-5678 | FAX: 02-123-4567<br>
						<h5>Copyright &copy; YeoJu_ProjectTeam Inc. All Right
							reserved.</h5>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>