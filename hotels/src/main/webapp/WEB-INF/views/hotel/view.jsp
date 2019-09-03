<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/typeahead/typeahead.js"></script>
<!-- 평점 소스파일 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/star/star.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/star/star.css" />

<!-- date picker 소스파일 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker/moment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/datepicker/tempusdominus-bootstrap-4.min.css" />


<!-- 	swiper 소스파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/swiper/swiper.css">
<script src="${pageContext.request.contextPath}/js/swiper/swiper.js"></script>


  
<script>
	$(function(){
		$(".wish-btn").click(function(){
			$(this).toggleClass("fa-heart-o");
			$(this).toggleClass("fa-heart");
		})
	});
	
	$(function(){
		$(".wish-btn").click(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/member/wish_in",
				data : {
					hotel_no : $(".hotel_no").val()  // 보내는 이름 : 우리가 가져올 값
				},
				dataType : "text",
				success : function(resp) {
					if (resp == "Y") {
					}
					else {
					}
				}
			});
		});
	});
</script>

<!-- search data -->
<script>
	var states = [];
	$.ajax({
		type:'post',
		url : "${pageContext.request.contextPath}/region",
		dataType:"json",
		success: function(data){
			console.log(data[1].region_kor_name);
			var size = Object.keys(data).length;
			console.log(size);
			for(var i=0; i<size; i++){
				states.push(data[i].region_kor_name);
				states.push(data[i].region_eng_name);
			}
		}
	})
</script>
<!-- 자동완성 스크립트 -->
<script>
$(function(){
	var substringMatcher = function(strs) {
		  return function findMatches(q, cb) {
		    var matches, substringRegex;

		    // an array that will be populated with substring matches
		    matches = [];

		    // regex used to determine if a string contains the substring `q`
		    substrRegex = new RegExp(q, 'i');

		    // iterate through the pool of strings and for any string that
		    // contains the substring `q`, add it to the `matches` array
		    $.each(strs, function(i, str) {
		      if (substrRegex.test(str)) {
		        matches.push(str);
		      }
		    });

		    cb(matches);
		  };
		};
	
	$("input[name=region]").typeahead({
	  hint: true,
	  highlight: true,
	  minLength: 1
	},
	{
	  name: 'states',
	  source: substringMatcher(states)
	});
})
</script>

<!-- Initialize Swiper -->
<script>
  $(function(){
	  var galleryThumbs = new Swiper('.gallery-thumbs', {
	      spaceBetween: 10,
	      slidesPerView: 6,
	      freeMode: true,
	      autoResize: true,
	      
	      watchSlidesVisibility: true,
	      watchSlidesProgress: true,
	    });
	    var galleryTop = new Swiper('.gallery-top', {
	      spaceBetween: 10,
	      autoResize: true,
	      loop : true,
	      navigation: {
	        nextEl: '.swiper-button-next',
	        prevEl: '.swiper-button-prev',
	      },
	      thumbs: {
	        swiper: galleryThumbs
	      }
	    });
  })
    
  </script>

<script type="text/javascript">
    $(function () {
    	$("input[name=check_in]").focus(function(){
    	    $("#datetimepicker1").datetimepicker("show");
		});
		$("input[name=check_out]").focus(function(){
			$("#datetimepicker2").datetimepicker("show");
		});
    	
    	var map = new URLSearchParams(window.location.search);
    	if(!map.get('check_out')){
    		$(".keywordArea").css("display","none");
    		$(".room-area").css("display","none");
    		$(".resdesc-wrap").css("display","block");
    	}else{
    		$(".keywordArea").css("display","block");
    		$(".room-area").css("display","block");
    		$(".resdesc-wrap").css("display","none");
    	}
    	var startday = null;
    	if(!map.get('check_in')){
	    	var now = new Date();
	    	now.setDate(now.getDate()+1);
	    	startday = now;
    	}else{
    		startday = map.get('check_in');
    	}
    	
    	var lastday = null;
    	
        $('#datetimepicker1').datetimepicker({
        	minDate : now,
        	format : 'YYYY-MM-DD'
        });
        $('#datetimepicker2').datetimepicker({
        	minDate : now,
        	format : 'YYYY-MM-DD',
            useCurrent: false
        });
        
        $("#datetimepicker1").on("change.datetimepicker", function (e) {
            $('#datetimepicker2').datetimepicker('minDate', e.date);
            startday = $("#datetimepicker1 input").val();
            dateMath();
        });
        $("#datetimepicker2").on("change.datetimepicker", function (e) {
            lastday = $("#datetimepicker2 input").val();
            dateMath();
        });

		//날짜 차이 구하는 함수
		function dateMath() {
			if(startday != null && lastday!=null){
				var gap = Date.parse(lastday)-Date.parse(startday);
				if(gap<0){
					alert("체크인 날자가 체크아웃보다 뒤에 있습니다.")
					return;
				}
				var diff = dateDiff(startday, lastday)
				$(".diff").text(diff);
				if(diff>30){
					alert("기간은 30일 이하로 선택해주세요.")
					$("#datetimepicker2 input").val('');
				}
			}
		};
		function dateDiff(_check_in, _check_out) {
			var diffDate_1 = _check_in instanceof Date ? _check_in : new Date(_check_in);
			var diffDate_2 = _check_out instanceof Date ? _check_out : new Date(_check_out);

			diffDate_1 = new Date(diffDate_1.getFullYear(), diffDate_1
					.getMonth() + 1, diffDate_1.getDate());
			diffDate_2 = new Date(diffDate_2.getFullYear(), diffDate_2
					.getMonth() + 1, diffDate_2.getDate());

			var diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
			diff = Math.ceil(diff / (1000 * 3600 * 24));
			return diff;
		}
    });
</script>


<!-- 	date picker width 버그 수정 -->
<style>
		.bootstrap-datetimepicker-widget.dropdown-menu{
			width:330px;
		}
		
		<!-- typeahead 디자인 -->
		.typeahead,
		.tt-query,
		.tt-hint {
		  border: 2px solid #ccc;
		  outline: none;
		}
		.typeahead {
		  background-color: #fff;
		}
		.typeahead:focus {
		  border: 2px solid #0097cf;
		}
		.twitter-typeahead > .form-control:focus{
			color: blue;
			font-weight: bold;
		}
		.tt-menu{
			width:20rem;
			background-color: white;
			border: 1px solid black;
		}
		.tt-dropdown-menu {
		  width: 422px;
		  margin-top: 3px;
		  padding: 8px 0;
		  background-color: #fff;
		  border: 1px solid #ccc;
		  border: 1px solid rgba(0, 0, 0, 0.2);
		  -webkit-border-radius: 8px;
		     -moz-border-radius: 8px;
		          border-radius: 8px;
		  -webkit-box-shadow: 0 5px 10px rgba(0,0,0,.2);
		     -moz-box-shadow: 0 5px 10px rgba(0,0,0,.2);
		          box-shadow: 0 5px 10px rgba(0,0,0,.2);
		}
		
		/* 자동완성(하단) */
		.tt-suggestion {
		  padding: 3px 20px;
		  line-height: 24px;
		  color: gray;
		  text-align: left;
		  
		  /* 텍스트 숨기기 위한 스타일 속성 */
		  text-overflow: ellipsis;
		  white-space: nowrap;
		  overflow: hidden;
		}
		.tt-suggestion:hover{
			background-color:lightgray;
			cursor:hand;
		}
		
		.tt-suggestion.tt-cursor {
		  color: #fff;
		  background-color: #0097cf;
		}
		
		.tt-suggestion p {
		  margin: 0;
		  font-size: 18px;
		  text-align: left;
		}
		
		.twitter-typeahead {
			width: 100%;
		}
	</style>	
<style>
/* 	swiper 스타일 */
    .gallary {
      position: relative;
      width:100%;
      height:600px;
    }
    .swiper-container {
      width: 100%;
      height: 300px;
      margin-left: auto;
      margin-right: auto;
    }
    .swiper-slide {
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
    }
    .gallery-top {
      height: 80%;
      width: 100%;
    }
    .gallery-thumbs {
      height: 20%;
      box-sizing: border-box;
      padding: 10px 0;
    }
    .gallery-thumbs .swiper-slide {
      height: 100%;
      opacity: 0.4;
    }
    .gallery-thumbs .swiper-slide-thumb-active {
      opacity: 1;
    }
    
    .hotel-title-wrap .head-name{
     	font-size: 30px;
     	color: black;
     	padding: 20px 0px;
    }
</style>

${hdto }
<form action="../search">
<div style="height: 50px;"></div>
<div style="max-width: 100%;min-width:355px ;margin: auto; text-align: center;padding: 40px 10px 30px 10px; background-color: #f1f1f1; vertical-align: middle;">
	<div class="form-group" style="width: 150px;display: inline-block;">
		<input type="text" placeholder="지역 선택" name="region" class="form-control" value="${param.region}" required>
	</div>
	
	<div style="width: 200px;display: inline-block;">
          <div class="input-group date" id="datetimepicker1" data-target-input="nearest" >
               <input type="text" name="check_in" class="form-control datetimepicker-input" value="${param.check_in}" placeholder="체크 인" data-target="#datetimepicker1" autocomplete="off" required/>
               <div class="input-group-append check_in_btn" data-target="#datetimepicker1" data-toggle="datetimepicker">
                   <div class="input-group-text"><i class="fa fa-calendar"></i></div>
               </div>
           </div>
	</div>
	
	<div style="width: 200px;display: inline-block;">
          <div class="input-group date" id="datetimepicker2" data-target-input="nearest">
               <input type="text" name="check_out" class="form-control datetimepicker-input" value="${param.check_out}" placeholder="체크 아웃" data-target="#datetimepicker2" autocomplete="off" required/>
               <div class="input-group-append check_out_btn" data-target="#datetimepicker2" data-toggle="datetimepicker">
                   <div class="input-group-text"><i class="fa fa-calendar"></i></div>
               </div>
           </div>
       </div>
       
    <div class="form-group" style="width: 150px;display: inline-block;">
	  <select class="custom-select" name="people" >
	    <option value="1" ${param.people eq 1?"selected":""}>총 인원 1</option>
	    <option value="2" ${param.people eq 2?"selected":""}>총 인원 2</option>
	    <option value="3" ${param.people eq 3?"selected":""}>총 인원 3</option>
	    <option value="4" ${param.people eq 4?"selected":""}>총 인원 4</option>
	    <option value="5" ${param.people eq 5?"selected":""}>총 인원 5</option>
	  </select>
	</div>
	<input class="btn btn-danger" type="submit" value="호텔 검색">
	
<span style="font-size: 20px;" class="diff"></span>
</div>
</form>


<div class="hotel-info-wrap" style="width: 1100px; margin: auto;">
	<div class="hotel-title-wrap">
		<div class="head-name" style="display: inline-block;">${hdto.hotel_name}</div>
		<div class="hotel-star" style="width: 120px;display: inline-block;">
	    	<div style="display: inline-block;" data-toggle="tooltip" title="${hdto.hotel_star}성급 호텔" class="star-wrap" data-star="${hdto.hotel_star}" >
	        	<img src="${pageContext.request.contextPath}/img/star/star.png">        
	        	<div class="star-paint"></div>
	    	</div>
		</div>
		<i style="color: #ffa2ad;" class="wish-btn fa fa-heart-o fa-2x"></i>
	</div>
	
  <div class="gallary">
	  <div class="swiper-container gallery-top">
	    <div class="swiper-wrapper">
	    <c:forEach var="hotel_file" items="${hflist}">
	    	<div class="swiper-slide">
	    		<img width="100%" height="100%" src="${pageContext.request.contextPath}/img_v/3?img_name=${hotel_file.h_file_name}">
	    	</div>
	    </c:forEach>
	
	    </div>
	    <!-- Add Arrows -->
	    <div class="swiper-button-next swiper-button-white"></div>
	    <div class="swiper-button-prev swiper-button-white"></div>
	  </div>
	  <div class="swiper-container gallery-thumbs">
	    <div class="swiper-wrapper">
		    <c:forEach var="hotel_file" items="${hflist}">
				<div class="swiper-slide">
	      			<img width="100%" height="100%" src="${pageContext.request.contextPath}/img_v/3?img_name=${hotel_file.h_file_name}">
	      	    </div>	    
		    </c:forEach>
	    </div>
	  </div>
  </div>
  	<div class="room-wrap">
  		<c:forEach	var="detail_room" items="${detail_list}">
  			<p>${detail_room}</p>
  			<c:forEach items="${detail_room.room_file_list }" var="room_picture">
  				<p>${room_picture}</p>
  			</c:forEach>
  		</c:forEach>
  	</div>
  <div>
  
  
  </div>
  
  
</div>






<input type="hidden" class="hotel_no" value="${param.h_no}">
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>