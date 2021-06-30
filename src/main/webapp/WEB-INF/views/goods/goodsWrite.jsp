<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 등록</title>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="/resources/js/cropper.js"></script>
<script>
	$(document).ready(function(){
		$("#addBtn").click(function(){
			var goodsName = $("#goodsName").val();
			var goodsPrice = $("#goodsPrice").val();
			var goodsInfo = $("#goodsInfo").val();
			var img = $("#img").val();
			var categoryCode = $("categoryCode").val();			
			
			if(goodsName == "") {
				alert("상품명을 입력해주세요");
				goodsName.foucs();
			} else if (goodsPrice == "") {
				alert("상품 가격을 입력해주세요");
				goodsPrice.focus();
			} else if (goodsInfo == "") {
				alert("상품 설명을 입력해주세요");
				goodsInfo.focus();
			} else if (img == "") {
				alert("상품 사진을 입력해주세요");
				img.focus();
			}else if(categoryCode==""){
				alert("카테고리를 선택해주세요");
				categoryCode.focus();
			}
			document.form1.action = "${path}/goods/insert.do";
			document.form1.submit();
		});
	});
	function readURL(input) {
		var file = input.files[0]	//파일에 대한 정보
		if(file != ''){
			var reader = new FileReader();
			reader.readAsDataURL(file);	//읽고
			reader.onload = function (e) {	//로드한 값을 표현한다.
				$("#preview").attr('src',e.target.result);
			}
	window.addEventListener('DOMContentLoaded', function () {
	      var avatar = document.getElementById('avatar');
	      var image = document.getElementById('image');
	      var input = document.getElementById('input');
	      var $modal = $('#modal');
	      var cropper;
	      var canvas;
	      var inputchange = false;
		  var fileName = '';
		  $('#close').click(function () {
				$modal.modal('hide');
		  });
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
	$("#addBtn").click(function(){
		var goodsName = $("#goodsName");
		var goodsPrice = $("#goodsPrice");
		var goodsInfo = $("#goodsInfo");
		if(goodsName.val() == "") {
			alert("상품명을 입력해주세요");
			goodsName.focus();
		} else if (goodsPrice.val() == "") {
			alert("상품 가격을 입력해주세요");
			goodsPrice.focus();
		} else if (goodsInfo.val() == "") {
			alert("상품 설명을 입력해주세요");
			goodsInfo.focus();
		} else if (!inputchange) {
			alert("상품 사진을 등록해주세요");
		}else{
			canvas.toBlob(function (blob) {
	            var formData = new FormData();
	            formData.append('imgFile', blob,fileName);
	            formData.append('goodsName', goodsName.val());
	            formData.append('goodsPrice', goodsPrice.val());
	            formData.append('goodsInfo', goodsInfo.val());
	            $.ajax('${path}/goods/insert.do', {
	              method: 'POST',
	              data: formData,
	              processData: false,
	              contentType: false,
	              success: function (url) {
	            	  if(url !== ''){
		            	  location.replace(url)
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
	    });
	</script>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4/dist/css/bootstrap.min.css" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  <link rel="stylesheet" href="/resources/css/cropper.css">
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
</head>
<body>
<c:import url="../default/header.jsp"/>
<main class="container d-flex flex-wrap align-items-center justify-content-center">
<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 bg-light">
	<div class="row">
		<h2>상품 등록</h2>
	</div>
	<hr>
	<form action="" id="form1" name="form1" enctype="multipart/form-data" method="post">
	<div class="row">
		<div class="col">
    <label class="label" data-toggle="tooltip" title="클릭해서 이미지를 등록">
      <img class="img-thumbnail" id="avatar" src="https://www.greatroot.net/img/download?fileName=default.png" alt="avatar" width="640" height="640">
      <input type="file" class="sr-only" id="input" name="imgFile" accept="image/*">
    </label>
    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
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
		</div>
		<div class="col">
				<input class="form-control mb-2" type="text" placeholder="상품명"  name="goodsName" id="goodsName" aria-label="상품명 입력칸">
				<input class="form-control mb-2" type="text" placeholder="상품가격"  name="goodsPrice" id="goodsPrice" aria-label="상품가격">
				<div class="mb-3">
				
				  <textarea class="form-control" rows="3" placeholder="상품 설명을 입력해주세요"  name="goodsInfo" id="goodsInfo"></textarea>
				</div>
					<label>카테고리</label>
					<select>
					<c:forEach var="cate" items="${category}">
						<option value="${cate.code}">${cate.name}</option>
					</c:forEach>
					</select>
		</div>
	</div>
				<div class="row">
					<div class="col d-flex justify-content-center">
						<input type="button" class="btn btn-primary mx-3" value="상품 등록 완료" id="addBtn"> 
						<input type="button" class="btn btn-secondary mx-3" value="목록" onclick="location.href='${path}/goods/list.do';">
						<input type="button" class="btn btn-danger mx-3" value="취소" onClick="javascript:history.back(-1)"> 
					</div>
				</div>
			</form>
	</div>
	</main>
<c:import url="../default/footer.jsp"/>
</body>
</html>