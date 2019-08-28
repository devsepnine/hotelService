<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.info-wrap{
		
		padding: 100px;
	}
</style>

<div align="center" class="info-wrap">
	<h1>${mdto.member_name}님의 정보</h1>
	<br>
	<table class="table table-hamburg table-stripe" width="500"> 
		<tbody>
			
			<tr>
				<th>이메일</th>
				<td>${mdto.member_email1}@${mdto.member_email2}</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${mdto.member_id}</td>
			</tr>
			<tr >
				<th>이름</th>
				<td>${mdto.member_name}</td>
			</tr>
			<tr>
				<th>주소</th>
			</tr>
			<tr>
				<td>${mdto.member_zip_code}</td>
				<td>${mdto.member_basic_addr}</td>
				<td>${mdto.member_detail_addr}</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${mdto.member_birthday}</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${mdto.member_phone}</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${mdto.member_when}</td>
			</tr>
			<tr>
				<th>권한</th>
				<td>${mdto.member_auth}</td>
			</tr>
			<tr>
				<th>최종 접속일</th>
				<td>${mdto.member_recent}</td>
			</tr>
		</tbody>
	</table>
	<%-- 회원이 이용할 수 있는 기능들을 링크로 제공 --%>
	<h3><a href="wish">위시리스트</a></h3>
	<h3><a href="change_pw">비밀번호 변경</a></h3>
	<h3><a href="change">개인정보 변경</a></h3>
	<h3><a href="delete">회원 탈퇴</a></h3>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>











