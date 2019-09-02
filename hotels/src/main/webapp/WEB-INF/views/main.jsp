<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
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
/*  		swipe 스타일 */
		.swiper-container {
			width:100%;
			max-height:200px;
			padding:30px 0;
			border:5px solid silver;
			border-radius:7px;
			box-shadow:0 0 20px #ccc inset;
		}
		
		.swiper-container img{
			width:100%;
			max-height:200px;
		}
		
		.ui-autocomplete
	    {
	        max-height: 140px;
	        overflow-y: hidden; /* prevent horizontal scrollbar */
	        overflow-x: hidden;
	    }
	</style>	

	
<!-- 	swiper 소스파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/swiper/swiper.css">
<script src="${pageContext.request.contextPath}/js/swiper/swiper.js"></script>

<!-- 슬라이더 스크립트 -->
<script>
	$(function(){
		var mySwiper = new Swiper ('.swiper-container', {
				loop : true,
// 				resizeReInit: true,
				effect: 'fade',
				autoResize: true
		    })
	})
</script>
<!-- Slider main container -->
<div class="swiper-container">
    <!-- Additional required wrapper -->
    <div class="swiper-wrapper">
        <!-- Slides -->
        <div class="swiper-slide"><img src="${pageContext.request.contextPath }/img/1.jpg"></div>
        <div class="swiper-slide"><img src="${pageContext.request.contextPath }/img/2.jpg"></div>
        <div class="swiper-slide"><img src="${pageContext.request.contextPath }/img/3.jpg"></div>
        ...
    </div>
</div>


<div style="height: 20px;"></div>

<!-- 자동완성 스크립트 -->
<script>
$(function(){
	var region_list = [];
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
			}
		}
	})
	
    $("input[name=region]").autocomplete({
   		source : region_list
    });
})
</script>

<form action="${pageContext.request.contextPath }/hotel/search">
<div style="max-width: 1100px;min-width:355px ;margin: auto; text-align: center;">
	<div class="form-group" style="width: 150px;display: inline-block;">
		<input type="text" placeholder="지역 선택" name="region" class="form-control" required>
	</div>
	
	<div style="width: 200px;display: inline-block;">
          <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
               <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" placeholder="체크인" name="check_in" required/>
               <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
                   <div class="input-group-text"><i class="fa fa-calendar"></i></div>
               </div>
           </div>
	</div>
	
	<div style="width: 200px;display: inline-block;">
          <div class="input-group date" id="datetimepicker2" data-target-input="nearest">
               <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker2" placeholder="체크아웃" name="check_out" required/>
               <div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
                   <div class="input-group-text"><i class="fa fa-calendar"></i></div>
               </div>
           </div>
       </div>
       
    <div class="form-group" style="width: 150px;display: inline-block;">
	  <select class="custom-select" name="people" required>
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
</form>

<script type="text/javascript">
    $(function () {
    	var now = new Date();
    	now.setDate(now.getDate()+1);
    	var startday = now;
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
<div style="text-align: center;">

<span> 여기에 메인 내용을 넣으시면 됩니다.</span>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>