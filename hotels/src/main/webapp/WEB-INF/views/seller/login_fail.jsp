<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h2>로그인 정보가 일치하지 않습니다</h2>
<h3><a href="login">다시 로그인 할래요?</a></h3>
<h3><a href="find_id">아이디 찾으러 가실래요?</a></h3>
<h3><a href="find_pw">비밀번호 찾으러 가실래요?</a></h3>
<h3><a href="${pageContext.request.contextPath}">메인으로 갈래요?</a></h3>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>