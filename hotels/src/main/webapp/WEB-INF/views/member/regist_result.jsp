<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	.regist-result-wrap{
		padding: 20px;
		border: 5px solid white;
		max-width: 500px;
		margin: auto;
		margin-top:150px;
		box-shadow: 2px 2px 10px #EAEAEA;
	}
	.regist-result-wrap >a {
		margin: 20px;
	}
</style>
<div align="center" class="regist-result-wrap">
	<h2>회원 등록이 완료되었습니다</h2>
	<br>
	<a href="login"><input type="button" style="width: 134px;" class="btn btn-danger" value="로그인"></a>
	<a href="${pageContext.request.contextPath}"><input type="button" style="width: 134px;" class="btn btn-danger" value="메인화면"></a>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>