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
		$(".delete_btn").click(function(){
			var that = this;
			
			$.ajax({
				url : "${pageContext.request.contextPath}/member/wish_in",
				data : {
					hotel_no : $(".hotel_no").val()  // 보내는 이름 : 우리가 가져올 값
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
						<img src="${pageContext.request.contextPath}/img_v/3?img_name=${wishDto.hotel_title}" width="200px" height="200px">
						<font>${wishDto.hotel_name}</font>
					</div>
					</a>
					</td>
					<td><input type="button" class="btn btn-danger delete_btn" value="삭제"></td>
				
				</tr>
				
			</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>