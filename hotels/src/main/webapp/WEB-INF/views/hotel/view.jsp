<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/typeahead/typeahead.js"></script>
<!-- 평점 소스파일 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/star/star.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/star/star.css" />

<!-- date picker 소스파일 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker/moment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/datepicker/tempusdominus-bootstrap-4.min.css" />

<!-- 다음 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=46239c794a7a0438306ca21d387251c8"></script>
  	
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
			var size = Object.keys(data).length;
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

<!-- hotel Swiper -->
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
	      effect: 'fade',
	      autoplay: {
		      delay: 5000,
		      disableOnInteraction: false,
	    },
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

<!-- room 슬라이더 스크립트 -->
<script>
	$(function(){
		var mySwiper = new Swiper ('.room-swiper', {
				autoHeight : true,
				loop : true,
				resizeReInit: true,
				effect: 'fade',
				autoplay: {
				      delay: 2500,
				      disableOnInteraction: false,
			    },
			    pagination: {
			        el: '.swiper-pagination',
			        type:'bullets',
			        clickable:'true',
			      }
		    })
	})
</script>
<style>
	.room-pic{
		max-width: 300px;
		height: 200px;
		display: inline-block;
	}
	.room-swiper{
		height: 100%;
	}
	.room-swiper .swiper-pagination{
		position: relative;
		text-align: center;
		bottom: 27px;
	}
	.swiper-pagination-bullet{
		background: white;
		opacity: 0.7;
	}
	.swiper-pagination-bullet-active{
		background: #007aff;
	}
</style>

<!-- hotel detail wrap -->
<style>
	.hotel-detail-wrap{
		display: flex;
		margin-bottom: 20px;
	}
	.hotel-map-wrap{
		border: 1px solid lightgray;
		border-radius:5px;
		height: 300px;
		width: 300px;
		margin-right: 20px;
		padding: 5px;
	}
	.hotel-title-wrap{
		border: 1px solid lightgray;
		border-radius: 5px;
		padding: 10px;
		width: 800px;
	}
	.hotel-title-wrap{
		display: flex;
		flex-direction: column;
	}
    .hotel-title-wrap .head-name{
    	font-size: 30px;
    	color: black;
    }
    .hotel-title-wrap > .title-content-wrap{
    	width: 780px;
    }
    .hotel-title-wrap > .hotel-addr{
    	border-bottom: 1px solid lightgray;
    	padding-bottom: 10px;
    }
    .hotel-content-wrap{
		padding: 10px;
		display: flex;
    }
    .hotel-content-wrap .hotel-star-wrap{
    	border: 1px solid lightgray;
    	border-radius: 5px;
    	height:180px;
    	padding: 10px;
    	flex-grow: 1;
    	margin-right: 20px;
    	
    }
    .hotel-content-wrap .hotel-content-wrap{
    	border: 1px solid lightgray;
    	border-radius: 5px;
    	flex-grow: 1;
    }
    .hotel-star-wrap .hotel-star{
    	width: 200px;
    	margin: auto;
    	margin-top: 40px;
    }
    .hotel-star-wrap .hotel-star .star-wrap{
	    display: inline-block;
	    width:200px;
	    height:40px;
	}
	.hotel-star-wrap .hotel-star .star-wrap > .star-paint{
	    width:0%;
	    height:40px;
	    background-color:#5392f9;
	}
	.hotel-star-wrap .hotel-star .star-wrap > img{
	    position: absolute;
	    width:200px;
	    height:40px;
	}
</style>
<!--  room detail style -->
<style>
	.room-detail{
		display: flex;
		flex-flow: column;
	}
	.room-header{
		font-size: 15px;
	}
	.room-ico-wrap{
		border: 1px solid #ced4da;
		border-radius:10px;
		padding: 5px;
		width: 750px;
	}
	.room-detail >.room-ico-wrap img{
		width: 30px;
		height: 30px;
	}
	.room-body-wrap{
		display: flex;
		flex-wrap: wrap;
	}
	.room-thumnail{
		width: 300px;
		height: 200px;
		margin-right: 5px;
	}
	.room-reserve{
		display: flex;
		margin-bottom: 15px;
	}
	.room-reserve>div{
		border: 1px solid lightgray;
		border-radius: 5px;
		margin-right: 10px;
		padding: 10px;
	}
	.room-reserve .room-intro{
		width: 330px;
	}
	.room-pic img{
		border-radius: 5px;
	}
	.reserve-info{
		flex-grow: 1;
	}
	.room-intro{
		flex-grow: 3;
	}
	.reserve-price{
		flex-grow: 1;
	}
</style>
<style>
  .swiper-container {
    width: 100%;
    height: 100%;
  }
  .swiper-slide {
    text-align: center;
    font-size: 18px;
    background: #fff;
    /* Center slide text vertically */
    display: -webkit-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    -webkit-align-items: center;
    align-items: center;
  }
</style>

<!-- 날짜 검색 스크립트 -->
<script type="text/javascript">
    $(function () {
    	$(".toast").hide();
    	
    	$("input[name=check_in]").focus(function(){
    	    $("#datetimepicker1").datetimepicker("show");
		});
		$("input[name=check_out]").focus(function(){
			$("#datetimepicker2").datetimepicker("show");
		});
    	
    	var map = new URLSearchParams(window.location.search);
    	if(map.get("region")) $("input[name=region]").val(decodeURI(map.get("region")));
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

    	$("form").submit(function(e){
    		e.preventDefault();
    		var region_uri = encodeURI($("input[name=region]").val());
    		$("input[name=region]").val(region_uri);
    		$(".toast").show();
    		var daygap = new Date($("#datetimepicker2 input").val()) - new Date($("#datetimepicker1 input").val());
    		if(daygap < 0){
    			$('#date-toast').toast({
                    delay: 3000
                }).toast('show');
    			$("input[name=check_in]").val("");
    			$("input[name=check_in]").focus();
    		}else{
    			this.submit();
    		}
    	})
		//날짜 차이 구하는 함수
		function dateMath() {
			if(startday != null && lastday!=null){
				var diff = dateDiff(new Date($("#datetimepicker1 input").val()), new Date($("#datetimepicker2 input").val()));
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
/* 		 iconn 크기 조절  */
		.ico-wrap img{
	    	width: 24px;
	    	margin-left: 5px;
	    	margin-right: 5px;
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
			color: #003a70;
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
		#date-toast{
			position: fixed;
			top: 30px;
			right: 50px;
			z-index: 999;
		}
		#date-toast>.toast-header{
			background-color: #000080;
			color: white;
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
    .gallery-top{
    	border-radius: 10px;
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
    .card{
    	margin-bottom: 20px;
    }
    .card 
</style>


<script>
	$(function(){
		var markerPosition  = new kakao.maps.LatLng(${hdto.hotel_latitude}, ${hdto.hotel_longitude}); 
	
		// 이미지 지도에 표시할 마커입니다
		// 이미지 지도에 표시할 마커는 Object 형태입니다
		var marker = {
		    position: markerPosition
		};
	
		var staticMapContainer  = document.getElementById('hotel-map'), // 이미지 지도를 표시할 div  
		    staticMapOption = { 
		        center: new kakao.maps.LatLng(${hdto.hotel_latitude}, ${hdto.hotel_longitude}), // 이미지 지도의 중심좌표
		        level: 6, // 이미지 지도의 확대 레벨
		        marker: marker // 이미지 지도에 표시할 마커 
		    };    
	
		// 이미지 지도를 생성합니다
		var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
	});
</script>

<form action="../search">
<div style="height: 20px;"></div>
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
	<input class="btn btn-danger" type="submit" value="호텔 재 검색">
	
<span style="font-size: 20px;" class="diff"></span>
</div>
</form>
<div class="hotel-info-wrap" style="width: 1100px; margin: auto;">
	<div style="height: 20px;"></div>
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
   
	<div class="hotel-detail-wrap">
		<div class="hotel-map-wrap" id="hotel-map"></div>
		
	  	<div class="hotel-title-wrap">
	  		<div class="title-content-wrap">
				<div class="head-name" style="display: inline-block;">${hdto.hotel_name}</div>
				<div class="hotel-star" style="width: 120px;display: inline-block;">
			    	<div style="display: inline-block;" data-toggle="tooltip" title="${hdto.hotel_star}성급 호텔" class="star-wrap" data-star="${hdto.hotel_star}" >
			        	<img src="${pageContext.request.contextPath}/img/star/star.png">        
			        	<div class="star-paint"></div>
			    	</div>
				</div>
				<i style="color: #ffa2ad;" class="wish-btn fa fa-heart-o fa-2x"></i>
			</div>
			<div class="hotel-addr">
				<div>${hdto.hotel_basic_addr}</div>
			</div>
			
			
			<div class="hotel-content-wrap">
				<div class="hotel-star-wrap">
					<div class="hotel-star">
				    	<div style="display: inline-block;" data-toggle="tooltip" title="리뷰 평점 : ${hotel_score}" class="star-wrap" data-star="${hotel_score}" >
				        	<img src="${pageContext.request.contextPath}/img/star/star.png">        
				        	<div class="star-paint"></div>
				    	</div>
				    	<font style="margin: auto; width: 70px;display: block">리뷰 평점</font>
					</div>
				</div>
				
				<div class="hotel-content-wrap">
					<span>${hdto.hotel_content}</span>
				</div>
			</div>
			
			
		</div>
	
	</div>
  
<div class="card border-secondary">
	<div class="card-header">주요 편의 시설</div>
	<div class="card-body">
		<div class="ico-wrap" style="display: inline-block;width: 100%;padding: 10px 0px;">
			<c:if test="${hdto.hotel_bbq=='Y'}">
			<img alt="" data-toggle="tooltip" data-placement="top" title="바베큐" data-original-title="바베큐" src="${pageContext.request.contextPath}/img/ico/bbq.png">바베큐장</c:if>
			<c:if test="${hdto.hotel_karaoke=='Y'}">
			<img alt="" data-toggle="tooltip" data-placement="top" title="노래방" src="${pageContext.request.contextPath}/img/ico/karaoke.png">노래방</c:if>
			<c:if test="${hdto.hotel_cafe=='Y'}">
			<img alt="" data-toggle="tooltip" data-placement="top" title="카페" src="${pageContext.request.contextPath}/img/ico/cafe.png">카페</c:if>
			<c:if test="${hdto.hotel_convenience_store=='Y'}">
			<img alt="" data-toggle="tooltip" data-placement="top" title="편의점" src="${pageContext.request.contextPath}/img/ico/conveni.png">편의점</c:if>
			<c:if test="${hdto.hotel_fitness=='Y'}">
			<img alt="" data-toggle="tooltip" data-placement="top" title="피트니스" src="${pageContext.request.contextPath}/img/ico/fitness.png">피트니스</c:if>
			<c:if test="${hdto.hotel_internet=='Y'}">
			<img alt="" data-toggle="tooltip" data-placement="top" title="인터넷" src="${pageContext.request.contextPath}/img/ico/internet.png">무료 WIFI</c:if>
			<c:if test="${hdto.hotel_lounge=='Y'}">
			<img alt="" data-toggle="tooltip" data-placement="top" title="라운지" src="${pageContext.request.contextPath}/img/ico/lounge.png">라운지</c:if>
			<c:if test="${hdto.hotel_parking=='Y'}">
			<img alt="" data-toggle="tooltip" data-placement="top" title="주차장" src="${pageContext.request.contextPath}/img/ico/parking.png">주차장</c:if>
			<c:if test="${hdto.hotel_pool=='Y'}">
			<img alt="" data-toggle="tooltip" data-placement="top" title="수영장" src="${pageContext.request.contextPath}/img/ico/pool.png">수영장</c:if>
			<c:if test="${hdto.hotel_sauna=='Y'}">
			<img alt="" data-toggle="tooltip" data-placement="top" title="사우나" src="${pageContext.request.contextPath}/img/ico/sauna.png">사우나</c:if>
		</div>
	</div>
</div>

<c:forEach	var="detail_room" items="${detail_list}">
	<div class="card border-secondary room-wrap">
		<div class="card-header room-header">${detail_room.rdto.room_name } | 최대숙박인원 : ${detail_room.rdto.room_people}</div>
		<div class="card-body room-body-wrap">
		<div class="room-thumnail">
			<!-- Slider main container -->
			<div class="room-pic">
				<div class="room-swiper">
				    <!-- Additional required wrapper -->
				    <div class="swiper-wrapper">
				        <!-- Slides -->
				        <c:forEach items="${detail_room.room_file_list}" var="room_picture">
				        <div class="swiper-slide"><img height="200px" width="300px" src="${pageContext.request.contextPath }/img_v/4?img_name=${room_picture.r_file_name}"></div>
				        </c:forEach>
				    </div>
				    <div class="swiper-pagination"></div>
				</div>
			</div>
		</div>
			<div class="room-detail">
			
				<div class="room-reserve">
					<div class="reserve-info">
						<img alt="" width="40" height="40" data-toggle="tooltip" data-placement="top" title="" data-original-title="침구" src="${pageContext.request.contextPath}/img/room_ico/bed.png"> : ${detail_room.rdto.room_bed}
						<br>
						<div><img alt="" width="40" height="40" data-toggle="tooltip" data-placement="top" title="" data-original-title="정원" src="${pageContext.request.contextPath}/img/room_ico/people.png"> : ${detail_room.rdto.room_people}</div>
					</div>
					<div class="room-intro">
						<div>${detail_room.rdto.room_content}</div>
					</div>
					<div class="reserve-price">
						<div><div style="font-weight: bold; font-size: 20px;text-align: right;color: black"><fmt:formatNumber value="${detail_room.rdto.room_price}" pattern="#,###" />원</div></div>
						<div style="text-align: center">세금 및 기타 요금 포함</div>
						<div><a class="btn btn-reserve btn-block" style="color: white; border-radius: 10px;">예약하러 가기</a></div>
					</div>
				</div>
				
				<div class="room-ico-wrap">
					<div style="border-bottom: 1px solid lightgray; margin-bottom: 5px;">서비스 / 혜택</div>
					<c:if test="${detail_room.rdto.room_breakfast eq 'Y'}">
					<img alt="" data-toggle="tooltip" data-placement="top" title="" data-original-title="조식" src="${pageContext.request.contextPath}/img/room_ico/breakfast.png"></c:if>
					<c:if test="${detail_room.rdto.room_spa eq 'Y'}">
					<img alt="" data-toggle="tooltip" data-placement="top" title="" data-original-title="스파" src="${pageContext.request.contextPath}/img/room_ico/spa.png"></c:if>
					<c:if test="${detail_room.rdto.room_conditioner eq 'Y'}">
					<img alt="" data-toggle="tooltip" data-placement="top" title="" data-original-title="에어컨" src="${pageContext.request.contextPath}/img/room_ico/conditioner.png"></c:if>
					<c:if test="${detail_room.rdto.room_tv eq 'Y'}">
					<img alt="" data-toggle="tooltip" data-placement="top" title="" data-original-title="TV" src="${pageContext.request.contextPath}/img/room_ico/tv.png"></c:if>
					<c:if test="${detail_room.rdto.room_refrigerator eq 'Y'}">
					<img alt="" data-toggle="tooltip" data-placement="top" title="" data-original-title="냉장고" src="${pageContext.request.contextPath}/img/room_ico/refrigerator.png"></c:if>
					<c:if test="${detail_room.rdto.room_shower_room eq 'Y'}">
					<img alt="" data-toggle="tooltip" data-placement="top" title="" data-original-title="샤워룸" src="${pageContext.request.contextPath}/img/room_ico/shower_room.png"></c:if>
					<c:if test="${detail_room.rdto.room_hair eq 'Y'}">
					<img alt="" data-toggle="tooltip" data-placement="top" title="" data-original-title="헤어드라이어" src="${pageContext.request.contextPath}/img/room_ico/hair.png"></c:if>
					<c:if test="${detail_room.rdto.room_cookoo eq 'Y'}">
					<img alt="" data-toggle="tooltip" data-placement="top" title="" data-original-title="취사가능" src="${pageContext.request.contextPath}/img/room_ico/cookoo.png"></c:if>
					<c:if test="${detail_room.rdto.room_smoking eq 'Y'}">
					<img alt="" data-toggle="tooltip" data-placement="top" title="" data-original-title="흡연가능" src="${pageContext.request.contextPath}/img/room_ico/smoking.png"></c:if>
					<c:if test="${detail_room.rdto.room_cooking eq 'Y'}">
					<img alt="" data-toggle="tooltip" data-placement="top" title="" data-original-title="취사가능" src="${pageContext.request.contextPath}/img/room_ico/cooking.png"></c:if>
					<c:if test="${detail_room.rdto.room_bath eq 'Y'}">
					<img alt="" data-toggle="tooltip" data-placement="top" title="" data-original-title="욕조" src="${pageContext.request.contextPath}/img/room_ico/bath.png"></c:if>
				</div>
			</div>
		</div>
	</div>
<%-- 	<p>${detail_room}</p> --%>
</c:forEach>
<div class="hotel_review">
	
</div>
<h2 style="margin: 100px auto 50px; width: 200px;"> 호텔 리뷰 </h2>

<c:forEach var="review"	items="${review_list }">
<div class="card border-secondary mb-3">
  <div class="card-header">${review.room_name}&emsp;&emsp;${fn:substring(review.review_when, 0, 16)}</div>
  <div class="card-body">
	  <div class="hotel-star" style="width: 120px;display: inline-block;">
	    	<div style="display: inline-block;" data-toggle="tooltip" title="평점 : ${review.review_score }" class="star-wrap" data-star="${review.review_score}" >
	        	<img src="${pageContext.request.contextPath}/img/star/star.png">        
	        	<div class="star-paint"></div>
	    	</div>
		</div>
    <h4 class="card-title">${review.review_content}</h4>
  </div>
</div>
</c:forEach>
  		
  			
  			


</div>
<!-- 	팝업알림 -->
  <div class="toast" id="date-toast">
    <div class="toast-header">
      숙박기간
    </div>
    <div class="toast-body">
      Check In 날짜가 Check Out 날짜보다 후일일 수 없습니다.
    </div>
  </div>
<input type="hidden" class="hotel_no" value="${param.h_no}">
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>