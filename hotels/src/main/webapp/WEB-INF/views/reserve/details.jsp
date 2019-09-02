<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.details-wrap{
		padding: 100px;
	}

</style>


<div align="center" class="details-wrap">
<h1>예약 상세 보기</h1>
<br>
	<table class="table table-hamburg table-stripe">
		<tbody>
			<tr>
				<td>${hotelDto.hotel_name}</td>
				<td>${rdto.reserve_ok}</td>
				<td><a href="review/write"><input type="button" class="btn btn-danger" value="리뷰쓰기"></a></td>
			</tr>
			<tr>
				<td colspan="3">1.예약정보</td>
				
			</tr>
			<tr>
				<td>체크인</td>
				<td><p>_박</p></td>
				<td>체크아웃</td>
			</tr>
			<tr>
				<td colspan="3">객실정보</td>
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
				<td colspan="3">예약자 정보</td>
			</tr>
			<tr>
				<td>예약자 수</td>
				<td colspan="2">(예약자 수)</td>
			</tr>
			<tr>
				<td>예약자명</td>
				<td colspan="2">(이름)</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td colspan="2">(전화번호)</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td colspan="2">(이메일)</td>
			</tr>
			<tr>
				<td>방문방법</td>
				<td colspan="2">(차량)</td>
			</tr>
			<tr>
				<td colspan="3">2. 결제 금액 정보</td>
			</tr>
			<tr>
				<td>예약일</td>
				<td colspan="2">(예약일)</td>
			</tr>
			<tr>
				<td>예약금액</td>
				<td colspan="2">(금액)</td>
			</tr>
			<tr>
				<td>총 결제금액</td>
				<td colspan="2">(금액)</td>
			</tr>
		</tbody>
	</table>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>