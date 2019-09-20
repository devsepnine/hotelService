<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.list-wrap{
		padding: 100px;
	}
	.reserve-cancel-wrap{
		text-align: right;
		width: 100%;
	}
	.reserve-list-wrap{
		width: 800px;
		margin: auto;
	}
</style>
<script>

</script>

<div align="center" class="list-wrap">
	<h1>내 예약 내역</h1>
	<br>
	<div class="reserve-cancel-wrap">
	<a href="cancel_list" class="btn btn-danger can_btn" >예약취소 내역</a>
	</div>
	<div class="reserve-list-wrap">
<c:forEach var = "reserveVO" items="${reserveVO}"> 
		<table class="table table-hamburg table-stripe">
			<tbody>
				<tr>
					<td colspan="2">예약상태 : ${reserveVO.reserve_ok}</td>
				</tr>
				<tr>
					<td rowspan="3" ><img src="${pageContext.request.contextPath}/img_v/3?img_name=${reserveVO.hotel_title}" width="200px" height="200px" ></td>
					<td>호텔이름 : ${reserveVO.hotel_name}</td>
				</tr>
				<tr>
					<td>입실일 : ${reserveVO.reserve_in.substring(0,10)}
					<br>
						퇴실일 : ${reserveVO.reserve_out.substring(0,10)}</td>
				</tr>
				<tr>
					<td>예약명 수: ${reserveVO.reserve_people}</td> 
				</tr>
			</tbody>
		</table>
		<a href="details?reserve_no=${reserveVO.reserve_no}"><input type="button" class="btn btn-danger btn-block" value="상세보기"></a>

</c:forEach>
</div>


</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>