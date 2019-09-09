<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<script>
window.onload = function () {

var chart = new CanvasJS.Chart("member_count", {
	animationEnabled: true,  
	title:{
		text: "Monthly member count"
	},
	axisY: {
		title: "가입자 수",
		valueFormatString: "###,###,###,###",
		suffix: "명"
	},
	data: [{
		type: "splineArea",
		color: "rgba(54,158,173,.7)",
		markerSize: 5,
		xValueFormatString: "MM",
		yValueFormatString: "###,###,###,###",
		dataPoints: [
			<c:forEach var="member_monthly_count" items="${member_monthly_count}">
				{ x: new Date('${member_monthly_count.monthly}'), y: ${member_monthly_count.count}} ,
			</c:forEach>]
	}]
	} );
	
	var chart1 = new CanvasJS.Chart("seller_count", {
		animationEnabled: true,  
		title:{
			text: "Monthly seller count"
		},
		axisY: {
			title: "가입자 수",
			valueFormatString: "#0",
			suffix: "명"
		},
		data: [{
			type: "splineArea",
			color: "rgba(54,158,173,.7)",
			markerSize: 5,
			xValueFormatString: "MM월",
			yValueFormatString: "$#,##0.##",
			dataPoints: [
				{ x: new Date(2019, 01), y: 700 },
				{ x: new Date(2019, 02), y: 230 },
				{ x: new Date(2019, 03), y: 250 },
				{ x: new Date(2019, 04), y: 130 },
				{ x: new Date(2019, 05), y: 150 },
				{ x: new Date(2019, 06), y: 230 },
				{ x: new Date(2019, 07), y: 100 },
				{ x: new Date(2019, 08), y: 200 },
				{ x: new Date(2019, 09), y: 340 },
				{ x: new Date(2019, 10), y: 220 },
				{ x: new Date(2019, 11), y: 420 },
				{ x: new Date(2019, 12), y: 510 } 
			]
		}]
		});
	
	var chart2 = new CanvasJS.Chart("hotel_price", {
		animationEnabled: true,  
		title:{
			text: "Monthly hotel price"
		},
		axisY: {
			title: "총 매출 액",
			valueFormatString: "\###,###,###,##0.##",
			suffix: "원"
		},
		data: [{
			type: "splineArea",
			color: "rgba(54,158,173,.7)",
			markerSize: 5,
			xValueFormatString: "MM월",
			yValueFormatString: "\#,##0.##",
			dataPoints: [
				{ x: new Date(2019, 01), y: 7000000 },
				{ x: new Date(2019, 02), y: 2300000 },
				{ x: new Date(2019, 03), y: 2500000 },
				{ x: new Date(2019, 04), y: 1300000 },
				{ x: new Date(2019, 05), y: 1500000 },
				{ x: new Date(2019, 06), y: 2300000 },
				{ x: new Date(2019, 07), y: 1000000 },
				{ x: new Date(2019, 08), y: 2000000 },
				{ x: new Date(2019, 09), y: 3400000 },
				{ x: new Date(2019, 10), y: 2200000 },
				{ x: new Date(2019, 11), y: 4200000 },
				{ x: new Date(2019, 12), y: 5100000 }
			]
		}]
		});
	
chart.render();
chart1.render();
chart2.render();
}
</script>

<style>
	.regist_count_table {
		color:black;
	}
	
	.empty {
		height:100px;
	}
	
	.regist_count_table{
		border-top: 3px solid #432c10;
  		border-bottom: 3px solid #432c10;
   		border-left: none;
  		border-right: none;
	}
	
	.regist_count_table thead tr th {
		font-size: 28px;
	}
	
</style>

<div class="empty"></div>

<div>
	<div style="display: inline-block; width: 49%; text-align: right;">
		<table class="regist_count_table"  style="margin-left: 350px">
			<thead>
				<tr>
					<th colspan="2">
						&emsp;[ 회원 가입 수 ]&emsp;
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>전체 회원 수</td>
					<td>1000명</td>
				</tr>
				<tr>
					<td>최근 7일 가입 회원 수</td>
					<td>123명</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div style="display: inline-block; width: 49%; text-align: right;">
		<table class="regist_count_table" style="margin-left: 320px">
			<thead>
				<tr>
					<th colspan="2">
						&emsp;[ 판매자 가입 수 ]&emsp;
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>전체 판매자 수</td>
					<td>1000명</td>
				</tr>
				<tr>
					<td>최근 7일 가입 판매자 수</td>
					<td>123명</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<div style="height: 10px"></div>

<div style="width: 100%;">
<div id="member_count" style="height: 370px; width: 45%; display: inline-block; margin-left : 35px; margin-right : 50px;" ></div>

<div id="seller_count" style="height: 370px; width: 45%; display: inline-block;"></div>
</div>

<div class="empty"></div>

<div style="width: 100%;">
<div id="hotel_price" style="height: 470px; width: 90%; margin-left : 50px; margin-right : 50px;" ></div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
