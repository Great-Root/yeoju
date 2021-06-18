<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function daumPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 도로 명일 경우 R, 지번일 경우 J 의 값을 가지고 있다.
            console.log("data.userSelectedType : "+data.userSelectedType)
            console.log("data.roadAddress : "+data.roadAddress)
            console.log("data.jibunAddress : "+data.jibunAddress)
            console.log("data.zonecode(우편번호) : "+data.zonecode)
            addr = ""
            if(data.userSelectedType == 'R'){
            	addr = data.roadAddress
            }else{
            	addr = data.jibunAddress
            }
            $("[name=addr1]").val(data.zonecode)
            $("[name=addr2]").val(addr)
            $("[name=addr3]").attr("readonly",false);
            $("[name=addr3]").focus()
        }
    }).open();
    
    
    
}
</script>

</head>
<body>
<c:import url="../default/header.jsp" />
   <div style="width:700px; margin: 0 auto;">
      <form action="${contextPath }/mypage/modify" method="post">
			<table>
				<tr>
					<h1 style="color: green; font-size: 30px;">회원정보 수정</h1>
				</tr>
				<tr>
					<td>아이디&nbsp;&nbsp;&nbsp;<input size="30" type="text"	name="userId" value="${modifyInfo.userId}" readonly="readonly"><br>
						이름<input type="text" name="name" value="${modifyInfo.name}"> <br> 
						비밀번호<input size="30" type="password" name="pw" placeholder="8자리 이상 입력해주세요"><br> 
						Email<input type="email" name="email" value="${modifyInfo.email}"> <br>
						
						우편번호<input id="addr1" name="addr1" readonly="readonly">
						<input type="button" onclick="daumPost()" value="우편번호 검색"><br>
						주소<input id="addr2" name="addr2" size="30px" readonly="readonly"><br>
						상세주소<input id="addr3" name="addr3" size="30px" readonly="readonly"><br>
						
						<!--  주소(시/도)<input type="text"	name="addr1" value="${modifyInfo.addr1}"> <br>
						주소(동/면)<input	type="text" name="addr2" value="${modifyInfo.addr2}"><br>
						주소(상세주소)<input type="text" name="addr3" value="${modifyInfo.addr3}"> <br>
						
						
						성별
						<div class="form-check">
							<input class="form-check-input" type="radio" name="M" id="flexRadioDefault1"> 
								<label class="form-check-label" for="flexRadioDefault1">
								남 
								</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="W" id="flexRadioDefault2" checked>
								<label class="form-check-label" for="flexRadioDefault2">
								여 
								</label>
						</div> <br>
						-->
						<input type="submit" value="정보수정완료"> 
						<input type="button" value="로그인" onclick="javascript:window.location='login'">
						<input type="button" value="회원 탈퇴" onclick="location.href='${contextPath }/mypage/delete'">
					</td>
				</tr>
			</table>
		</form>
   </div>
<c:import url="../default/footer.jsp" />
</body>
</html>