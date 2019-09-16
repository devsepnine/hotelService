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
<script>
	$(function(){
		$("input[name=seller_id]").blur(function(){
			var s_id = $("input[name=seller_id]").val();
			var regex = /^[a-z0-9]{8,15}$/;
			
			var result = regex.test(s_id);
			var div = document.querySelector(".s_idD");
			
			if(result){
				div.innerHTML = ""
			}
			else{
				div.innerHTML = "8~15자의 영문 소문자, 숫자로 입력해주세요"
			}
		});
		
		$("input[name=seller_phone]").blur(function(){
			var s_phone = $("input[name=seller_phone]").val();
			var regex = /^01[016-9]-[0-9]{3,4}-[0-9]{4}$/;
			
			var result = regex.test(s_phone);
			var div = document.querySelector(".s_phoneD");
			
			if(result){
				div.innerHTML = ""
			}
			else{
				div.innerHTML = "- 포함한 번호를 작성해주세요"
			}
		});
	});
</script>

<%-- error 파라미터 유무에 따라 오류메시지를 출력 --%>

<div align="center" class="find_pw-wrap">
<c:if test="${param.error eq 'error'}">
	<h4>
		<font color="red">
			입력하신 정보에 해당하는 회원이 존재하지 않습니다	
		</font>
	</h4>
</c:if>
	<h2>비밀번호 찾기</h2>
		<form class="form form-vertical-line" action="find_pw" method="post">
			<table>
				<tr>
				<td><label>아이디</label></td>
					<td><input class="form-control"  type="text" name="seller_id" placeholder="아이디" required autocomplete="off"><div class="s_idD"></div></td>
				</tr>
				<tr>
					<td><label>핸드폰 번호</label></td>
					<td><input class="form-control"  type="text" name="seller_phone" placeholder="핸드폰 번호" required autocomplete="off"><div class="s_phoneD"></div></td>
				</tr>
				<tr>
					<td><label>생년월일</label></td>
					<td><input class="form-control"  type="date" max="2999-12-31" name="seller_birth" placeholder="생년월일" required autocomplete="off"></td>
				</tr>
				<tr>
					<td colspan="2"><input class="btn btn-danger btn-block" type="submit" value="찾기"></td>
				</tr>
			</table>
		</form>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

