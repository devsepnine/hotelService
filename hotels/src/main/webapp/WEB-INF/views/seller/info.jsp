<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/seller/seller_template/header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<script>
	$(function(){
		$(".cdbtn").click(function(){
			var pw = $("input[name=seller_pw]").val();
			var encPw = CryptoJS.SHA256(pw).toString();
			$.ajax({
				type: "post",
				url : "checkDelete",
				data : {
					seller_pw : encPw
				},
				dataType : "text",
				success : function(resp) {
					if (resp == "Y") {
						location.href="${pageContext.request.contextPath}/seller/goodbye"
					}
					else {
						window.alert("비밀번호가 일치하지 않습니다")
					}
				}
			});
		});
		
	});
	
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
	<a href="change_pw" class="btn btn-danger">비밀번호 변경</a>
	<a href="change" class="btn btn-danger">개인정보 변경</a>
	<button type="button" id = "deleteOpenModal" class="btn btn-danger" data-toggle="modal" data-target= "#deleteCheckModal" data-title="data">회원 탈퇴</button>

</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


<div class="modal fade" id="deleteCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">비밀번호 확인</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
			<div class="modal-body">
				<label for="s_pw">회원님의 비밀번호를 입력후 확인을 누르시면 삭제됩니다</label>
				<input type="password" class="form-control" name="seller_pw" id="s_pw" placeholder="PASSWORD를 입력하세요" required>
				<img id="deleteUrl" src="">
			
			</div>
			<div class="modal-footer">
			
				<button type="button" class="btn btn-primary cdbtn" id="delete">확인</button>
				
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>






