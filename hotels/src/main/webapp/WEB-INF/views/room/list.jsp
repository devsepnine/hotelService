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
		border-right: 0.5px solid lightgray;
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

	
</style>
<script>
$(function(){
	$(".roomcheckdelete").click(function(){
		var room_no = $(this).data("roomno")
		$("input[name=room_no]").val(room_no);
		
		$("#deleteCheckModal").modal();  
	});
	
	$(".cdbtn").click(function(){
		var pw = $("input[name=seller_pw]").val();
		var encPw = CryptoJS.SHA256(pw).toString();
		var room_no = $("input[name=room_no]").val();
		var hotel_no = $("input[name=hotel_no]").val();
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/room/roomDelete",
			data : {
				seller_pw : encPw,
				room_no : room_no
			},
			dataType : "text",
			success : function(resp) {
				if (resp == "Y") {
					location.href="${pageContext.request.contextPath}/room/list?hotel_no="+hotel_no;
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
	<c:forEach var="rdto" items="${list}">
		<table class="table table-hamburg table-stripe room_info">
			<tbody>
					<tr>
						<td rowspan="3" style="width: 180px;">
							<a href="detail?room_no=${rdto.room_no}">
								<img src="${pageContext.request.contextPath}/img_v/4?img_name=${rdto.r_file_name}" width="240px" height="240px">
							</a>
						</td>
						<td class="content_title">객실 이름
							<input type="hidden" class="room_no" name="room_no" value="${rdto.room_no}">
						</td>
						<td>
							<a href="detail?room_no=${rdto.room_no}">${rdto.room_name}</a>
						</td>
					</tr>
					<tr>
						<td class="content_title">객실 가격</td>
						<td >${rdto.room_price}</td>
					</tr>
					<tr>
						<td class="content_title ">객실 소개</td>
						<td class="">${rdto.room_content}</td>
					</tr>
					<tr class="end_line">
						<td colspan="3">
							<a href="${pageContext.request.contextPath}/room/regist?hotel_no=${rdto.hotel_no}"><button class="btn btn-danger">방 등록</button></a>
							<button type="button" class="btn btn-primary roomcheckdelete" data-roomno="${rdto.room_no}">삭제</button>
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
				<input type="hidden" name="room_no" value="" >
				<input type="hidden" name="hotel_no" value="${param.hotel_no}" >
				<img id="deleteUrl" src="">
			
			</div>
			<div class="modal-footer">
			
				<button type="button" class="btn btn-primary cdbtn" id="delete">확인</button>
				
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
