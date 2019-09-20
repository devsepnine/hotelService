<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 비밀번호 확인 입력창 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>

<script>
	$(function(){
		$("form").submit(function(e){
			e.preventDefault();	
			
			var pw = $("input[name=pw]").val();
			var encPw = CryptoJS.SHA256(pw).toString();
			
			$("input[name=pw]").attr("name","");
			var newInput = $("<input/>").attr("name","pw").val(encPw).attr("type","hidden");
			
			$(this).append(newInput);
			this.submit();
		});
	});
	
</script>

<style>
	.check_pw-wrap{
		
		padding: 100px;
		min-width: 625px;
	}
</style>


<%-- error 파라미터 유무에 따라 오류메시지를 출력 --%>

<div align="center" class="check_pw-wrap">
<c:if test="${param.error eq 'error'}">
	<h4>
		<font color="red">
			일치하지 않는 비밀번호입니다.	
		</font>
	</h4>
</c:if>
	<h2>비밀번호 확인</h2>
		<form class="form form-vertical-line" action="check_pw" method="post">
			<table>
				<tr>
					<td><label>비밀번호</label></td>
					<td><input class="form-control"  type="password" name="pw" placeholder="비밀번호" required>
					</td>
				</tr>
					<td colspan="2"><input class="btn btn-danger btn-block" type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

