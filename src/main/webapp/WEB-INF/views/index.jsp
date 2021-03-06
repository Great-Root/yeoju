<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여주마켓</title>
<link rel="shortcut icon" href="resources/img/여주favicon.png" type="image/png">
<link rel="icon" href="resources/img/여주favicon.png" type="image/png">
<c:set var="path" value="<%=request.getContextPath()%>"/>
<c:set var="userId" value=""/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://kit.fontawesome.com/bdec6dffe3.js" crossorigin="anonymous"></script>
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
      var $soldOutView = $("#soldOutView");
      if(${soldOutView}){
    	  $soldOutView.addClass('active');
      }else{
    	  $soldOutView.removeClass('active');
      }
      $soldOutView.click(function () {
    	  if(${soldOutView}){
		   location.href='${path}?keyword=${keyword}&searchOption=${searchOption}&soldOutView=false&categoryCode=${categoryCode}'
    	  }else{
		   location.href='${path}?keyword=${keyword}&searchOption=${searchOption}&soldOutView=true&categoryCode=${categoryCode}'
    	  }
	  });
   });
   function initPage(pageNo) {
      var param = {
         "pageNo" : pageNo,
         "keyword" : '${keyword}',
         "searchOption" : '${searchOption}',
         "soldOutView" : '${soldOutView}',
         "categoryCode" : '${categoryCode}'
      };
      console.log(param);
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
// 숫자 타입에서 쓸 수 있도록 format() 함수 추가
   Number.prototype.format = function(){
       if(this==0) return 0;
    
       var reg = /(^[+-]?\d+)(\d{3})/;
       var n = (this + '');
    
       while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
    
       return n;
   };


   function lodingList(item) {
            html = '<div class ="div-d" ><a class ="a-a" href ="${path}/goods/detail/'+item.goodsId+'">'
            html += '<div class ="div-e"><img alt="상품 이미지" src="https://www.greatroot.net/img/download?fileName='+item.imgFileName+'" '+(item.soldOut == 1 ? 'style="opacity:0.5;"':'')+'>'
            html += '<div class ="div-f"></div>'
            html += '<div class ="div-g"><div class ="div-h">'+item.goodsName+(item.soldOut == 1 ? '<b>&nbsp;(판매완료)</b>':'')+'</div>'
            html += '<div class ="div-i"><div class ="div-j">'+item.goodsPrice.format()+'</div>'
            html += '<div class ="div-k"><i class="far fa-eye"></i> '+item.viewCount+' &bull; '+timeForToday(item.regDate)+'</div></div></div></div></a></div>'
        return html;
   }
 //시간
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
		  <button type="button" class="btn btn-outline-success active" id="soldOutView">판매완료 같이보기</button>
		  
      <div class ="div-a" ><div class ="div-b"><div class ="div-c" id="images">
      </div></div></div>
      <div id="msg"></div>
   </section>
   <c:import url="default/footer.jsp" />
</body>
</html>