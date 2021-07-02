<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function replyData(){
		$.ajax({
			url:"replyData/"+${personalData.writeNo}, type:"GET", 
			dataType:"json",
			success: function(rep){
				let html = ""
				rep.forEach(function(data){
					let date = new Date(data.write_date)
					let writeDate = date.getFullYear()+"년"+(date.getMonth()+1)+"월"
					writeDate += date.getDate()+"일"+date.getHours()+"시"
					writeDate += date.getMinutes()+"분"+date.getSeconds()+"초"
					html += "<div align='left'><b>아이디 : </b>"+data.userid+"님 / ";
					html += "<b>작성일</b> : "+writeDate+"<br>"
					html += "<b>제목</b> : "+data.title+"<br>"
					html += "<b>내용</b> : "+data.content+"<hr></div>"
				})
				$("#reply").html(html)
			},error:function(){
				alert('데이터를 가져올 수 없습니다')
			}
		})
	}
	
</script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
	integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
	crossorigin="anonymous"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body onload="replyData()">
	<c:import url="../default/header.jsp" />
	<div class="container">
		<h3>QnA 게시판</h3>
		<div class="row" style="padding: 40px;">
		<table class="table table-bordered row">
	<tr>
		<th>글 번호</th><td>${personalData.writeNo }</td>
		<th>작성자</th><td>${personalData.userid }</td>
	</tr>
	<tr>
		<th>제 목</th><td>${personalData.title }</td>
		<th>작성일</th><td>${personalData.saveDate }</td>
	</tr>
	
	<tr>
		<th>내 용</th><td colspan="3">${personalData.content }</td>
		
		<tr>
		<td colspan="4" align="center">
			<div id="reply"></div>
			<div style="display: flex;">
			<c:choose>
			<c:when test="${personalData.userid==loginUser}">
			<form action="${contextPath }/member/QnABoardDelete" method="post">
			 <input type="hidden" name="writeNo" value="${personalData.writeNo}"> 
			<input type="submit" value="삭제하기" class="b btn btn-outline-secondary col"></form>
			<form action="${contextPath }/member/QnaModifyForm" method="get">
			 <input type="hidden" name="writeNo" value="${personalData.writeNo}"> 
			<input type="submit" value="수정하기" class="b btn btn-outline-secondary">
			</form>
			</c:when></c:choose>
			<input type="button" class="b btn btn-outline-success col" onclick="location.href='${contextPath }/member/qnaBoardView'" value="리스트로 돌아가기">
			</div>
		</td>
	</tr>
		</table>
		
		</div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>