<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.info-wrap{
		padding: 100px;
	}
	.new_reserver{
 		display:none;	 
	}
	.reserve-visit{
		display: none;
	}
</style>
<script>
	$(function(){
		$("input[type=checkbox]").click(function(){
			if($("input[type=checkbox]").is(":checked")){
				$(".new_reserver").css("display","table-row")
			}
			else{
				$(".new_reserver").css("display","none")
			}
		});
	});
	
	$(function(){
		$(".custom-control").click(function(){
			console.log
			if($("#customRadio2").is(":checked")){
				$(".reserve-visit").css("display","table-row")
			}
			else{
				$(".reserve-visit").css("display","none")
			}
		});
	});
</script>
${rdto}
${mdto}
${hdto}
<div align="center" class="info-wrap">
<form action="regist" method="get">
	<h1>1.예약 정보 확인</h1>
	<table class="table table-hamburg table-stripe" >
		<tbody>
			<tr>
				<td>체크인 : <input type="text" value="${check_in}" name="check_in" readonly></td>
				<td>몇박</td>
				<td>체크아웃 : <input type="text" value="${check_out}" name="check_out" readonly></td>
			</tr>
			<tr>
				<th colspan="3" style="text-align: center;">객실정보</th>
			</tr>
			<tr>
				<td >호텔이름</td>
				<td colspan="2">${hdto.hotel_name }</td>
			</tr>
			<tr>
				<td>객실타입</td>
				<td colspan="2">${rdto.room_name }</td>
			</tr>
			<tr>
				<th colspan="3">예약자 정보</th>
			</tr>
			<tr>
				<td>예약자명</td>
				<td colspan="2"><input type="text" value="${mdto.member_name }" readonly> </td>
			</tr>
			<tr>
				<td>연락처</td>
				<td colspan="2"><input type="text" value="${mdto.member_phone }" readonly> </td>
			</tr>
			<tr>
				<td>이메일</td>
				<td colspan="2"><input type="text" value="${mdto.member_email1}@${mdto.member_email2}" readonly></td>
			</tr>
			<tr>
				<td colspan="3">
					<div class="custom-control custom-checkbox">
				      <input type="checkbox" class="custom-control-input" id="customCheck1" >
				      <label class="custom-control-label" for="customCheck1">예약자와 투숙자가 다를경우 체크해 주세요</label>
				    </div>
				    <div class="reserve-wrap">
				    </div>
			    </td>
			</tr>
			<tr class="new_reserver">
				<th colspan="3">예약자 정보</th>
			</tr>
			<tr class="new_reserver">
				<td>예약자명</td>
				<td colspan="2"><input class="form-control" style="width: 45%;" type="text" name="member_name"></td>
			</tr>
			<tr class="new_reserver">
				<td>연락처</td>
				<td colspan="2"><input class="form-control" style="width: 45%;" type="text" name="member_phone" placeholder="-포함 입력"></td>
			</tr>
			<tr>
				<td>방문상태</td> 
				<td class="choice">  <div class="custom-control custom-radio">
					      <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" checked>
					      <label class="custom-control-label" for="customRadio1">도보</label>
					    </div>
					    <div class="custom-control custom-radio">
					      <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input">
					      <label class="custom-control-label" for="customRadio2">차량</label>
					    </div>
			</tr>
			<tr class="reserve-visit">
					    <td colspan="3" style="text-align: center"> 
						    <span>업체 사정상 주차장 이용이 어려울 수 있습니다
						    <br>
						    주차가 불가능할 경우 업체에서 사전에 연락을 드릴 예정입니다</span>
					    </td>
			</tr>
		</tbody>
	</table>
	<h1>2. 할인 수단 및 결제금액</h1>
		<table class="table table-hamburg table-stripe">
			<tbody>
				<tr>
					<th>할인정보</th>
					<td>할인쿠폰사용</td>
				</tr>
				<tr>
					<th colspan="2">결제정보</th>
				</tr>
				<tr>
					<td colspan="2">예약금액</td>
				</tr>
				<tr>
					<td colspan="2">할인금액</td>
				</tr>
				<tr>
					<th colspan="2"> 총 결제 금액 </th>
				</tr>
			</tbody>
		</table>
		<input class="btn btn-danger btn-block" type="submit" value="에약하기">
	</form>
</div>   
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>