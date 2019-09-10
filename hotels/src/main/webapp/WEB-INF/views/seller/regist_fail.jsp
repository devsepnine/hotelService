<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	.result_page{
		text-align: center;
		width: 800px;
		height: 600px;
	}
	.result_comment {
		font-weight: bold;
		font-style: italic;
	}
</style>
<div class="result_page" align="center">
	<div >
		<h2>
			<font class="result_comment">가입을 다시 시도해 주세요</font>
		</h2>
	</div>
	
	<div align="center" style="text-align: center;">
		<h3><a href="regist">가입하기</a></h3>
		<h3><a href="${pageContext.request.contextPath}">메인으로</a></h3>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>