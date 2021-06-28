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
	.footer {
	display: flex;
    flex-direction: column;
    -webkit-box-align: center;
    align-items: center;
    background: rgb(255, 255, 255);
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
	.footer2 >a {
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
	.footer3-2{
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
	
	<div class ="footer">
		<c:choose>
	 <c:when test="${grade ==1}">
	관리자는 안볼꺼얌
 	</c:when>
  	<c:otherwise>
		<div class ="footer1">
			<div class ="footer2">
				<a class="footer2-1" href ="../member/annBoardView">공지사항</a>
				<a class="footer2-1" href ="../member/qnaBoardView">Q&A</a>
				<a class="footer2-1" href ="#">이용약관</a>
				<a class="footer2-1" href ="#">자주하는 질문</a>
			</div>
		</div>
		<div class ="footer3">
			<div class ="footer3-1">
				<div class="nothing">
					<div class ="logoLocation">
						<img alt="" style="width:200px; height:70px;"
						src="../../resources/img/yeojuLogo.png">
					</div>
					<div class="intro">
						<b>누구나, 무엇이든 쉽고 편하고 안전하게 거래하는 세상을 꿈꾸고 있습니다.</b>
					</div>
				</div>
				<div class ="footer3-2">
					<div class ="footer3-3">
					대표이사: 홍길동  |  개인정보보호책임자: 잉꺽정  |  주소: 서울특별시 용산구 한남동  <br>
  					사업자등록번호: 123-45-67895 <br>
  					고객/판매자센터: 1234-5678  |  FAX: 02-123-4567<br>
					 <h5>Copyright &copy; YeoJu_ProjectTeam Inc. All Right reserved.</h5>
					</div>
				</div>
			</div>
		</div>
			</c:otherwise>
  		
  		<hr>
	 
  <div class="row">

    <div class="col-sm-3" style = " text-align: center;  border-right: solid 1px black;">
     	<a href ="#">공지사항</a>
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
 		 </c:choose>
	</div>
</body>
</html>