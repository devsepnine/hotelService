<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
	$(function(){
		$(".wish-btn").click(function(){
			$(this).toggleClass("fa-heart-o");
			$(this).toggleClass("fa-heart");
		})
		
	});
</script>
wish list 버튼

<i style="color: black;" class="wish-btn fa fa-heart-o fa-3x"></i>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>