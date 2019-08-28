<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- date picker 소스파일 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker/moment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/datepicker/tempusdominus-bootstrap-4.min.css" />
<!-- jquery ui -->
<link href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" rel="Stylesheet"></link>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script>
<!-- 	date picker width 버그 수정 -->
	<style>
		.bootstrap-datetimepicker-widget.dropdown-menu{
			width:330px;
		}
		.ui-autocomplete
	    {
	        max-height: 140px;
	        overflow-y: hidden; /* prevent horizontal scrollbar */
	        overflow-x: hidden;
	    }
	    .keywordArea{
	    	margin: auto;
	    	width: 1000px;
	    	
	    	border: 1px solid #e3d6c6;
	    	padding: 20px 10px;
	    	vertical-align: middle;
	    	display: table;
	    }
	    .keywordArea .keywordArea_key>.custom-control{
	    	display: inline-block;
	    	width: 100px;
	    }
	    .key_wrap{
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
	    .room_area{
	    	text-align: center;
	    }
	    .hotel_list{
	    	list-style: none;
	    	text-align: left;
	    }
	    .hotel_list li{
	    	width: 1000px;
	    	margin: 10px 20px;
	    }
	</style>
<script>
$(function(){
<!-- 자동완성 스크립트 -->
	var region_list = new Array;
	$.ajax({
		type:'post',
		url : "${pageContext.request.contextPath}/region",
		dataType:"json",
		success: function(data){
			console.log(data[1].region_kor_name);
			var size = Object.keys(data).length;
			console.log(size);
			for(var i=0; i<size; i++){
				region_list.push(data[i].region_kor_name);
				region_list.push(data[i].region_eng_name);
			}
		}
	})
    $("input[name=region]").autocomplete({
   	source : region_list
    });
// 	키워드 리셋
	$(".keywordreset").click(function(){
		$("input[type=checkbox]").prop("checked", false);
	})
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
               <input type="text" name="date1" class="form-control datetimepicker-input" value="${param.date1}" data-target="#datetimepicker1" required/>
               <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
                   <div class="input-group-text"><i class="fa fa-calendar"></i></div>
               </div>
           </div>
	</div>
	
	<div style="width: 200px;display: inline-block;">
          <div class="input-group date" id="datetimepicker2" data-target-input="nearest">
               <input type="text" name="date2" class="form-control datetimepicker-input" value="${param.date2}" data-target="#datetimepicker2" required/>
               <div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
                   <div class="input-group-text"><i class="fa fa-calendar"></i></div>
               </div>
           </div>
       </div>
       
    <div class="form-group" style="width: 150px;display: inline-block;">
	  <select class="custom-select" name="people">
	    <option value="1">총 인원 1</option>
	    <option value="2">총 인원 2</option>
	    <option value="3">총 인원 3</option>
	    <option value="4">총 인원 4</option>
	    <option value="5">총 인원 5</option>
	  </select>
	</div>
	<input class="btn btn-danger" type="submit" value="호텔 검색">
	
<span style="font-size: 20px;" class="diff"></span>
</div>

<script type="text/javascript">
    $(function () {
    	var map = new URLSearchParams(window.location.search);
    	if(!map.get('date2')){
    		$(".keywordArea").css("display","none");
    		$(".room_area").css("display","none");
    		$(".resdesc-wrap").css("display","block");
    	}else{
    		$(".keywordArea").css("display","block");
    		$(".room_area").css("display","block");
    		$(".resdesc-wrap").css("display","none");
    	}
    	var startday = null;
    	if(!map.get('date1')){
	    	var now = new Date();
	    	now.setDate(now.getDate()+1);
	    	startday = now;
    	}else{
    		startday = map.get('date1');
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
				var diff = dateDiff(startday, lastday)
				$(".diff").text(diff);
				if(diff>30){
					alert("기간은 30일 이하로 선택해주세요.")
					$("#datetimepicker2 input").val('');
				}
			}
		};
		function dateDiff(_date1, _date2) {
			var diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
			var diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);

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
	<div class="key_wrap">
	<div class="keywordArea_key" style="width: 520px;text-align: left; display: table-cell;">
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" class="custom-control-input" id="parking" name="parking" ${not empty param.parking?"checked":""}>
	      <label class="custom-control-label" for="parking">주차장</label>
	    </div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" class="custom-control-input" id="fitness" name="fitness" ${not empty param.fitness?"checked":""}>
	      <label class="custom-control-label" for="fitness">피트니스</label>
	    </div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" class="custom-control-input" id="pool" name="pool" ${not empty param.pool?"checked":""}>
	      <label class="custom-control-label" for="pool">수영장</label>
	    </div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" class="custom-control-input" id="sauna" name="sauna" ${not empty param.sauna?"checked":""}>
	      <label class="custom-control-label" for="sauna">사우나</label>
	    </div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" class="custom-control-input" id="lounge" name="lounge" ${not empty param.lounge?"checked":""}>
	      <label class="custom-control-label" for="lounge">라운지</label>
	    </div>
	    <div style="display: block;height: 15px;"></div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" class="custom-control-input" id="bbq" name="bbq" ${not empty param.bbq?"checked":""}>
	      <label class="custom-control-label" for="bbq">바베큐장</label>
	    </div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" class="custom-control-input" id="cafe" name="cafe" ${not empty param.cafe?"checked":""}>
	      <label class="custom-control-label" for="cafe">카페</label>
	    </div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" class="custom-control-input" id="conveni" name="conveni" ${not empty param.conveni?"checked":""}>
	      <label class="custom-control-label" for="conveni">편의점</label>
	    </div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" class="custom-control-input" id="karaoke" name="karaoke" ${not empty param.karaoke?"checked":""}>
	      <label class="custom-control-label" for="karaoke">노래방</label>
    	</div>
	    <div class="custom-control custom-checkbox">
	      <input type="checkbox" class="custom-control-input" id="internet" name="internet" ${not empty param.internet?"checked":""}>
	      <label class="custom-control-label" for="internet">인터넷</label>
	    </div>
	</div>
	<div style="vertical-align:middle; display:table-cell;text-align: center; width: 280px;">
		<a href="#none" class="keywordreset btn btn-danger" style="margin-left: 40px;">선택 해제</a>
		<input type="submit" class="btn btn-danger" style="width: 130px;" value="키워드 검색"/>
	</div>
	</div>					
</div>
</form>
<br>
<div class="resdesc-wrap">
<div class="resdesc">예약을 원하는 지역, 날짜, 인원을 선택후 호텔 검색 버튼을 눌러주세요.</div>
</div>

<div class="room_area">
	<div class="pick_hotel">
		<ul class="hotel_list">
			<c:forEach var="h_con" items="${h_list}">
			<li>
				<span><img alt="" src="http://placehold.it/150"></span>
				<span><i class="fa fa-car fa-2x"></i></span>
				<span>${h_con.hotel_name }${h_con.hotel_tel }</span>
			</li>
			</c:forEach>
		</ul>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>