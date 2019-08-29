<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.new-pw-wrap{
		padding: 80px;
		border: 5px solid white;
		width: 600x;
		margin: auto;
		margin-top:10px;
		box-shadow: 2px 2px 10px #EAEAEA;
	}
	.ab{
		margin: 10px;
	}
</style>

<div align="center" class="new-pw-wrap ">
	<h2>비밀번호 변경이 완료되었습니다</h2>
	<br>
	<a href="login"><input type="button" style="width: 90.14px;" class="btn btn-danger ab" value="로그인"></a>
	<a href="${pageContext.request.contextPath}"><input type="button" class="btn btn-danger ab" value="메인화면"></a>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>