<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/typeahead/typeahead.js"></script>
<!-- 평점 소스파일 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/star/star.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/star/star.css" />
<!-- date picker 소스파일 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker/moment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/datepicker/tempusdominus-bootstrap-4.min.css" />

<!-- 	date picker width 버그 수정 -->
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
			width:150px;
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
	    .keywordArea{
	    	margin: auto;
	    	width: 1000px;
	    	
	    	border: 1px solid #e3d6c6;
	    	padding: 20px 10px;
	    	vertical-align: middle;
	    	display: table;
	    }
	    .keywordArea .keywordArea-key>.custom-control{
	    	display: inline-block;
	    	width: 100px;
	    }
	    .key-wrap{
	    	width: 910px;
	    	margin: auto;
	    }
	    .resdesc-wrap{
	    	border-top: 1px solid #e6e5de;
	    	border-bottom: 1px solid #e6e5de;
	    	height: 300px;
	    }
	    .resdesc-wrap>.resdesc{
	    	width: 500px;
	    	margin: auto;
	    	text-align: center;
	    	margin: 100px auto;
	    	font-size: 25px;
	    	color: #62523f;
	    }
	    .room-area{
	    	text-align: center;
	    }
	    .hotel-list{
	    	list-style: none;
	    	text-align: left;
	    }
	    .hotel-list li{
	    	width: 1220px;
	    	margin: auto;
	    	border-bottom: 1px solid #f4eee3;
	    }
	    .hotel-list .thum-nail img{
	    	border-radius: 10px;
	    }
	    .ico-wrap img{
	    	width: 24px;
	    	margin-left: 5px;
	    	margin-right: 5px;
	    }
		a:link { color: black; text-decoration: none;}
		a:visited { color: black; text-decoration: none;}
		a:hover { color: black; text-decoration: none;}
	</style>
<script>
$(function(){
	$('[data-toggle="tooltip"]').tooltip();
// 	키워드 리셋
	$(".keywordreset").click(function(){
		$("input[type=checkbox]").prop("checked", false);
	})
})
</script>

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

<form action="search">
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

<script type="text/javascript">
    $(function () {
    	$("input[name=check_in]").focus(function(){
			$(".check_in_btn").trigger("click");
		});
		$("input[name=check_out]").focus(function(){
			$(".check_out_btn").trigger("click");
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
<div style="height: 20px;"></div>

<div class="keywordArea">
	<div class="key-wrap">
	<div class="keywordArea-key" style="width: 550px;text-align: left; display: table-cell;">
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" value="Y" class="custom-control-input" id="parking" name="parking" ${not empty param.parking?"checked":""}>
	      <label class="custom-control-label" for="parking">주차장</label>
	    </div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" value="Y" class="custom-control-input" id="fitness" name="fitness" ${not empty param.fitness?"checked":""}>
	      <label class="custom-control-label" for="fitness">피트니스</label>
	    </div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" value="Y" class="custom-control-input" id="pool" name="pool" ${not empty param.pool?"checked":""}>
	      <label class="custom-control-label" for="pool">수영장</label>
	    </div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" value="Y" class="custom-control-input" id="sauna" name="sauna" ${not empty param.sauna?"checked":""}>
	      <label class="custom-control-label" for="sauna">사우나</label>
	    </div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" value="Y" class="custom-control-input" id="lounge" name="lounge" ${not empty param.lounge?"checked":""}>
	      <label class="custom-control-label" for="lounge">라운지</label>
	    </div>
	    <div style="display: block;height: 15px;"></div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" value="Y" class="custom-control-input" id="bbq" name="bbq" ${not empty param.bbq?"checked":""}>
	      <label class="custom-control-label" for="bbq">바베큐장</label>
	    </div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" value="Y" class="custom-control-input" id="cafe" name="cafe" ${not empty param.cafe?"checked":""}>
	      <label class="custom-control-label" for="cafe">카페</label>
	    </div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" value="Y" class="custom-control-input" id="conveni" name="conveni" ${not empty param.conveni?"checked":""}>
	      <label class="custom-control-label" for="conveni">편의점</label>
	    </div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" value="Y" class="custom-control-input" id="karaoke" name="karaoke" ${not empty param.karaoke?"checked":""}>
	      <label class="custom-control-label" for="karaoke">노래방</label>
    	</div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" value="Y" class="custom-control-input" id="internet" name="internet" ${not empty param.internet?"checked":""}>
	      <label class="custom-control-label" for="internet">인터넷</label>
	    </div>
	</div>
	<div style="vertical-align:middle; display:table-cell;text-align: center; width: 290px;">
		<span class="keywordreset btn btn-danger" style="margin-left: 40px;">선택 해제</span>
		<input type="submit" class="btn btn-danger" style="width: 130px;" value="키워드 검색"/>
	</div>
	</div>					
</div>
</form>
<br>
<div class="resdesc-wrap">
<div class="resdesc">예약을 원하는 지역, 날짜, 인원을 선택후 호텔 검색 버튼을 눌러주세요.</div>
</div>

<div class="room-area">
	<div class="pick-hotel">
		<ul class="hotel-list">
			<c:forEach var="h_con" items="${h_list}">
			<li class="hotel-wrap" style="padding:20px;vertical-align: middle;">
			
				<div class="thumnail-wrap" style="display: inline-block; width: 230px;">
					<a href="view/${h_con.hotel_no}?region=${param.region}&check_in=${param.check_in}&check_out=${param.check_out}&people=${param.people}">
						<img alt="${h_con.hotel_title}" style="border-radius: 5px;width: 230px; height:230px;" src="${pageContext.request.contextPath}/img_v/3?img_name=${h_con.hotel_title}">
					</a>
				</div>
				
				<div class="detail" style="width: 700px;display: inline-block;">
					<div class="hotel-title-wrap">
						<font style="display: inline-block;font-size: 30px;width: 300px;">${h_con.hotel_name }</font>
						<div class="hotel-star">
					    	<div style="display: inline-block;" data-toggle="tooltip" title="${h_con.hotel_star}성급 호텔" class="star-wrap" data-star="${h_con.hotel_star}" >
					        	<img src="${pageContext.request.contextPath}/img/star/star.png">        
					        	<div class="star-paint"></div>
					    	</div>
						</div>
					</div>
					<div class="ico-wrap" style="display: inline-block;width: 100%;padding: 10px 0px;">
						<c:if test="${h_con.hotel_bbq=='Y'}">
						<img alt="" data-toggle="tooltip" data-placement="top" title="" data-original-title="바베큐" src="${pageContext.request.contextPath}/img/ico/bbq.png"></c:if>
						<c:if test="${h_con.hotel_karaoke=='Y'}">
						<img alt="" data-toggle="tooltip" data-placement="top" title="노래방" src="${pageContext.request.contextPath}/img/ico/karaoke.png"></c:if>
						<c:if test="${h_con.hotel_cafe=='Y'}">
						<img alt="" data-toggle="tooltip" data-placement="top" title="카페" src="${pageContext.request.contextPath}/img/ico/cafe.png"></c:if>
						<c:if test="${h_con.hotel_convenience_store=='Y'}">
						<img alt="" data-toggle="tooltip" data-placement="top" title="편의점" src="${pageContext.request.contextPath}/img/ico/conveni.png"></c:if>
						<c:if test="${h_con.hotel_fitness=='Y'}">
						<img alt="" data-toggle="tooltip" data-placement="top" title="피트니스" src="${pageContext.request.contextPath}/img/ico/fitness.png"></c:if>
						<c:if test="${h_con.hotel_internet=='Y'}">
						<img alt="" data-toggle="tooltip" data-placement="top" title="인터넷" src="${pageContext.request.contextPath}/img/ico/internet.png"></c:if>
						<c:if test="${h_con.hotel_lounge=='Y'}">
						<img alt="" data-toggle="tooltip" data-placement="top" title="라운지" src="${pageContext.request.contextPath}/img/ico/lounge.png"></c:if>
						<c:if test="${h_con.hotel_parking=='Y'}">
						<img alt="" data-toggle="tooltip" data-placement="top" title="주차장" src="${pageContext.request.contextPath}/img/ico/parking.png"></c:if>
						<c:if test="${h_con.hotel_pool=='Y'}">
						<img alt="" data-toggle="tooltip" data-placement="top" title="수영장" src="${pageContext.request.contextPath}/img/ico/pool.png"></c:if>
						<c:if test="${h_con.hotel_sauna=='Y'}">
						<img alt="" data-toggle="tooltip" data-placement="top" title="사우나" src="${pageContext.request.contextPath}/img/ico/sauna.png"></c:if>
					</div>
					<div>
						<div>${h_con.hotel_content}</div>
					</div>
				</div>
				
				<div class="price-review" style="width: 95px;display: inline-block;">
					<p>객실 수 : ${h_con.room_cnt }</p>
					<font>가격 : ${h_con.min_price } <i class="fi fi-h-currency"></i></font>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>