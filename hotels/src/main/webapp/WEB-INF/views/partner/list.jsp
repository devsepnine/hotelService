<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/seller/seller_template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		$(".delete_btn").click(
			function() {
				var that = this;
				
				$.ajax({
					url : "${pageContext.request.contextPath}/seller/hotel/partner/delete",
					data : {
						room_no : $("#partner_no").val()
					},
					dataType : "text",
					success : function(resp) {
						
						if (resp == "Y") {
 							$(that).parents(".partner_info").remove();							
						}
						else {
							
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
							<button class="btn btn-danger delete_btn ">삭제</button>
						</td>
					</tr>
			</tbody>
		</table>
	</c:forEach>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>











