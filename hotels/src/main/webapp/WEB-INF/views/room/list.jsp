<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/seller/seller_template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.hotel-list-wrap{
		
		padding: 50px;
	}
	.content_title{
		color:black;
		border-right: 0.5px solid lightgray;
		text-align: center;
		width: 15%;
	}
	.end_line{
		border-bottom: 1px solid darkgray;
		text-align: right;
	}
	.delete_btn{
		background-color: #fe2c08;
		color : white;
	}

	
</style>
<script>
	$(function(){
		$(".delete_btn").click(
			function() {
				var that = this;
				
				$.ajax({
					url : "delete",
					data : {
						room_no : $(that).parent().parent().prev().prev().prev().find().(".room_no").val()
					},
					dataType : "text",
					success : function(resp) {
						
						if (resp == "Y") {
 							$(that).parents(".room_info").remove();							
						}
						else {
							
						}
					}
				});
			});
	});
</script>

<br>
<br>

<jsp:include page="/WEB-INF/views/hotel/hotel_template/hotel_header.jsp"></jsp:include>
<div align="center" class="hotel-list-wrap">
	<c:forEach var="rdto" items="${list}">
		<table class="table table-hamburg table-stripe room_info">
			<tbody>
					<tr>
						<td rowspan="3" style="width: 180px;">
							<a href="detail?room_no=${rdto.room_no}">
								<img src="${pageContext.request.contextPath}/img_v/4?img_name=${rdto.r_file_name}" width="240px" height="240px">
							</a>
						</td>
						<td class="content_title">객실 이름
							<input type="hidden" class="room_no" name="room_no" value="${rdto.room_no}">
						</td>
						<td>
							<a href="detail?room_no=${rdto.room_no}">${rdto.room_name}</a>
						</td>
					</tr>
					<tr>
						<td class="content_title">객실 가격</td>
						<td >${rdto.room_price}</td>
					</tr>
					<tr>
						<td class="content_title ">객실 소개</td>
						<td class="">${rdto.room_content}</td>
					</tr>
					<tr class="end_line">
						<td colspan="3">
							<a href="${pageContext.request.contextPath}/room/regist?hotel_no=${rdto.hotel_no}"><button class="btn btn-danger">방 등록</button></a>
							<button class="btn btn-danger delete_btn">삭제</button>
						</td>
					</tr>
			</tbody>
		</table>
	</c:forEach>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>











