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
		var review_state = Math.round(gap/(24 * 3600 * 1000))
		if(review_state >= 7 || review_state < 0){
			$('#review-btn').css('display','block');
		}else{
			$('#review-btn').css('display','block');
		}
	});
	
	$(function(){
		var check = ${check};
		if(${check}==true){
			$('#review-btn').prop('disabled', true)
							.val("리뷰완료");
		}
	});
	
	$(function(){
		var checkin = new Date($(".check_in").text().substring(6,16));
		var today = new Date();
		var gap = today - checkin;
		console.log(gap);
		var review_state = Math.round(gap/(24 * 3600 * 1000))
		console.log(review_state);		
		
		if(review_state > -1){
			$('.reserve_can').css('display','none');
		}else{
			$('.reserve_can').css('display','block');
		}
	});
	
	
</script>


<div align="center" class="details-wrap">
<h1>예약 상세 보기</h1>
<br>
	<table class="table table-hamburg table-stripe">
		<tbody>
			<tr>
				<td>호텔이름 : ${hotelDto.hotel_name}</td>
				<td>${rdto.reserve_ok}</td>
				<td><a href="${pageContext.request.contextPath}/review/write?reserve_no=${rdto.reserve_no}"><input type="button" id="review-btn" class="btn btn-danger" value="리뷰쓰기"></a></td>
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
				<td>방문방법</td>
				<td colspan="2">${rdto.reserve_visit}</td>
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
				<td colspan="2">${roomDto.room_price}원</td>
			</tr>
			<tr>
				<td>총 결제금액</td>
				<td colspan="2">(금액)</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center;" ><a href="#" class="btn btn-danger reserve_can">예약취소</a>
			</tr>
		</tbody>
	</table>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>