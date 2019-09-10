<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	font{
		font-weight: bold;
		font-style: italic;
	}
	.login_fail{
		width: 700;
		height: 500px;
		margin-top: 250px;
	}
	.login_fail a button{
		width: 8rem;
	}
	.center_row{
		margin-top: 40px;
	}
</style>
<div class="login_fail" align="center">
	<div align="center">
		<h2><font>로그인 정보가 일치하지 않습니다</font></h2>
	</div>
	<div class="center_row" align="center" style="text-align: center;">
		<a href="login" style="margin-right: 10px; display: inline-block;"><button class="btn btn-danger">로그인</button></a>
		<a href="find_id"style="margin-right: 10px; display: inline-block;"><button class="btn btn-danger">아이디 찾기</button></a>
		<a href="find_pw"style="margin-right: 10px; display: inline-block;"><button class="btn btn-danger">비밀번호 찾기</button></a>
		<a href="${pageContext.request.contextPath}"style="margin-right: 10px; display: inline-block;"><button class="btn btn-danger">메인으로</button></a>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>