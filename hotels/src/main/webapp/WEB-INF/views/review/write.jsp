<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
	$(function(){
		$("button").click(function(){
			
			var h1 = $("<h1/>").text();
		});
		$("reivew-wrap").append(h1);
	});
</script>
<textarea class="review-box" rows="3" placeholder="후기입력">
</textarea>
<hr>
<button class="">등록하기</button>
<hr>
<div class="review-wrap"></div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>