<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		opener.location.href = '${pageContext.request.contextPath}/payment/kakao/r_success/${order_id}'
		window.close();
	});
</script>
