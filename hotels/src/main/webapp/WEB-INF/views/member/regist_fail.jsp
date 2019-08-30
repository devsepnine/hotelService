<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.regist-fail-wrap{
		padding: 20px;
		border: 5px solid white;
		max-width: 500px;
		margin: auto;
		margin-top:150px;
		box-shadow: 2px 2px 10px #EAEAEA;
	}
	.regist-fail-wrap >a{
		margin: 20px;
	}
</style>

<div align="center" class="regist-fail-wrap">
	<h2>가입을 다시 시도해 주세요</h2>
	<br>
	<a href="regist"><input type="button" style="width: 134px;" class="btn btn-danger" value="다시가입하러 가기"></a>
		<a href="${pageContext.request.contextPath}"><input type="button" style="width: 134px;" class="btn btn-danger" value="메인화면"></a>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>