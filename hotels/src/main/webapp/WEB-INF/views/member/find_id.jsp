<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 비밀번호 확인 입력창 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	.find_pw-wrap{
		
		padding: 100px;
		min-width: 625px;
	}
</style>

<%-- error 파라미터 유무에 따라 오류메시지를 출력 --%>
<c:if test="${not empty param.error}">
	<h4>
		<font color="red">
			입력하신 정보에 해당하는 회원이 존재하지 않습니다	
		</font>
	</h4>
</c:if>
<div align="center" class="find_pw-wrap">
	<h2>아이디 찾기</h2>
		<form class="form form-vertical-line" action="find_id" method="post">
			<table>
				<tr>
				<td><label>이름</label></td>
					<td><input class="form-control" display: inline-block;" type="text" name="member_name" placeholder="이름" required autocomplete="off"></td>
				</tr>
				<tr>
					<td><label>핸드폰 번호</label></td>
					<td><input class="form-control" display: inline-block;" type="text" name="member_phone" placeholder="핸드폰 번호" required autocomplete="off"></td>
				</tr>
				<tr>
					<td><label>생년월일</label></td>
					<td><input class="form-control" display: inline-block;" type="date" name="member_birthday" placeholder="생년월일" required autocomplete="off"></td>
				</tr>
				<tr>
					<td colspan="2"><input class="btn btn-danger btn-block" type="submit" value="찾기"></td>
				</tr>
			</table>
		</form>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

