<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/seller/seller_template/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/hotel/hotel_template/hotel_header.jsp"></jsp:include>
<style>

	.content-wrap{
		width: 1200px;
		margin-left: auto;
		margin-right: auto;	
	}

	.hotel_title{
		text-align: center;
		margin-left: auto;
		margin-right: auto;
		
	}
	
	.list-wrap{
		width: 100%;
	}
	
	.list-title{
		
	}
</style>

<div class="content-wrap">
	<h2 class="hotel_title" align="center">${hdto.hotel_name}</h2>
	
	<c:forEach var="rlist" items="${rlist}">
		<table class="list-wrap table-bordered">
			<tbody>
			<tr class="list-title">
				<th style="width: 10%;">예약번호</th>
				<th style="width: 10%;">예약자명</th>
				<th style="width: 18%;">예약자 번호</th>
				<th style="width: 21%;">방 이름</th>
				<th style="width: 10%;">예약금액</th>
				<th style="width: 10%;">예약 인원</th>
				<th style="width: 10%;">최대수용인원</th>
				<th style="width: 10%;">쿠폰 사용 여부</th>
			</tr>
		
			<tr class="list-title">
				<td>${rlist.reserve_no}</td>
				<td>${rlist.reserve_name}</td>
				<td>${rlist.reserve_phone}</td>
				<td>${rlist.room_name}</td>
				<td>${rlist.reserve_price}</td>
				<td>${rlist.reserve_people}</td>
				<td>${rlist.room_people}</td>
				<td>${rlist.reserve_coupon_use}</td>
			</tr>
			
			</tbody>
		</table>
	</c:forEach>
</div>