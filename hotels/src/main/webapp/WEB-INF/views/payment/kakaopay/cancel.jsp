<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	.alert-hotel{
		width: 600px;
		margin: auto;
		text-align: center;
	}
	.alert-hotel p{
		font-size: 20px;
	}
	.alert-hotel a{
		color: white;
	}
</style>
<div style="height: 120px"></div>
<div class="alert-hotel">
	<p>결제가 취소되었습니다.</p>
	<a href="${pageContext.request.contextPath}" class="btn btn-reserve">HOME</a>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>