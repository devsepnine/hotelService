<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
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

	
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


<script>
	$(function() {
		var bxsilder = $('.slider').bxSlider({
			auto : true,
			pager : false,
			controls : false,
		});
		$(".datemath").click(function() {
			var start = $("input[name=first]").val();
			var last = $("input[name=last]").val();
			var diff = dateDiff(start, last)
			$(".diff").text(diff);
		})

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
<div class="slider">
   <div><img src="img/1.jpg"></div>
   <div><img src="img/2.jpg"></div>
   <div><img src="img/3.jpg"></div>
</div>


<div class="container">
    <div class='col-md-5'>
        <div class="form-group">
           <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
                <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1"/>
                <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                </div>
            </div>
        </div>
    </div>
    <div class='col-md-5'>
        <div class="form-group">
           <div class="input-group date" id="datetimepicker2" data-target-input="nearest">
                <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker2"/>
                <div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $('#datetimepicker1').datetimepicker({
        	useCurrent: false
        });
        $('#datetimepicker2').datetimepicker({
            useCurrent: false
        });
        
        $("#datetimepicker1").on("change.datetimepicker", function (e) {
            $('#datetimepicker2').datetimepicker('minDate', e.date);
        });
        $("#datetimepicker2").on("change.datetimepicker", function (e) {
            $('#datetimepicker1').datetimepicker('maxDate', e.date);
        });
    });
</script>



<div>
	<form action="" method="post">
		<input type="date" name="first">
		<input type="date" name="last">
		<input type="submit">
	</form>
	<button class="datemath">계산</button>
	<h1 class="diff">aa</h1>
</div>

<div>
<span> 여기에 메인 내용을 넣으시면 됩니다.</span>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>