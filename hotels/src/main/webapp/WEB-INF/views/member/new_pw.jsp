<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<script src="${pageContext.request.contextPath}/js/password-encoder.js"></script>

<%-- 
	비밀번호 변경 페이지 
	 - new_pw.do라는 서블릿에게 이메일, 새로운 비밀번호를 전달한다
	 - 이메일은 요청 정보 파라미터에서 추출 가능 --> 자동 첨부 처리
	 - 비밀번호는 사용자가 입력
--%>
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
	
	$(function(){
		$("input[name=_member_pw]").blur(
			function checkPw(){
			    var m_pw = document.querySelector(".member_pw").value;
			    var regex = /^[a-zA-Z0-9!@#$\-_]{8,15}$/;
		    
			  //정규표현식으로 m_pw값 검사
			    var result = regex.test(m_pw);
			    
			    var div = document.querySelector(".m_pwD");
			
			    if(result) {
			        div.innerHTML = ""
			    }
			    
				//m_pw가 형식에 맞지 않으면 메세지 춮력
			    else {
			        div.innerHTML = "<font color = 'gray' size = '2'>8~15자의 영문 대소문자, 숫자, 특수문자(!@#$-_)로 입력해주세요</font>"
		        
		   		 }
			});
		});
		
	
</script>

<style>
	.new-wrap{
		margin: 80px;
		padding : 20px;
		border: 5px solid white;
		width: 600x;
		margin: auto;
		margin-top:10px;
		box-shadow: 2px 2px 10px #EAEAEA;
	}
	
	
</style>


<div align="center" class="new-wrap">
	<h1>비밀번호 변경</h1>
	<br>
	<br>
	<form class="form" action="new_pw" method="post">
		<%-- hidden은 사용자에게 표시되지 않으면서 전송이 가능 --%>
		<input class="form-control"  type="hidden" name="member_no" value="${member_no}">
		<input class="form-control" style="width: 30%;" type="password" name="member_pw" placeholder="신규 비밀번호" required>
		<br>
		<div class="m_pwD"></div>
		<br>
		<input class="btn btn-danger" type="submit" value="변경하기">
	</form>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

