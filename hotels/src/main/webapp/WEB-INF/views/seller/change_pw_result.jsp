<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div align="center" style="padding: 50px; margin-top: 150px; width: 100%;">
	<h2><font style="font-weight: bold; font-style: italic;">비밀번호 변경이 완료되었습니다</font></h2>
	<a href="${pageContext.request.contextPath}/seller/login"><button class="btn btn-danger">로그인</button></a>
	<a href="${pageContext.request.contextPath}"><button class="btn btn-danger">메인으로</button></a>
</div>
<jsp:include page="/WEB-INF/views/seller/seller_template/footer.jsp"></jsp:include>


