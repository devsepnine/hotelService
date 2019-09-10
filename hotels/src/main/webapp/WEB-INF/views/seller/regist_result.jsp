<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	.result_page{
		text-align: center;
		width: 800px;
		height: 600px;
	}
	.result_comment{
		font-weight: bold;
		font-style: italic;
	}
</style>
<div class="result_page" align="center">
	<div>
		<h2>
			<font class="result_comment">회원 등록이 완료되었습니다</font>
		</h2>
	</div>
	
	<div align="center" style="text-align: center;">
		<h3><a href="login">로그인</a></h3>
		<h3><a href="${pageContext.request.contextPath}">메인으로</a></h3>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>