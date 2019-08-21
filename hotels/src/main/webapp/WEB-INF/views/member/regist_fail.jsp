<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div align="center">
	<h2>가입을 다시 시도해 주세요</h2>
	<h3><a href="regist">다시 가입하러 가기</a></h3>
	<h3><a href="${pageContext.request.contextPath}">메인으로 갈래요?</a></h3>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>