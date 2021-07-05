<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="resources/img/여주favicon.png" type="image/png">
<link rel="icon" href="resources/img/여주favicon.png" type="image/png">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.header {
	position: sticky;
	display: flex;
	width: 100%;
	-webkit-box-pack: center;
	justify-content: center;
	padding-top: 0px;
	background: rgb(255, 255, 255);
	z-index: 10;
	border-bottom: 1px solid rgb(238, 238, 238);
	left: 0px;
	top: 0px;
}

.header01 {
	display: flex;
	flex-direction: column;
	width: 1047px;
}

.header02 {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	width: 1024px;
	height: 120px;
}

.logoA {
	margin-right: 158px;
	width: 136px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
}

.logoImg {
	border-style: none;
	vertical-align: bottom;
}

.search {
	border: 2px solid rgb(59, 247, 47);
	width: 460px;
	height: 40px;
	box-sizing: border-box;
	position: relative;
}

.search01 {
	width: 100%;
	height: 100%;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	padding: 0px 15px;
}

.search02 {
	color: rgb(102, 102, 102);
	-webkit-box-flex: 1;
	flex-grow: 1;
	border: none;
}

input:focus {
	outline: none;
}

.search03 {
	color: rgb(33, 33, 33);
	text-decoration: none;
	cursor: pointer;
}

.search03 img {
	border-style: none;
	vertical-align: bottom;
}

.search04 {
	display: flex;
	flex-direction: row-reverse;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-flex: 1;
	flex-grow: 1;
}

.search04-1 {
	display: flex;
	flex-direction: row-reverse;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-flex: 1;
	flex-grow: 1;
	margin-right: -6px;
}

.search04 button {
	margin-left: 6px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	position: relative;
	background: #43A047;
	color: #fff;
	border: none;
	position: relative;
	height: 42px;
	font-size: 1em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

.search05 {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	height: 70px;
}

.search04 button:hover {
	background: #fff;
	color: #1AAB8A;
}

.search04 button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}
</style>
</head>
<body>
	<div class="header" style="margin-bottom: 1em;">
		<div class="header01">
			<div class="header02">
				<a class="logoA" href="${contextPath}/"> <img alt="여주마켓 로고"
					style="width: 200px; height: 70px;"
					src="${contextPath}/resources/img/yeojuLogo.png" class="logoImg">
				</a>
				<div class="search">
					<div class="search01">
						<select name="searchOption" id="searchOption">
							<option value="all"
								<c:out value="${searchOption=='all'?'selected':'' }"/>>전체</option>
							<option value="goods_name"
								<c:out value="${searchOption=='goods_name'?'selected':''}"/>>상품이름</option>
							<option value="user_id"
								<c:out value="${searchOption=='user_id'?'selected':''}"/>>작성자</option>
						</select> <input type="text" placeholder="검색 키워드를 입력하세요!" class="search02"
							id="keyword" onkeypress="enterkey()"> <a class="search03"
							href="#" id="searchBtn"> <img alt="돋보기"
							style="width: 16px; height: 16px;"
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAeZJREFUOBGVVD1PAkEQ3VlOjY0xIdGOI0BMxMSGytJE+RsWWomx8mfYWNBpZWltg1b2NCZaGBppFAzR1njsOO9gzHEfIJdws/vmvcft7OySiT2DQqUakDtipjoZ4xsyzGy6RNzy2F7mu53nmGRiKprRw7XaQm/wdU6OG2xMTvFoFPKQLTXX86tn1G7/RHM6thjArP/xeWscn8rUWqJLee/klhdW8MM4xCQHDrjQqEkivhfLF++FEvf80luvsLGXIIwB5MABF5o0HoU1M+5RkvK1Xn29+3KfRlQMpmyCOyzfM3Y7XlMbboDUjIiuZpnBFBwsH3WGVv9Io8VuYuLEUMFZUbmqjfJt2BqC5JZyT9HEtLFyVRvlhrscBeYaS4/G+VaQV4DD7+FWPJk1Vy4aPs6R+nILoBTzMJ7MmitXtVGexXFCC8j5OpzWgyoCxzEfQQOt4hot+gjHSZZOhoLraabIEQU3EEMT70HgHl44m3KcNqUm+2SCVt8vX6E1dDdRMyzTcSCXBhRSImc6o9HkW7589Pz3cpAD8CBL3oXKkj1Ze+00xxZh+DNUMHF9SQKdEL2+en7lmNmFRmmm6jVXhGl4SchF0fcrjbnEWeQ008SSs8RZuC5fjIbWW6xm8ebCYdovlg8g+gXwsu0wmCVGbgAAAABJRU5ErkJggg==">
						</a>
					</div>

				</div>
				<c:if test="${loginUser == null}">
					<div class="search04">
						<button type="button"
							onclick="javascript:window.location='${contextPath}/member/memberJoinForm.do'">Sign-up</button>
						<button type="button"
							onclick="javascript:window.location='${contextPath}/member/login'">Login</button>
					</div>
				</c:if>
				<c:choose>
					<c:when test="${grade ==1}">
						<div class="search04">
							<button type="button"
								onclick="javascript:window.location='${contextPath}/member/memberJoinForm.do'">Sign-up</button>
							<button type="button"
								onclick="javascript:window.location='${contextPath}/member/login'">Login</button>
						</div>
					</c:when>
					<c:otherwise>
						<c:if test="${loginUser != null}">
							<div class="search04-1">
								<div class="dropdown p-3" style="float: right;">
									<button class="btn  dropdown-toggle text-dark" type="button"
										id="dropdownMenuButton1" data-bs-toggle="dropdown"
										aria-expanded="false" style="background-color: #43A047;">
										<div class="col">
											<img alt="안열림"
												src="${contextPath}/mypage/profileDownload/${loginUser}"
												class="rounded-circle" style="width: 36px; height: 36px;">
											${loginUser } 님
										</div>
									</button>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
										<li><a class="dropdown-item" href="${contextPath}/mypage">내상점</a></li>
										<li><a class="dropdown-item"
											href="${contextPath}/member/logout">로그아웃</a></li>
									</ul>
								</div>
							</div>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="search05">
					<div id="catelist"></div>
				<div class="text-end p-3" style="margin-left: 46rem;">
					<c:if test="${loginUser != null}">
						<button type="button" id="sellBtn"
							style="width: 131px; height: 58px;"
							class="btn btn-outline-success me-2">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-camera-fill"
								viewBox="0 0 16 16">
			                    <path
									d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
			                    <path
									d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z" />
			                  </svg>
							판매하기
						</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	var keyword = '';

	$(document).ready(function() {
		$("#sellBtn").click(function() {
			location.href = "${contextPath}/goods/write.do";
		})
		$("#searchBtn").on("click",function() {
			if ($(".search02").val().length == 0) {
				alert("검색어를 입력해주세여!");
				$("#keyword").focus();
			} else {
				location.href = "${contextPath}/?keyword="
						+ $("#keyword").val()
						+ "&searchOption="
						+ $("#searchOption").val()
						+ "&soldOutView=${soldOutView}"
						+ "&categoryCode=${categoryCode}";
			}
		});
		setCateList();
	});
	
		function setCateList() {
	      	$.ajax({
	          url : "${contextPath}/goods/getCateList.do",
	          type : "GET",
	          dataType : "json",
	          success : function(list) {
	        	  var url = '${contextPath}?keyword=${keyword}&searchOption=${searchOption}&soldOutView=${soldOutView}&categoryCode=';
	        	  var html = '';
	        		  html += '<select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" style="color: #fff; background-color: #4CAF50; border-color: #43A047; width: 7em;" '
	        		  html += 'onchange="if(this.value) location.href=(this.value)">'
	        		  html += ' <option hidden="hidden" selected>카테고리</option>'
	        	  $.each(list,function(index, item) {
	        		  html += '<option value="'+url+item.code+'" style="background-color: white; color: green;" '+(item.code == '${categoryCode}' ?"selected" : "")+'>'+item.name+'</option>'
	        	  })
	        		  html += '</select>'
	        		  $("#catelist").html(html);
	          },	
	          error : function() {
	             alert("문제 발생!!!");
	          }
	       })
		}
	function enterkey() {
		if (window.event.keyCode == 13) {
			$("#searchBtn").click();
		}
	}
</script>
</html>
