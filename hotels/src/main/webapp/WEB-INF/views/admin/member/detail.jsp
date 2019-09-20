<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>

<!-- 자바스크립트를 이용하여 페이지 이동을 처리 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<script>
	$(function(){
		//인증메일 버튼을 누르면 ajax로 /member/new_pw에 신호를 보낸다
		$(".newpw_btn").click(function(){
			$.ajax({ 
				url : "/hotels/admin/member/new_pw",
				data : {
					no : ${mdto.member_no}
				},
				dataType:"text",
				beforeSend : function(){
					//버튼 비활성화
					$(".newpw_btn").prop("disabled", true);
					$(".newpw_btn").text("인증 메일 발송중...");
				},
				success : function(resp){
					alert("이메일 발송 완료")
				},
				error:function(){
					alert("오류 발생");
				},
				complete:function(){
					//버튼 활성화
					$(".newpw_btn").prop("disabled", false);
					$(".newpw_btn").text("비밀번호 인증 메일 발송");
				}
			})
		});
	});
</script>


<script>
	$(function(){
		$("#deleteBtn").click(function(){
			var pw = $("input[name=pw]").val();
			var encPw = CryptoJS.SHA256(pw).toString();
			
			$.ajax({
// 				url : "../check_pw_member",
				url : "${pageContext.request.contextPath}/admin/check_pw_member",
				type: "post",
				data : {
					pw : encPw
				},
				dataType : "text",
				success : function(resp) {
					if (resp == "Y") {
						location.href="${pageContext.request.contextPath}/admin/member/exit?no=${mdto.member_no}"
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
	.table_ny_two thead,
	.table_ny_two tbody{
		color:black;
	}
	
	.empty {
		height:50px;
	}
	
	.navigator {
	    list-style: none;
	    padding: 0px;
	    margin: 0px;
	    display: inline-block;
	    width: auto;
	    margin: auto;
	    text-align: center;
	}
	
	.navigator > li {
	    display: inline-block;
	    padding: 0.5rem;
	    min-width: 40px;
	    text-align: center;
	}
	
	.detail_wrap_member {
		text-align: center;
	}
	
	.headtit{
		border-bottom: #432c10 solid 10px;
		max-width:700px;
		margin:auto;
		text-align: left;
		margin-bottom: 50px;
	}
	
	.detail_wrap_member > .table-box > .table_ny_two {
		margin-top : 50px;
		border-top: 3px solid #432c10;
  		border-bottom: 3px solid #432c10;
   		border-left: none;
  		border-right: none;
  		max-width: 600px;
	}
	
	.detail_wrap_member > .table-box > .table_ny_two > thead > tr > th,
	.detail_wrap_member > .table-box > .table_ny_two > tbody > tr > th,
	.detail_wrap_member > .table-box > .table_ny_two > tfoot > tr > th,
	.detail_wrap_member > .table-box > .table_ny_two > tfoot > tr > td {
		border: none;
  		padding:10px 10px;
  		font-size: 16px;
	}
	
	.detail_wrap_member > .table-box > .table_ny_two > thead > tr > td,
	.detail_wrap_member > .table-box > .table_ny_two > tbody > tr > td {
		border: 1px solid #919aa1;
		border-left: none;
  		border-right: none;
  		padding:10px 10px;
  		font-size: 13px;
	}
	
	.content-line{
		margin-top:10px;
		border: 5px solid white;
		max-width: 900px;
		margin: auto;
		padding: 20px 10px;
		box-shadow: 2px 2px 10px #EAEAEA;
	
	}
	.table-box{
		max-width: 600px;
		margin: auto;
	}
	.table_ny_two{
		width:100%;
		text-align: center;
		margin: auto;
	}
	.custom-select{
		display:inline-block;
		width:100px;
	}
	input[name=keyword]{
		display:inline-block;
		max-width: 200px;
	}
	.table_ny_two .btn-danger{
		height: 45px;
		width: 130px;
	}
	
	.table_ny_two .newpw_btn{
		width : 200px;
	}
</style>

<div style="height: 100px;"></div>
<div class="content-line">
<div class="detail_wrap_member">
<div class="headtit">
<h3>[${mdto.member_id}]님의 상세 정보</h3>
</div>
<div class="table-box">
<table class="table_ny_two" border="1" >
	<tbody align="center">
		<tr>
			<th>회원 번호</th>
			<td>${mdto.member_no}</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${mdto.member_id}</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="hidden" name="member_no" value="${mdto.member_no}">
				<button class="btn btn-danger newpw_btn">비밀번호 인증 메일 발송</button>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${mdto.member_name}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${mdto.member_basic_addr}&emsp;${mdto.member_detail_addr}</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${mdto.member_birthday.substring(0,10)}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${mdto.member_email1}@${mdto.member_email2}</td>
		</tr>
		<tr>
			<th>핸드폰 번호</th>
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
	<tfoot>
		<tr>
			<td colspan="2">
				<div style = "margin-top:40px">
					<a href ="edit?no=${mdto.member_no}" style = "margin-right:30px; margin-left:200px"><input type="button" value="회원 정보 수정" name="edit" class="btn btn-danger"></a>
					<button type="button" name="exitbtn"  class="btn btn-danger exitbtn" data-toggle="modal" data-target="#deleteCheckModal">회원 탈퇴</button>
				</div>
			</td>
		</tr>
	</tfoot>
</table>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


<!-- 삭제할 때 삭제할건지 확인하는 모달 시작 -->
<!--modal 참고 url : https://getbootstrap.com/docs/4.0/components/modal/ -->
<div class="modal" id="deleteCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">비밀번호 확인</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
			<div class="modal-body">
			비밀번호를 입력후 확인을 누르시면 삭제됩니다
			<!--해당 글 삭제하는 주소값받는 input 태그-->
				<input type="password" class="form-control" name="pw" id="pw" placeholder="PASSWORD를 입력하세요" required>
				<img id="deleteUrl" src="">
			
			</div>
			<div class="modal-footer">
			
				<button type="button" class="btn btn-primary" id="deleteBtn">확인</button>
				
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
