<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>

<script>
	$(function(){
		$("form").submit(function(e){
			e.preventDefault();	
			
			var pw = $("input[name=member_pw]").val();
			var encPw = CryptoJS.SHA256(pw).toString();
			
			$("input[name=member_pw]").attr("name","");
			var newInput = $("<input/>").attr("name","member_pw").val(encPw).attr("type","hidden");
			
			$(this).append(newInput);
			this.submit();
		});
	});
	
</script>
	
<style>

.form.form-label>fieldset {
	width: 350px;
	text-align: left;
	margin-top : 20px;
	margin-bottom : 20px;
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

	.content-line{
		margin-top:100px;
		border: 5px solid white;
		max-width: 500px;
		margin: auto;
		margin-top: 50px;
		
		box-shadow: 2px 2px 10px #EAEAEA;
	}

</style>
<div style="height: 100px"></div>
<div align="center" class="content-line">
	<form action="login" method="post" class="form form-label">
		<fieldset>
			<legend>LOGIN</legend>
				<table width=300px class="table table-noline">
					<tbody>
						
						<tr>
							<td>
								<label for="m_id">ID</label>
								<input type="text" class="form-control" name="member_id" id="m_id" placeholder="ID를 입력하세요" value="${cookie.saveId.value}" required>
							</td>
						</tr>
						<tr>
							<td>
								<label for="m_pw">PASSWORD</label>
								<input type="password" class="form-control" name="member_pw" id="m_pw" placeholder="PASSWORD를 입력하세요" required>
								<div style="text-align: right;padding-top: 10px;">
									<input type="checkbox" name="remember" ${not empty cookie.saveId?"checked":""}>
									<label for="remember" style="margin-right:20px">아이디 저장하기</label>
								</div>
							</td>
						</tr>
						<tr align="center">
							<td>
								<input class="btn btn-danger btn-block" style="padding:0.5rem 3rem;" type="submit" value="로그인">
							</td>
						</tr>
						<tr>
							<td colspan = "2" align = "center" >
								<a href ="find_id"><input class="btn btn-danger" style="width: 100px;" type="button" value="ID 찾기" name="find_id"></a>
								<a href ="find_pw"><input class="btn btn-danger" style="width: 100px;" type="button" value="PW 찾기" name="find_pw"></a>
							</td>
						</tr>
					</tbody>
				</table>
		</fieldset>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>