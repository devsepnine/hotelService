<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 비밀번호 확인 입력창 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<%-- error 파라미터 유무에 따라 오류메시지를 출력 --%>
<c:if test="${not empty param.error}">
	<h4>
		<font color="red">
			입력하신 정보에 해당하는 회원이 존재하지 않습니다	
		</font>
	</h4>
</c:if>

<h2>비밀번호 찾기</h2>
<form class="form form-vertical-line" action="find_pw" method="post">
	<fieldset class="w40">
		<input type="text" name="member_id" placeholder="아이디" required autocomplete="off">
		<input type="text" name="member_phone" placeholder="핸드폰 번호" required autocomplete="off">
		<input type="text" name="member_birthday" placeholder="생년월일" required autocomplete="off">
		<input type="submit" value="찾기">
	</fieldset>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

