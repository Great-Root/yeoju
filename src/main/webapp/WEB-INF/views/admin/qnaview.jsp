<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function slideClick(){
		$("#first").slideDown("slow"); $("#modal_wrap").show();
	}
	function slide_hide(){
		$("#first").slideUp("fast"); $("#modal_wrap").hide();
	}
	function rep(){
		let form={}; let arr = $("#frm").serializeArray();
		for(i=0 ; i<arr.length ; i++){ form[arr[i].name] = arr[i].value }
		$.ajax({
			url: "addReply", type: "POST", data: JSON.stringify(form),
			contentType: "application/json; charset=utf-8",
			success: function(){
				alert("성공적으로 답글이 달렸습니다"); slide_hide();
				replyData();
			}, error: function(){
				alert("성공적으로 답글이 달렸습니다");
				slide_hide();
				replyData();
			}
		})
	}
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
					writeDate += date.getMinutes()+"분"
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
<style type="text/css">
#modal_wrap{
	display:none;
	position: fixed; z-index: 9; margin: 0 auto; 
	top:0; left: 0; right: 0; width: 100%; height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
}
#first{
	display:none;
	position: fixed; z-index: 10; margin: 0 auto;
	top:120px; left: 0; right: 0; width: 350px; height: 450px;
	background-color: rgba(212, 244, 250, 0.9);
}
</style>
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
	<div  align="right"  style=" padding-right: 250px; ">
	<table  >
	<tr>
	<th>관리자 모드</th>
	<th><a href="/">쇼핑몰로 이동</a></th>
	</tr>
	</table></div>
	<div class="container">
		
		<div class="row" style="padding: 40px;">
		<table class="table col" >
			<thead>
				<tr  >
					<th><a href="adminlist">관리자 메뉴</a></th>
					<th><a href="memmanagement">회원 관리</a></th>
					<th><a href="commanagement">커뮤니티 관리</a></th>
				</tr>
			</thead>
		</table>
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
				<input type="button" class="b btn btn-outline-secondary" onclick="slideClick()" value="답변달기">
			<input type="button" class="b btn btn-outline-success" onclick="location.href='${contextPath }/admin/commanagement'" value="리스트로 돌아가기">
		</td>
	</tr>
		</table>
		
		</div>
			<div id="modal_wrap">
			<div id="first">
			<div style="width:250px; margin: 0 auto; padding-top: 20px;">
				<form id="frm">
					<input type="hidden" name="write_no" value="${personalData.writeNo }">
					<b>답글 작성 페이지</b><hr>
					<b>작성자 : ${loginUser }</b><hr>
					<b>제목</b> <br> <input type="text" id="title" size="25" name="title"><hr>
					<b>내용</b> <br> <textarea rows="5" cols="30" id="content" name="content"></textarea>
					<hr>
					<button type="button" onclick="rep()">답글</button>
					<button type="button" onclick="slide_hide()">취소</button>
				</form>
			</div>
		</div>
		</div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>