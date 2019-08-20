<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!-- date picker 소스파일 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<!-- 	date picker width 버그 수정 -->
	<style>
		.bootstrap-datetimepicker-widget.dropdown-menu{
			width:330px;
		}		
	</style>	

	
<!-- 	슬라이더 소스파일 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<!-- 슬라이더 스크립트 -->
<script>
	$(function() {
		var bxsilder = $('.slider').bxSlider({
			mode:'fade',
			auto : true,
			pager : false,
			controls : false,
			slideWidth: 0
		});
	});
</script>
<!-- 슬라이더 메인 -->
<div class="slider">
   <div><img src="img/1.jpg"></div>
   <div><img src="img/2.jpg"></div>
   <div><img src="img/3.jpg"></div>
</div>


<div style="width: 768px; margin: auto; text-align: center;">
	<div style="width: 200px;display: inline-block;">
          <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
               <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1"/>
               <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
                   <div class="input-group-text"><i class="fa fa-calendar"></i></div>
               </div>
           </div>
	</div>
	
	<div style="width: 200px;display: inline-block;">
          <div class="input-group date" id="datetimepicker2" data-target-input="nearest">
               <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker2"/>
               <div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
                   <div class="input-group-text"><i class="fa fa-calendar"></i></div>
               </div>
           </div>
       </div>
       
   <input type="number">
	
<span style="font-size: 20px;" class="diff"></span>



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


<div>
<span> 여기에 메인 내용을 넣으시면 됩니다.</span>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>