<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.login-fail{
		padding: 100px;
		border: 5px solid white;
		width: 600x;
		margin: auto;
		margin-top:10px;
		box-shadow: 2px 2px 10px #EAEAEA;
	}
	.login-fail > a{
		margin: 5px;
		width: 110px;
	}

</style>



<div align="center" class="login-fail">
	<h2>로그인 정보가 일치하지 않습니다</h2>
	<br>
	<a href="login"><input style="width: 110px;" type="button" class="btn btn-danger" value="로그인"></a>
	<a href="find_id"><input style="width: 110px;" type="button" class="btn btn-danger" value="아이디찾기"></a>
	<a href="find_pw"><input style="width: 110px;" type="button" class="btn btn-danger" value="비밀번호찾기"></a>
	<a href="${pageContext.request.contextPath}"><input style="width: 110px;" type="button" class="btn btn-danger" value="메인화면"></a>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>