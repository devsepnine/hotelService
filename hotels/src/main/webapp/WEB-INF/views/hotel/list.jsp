<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>

<jsp:include page="/WEB-INF/views/seller/seller_template/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/hotel/hotel_template/hotel_header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		$(".hotelcheckdelete").click(function(){
			//번호 받아오고
			//모달에 정보 설정
			var hotelNo = $(this).data("hotelno")
			$("input[name=hotel_no]").val(hotelNo);
			
			$("#deleteCheckModal").modal();  
		});
		
		$(".cdbtn").click(function(){
			var pw = $("input[name=seller_pw]").val();
			var encPw = CryptoJS.SHA256(pw).toString();
			var hotel_no = $("input[name=hotel_no]").val();
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/seller/hotel/hotelDelete",
				data : {
					seller_pw : encPw,
					hotel_no : hotel_no
				},
				dataType : "text",
				success : function(resp) {
					if (resp == "Y") {
						location.href="${pageContext.request.contextPath}/seller/hotel/list";
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


<div align="center" class="hotel-list-wrap">
	<c:forEach var="hdto" items="${list}">
		<table class="table table-hamburg table-stripe hotel_info">
			<tbody>
					<tr>
						<td rowspan="3" style="width: 180px;">
							<a href="detail?hotel_no=${hdto.hotel_no}">
								<img src="${pageContext.request.contextPath}/img_v/3?img_name=${hdto.hotel_title}" width="240px" height="240px">
							</a>
						</td>
						<td class="content_title">호텔 이름
							<input type="hidden" class="hotel_no" name="hotel_no" value="${hdto.hotel_no}">
						</td>
						<td><a href="detail?hotel_no=${hdto.hotel_no}">${hdto.hotel_name}</a></td>
					</tr>
					<tr>
						<td class="content_title">호텔 주소</td>
						<td >${hdto.hotel_basic_addr}<br>${hdto.hotel_detail_addr}</td>
					</tr>
					<tr>
						<td class="content_title ">호텔 전화번호</td>
						<td class="">${hdto.hotel_tel}</td>
					</tr>
					<tr class="end_line">
						<td colspan="3">
							<a href="${pageContext.request.contextPath}/seller/hotel/partner/regist?hotel_no=${hdto.hotel_no}"><button class="btn btn-danger">제휴 추가  </button></a>
							<a href="${pageContext.request.contextPath}/seller/hotel/partner/list?hotel_no=${hdto.hotel_no}"><button class="btn btn-danger">제휴목록</button></a>
							<a href="${pageContext.request.contextPath}/room/regist?hotel_no=${hdto.hotel_no}"><button class="btn btn-warning">방 추가  </button></a>
							<a href="${pageContext.request.contextPath}/room/list?hotel_no=${hdto.hotel_no}"><button class="btn btn-warning">방 목록</button></a>
							<button type="button" class="btn btn-primary hotelcheckdelete" data-hotelno="${hdto.hotel_no}">삭제</button>
						</td>
					</tr>
			</tbody>
		</table>
	</c:forEach>
	<a href="${pageContext.request.contextPath}/seller/hotel/regist"><input class="btn btn-danger" type="button" name="#" value="호텔등록"></a>
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
				<input type="hidden" name="hotel_no" value="" >
				<img id="deleteUrl" src="">
			
			</div>
			<div class="modal-footer">
			
				<button type="button" class="btn btn-primary cdbtn" id="delete">확인</button>
				
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>








