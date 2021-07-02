<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 등록</title>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/cropper.js"></script>
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
		var categoryCode = $("#categoryCode option:selected").val();
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
	            formData.append('categoryCode', categoryCode);
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
   .form {
  background: #FFFFFF;
  max-width: 1200px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: left;
  font-size: 13px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
 </style>
</head>
<body>
<c:import url="../default/header.jsp"/>
<main class="container d-flex flex-wrap align-items-center justify-content-center">
<div class="form position-relative overflow-hidden">
		<h2 style="color:green; font-size:30px; text-align:center">상품 등록</h2>
	<hr>
	<form action="" id="modifyForm" enctype="multipart/form-data" method="post">
	<div class="row">
		<div class="col">
    <label class="label" data-toggle="tooltip" title="클릭해서 이미지를 등록">
      <img class="img-thumbnail" id="avatar" src="https://www.greatroot.net/img/download?fileName=default.png" alt="avatar" width="640" height="640">
      <input type="file" class="sr-only" id="input" name="imgFile" accept="image/*">
    </label>
    <!--  -->
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
				<div align="right">
					<input type="submit" class="btn btn-secondary" id="close" data-dismis="modal" value="취소" style="margin-right: 0.7em;"> 
					<input type="button" class="btn btn-primary" id="crop" value="등록하기" >
				</div>
          </div>
        </div>
      </div>
    </div>
		</div>
		<div class="col">
				<input class="form-control mb-2" type="text" placeholder="상품명"  name="goodsName" id="goodsName" aria-label="상품명 입력칸">
				<input class="form-control mb-2" type="number" step="1000" placeholder="상품가격" autocomplete="off" name="goodsPrice" id="goodsPrice" aria-label="상품가격">
				<div class="mb-3">
				
				  <textarea class="form-control" rows="3" placeholder="상품 설명을 입력해주세요"  name="goodsInfo" id="goodsInfo"></textarea>
				</div>
					<label>카테고리</label>
					<select id="categoryCode">
					<c:forEach var="cate" items="${category}">
						<option value="${cate.code}">${cate.name}</option>
					</c:forEach>
					</select>
		</div>
	</div>
				<div class="row">
					<div class="col d-flex justify-content-center">
						<input type="button" class="btn btn-outline-success mx-3" value="상품 등록 완료" id="addBtn"> 
						<input type="button" class="btn btn-outline-danger" value="취소" onClick="javascript:history.back(-1)"> 
					</div>
				</div>
			</form>
	</div>
	</main>
<c:import url="../default/footer.jsp"/>
</body>
</html>