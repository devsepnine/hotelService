<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.write-wrap{
		padding: 100px;
	}

</style>

<script>
	$(function(){
		$("button").click(function(){
			
			var h1 = $("<h1/>").text();
		});
		$("reivew-wrap").append(h1);
	});
	
	$(function(){
		$(".write_btn").click(function(resp){
			
			if (resp == "Y") {
					$(that).parents(".hotel_info").remove();							
			}
			else {
				
			}
		});
	});
	
</script>
<form action="write" method="post">
	<div align="center" class="write-wrap">
	<h1>리뷰쓰기</h1>
		
		<table class="table table-hamburg table-stripe">
			<tbody>
				<tr>
					<td>호텔이름 : ${rvo.hotel_name }</td>
					<td>방타입 : ${roomDto.room_name}</td>
				</tr>
				<tr>
					<td>점수</td>
					<td> </td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="review_content" style="resize: none;" rows="30" cols="150"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="hidden" name="review_reserve" value="${reserve_no}">
						<input type="hidden" name="review_hotel" value="${rvo.hotel_no}">
						<input type="submit" class="btn btn-danger write_btn" value="리뷰등록">
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>