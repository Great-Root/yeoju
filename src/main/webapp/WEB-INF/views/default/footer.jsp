<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<style type="text/css">
 a {
 	text-decoration: none;
 }
 a:link {
 	color: black;
 }
 a:visited {
 	color: black;
 }
 a:hover {
 	color: blue;
 }
</style>
</head>
<body>

	<div class="container">
		<c:choose>
	 <c:when test="${grade ==1}">
	관리자는 안볼꺼얌
 	</c:when>
  	<c:otherwise>
  		
  		<hr>
	 
  <div class="row">
  	
    <div class="col-sm-3" style = " text-align: center;  border-right: solid 1px black;">
     	<a href ="../member/annBoardView">공지사항</a>
    </div>
    <div class="col-sm-3"  style = " text-align: center;  border-right: solid 1px black;">
      <a href ="../member/qnaBoardView"> Q&A</a>
    </div>
    <div class="col-sm-3"  style = " text-align: center; border-right: solid 1px black;">
      <a href ="#">이용약관</a>
    </div>
    <div class="col-sm-3"  style = " text-align: center;  ">
      <a href ="#">자주하는 질문</a>
    </div>
    
  </div>
  	</c:otherwise>
 		 </c:choose>
  
  <br>
  <hr>
  <br>
  <h5>여주마켓</h5>
  대표이사: 홍길동  |  개인정보보호책임자: 잉꺽정  |  주소: 서울특별시 용산구 한남동  <br>
  사업자등록번호: 123-45-67895 <br>
  고객/판매자센터: 1234-5678  |  FAX: 02-123-4567<br>
  <br>
  <br>
  <h5>Copyright &copy; YeoJu_ProjectTeam Inc. All Right reserved.</h5>
</div>

	
</body>
</html>