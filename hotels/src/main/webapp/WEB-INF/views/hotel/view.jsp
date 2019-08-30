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
	
	$(function(){
		$(".wish-btn").click(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/member/wish_in",
				data : {
					hotel_no : $(".hotel_no").val()  // 보내는 이름 : 우리가 가져올 값
				},
				dataType : "text",
				success : function(resp) {
					if (resp == "Y") {
						
					}
					else {
						
					}
				}
			});
		});
	});
</script>
wish list 버튼

<i style="color: #ffa2ad;" class="wish-btn fa fa-heart-o fa-3x"></i>
<input type="hidden" class="hotel_no" value="${param.h_no}">


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>