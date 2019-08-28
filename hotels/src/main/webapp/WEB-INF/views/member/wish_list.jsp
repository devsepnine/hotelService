<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.wish-wrap{
		
		padding: 100px;
	}
</style>

<script>
	
</script>

<div align="center" class="wish-wrap">
	<h1>위시리스트</h1>
	<table class="table table-hamburg table-stripe">
		<tbody>
			<c:forEach var = "wishDto" items="${wdto}">
				<tr>
					<td>
					<a href="${pageContext.request.contextPath}/hotel/view?h_no=${wishDto.hotel_no}">
					<div>
						<img src="https://via.placeholder.com/150">
						<font>${wishDto.hotel_name}</font>
					</div>
					</a>
					</td>
				
				</tr>
				
			</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>