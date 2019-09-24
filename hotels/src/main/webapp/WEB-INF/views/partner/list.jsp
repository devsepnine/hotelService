<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/seller/seller_template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>

<style>
	.hotel-list-wrap{
		
		padding: 50px;
	}
	.content_title{
		color:black;
		border-right: 1px solid lightgray;
		text-align: center;
		width: 15%;
	}
	.end_line{
		border-bottom: 1px solid darkgray;
		text-align: right;
	}
	.delete_btn{
		background-color: #fe2c08;
		color : white;
	}
	.table > tbody > tr > .partner_status{
	    vertical-align: middle;
	    text-align: center;
		border-left: 1px solid lightgray;
		width:10%;
	}
	
</style>
<script>
$(function(){
	$(".partnercheckdelete").click(function(){
		var partner_no = $(this).data("partnerno")
		$("input[name=partner_no]").val(partner_no);
		
		$("#deleteCheckModal").modal();  
	});
	
	$(".cdbtn").click(function(){
		var pw = $("input[name=seller_pw]").val();
		var encPw = CryptoJS.SHA256(pw).toString();
		var partner_no = $("input[name=partner_no]").val();
		var hotel_no = $("input[name=hotel_no]").val();
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/seller/hotel/partner/partnerDelete",
			data : {
				seller_pw : encPw,
				partner_no : partner_no
			},
			dataType : "text",
			success : function(resp) {
				if (resp == "Y") {
					location.href="${pageContext.request.contextPath}/seller/hotel/partner/list?hotel_no="+hotel_no;
				}
				else {
					window.alert("비밀번호가 일치하지 않습니다")
				}
			}
		});
	});
	
});
</script>

<br>
<br>

<jsp:include page="/WEB-INF/views/hotel/hotel_template/hotel_header.jsp"></jsp:include>
<div align="center" class="hotel-list-wrap">
	<c:forEach var="pdto" items="${list}">
		<table class="table table-hamburg table-stripe partner_info">
			<tbody>
					<tr>
						<td rowspan="4" style="width: 180px;">
							<a href="detail?partner_no=${pdto.partner_no}">
								<img src="${pageContext.request.contextPath}/img_v/5?img_name=${pdto.p_file_name}" width="240px" height="240px">
							</a>
						</td>
						<td class="content_title">제휴 이름
							<input type="hidden" id="partner_no" name="partner_no" value="${pdto.partner_no}">
						</td>
						<td>
							<a href="detail?partner_no=${pdto.partner_no}">${pdto.partner_name}</a>
						</td>
						<td rowspan="4" class="partner_status" >
							${pdto.partner_type}
						</td>
					</tr>
					<tr>
						<td class="content_title">제휴 번호</td>
						<td >${pdto.partner_tel}</td>
					</tr>
					<tr>
						<td class="content_title ">제휴 주소</td>
						<td class="">${pdto.partner_basic_addr}<br>
									${pdto.partner_detail_addr}</td>
					</tr>
					<tr>
						<td class="content_title ">제휴 소개</td>
						<td class="">${pdto.partner_content}</td>
					</tr>
					<tr class="end_line">
						<td colspan="4">
							<button type="button" class="btn btn-primary partnercheckdelete" data-partnerno="${pdto.partner_no}">삭제</button>
						</td>
					</tr>
			</tbody>
		</table>
	</c:forEach>
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
				<input type="hidden" name="partner_no" value="" >
				<input type="hidden" name="hotel_no" value="${param.hotel_no}">
				<img id="deleteUrl" src="">
			
			</div>
			<div class="modal-footer">
			
				<button type="button" class="btn btn-primary cdbtn" id="delete">확인</button>
				
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
