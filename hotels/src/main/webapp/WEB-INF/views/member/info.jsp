<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>
function member_delete() {
  var r = confirm("탈퇴 하시겠습니까?");
  if (r == true) {
	location.href="${pageContext.request.contextPath}/member/check_pw";  
  }
 
}
</script>

<style>
	.info-wrap{
		padding: 100px;
	}
	.info-wrap > a{
		margin: 10px;
	}
	.sh > tbody > tr > th{
		font-size: 20px;
	}
</style>

<div align="center" class="info-wrap">
	<h1>${mdto.member_name}님의 정보</h1>
	<br>
	<table class="table table-hamburg table-stripe sh" width="500"> 
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
			
				<td>${mdto.member_zip_code}</td>
				<td>${mdto.member_basic_addr}</td>
				<td>${mdto.member_detail_addr}</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${mdto.member_birthday.substring(0,10)}</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${mdto.member_phone}</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${mdto.member_when.substring(0,10)}</td>
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
	<br>
	<br>
	<br>
	<%-- 회원이 이용할 수 있는 기능들을 링크로 제공 --%>
	<a href="wish_list"><input type="button"  style="width: 115px;" class="btn btn-danger" value="위시리스트"></a>
	<a href="change_pw"><input type="button" style="width: 115px;" class="btn btn-danger" value="비밀번호 변경"></a>
	<a href="change"><input type="button" style="width: 115px;" class="btn btn-danger" value="개인정보 변경"></a>
	<input type="button" style="width: 115px;" class="btn btn-danger"  onclick="member_delete()" value="회원탈퇴">
	<a href="${pageContext.request.contextPath}/review/review_list"><input type="button" style="width: 115px;" class="btn btn-danger" value="내가 쓴 리뷰"></a>
	<a href="coupon_list"><input type="button" style="width: 115px;" class="btn btn-danger" value="내 쿠폰함"></a>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>











