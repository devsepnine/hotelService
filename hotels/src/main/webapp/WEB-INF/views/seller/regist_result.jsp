<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	.result_page{
		text-align: center;
		width: 800px;
		height: 600px;
		margin-left: auto;
		margin-right: auto;
	}
	.result_comment{
		font-weight: bold;
		font-style: italic;
	}
</style>
<div class="result_page" align="center" style="margin-top: 200px;">
	<div align="center">
		<h2>
			<font class="result_comment">회원 등록이 완료되었습니다</font>
		</h2>
	</div>
	
	<div align="center" style="text-align: center;">
		<h3>
			<a href="login">
				<button class="btn btn-danger">로그인</button>
			</a>
		</h3>
		
		<h3>
			<a href="${pageContext.request.contextPath}">
				<button class="btn btn-danger">메인으로</button>
			</a>
		</h3>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>