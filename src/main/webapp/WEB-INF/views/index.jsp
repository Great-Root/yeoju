<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여주마켓</title>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<c:set var="userId" value=""/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script type="text/javascript">
   var pageNo = 1;
   $(document).ready(function(){
      initPage(pageNo);
      initPage(++pageNo);
      $(window).scroll(function() {
    	   if($(window).scrollTop() + $(window).height() == $(document).height()) {
        	  pageNo += 1;
              initPage(pageNo);
    	   }
    	});
   });
      
   function initPage(pageNo) {
      
      var param = {
         "pageNo" : pageNo,
         "keyword" : '${keyword}'
      };
      // 데이터를 불러온다.
      $.ajax({
          url : "goods/list.do",
          type : "GET",
          dataType : "json",
          data : param,
          async : false,
          success : function(list) {
        	  $.each(list,function(index, item) {
            	$(lodingList(item)).hide().appendTo("#images").show(1200)
        	  })
         	  if(list.length < 5){
           		  msg = '<hr>더이상 상품이 없습니다'
           		  $("#msg").html(msg)
           	  }
          },
          error : function() {
             alert("문제 발생!!!");
          }
       })
   }

   function lodingList(item) {
            html = '<div class ="div-d" ><a class ="a-a" href ="${path}/goods/detail/'+item.goodsId+'">'
            html += '<div class ="div-e"><img alt="상품 이미지" src="https://www.greatroot.net/img/download?fileName='+item.imgFileName+'" >'
            html += '<div class ="div-f"></div>'
            html += '<div class ="div-g"><div class ="div-h">'+item.goodsName+'</div>'
            html += '<div class ="div-i"><div class ="div-j">'+item.goodsPrice+'</div>'
            html += '<div class ="div-k"><span>8분전</span></div></div></div></div></a></div>'
        return html;
   }
</script>
<link rel="stylesheet" type="text/css" href="resources/css/list.css">

</head>

<body>
   <c:import url="default/header.jsp" />
<div class ="div-1">
<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
    <a href ="#1">
      <img src="https://media.bunjang.co.kr/images/nocrop/617974702.jpg" class="d-block w-100" alt="...">
    </a>
    </div>
    <div class="carousel-item">
       <a href="#2">
      <img src="https://media.bunjang.co.kr/images/nocrop/645571250.jpg" class="d-block w-100" alt="...">
       </a>
    </div>
    <div class="carousel-item">
       <a href ="#3">
      <img src="https://media.bunjang.co.kr/images/nocrop/650140922.jpg" class="d-block w-100" alt="...">
       </a>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>
   <section class ="section01" style ="width:1035px; margin:auto; padding : 3.5rem 0px 1.5rem;">
      <h2>오늘의 상품 추천</h2>
      <div class ="div-a" ><div class ="div-b"><div class ="div-c" id="images">
      </div></div></div>
      <div id="msg"></div>
   </section>
   <c:import url="default/footer.jsp" />
</body>
</html>