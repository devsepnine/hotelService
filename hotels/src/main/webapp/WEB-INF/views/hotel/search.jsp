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
		.ui-autocomplete
	    {
	        max-height: 140px;
	        overflow-y: hidden; /* prevent horizontal scrollbar */
	        overflow-x: hidden;
	    }
	</style>
<!-- 자동완성 스크립트 -->
<script>
$(function(){
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
})
</script>
<div style="height: 50px;"></div>
<div style="max-width: 1100px;min-width:355px ;margin: auto; text-align: center;">
	<div class="form-group" style="width: 150px;display: inline-block;">
		<input type="text" placeholder="지역 선택" name="region" class="form-control">
	</div>
	
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

<div class="keyWord clearfix" id="keywordArea" style="width: 900px;text-align: center;">
  				<div>
						<span>
							<input type="checkbox" id="MBR" name="keyword" class="css-checkbox checkbox" value="MBR" onclick="fncKeywordOn('MBR');" autocomplete="off">
							<label for="MBR" class="css-label" style="background-position: 0px 0px;">
								멤버십</label>
		  				</span>
		  				<span>
		  						<input type="checkbox" id="27" name="keyword" class="css-checkbox checkbox" value="27" onclick="fncKeywordOn('27');" autocomplete="off">
		  						<label for="27" class="css-label" style="background-position: 0px 0px;">야외수영장</label>
	  						</span>
		  				<span>
		  						<input type="checkbox" id="28" name="keyword" class="css-checkbox checkbox" value="28" onclick="fncKeywordOn('28');" autocomplete="off">
		  						<label for="28" class="css-label" style="background-position: 0px 0px;">조식</label>
	  						</span>
		  				<span>
		  						<input type="checkbox" id="29" name="keyword" class="css-checkbox checkbox" value="29" onclick="fncKeywordOn('29');" autocomplete="off">
		  						<label for="29" class="css-label" style="background-position: 0px 0px;">와이너리</label>
	  						</span>
		  				<span>
		  						<input type="checkbox" id="30" name="keyword" class="css-checkbox checkbox" value="30" onclick="fncKeywordOn('30');" autocomplete="off">
		  						<label for="30" class="css-label" style="background-position: 0px 0px;">스파</label>
	  						</span>
		  				<span>
		  						<input type="checkbox" id="481" name="keyword" class="css-checkbox checkbox" value="481" onclick="fncKeywordOn('481');" autocomplete="off">
		  						<label for="481" class="css-label" style="background-position: 0px 0px;">라운지 혜택</label>
	  						</span>
		  				<span>
		  						<input type="checkbox" id="489" name="keyword" class="css-checkbox checkbox" value="489" onclick="fncKeywordOn('489');" autocomplete="off">
		  						<label for="489" class="css-label" style="background-position: 0px 0px;">엑스트라 베드</label>
	  						</span>
		  				<span>
		  					<a href="#none" onclick="fncKeywordReset();" class="keywordReset">
		  						선택해제<!-- 선택해제 -->
		  					</a>
		  				</span>
	  				</div>
	  				<a href="#none" class="btnKeySrch" onclick="fncSearchResvList();">
	  					키워드 검색</a>
  				</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>