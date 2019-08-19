<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	.join_select_wrap{
		margin: auto;
		width: 768px;
		margin-top: 200px;
		text-align: center;
	}
	.join_select_wrap a{
		margin-left: 30px;
	}
</style>

<div class="join_select_wrap">
	<a href="${pageContext.request.contextPath}/member/regist" class="btn btn-outline-info">일반 회원으로 가입하기</a>
	<a class="btn btn-outline-danger">판매 회원으로 가입하기</a>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>