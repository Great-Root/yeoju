<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link
	href="${pageContext.request.contextPath}/resources/css/member/modify.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/cropper.css"> 
<script src="/resources/js/cropper.js"></script>
<script>
	window.addEventListener('DOMContentLoaded', function () {
	      var avatar = document.getElementById('avatar');
	      var image = document.getElementById('image');
	      var input = document.getElementById('input');
	      var $modal = $('#modal');
	      var $close = $('#close');
	      var cropper;
	      var canvas;
	      var inputchange = false;
		  var fileName = '';
	      $('[data-toggle="tooltip"]').tooltip();

	      input.addEventListener('change', function (e) {
	        var files = e.target.files;
	        var done = function (url) {
	          input.value = '';
	          image.src = url;
	          $modal.modal('show');
	        };
	        var reader;
	        var file;
	        var url;

	        if (files && files.length > 0) {
	          file = files[0];
	          inputchange = true;
	          fileName = file.name;
	          if (URL) {
	            done(URL.createObjectURL(file));
	          } else if (FileReader) {
	            reader = new FileReader();
	            reader.onload = function (e) {
	              done(reader.result);
	            };
	            reader.readAsDataURL(file);
	          }
	        }
	      });
	      $close.click(function () {
			$modal.modal('hide');
		  });
	      $modal.on('shown.bs.modal', function () {
	        cropper = new Cropper(image, {
	          aspectRatio: 1,
	          viewMode: 3,
	        });
	      }).on('hidden.bs.modal', function () {
	        cropper.destroy();
	        cropper = null;
	      });

	      document.getElementById('crop').addEventListener('click', function () {
	        var initialAvatarURL;
	        

	        $modal.modal('hide');
	        if (cropper) {
	          canvas = cropper.getCroppedCanvas({
	            width: 640,
	            height: 640,
	          });
	          initialAvatarURL = avatar.src;
	          avatar.src = canvas.toDataURL();
	          
	        }
	      });
	});
	function daumPost() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 도로 명일 경우 R, 지번일 경우 J 의 값을 가지고 있다.
				console.log("data.userSelectedType : " + data.userSelectedType)
				console.log("data.roadAddress : " + data.roadAddress)
				console.log("data.jibunAddress : " + data.jibunAddress)
				console.log("data.zonecode(우편번호) : " + data.zonecode)
				addr = ""
				if (data.userSelectedType == 'R') {
					addr = data.roadAddress
				} else {
					addr = data.jibunAddress
				}
				$("[name=addr1]").val(data.zonecode)
				$("[name=addr2]").val(addr)
				$("[name=addr3]").attr("readonly", false);
				$("[name=addr3]").focus()
			}
		}).open();
	}

	$(function() {
		$("#modifyForm").submit(function() {
			if ($("#pw").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			} else if ($.trim($("#pw").val()) !== $("#pw").val() || $.trim($("#email").val()) !== $("#email").val()) {
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		});
	});
</script>

</head>
<body>
	<c:import url="../default/header.jsp" />
	<div class="form">
		<form id="modifyForm" action="${contextPath }/mypage/modify"
			method="post">
					<h1 style="color: green; font-size: 30px; text-align: center;">회원정보 수정</h1>
					<br>
					<div style="text-align: center;">
					<label class="label" data-toggle="tooltip" title="클릭해서 프로필 이미지 변경">
						<img class="img-thumbnail" id="avatar"
						src="https://www.greatroot.net/img/download?fileName=default.png"
						alt="avatar" width="240" height="240"> <input type="file"
						class="sr-only" id="input" name="imgFile" accept="image/*" hidden="hidden">
					</label>
					</div>
					<hr>
			<table>
				<tr>
					<td style="width: 70px;">
						아이디
					</td>
					<td>
						<h5>${modifyInfo.userId}</h5>
						<input size="40" type="hidden" name="userId" value="${modifyInfo.userId}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>
						이름
					</td>
					<td>
						<input type="text" name="name" size="40" value="${modifyInfo.name}">
					</td>
				</tr>
				<tr>
					<td>
						비밀번호
					</td>
					<td>
						<input type="password" id="pw" name="pw" size="40" placeholder="8자리 이상 입력해주세요">
					</td>
				</tr>
				<tr>
					<td>
						Email
					</td>
					<td>
						<input type="email" size="40" id="email" name="email" value="${modifyInfo.email}">
					</td>
				</tr>
				<tr>
					<td>
						생년월일
					</td>
					<td>
						<input type="text" id="birth" name="birth" size="40" placeholder="ex)19960621" value="${modifyInfo.birth}"><br>
					</td>
				</tr>
				<tr>
					<td>
						전화번호
					</td>
					<td>
						<input type="text" id="tel" name="tel" size="40" placeholder="'-'없이 번호만 입력해주세요" value="${modifyInfo.tel}">
					</td>
				</tr>
				<tr>
					<td>
						성별
					</td>
					<td>
						<input type="checkbox" id="gender" name="gender" value="남">
						남 <input type="checkbox" id="gender" name="gender" value="여">여
					</td>
				</tr>
				<tr>
					<td>
						우편번호
					</td>
					<td>
						<input id="addr1" name="addr1" readonly="readonly" value="${modifyInfo.addr1}">
						<input type="button" onclick="daumPost()" value="우편번호 검색">
					</td>
				</tr>
				<tr>
					<td>
						주소
					</td>
					<td>
						<input id="addr2" name="addr2" size="40px" readonly="readonly" value="${modifyInfo.addr2}">
					</td>
				</tr>
				<tr>
					<td>
						상세주소
					</td>
					<td>
						<input id="addr3" name="addr3" size="40px" readonly="readonly" value="${modifyInfo.addr3}">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="right">
							<input type="submit" value="정보수정완료"> &nbsp;&nbsp; <input
								type="button" value="회원 탈퇴"
								onclick="location.href='${contextPath }/mypage/delete/${modifyInfo.userId}'">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 이미지 Modal -->
	<div class="modal fade" id="modal" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalLabel">상품이미지 선택</h5>
				</div>
				<div class="modal-body">
					<div class="img-container">
						<img id="image" src="">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="close" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="crop">등록하기</button>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>