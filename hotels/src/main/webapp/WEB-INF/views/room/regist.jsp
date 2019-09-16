<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/seller/seller_template/header.jsp"></jsp:include>

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
.Thumbnail{
	color: black;
	font-size: 1.5rem;
}
table{
	width: 70%;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f6577d0e4ec93da30c028985f6927308&libraries=services"></script>
<script>


</script>



<div class="regist-wrap" align="center">
	<br>
	<h1>객실 정보 입력</h1>
	<br>
	<form action="regist" method="post" enctype="multipart/form-data">
		<div>
			<table>
				<tbody>
					<tr>
						<td>방 이름</td>
						<td>
							<input type="hidden" value="${param.hotel_no}" name="hotel_no">
							<input class="form-control" type="text" name="room_name" placeholder="객실 이름을 입력하세요" required> 
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
							name="room_content" style="resize: none;" rows="7"></textarea>
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
<div class="custom-control custom-checkbox">
								<input type="checkbox" name="room_breakfast" value="Y"
									id="breakfast" class="custom-control-input"> 
									<label class="custom-control-label" for="breakfast">조식</label>
							</div>
							<br>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" value="Y" class="custom-control-input"
									id="spa" name="room_spa"> 
								<label class="custom-control-label" for="spa">스파</label>
							</div>
							<br>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" value="Y" class="custom-control-input"
									id="conditioner" name="room_conditioner">
								<label class="custom-control-label" for="conditioner">에어컨</label>
							</div>
							<br>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" value="Y" class="custom-control-input"
									id="tv" name="room_tv">
								<label class="custom-control-label" for="tv">TV</label>
							</div>
							<br>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" value="Y" class="custom-control-input"
									id="refrigerator" name="room_refrigerator">
								<label class="custom-control-label" for="refrigerator">냉장고</label>
							</div>
							<br>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" value="Y" class="custom-control-input"
									id="shower_room" name="room_shower_room">
								<label class="custom-control-label" for="shower_room">샤워실</label>
							</div>
							<br>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" value="Y" class="custom-control-input"
									id="bath" name="room_bath"> 
								<label class="custom-control-label" for="bath">욕조</label>
							</div>
							<br>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" value="Y" class="custom-control-input"
									id="hair" name="room_hair"> 
								<label class="custom-control-label" for="hair">헤어드라이기</label>
							</div>
							<br>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" value="Y" class="custom-control-input"
									id="cookoo" name="room_cookoo"> 
								<label class="custom-control-label" for="cookoo">전기밥솥</label>
							</div>
							<br>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" value="Y" class="custom-control-input"
									id="smoking" name="room_smoking"> 
								<label class="custom-control-label" for="smoking">흡연</label>
							</div>
							<br>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" value="Y" class="custom-control-input"
									id="cooking" name="room_cooking"> 
								<label class="custom-control-label" for="cooking">요리</label>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p class="Thumbnail">객실 사진</p><br>
							<input type="file" name="file1" accept = ".jpg, .png, .gif" required>메인사진(필수)<br>
							<input type="file" name="file2" accept = ".jpg, .png, .gif" ><br>
							<input type="file" name="file3" accept = ".jpg, .png, .gif" ><br>
							<input type="file" name="file4" accept = ".jpg, .png, .gif" >
						</td>
					</tr>
					
					<tr>
						<td colspan="2"><input class="btn btn-danger btn-block"
							type="submit" style="margin-top: 30px;" value="등록하기" name="registbtn"></td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</form>
</div>


<jsp:include page="/WEB-INF/views/seller/seller_template/footer.jsp"></jsp:include>