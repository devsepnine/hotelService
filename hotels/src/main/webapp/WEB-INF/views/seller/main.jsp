<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/seller/seller_template/header.jsp"></jsp:include>
<!-- date picker 소스파일 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker/moment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/datepicker/tempusdominus-bootstrap-4.min.css" />

<!-- jquery ui -->
<link href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" rel="Stylesheet"></link>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
 		google.charts.load('current', {'packages':['corechart']});
 		google.charts.setOnLoadCallback(drawVisualization);
	
 		function drawVisualization() { 
// 			var arr = [
// 				['월', '개수'],
// 				['2004/06',  165],
// 				['2004/07',  165],
// 				['2004/08',  165]
// 			]

 			var arr = [];
 				arr.push(['월', '개수']);
 			<c:forEach var="sales" items="${monthlySales}">
 				<c:forEach var="con" items="${sales}">
 					arr.push(['${con.monthly}', ${con.count}]);
 				</c:forEach>
 			</c:forEach>
			
 			var data = google.visualization.arrayToDataTable(arr);
 			var options = {
 					title : '월별 매출',
 					vAxis: {title: 'Price(원)'},
 					hAxis: {title: 'Month'}, 
 					seriesType: 'bars',
 					series: {5: {type: 'line'}}
 				};
			
 			var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
 			chart.draw(data, options);
		}
</script>
<style>
	.chart_page{
		width: 1600px;
		height: 500px;
	}
	
	.chart_chart{
		width:49%;
		height:100%;
		display:inline-block;
	}
	
	.chart_table{
		width: 49%;
		height:100%;
		display:inline-block;	
	}
	#chart_div{
		height: 100%;
	}



	
</style>

<jsp:include page="/WEB-INF/views/hotel/hotel_template/hotel_header.jsp"></jsp:include>
<div style="height: 20px;"></div>
<div class="chart_page">
	<div class="chart_chart">
		<div id="chart_div"></div>
	</div>
	<div class="chart_table">
		<table class="table chart_table_size">
			<thead>
				<tr>
					<th class="menu_month">월</th>
					<th>갯수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="sales" items="${monthlySales}">
					<c:forEach var="con" items="${sales}">
						<tr>
							<td>${con.monthly}</td>
							<td>${con.count}</td>
						</tr>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>




<jsp:include page="/WEB-INF/views/seller/seller_template/footer.jsp"></jsp:include>