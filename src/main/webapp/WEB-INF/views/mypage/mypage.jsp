<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4/dist/css/bootstrap.min.css" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="resources/css/list.css">
<link rel="stylesheet" href="/resources/css/cropper.css"> 
<script src="/resources/js/cropper.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var pageNo = 1;
		var $imges = $("#imges");
		var $sellingBtn = $("#sellingBtn");
		var $heartBtn = $("#heartBtn");
		var $doneBtn = $("#doneBtn");
		var	$mypageBtn = $(".myBtn");
		var $nowList = $sellingBtn;
		initPage();
		function initPage() {
			$imges.html('');
			requestList($nowList, 1);
			requestList($nowList, 2);
		}
	   $(window).scroll(function() {
	 	   if($(window).scrollTop() + $(window).height() == $(document).height()) {
	     	  requestList($nowList, ++pageNo);
	 	   }
	 	});
	   $sellingBtn.click(function () {
		   $nowList = $sellingBtn;
			initPage();
		})
		$heartBtn.click(function () {
			$nowList = $heartBtn;
			initPage();
		})
		$doneBtn.click(function () {
			$nowList = $doneBtn;
			initPage();
		})
		// URL 비동기방식(Ajax) 요청 코드
		function requestList(e, page) {
			pageNo = page;
			nowList = e;
			selectBtn($(e));
		    var param = {
				"pageNo" : page
			};
			$.ajax({
				url : "mypage/"+getUrl($(e)),
				type : "GET",
				dataType : "json",
			    data : param,
			    async : false,
				success : function(list) {
					html = ''
					$.each(list,function(index, item) {
						html += setCard(item)
					})
					if(list.length < 5){
			   		  msg = '<hr>더이상 상품이 없습니다'
			   		  $("#msg").html(msg)
				   	}
					$imges.append(html)
				},
				error : function() {
					alert("문제 발생!!!");
				}
			})
		}
		   
		// URL 추가 하는 곳
		function getUrl(e) {
			switch (e.attr('id')) {
			  case 'sellingBtn':
			    return 'sellGoods';
			  case 'heartBtn':
			    return 'heartPage';
			  case 'doneBtn':
			    return 'soldoutGoods';
			}
		}
		
		// 상품 이미지 세팅하는 코드
		function setCard(item) {
			html = '<div class ="div-d" ><a class ="a-a" href ="${path}/goods/detail/'+item.goodsId+'">'
			html += '<div class ="div-e"><img alt="상품 이미지" src="https://www.greatroot.net/img/download?fileName='+item.imgFileName+'" '
					+ (item.soldOut == 1 ? 'style="opacity:0.5;"':'')+' >'
			html += '<div class ="div-f"></div>'
			html += '<div class ="div-g"><div class ="div-h">'+item.goodsName+(item.soldOut == 1 ? '<b>&nbsp;(판매완료)</b>':'')+'</div>'
			html += '<div class ="div-i"><div class ="div-j">'+ item.goodsPrice.format() +'</div>'
			html += '<div class ="div-k"><i class="far fa-eye"></i> '+item.viewCount+' &bull; '+timeForToday(item.regDate)+'</div></div></div></div></a></div>'
			return html;
		}
		// 버튼 활성화 코드
		function activeBtn(btn) {
			btn.removeClass('btn-outline-success');
			btn.addClass('btn-success');
		}
		// 버튼 비활성화 코드
		function inActiveBtn(btn) {
			btn.removeClass('btn-success');
			btn.addClass('btn-outline-success');
		}
		// 버튼선택 코드 : 전체 비활성화, 매개변수로 들어온 버튼만 활성화
		function selectBtn(btn) {
			inActiveBtn($mypageBtn);
			activeBtn(btn);
		}
		
	});
	
	 window.addEventListener('DOMContentLoaded', function () {
	      var avatar = document.getElementById('avatar');
	      var image = document.getElementById('image');
	      var input = document.getElementById('input');
	      var $progress = $('.progress');
	      var $progressBar = $('.progress-bar');
	      var $alert = $('.alert');
	      var $modal = $('#modal');
	      var cropper;
	      var fileName;
	      $progress.hide();
	      $('#close').click(function () {
			$modal.modal('hide');
		  });


	      $('[data-toggle="tooltip"]').tooltip();
	      
	      input.addEventListener('change', function (e) {
	        var files = e.target.files;
	        var done = function (url) {
	          input.value = '';
	          image.src = url;
	          $alert.hide();
	          $modal.modal('show');
	        };
	        var reader;
	        var file;
	        var url;

	        if (files && files.length > 0) {
	          file = files[0];
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
	        var canvas;

	        $modal.modal('hide');

	        if (cropper) {
	          canvas = cropper.getCroppedCanvas({
	            width: 160,
	            height: 160,
	          });
	          initialAvatarURL = avatar.src;
	          avatar.src = canvas.toDataURL();
	          $progress.show();
	          $alert.removeClass('alert-success alert-warning');
	          canvas.toBlob(function (blob) {
	            var formData = new FormData();

	            formData.append('avatar', blob, fileName);
	            $.ajax('${path}/mypage/profileUpload', {
	              method: 'POST',
	              data: formData,
	              processData: false,
	              contentType: false,

	              xhr: function () {
	                var xhr = new XMLHttpRequest();

	                xhr.upload.onprogress = function (e) {
	                  var percent = '0';
	                  var percentage = '0%';

	                  if (e.lengthComputable) {
	                    percent = Math.round((e.loaded / e.total) * 100);
	                    percentage = percent + '%';
	                    $progressBar.width(percentage).attr('aria-valuenow', percent).text(percentage);
	                  }
	                };

	                return xhr;
	              },

	              success: function () {
	                $alert.show().addClass('alert-success').text('프로필 등록 완료');
	                setTimeout(function () {
	                	$alert.hide();
					},3000);
	                location.reload();
	              },

	              error: function () {
	                avatar.src = initialAvatarURL;
	                $alert.show().addClass('alert-warning').text('프로필 등록 실패');
	                setTimeout(function () {
	                	$alert.hide();
					},3000);
	              },

	              complete: function () {
	                $progress.hide();
	              },
	            });
	          });
	        }
	      });
	      
	   // 프로필 이미지 reset 버튼 코드
		    const $reset = $("#profileReset");
		    var $avatar = $("#avatar");
			$reset.hide();
			$avatar.mouseenter(function () {
				$reset.show(200);
			});
			$avatar.mouseleave(function () {
				setTimeout(function () {
					$reset.hide(200);
				},2000)
			});
			
			$reset.click(function () {
				$.ajax('${path}/mypage/setDefaultImg',{
					method: 'GET',
					success: function () {
		                $alert.show().addClass('alert-success').text('프로필 등록 완료');
		                setTimeout(function () {
		                	$alert.hide();
						},3000);
		                location.reload();
		              },
		              error: function () {
		                $alert.show().addClass('alert-warning').text('프로필 등록 실패');
		                setTimeout(function () {
		                	$alert.hide();
						},3000);
		              }
				});
			});
			// 숫자 타입에서 쓸 수 있도록 format() 함수 추가
			   Number.prototype.format = function(){
			       if(this==0) return 0;
			    
			       var reg = /(^[+-]?\d+)(\d{3})/;
			       var n = (this + '');
			    
			       while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
			    
			       return n;
			   };
			 //시간
	    });
			function timeForToday(value){
				const today=new Date();
				const timeValue=new Date(value);
				console.log(timeValue);
				const betweenTime = Math.floor((today.getTime() - timeValue.getTime())/1000/60);
				if(betweenTime<1) return '방금전';
				if(betweenTime<60){
					return betweenTime+`분전`;
				}
				
				const betweenTimeHour = Math.floor(betweenTime / 60);
				if(betweenTimeHour < 24){
					return betweenTimeHour+`시간전`;
				}
				
				const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
				if(betweenTimeDay < 365){
					return betweenTimeDay+`일전`;
				}
				
				return `${Math.floor(betweenTimeDay / 365)}년전`;
			}
	
</script>
</head>
<body>
<c:import url="../default/header.jsp" />
	<main class="container d-flex">
		<div class="card shadow-sm me-3" style="width:200px; min-width: 200px;">
			<label class="label" data-toggle="tooltip" title="클릭해서 프로필 이미지 변경" style=" padding: 0.5em;">
					<img class="img-thumbnail card-img-top rounded" id="avatar"
					src="${path}/mypage/profileDownload/${userInfo.userId}"
					alt="avatar" width="240" height="240"> <input type="file"
					class="sr-only" id="input" name="imgFile" accept="image/*" hidden="hidden">
			</label>
			<button type="button" class="btn btn-outline-warning" id="profileReset" style="margin: 0 1em;">기본 프로필로 설정</button>
			 <div class="progress">
		      <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
		    </div>
		    <div class="alert" role="alert"></div>
			<div class="card-body">
				<h5 class="card-title">ID : ${userInfo.userId}</h5>
				<button type="button" onclick="location.href='mypage/memberModify?userId=${loginUser}';" class="btn btn-outline-success">회원정보 수정</button>
				<p class="card-text">${userInfo.regDate}시작</p>
				<div class="mb-3">
					지금 이거 다팔면<br> <b>${ result.totalMoney }원</b> 벌수 있어요~<hr>
					지금까지<br> <b>${ result.getMoney }원</b> 벌었어요!<hr>
					찜한 총 갯수는<br> <b>${ result.heartNum }개</b> 이며<br> <b>${ result.soldoutNum }개</b>는 이미 팔리고 <br>
					<b>${ result.sellingNum }개</b> 남았어요<br>다사려면<br> <b>${ result.needMoney }원</b>이 필요해요
				</div>
			</div>
		</div>
		<div class ="div-a" >
		<section class="text-center mb-2">
			<button type="button" class="myBtn btn" id="sellingBtn" >판매상품</button>
			<button type="button" class="myBtn btn" id="doneBtn" >판매완료</button>
			<button type="button" class="myBtn btn" id="heartBtn">찜 상품</button>
		</section>
			<div class ="div-b">
				<div class ="div-c" id="imges" style="min-width: 1100px;">
				</div>
			</div>
		<div id="msg"></div>
		</div>
	</main>
	<c:import url="../default/footer.jsp" />
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
					<button type="button" class="btn btn-success" id="crop">등록하기</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>