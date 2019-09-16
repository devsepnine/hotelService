<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.details-wrap{
		padding: 100px;
	}

</style>
<script>
	$(function(){
		var checkout = new Date($(".check_out").text().substring(6,16));
		var today = new Date();
		var gap = today - checkout;
		var review_states = Math.round(gap/(24 * 3600 * 1000))
		if(review_states >= 7 || review_states < 0){
			$('.review-btn').css('display','none');
		}else{
			$('.review-btn').css('display','block');
		}
	});
	
	$(function(){
		var check = ${check};
		if(${check}==true){
			$('.review-btn').prop('disabled', true)
							.val("리뷰완료");
		}
	});
	
	$(function(){
		var checkin = new Date($(".check_in").text().substring(6,16));
		var today = new Date();
		var gap = today - checkin;
		var review_state = Math.round(gap/(24 * 3600 * 1000))
		console.log(review_state);		
		if(review_state > -1){
			$('.delete_btn').css('display','none');
		}else{
			if($(".reserve_ok").text() == '취소'){
				$(".delete_btn").css("display",'none');
				$(".review-btn").css("display",'none');
			}	
			else{
				$(".delete_btn").css("display",'block');
			}
		}
	});
	
	$(function(){
		$(".delete_btn").click(
			function() {
				//this == button
				var that = this;
				var reserve_no = $(this).prev(".reserve_no").val();
				console.log(reserve_no)
				$.ajax({
					url : "${pageContext.request.contextPath}/payment/kakao/canceled",
					data : {
						order_id : reserve_no
					},
					dataType : "text",
					success : function(resp){
						if (resp == "success"){
							$.ajax({
								url : "${pageContext.request.contextPath}/reserve/reserve_delete",
								data : {
									reserve_no : reserve_no
								},
								dataType : "text",
								success : function(resp) {
									if (resp == "Y") {
										$(".reserve_ok").text("취소");
										$(".delete_btn").css("display",'none');
									}
									else {
										
									}
								}
							});
						}else{
							alert(resp);
							return;
						}
					}
				})
			});
	});
	
	
</script>


<div align="center" class="details-wrap">
<h1>예약 상세 보기</h1>
<br>
	<table class="table table-hamburg table-stripe">
		<tbody>
			<tr>
				<td>호텔이름 : ${hotelDto.hotel_name}</td>
				<td>예약상태 :<span class="reserve_ok">${rdto.reserve_ok}</span></td>
				<td><a href="${pageContext.request.contextPath}/review/write?reserve_no=${rdto.reserve_no}"><input type="button" class="btn btn-danger review-btn" value="리뷰쓰기"></a></td>
			</tr>
			<tr>
				<td colspan="3">1.예약정보</td>
				
			</tr>
			<tr>
				<td class="check_in">입실일 : ${rdto.reserve_in.substring(0,10)}</td>
				<td><p>${time}박</p></td>
				<td class="check_out">퇴실일 : ${rdto.reserve_out.substring(0,10)}</td>
			</tr>
			<tr>
				<td colspan="3">* 객실정보</td>
			</tr>
			<tr>
				<td>예약장소</td>
				<td colspan="2">${hotelDto.hotel_name}</td>
			</tr>
			<tr>
				<td>객실타입</td>
				<td colspan="2">${roomDto.room_name}</td>
			</tr>
			<tr>
				<td>위치</td>
				<td colspan="2">${hotelDto.hotel_basic_addr}</td>
			</tr>
			<tr>
				<td colspan="3">* 예약자 정보</td>
			</tr>
			<tr>
				<td>예약자 수</td>
				<td colspan="2">${rdto.reserve_people}</td>
			</tr>
			<tr>
				<td>예약자명</td>
				<td colspan="2">${rdto.reserve_name}</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td colspan="2">${rdto.reserve_phone}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td colspan="2">${memberDto.member_email1}@${memberDto.member_email2}</td>
			</tr>
			<tr>
				<td colspan="3">2. 결제 금액 정보</td>
			</tr>
			<tr>
				<td>예약일</td>
				<td colspan="2">${rdto.reserve_when.substring(0,10)}</td>
			</tr>
			<tr>
				<td>예약금액</td>
				<td colspan="2">${rdto.reserve_price}원</td>
			</tr>
			<tr>
				<td>총 결제금액</td>
				<td colspan="2">(금액)</td>
			</tr>
			<tr>
				<td colspan="3"><input type="hidden" class="reserve_no" name="${reserveDto.reserve_no}" value="${param.reserve_no}"><input type="button" class="btn btn-danger delete_btn btn-block" value="예약취소"></td>
			</tr>
		</tbody>
	</table>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>