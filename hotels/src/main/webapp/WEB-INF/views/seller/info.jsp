<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/seller/seller_template/header.jsp"></jsp:include>
<script>
function seller_delete() {
  var r = confirm("탈퇴 하시겠습니까?");
  if (r == true) {
	location.href="${pageContext.request.contextPath}/seller/delete";  
  }
 
}
</script>
<style>
	.info-wrap{
		
		padding: 100px;
	}
	.seller_info{
		width:700px;
	}
</style>

<div align="center" class="info-wrap">
	<h1>${sdto.seller_name}님의 정보</h1>
	<br>
	<table class="table table-hamburg table-stripe seller_info"> 
		<tbody>
			
			<tr>
				<th>이메일</th>
				<td>${sdto.seller_email_id}@${sdto.seller_email_addr}</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${sdto.seller_id}</td>
			</tr>
			<tr >
				<th>이름</th>
				<td>${sdto.seller_name}</td>
			</tr>

			<tr>
				<th>생년월일</th>
				<td>${sdto.seller_birth}</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${sdto.seller_phone}</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${sdto.seller_regist}</td>
			</tr>
			<tr>
				<th>사업자 등록번호</th>
				<td>${sdto.seller_lisence}</td>
			</tr>
			<tr>
				<th colspan="3 ">주소</th>
			</tr>
			<tr>
				<th>우편번호</th>
				<th>기본주소</th>
				<th>상세주소</th>
			</tr>
			<tr>
				<td>${sdto.seller_zip_code}</td>
				<td>${sdto.seller_basic_addr}</td>
				<td>${sdto.seller_detail_addr}</td>
			</tr>
		</tbody>
	</table>
	<%-- 회원이 이용할 수 있는 기능들을 링크로 제공 --%>
	<a href="change_pw"><button class="btn btn-danger">비밀번호 변경</button></a>
	<a href="change"><button class="btn btn-danger">개인정보 변경</button></a>
	<a href="delete"><button class="btn btn-danger" onclick="seller_delete()">회원 탈퇴</button></a>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>











