<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	div{
		text-align: center;
	}
</style>
<div align="center">
	<h2>예약이 완료되었습니다</h2>
	<h3><a href="reserve_info">예약확인 하러가기</a></h3>
	<h3><a href="${pageContext.request.contextPath}">메인으로 갈래요?</a></h3>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>