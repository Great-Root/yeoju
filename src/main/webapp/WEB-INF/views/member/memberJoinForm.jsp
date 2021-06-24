<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/member/login.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/cropper.css"> 
<script src="/resources/js/cropper.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
    .label {
      cursor: pointer;
    }

    .progress {
      display: none;
      margin-bottom: 1rem;
    }

    .alert {
      display: none;
    }

    .img-container img {
      max-width: 100%;
    }
  </style>
<script>
	window.addEventListener('DOMContentLoaded', function () {
	      var avatar = document.getElementById('avatar');
	      var image = document.getElementById('image');
	      var input = document.getElementById('input');
	      var $modal = $('#modal');
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
	$("#joinBtn").click(function(){
		var $userId = $("#userId");
		var $pw = $("#pw");
		var $pw2 = $("#pw2");
		var $email = $("#email");
		if($pw.val() !== $pw2.val()){
			alert("비밀번호가 다릅니다.");
			$pw.val("").focus();
			$pw2.val("");
		}else if ($pw.val().length < 8) {
			alert("비밀번호는 8자 이상으로 설정해야 합니다.");
			$pw.val("").focus();
		}else if($.trim($pw.val()) !== $pw.val() || $.trim($email.val()) !== $email.val() || $.trim($userId.val()) !== $userId.val()){
			alert("공백은 입력이 불가능합니다.");
		}else{
			canvas.toBlob(function (blob) {
	            var formData = new FormData();
	            formData.append('profileImg', blob,fileName);
	            formData.append('userId', $userId.val());
	            formData.append('pw', $pw.val());
	            formData.append('email', $email.val());
	            $.ajax('${contextPath}/member/join_member.do', {
	              method: 'POST',
	              data: formData,
	              processData: false,
	              contentType: false,
	              success: function (url) {
	            	  if(url !== ''){
	            		  console.log(url)
		            	  /* location.replace(url) */
	            	  }else{
	            		  alert('다시 시도해주세요')
	            	  }
	              },
	              error: function () {
	            	  alert('실패')
	              }
	            });
			});
		}

		
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
				<img src="../../resources/img/test.png" width="110px" height="140px">
				<h1 style="color: green; font-size: 30px;">Join</h1>
			<div>
				<form id="joinForm" action="" method="post">
				<p>
				<label>프로필 사진</label> <br>
					<label class="label" data-toggle="tooltip" title="클릭해서 이미지를 등록">
						<img class="img-thumbnail" id="avatar"
						src="https://www.greatroot.net/img/download?fileName=default.png"
						alt="avatar" width="240" height="240"> <input type="file"
						class="sr-only" id="input" name="imgFile" accept="image/*">
					</label>
				</p>
					

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
						<button type="button" id="joinBtn">가입</button>
						<button type="button" onclick="history.go(-1);" >취소</button>
					</p>
				</form>
			</div>
		</div>
	</div>
	<!-- 이미지 Modal -->
	<div class="modal fade" id="modal" tabindex="-1" role="dialog"
						aria-labelledby="modalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="modalLabel">상품이미지 선택</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="img-container">
										<img id="image" src="">
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" id="crop">등록하기</button>
								</div>
							</div>
						</div>
					</div>
</body>
</html>