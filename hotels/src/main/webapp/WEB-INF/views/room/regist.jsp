<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<!-- 수정했습니다. -->
<style>
form h4 {
	display: none
}

form label {
	font-size: 20px;
	/* 	background-color:yellow; */
}

.regist-wrap {
	width: 800px;
	margin: auto;
}

.cert_check{
 	display: none; 
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f6577d0e4ec93da30c028985f6927308&libraries=services"></script>
<script>


</script>



<div class="regist-wrap" align="center">
	<br>
	<h1>가입 정보 입력</h1>
	<br>
	<form action="regist" method="post">
		<div>
			<table>
				<tbody>
					<tr>
						<td>방 이름</td>
						<td>
							<input type="hidden" value="${param.hotel_no}" name="hotel_no">
							<input class="form-control" type="text" name="room_name" required> 
						</td>
					</tr>
					<tr>
						<td>방 가격</td>
						<td><input class="form-control"
							type="text" placeholder="가격을 입력해주세요" name="room_price" required>
						</td>
					</tr>
					<tr>
						<td>소개</td>
						<td>
							<textarea class="form-control" placeholder="방 소개글을 입력하세요" 
							name="room_content"></textarea>
						</td>
					</tr>
					<tr>
						<td>최대 인원</td>
						<td>
							<select class="form-control" name="room_people" required>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>침대 타입</td>
						<td>
							<select class="form-control" name="room_bed" required>
								<option>온돌</option>
								<option>싱글 베드</option>
								<option>트윈 베드</option>
								<option>더블 베드</option>
								<option>더블 트윈 베드</option>
								<option>패밀리 베드</option>
								<option>엑스트라 베드</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td>옵션사항</td>
						<td>
							<input type="checkbox" name="room_breakfast" value="Y">조식<br>
							<input type="checkbox" name="room_spa" value="Y">스파<br>
							<input type="checkbox" name="room_conditioner" value="Y">에어컨<br>
							<input type="checkbox" name="room_tv" value="Y">TV<br>
							<input type="checkbox" name="room_refrigerator" value="Y">냉장고<br>
							<input type="checkbox" name="room_shower_room" value="Y">샤워실<br>
							<input type="checkbox" name="room_bath" value="Y">욕조<br>
							<input type="checkbox" name="room_hair" value="Y">헤어드라이기<br>
							<input type="checkbox" name="room_cookoo" value="Y">전기밥솥<br>
							<input type="checkbox" name="room_smoking" value="Y">흡연가능<br>
							<input type="checkbox" name="room_cooking" value="Y">요리가능
						</td>
					</tr>
<!-- 					<tr> -->
<!-- 						<td> -->
<!-- 							<input type="file" name="room_title"> -->
<!-- 						</td> -->
<!-- 					</tr> -->
					
					<tr>
						<td colspan="2"><input class="btn btn-danger btn-block"
							type="submit" style="margin-top: 30px;" value="등록하기" name="registbtn"></td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</form>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>