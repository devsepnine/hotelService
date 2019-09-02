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
	$(function(){
		$(".delete_btn").click(
			function() {
				//this == button
				var that = this;
				
				$.ajax({
					url : "${pageContext.request.contextPath}/member/wish_delete",
					data : {
						hotel_no : $("#hotel_no").val()
					},
					dataType : "text",
					success : function(resp) {
						if (resp == "Y") {
 							$(that).parents(".table-stripe").remove();							
						}
						else {
							
						}
					}
				});
			});
	});
</script>

<div align="center" class="wish-wrap">
	<h1>위시리스트</h1>
	<c:forEach var = "wishDto" items="${wdto}">
		<table class="table table-hamburg table-stripe">
			<tbody>
					<tr>
						<td>
						<a href="${pageContext.request.contextPath}/hotel/view?h_no=${wishDto.hotel_no}">
							<img src="${pageContext.request.contextPath}/img_v/3?img_name=${wishDto.hotel_title}" width="200px" height="200px">
							<font>${wishDto.hotel_name}</font>
							<input type="hidden" id="hotel_no" value="${wishDto.hotel_no}">
						</a>
						</td>
						<td><input type="button" class="btn btn-danger delete_btn" value="삭제"></td>
					</tr>
			</tbody>
		</table>
	</c:forEach>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>