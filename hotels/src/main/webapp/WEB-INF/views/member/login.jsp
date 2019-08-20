<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<script src="${pageContext.request.contextPath}/js/password-encoder.js"></script>

<script>
	$(function(){
		$("form").submit(function(e){
			e.preventDefault();	
			
			var pw = $("input[name=member_pw]").val();
			var encPw = CryptoJS.SHA256(pw).toString();
			
			$("input[name=member_pw]").val(encPw);
			$("input[name=member_pw]").attr("name","");
			var newInput = $("<input/>").attr("name","member_pw").val(encPw).attr("type","hidden");
			
			$(this).append(newInput);
			$(this).submit();
			this.submit();
		});
	});
	
</script>
	
<style>

.form.form-label>fieldset {
	width: 350px;
	text-align: left;
	margin-top : 100px;
	margin-bottom : 100px;
	padding : 10px;
}

input[name=m_id], input[name=m_pw]{
	width : 200px;
}

.error {
	color : red;
	font-size : 15px;
	text-align : center;
}

</style>

<div align="center">
	<form action="login" method="post" class="form form-label">
		<fieldset>
			<legend>LOGIN</legend>
				<table width=300px class="table table-noline">
					<tbody>
						
						<tr>
							<td><label for="m_id">ID</label></td>
							<td>
								<input type="text" name="member_id" id="m_id" placeholder="ID를 입력하세요" value="${cookie.saveID.value}" required>
							</td>
						</tr>
						<tr>
							<td><label for="m_pw">PASSWORD</label></td>
							<td>
								<input type="password" name="member_pw" id="m_pw" placeholder="PASSWORD를 입력하세요" required>
							</td>
						</tr>
						<tr align="right">
							<td colspan="2">
								<input type="checkbox" name="saveID" ${not empty cookie.saveID?"checked":""}>
								<label for="saveID" style="margin-right:20px">아이디 저장하기</label>
							</td>
						</tr>
						<tr align="center">
							<td colspan="2">
								<input style="padding:0.5rem 3rem;" type="submit" value="로그인">
							</td>
						</tr>
						<tr>
							<td colspan = "2" align = "center" >
								<a href ="find_id"><input type="button" value="ID 찾기" name="find_id"></a>
								<a href ="find_pw"><input type="button" value="PW 찾기" name="find_pw"></a>
							</td>
						</tr>
					</tbody>
				</table>
		</fieldset>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>