<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.kakao-success-wrap{
	width: 500px;
	margin: auto;
	margin-top: 200px;
}
</style>
<div class="kakao-success-wrap">
	<h2>당신의 결제 하였다 성공.</h2>
</div>
${success}
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>