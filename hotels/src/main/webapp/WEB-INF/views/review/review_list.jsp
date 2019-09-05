<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.review-wrap{
		padding: 100px;
	}

</style>

<script>
$(function(){
	$(".delete_btn").click(
		function() {
			//this == button
			var that = this;
			var review_no = $(this).prev(".review_no").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/review/review_delete",
				data : {
					review_no : review_no
				},
				dataType : "text",
				success : function(resp) {
					if (resp == "Y") {
						console.log(that)
						$(that).parents(".table-stripe").remove();							
					}
					else {
						
					}
				}
			});
		});
});
</script>
<div align="center" class="review-wrap">
	<h1>내가 쓴 리뷰</h1>
	<br>
	<c:forEach var = "reviewVO" items="${reviewVO}">
		<table class="table table-hamburg table-stripe">
			<tbody>
				<tr>
					<td>호텔이름 : ${reviewVO.hotel_name}</td>
					<td>방타입 : ${reviewVO.room_name}</td>
				</tr>
				<tr>
					<td>점수 : ${reviewVO.review_score}</td>
					<td>작성일 : ${reviewVO.review_when.substring(0,16)}</td>
				</tr>
				<tr>
					<td>숙박일 : ${reviewVO.reserve_in.substring(0,10)} ~ ${reviewVO.reserve_out.substring(0,10)}
						
					</td> 
				</tr>
				<tr>
					<td colspan="2">${reviewVO.review_content}</td>
				</tr>
				<tr align="right">
					<td colspan="2"><input type="hidden" class="review_no" name="${reviewVO.review_no}" value="${reviewVO.review_no}"><input type="button" class="btn btn-danger delete_btn" value="삭제"></td>
				</tr>
			</tbody>
		</table>
	</c:forEach>

</div>




<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>