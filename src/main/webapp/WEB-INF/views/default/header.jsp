<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">



</style>
</head>
<body>
	<header class="p-3 bg-white text-dark">
		<div class="container">
			<div class="container px-4" style ="width: 1133px; ">
				<div class="row gx-5">
					<div class="col">
						<div
							class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start p-3">
							<a href="${contextPath}/" class="nav-link fs-3 text-dark ">여주마켓</a>
						</div>
					</div>
					<div class="col">
						<div class="input-group p-3">
							<input type="text" class="form-control"
								placeholder="검색 키워드를 입력하세요!"> <span
								class="input-group-btn">
								<button class="btn btn-secondary btn-info" id="searchBtn" type="button">찾기</button>
							</span>
						</div>
					</div>
					
					 <c:choose>
					 <c:when test="${loginUser == null}">
					 
					<div class ="col">
					<div class="text-end p-3" style="margin-right: 0.5rem;">
						<button type="button" class="btn btn-outline-success me-2" onclick="javascript:window.location='${contextPath}/member/login'">Login</button>
						<button type="button" class="btn btn-outline-warning" onclick="javascript:window.location='${contextPath}/member/registerPage'">Sign-up</button>
					</div>
					 </div>
					 </c:when>
					  <c:otherwise>
					<!-- 
					 -->
					<!-- 
					  -->
					<div class="col">
						<div class="dropdown p-3" style ="float: right;">
							<button class="btn  dropdown-toggle text-dark" type="button"
								id="dropdownMenuButton1" data-bs-toggle="dropdown"
								aria-expanded="false" style="background-color: #7FFFD4; ">
								<div class="col">
									<img alt="안열림" src="../../resources/css/h1.jpg"
										class="rounded-circle" width="30px" height="30px" >
									${loginUser } 님 
								</div>

							</button>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
								<li><a class="dropdown-item" href="${contextPath}/mypage">내상점</a></li>
								<li><a class="dropdown-item" href="#">거래현황</a></li>
								<li><a class="dropdown-item" href="#">결제현황</a></li>
								<!--  
								-->
								<li><a class="dropdown-item" href="${contextPath}/member/logout">로그아웃</a></li>
							</ul>
						</div>
					</div>
				</div>
					  </c:otherwise>
					 </c:choose>
				<!-- 
				<li>
                  <c:choose>
                     <c:when test="${loginUser == null}">
                        <a href="${contextPath}/member/login">LOGIN</a>
                     </c:when>
                     <c:otherwise>
                        <a href="${contextPath}/member/logout">LOGOUT</a>
                     </c:otherwise>
                  </c:choose>
               </li>
				 -->
	


			</div>
			<div class="container px-4">
				<div class="dropdown row gx-5">
					<div class="col">
						<button class="btn btn-secondary dropdown-toggle btn-danger p-3 "
							type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">카테고리</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<c:forEach var="cate" items="${category}">
							<li><a class="dropdown-item" href="${cate.code}">${cate.name}</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="col">
						<div class="text-end p-3">
							<button type="button" id="sellBtn" class="btn btn-outline-success me-2">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-camera-fill"
									viewBox="0 0 16 16">
						  <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
						  <path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z" />
						</svg>
								판매하기
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</header>


</body>
<script>
$(document).ready(function(){
	$("#sellBtn").click(function () {
		location.href = "${contextPath}/goods/write.do"
	})
});
$("#searchBtn").on("click", function() {
	if($(".input-group.p-3").find("input.form-control").val().length == 0){
	        alert("검색어를 입력해주세여!");
	         $(".btn-secondary").css("background-color","red");
	           setInterval(borderDel, 3000);
	}
	});
	function borderDel() {
	     $("#searchBtn").css("background-color","pink");
	}
</script>
</html>