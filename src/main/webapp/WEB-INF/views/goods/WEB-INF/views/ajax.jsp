<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function test(){
		$.ajax({
			url:"ajax_result", //"ajax",
			type:"GET",
			success:function(cnt){ //cnt 는 컨트롤러에서 넘겨주는 return값
				console.log("연결 성공")
				$("#count").text(cnt)
			},
			error : function(){
				alert("연결 실패")
			}
		})
	}
</script>
</head>
<body>

	
	<h1>일</h1> <h1>2</h1> <h1>3</h1>
	<h1>4</h1> <h1>5</h1> <h1>6</h1>
	<h1>7</h1> <h1>8</h1> <h1>9</h1>
	<hr>
	<button type ="button" onclick="test()">클릭</button>
	<label id = "count">0</label>
</body>
</html>