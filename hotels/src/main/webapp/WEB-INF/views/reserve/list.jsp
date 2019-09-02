<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.list-wrap{
		padding: 100px;
	}

</style>
<script>
	
</script>

<div align="center" class="list-wrap">
	<h1>내 예약 내역</h1>
	<br>
	<%-- <c:forEach var = "reserveDto" items="${rdto}"> --%>
<form action="details" method="get">
		<table class="table table-hamburg table-stripe">
			<tbody>
				<tr>
					<td>이용상태</td>
				</tr>
				<tr>
					<td rowspan="2" ><img src="${pageContext.request.contextPath}/img_v/3?img_name=${wishDto.hotel_title}" width="200px" height="200px"></td>
					<td>호텔이름</td>
				</tr>
				<tr>
					<td>날짜</td>
				</tr>
			</tbody>
		</table>
		<a href="details"><input type="button" class="btn btn-danger" value="상세보기"></a>
</form>
	<%--  </c:forEach>--%>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>