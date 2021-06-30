<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${path}/resources/css/member/login.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
   window.addEventListener('DOMContentLoaded', function () {
      $("#joinForm").submit(function(){
         if($("#pw").val() !== $("#pw2").val()){
            alert("비밀번호가 다릅니다.");
            $("#pw").val("").focus();
            $("#pw2").val("");
            return false;
         }else if ($("#pw").val().length < 8) {
            alert("비밀번호는 8자 이상으로 설정해야 합니다.");
            $("#pw").val("").focus();
            return false;
         }else if($.trim($("#pw").val()) !== $("#pw").val() || $.trim($("#email").val()) !== $("#email").val() || $.trim($("#userId").val()) !== $("#userId").val()){
            alert("공백은 입력이 불가능합니다.");
            return false;
         }
      })
      
      $("#userId").keyup(function() {
         $.ajax({
            url : "./check_id.do",
            type : "POST",
            data : {
               userId : $("#userId").val()
            },
            success : function(result) {
               if (result == 1) {
                  $("#id_check").html("중복된 아이디가 있습니다.");
                  $("#joinBtn").attr("disabled", "disabled");
               } else {
                  $("#id_check").html("");
                  $("#joinBtn").removeAttr("disabled");
               }
            },
         })
      });
   $("#userId").keyup(function() {
      $.ajax({
         url : "./check_id.do",
         type : "POST",
         data : {
            userId : $("#userId").val()
         },
         success : function(result) {
            if (result == 1) {
               $("#id_check").html("중복된 아이디가 있습니다.");
               $("#joinBtn").attr("disabled", "disabled");
            } else {
               $("#id_check").html("");
               $("#joinBtn").removeAttr("disabled");
            }
         },
      })
   });
   
   $("#email").keyup(function(){
      $.ajax({
         url : "./check_email.do",
         type : "POST",
         data : {
            email : $("#email").val()
         },
         success : function(result) {
            if (result == 1) {
               $("#email_check").html("중복된 이메일이 있습니다.");
            } else {
               $("#email_check").html("");
            }
         },
      })
   });
});
   </script>

<title>회원가입 폼</title>
</head>
<body>
   <div class="login-page">
      <div class="form">
         <a href="${path}/">
            <img src="../../resources/img/여주.png" width="110px" height="140px">
         </a>
            <h1 style="color: green; font-size: 30px;">Join</h1>
         <div>
            <form id="joinForm" action="${path}/member/join_member.do" method="post">
               <p>
                  <input type="text" id="userId" name="userId" placeholder="ID" required> 
                  <span id="id_check"></span>
               </p>
               <p>
                  <input id="pw" name="pw" type="password" placeholder="password" required>
               </p>
               <p>
                  <input id="pw2" type="password" placeholder="password check" required>
               </p>
               <p>
                  <input type="text" id="email" name="email" placeholder="email" required>
                  <span id="email_check"></span>
               </p>
               <p>
                  <button type="submit" id="joinBtn">가입</button>
                  <button type="button" onclick="history.go(-1);" >취소</button>
               </p>
            </form>
         </div>
      </div>
   </div>
   
</body>
</html>