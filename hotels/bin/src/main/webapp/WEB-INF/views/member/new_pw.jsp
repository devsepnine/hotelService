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
	
</script>



<h1>비밀번호 변경</h1>
<form class="form" action="new_pw" method="post">
	<%-- hidden은 사용자에게 표시되지 않으면서 전송이 가능 --%>
	<input type="hidden" name="member_no" value="${member_no}">
	<input type="password" name="member_pw" placeholder="신규 비밀번호" required>
	<input type="submit" value="변경하기">
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>







