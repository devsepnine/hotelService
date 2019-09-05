<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/seller/seller_template/header.jsp"></jsp:include>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
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
.end-line{
	text-align: center;
}

.end-btn{
	margin: 30px,30px;
}
table{
	width: 70%;
}

</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f6577d0e4ec93da30c028985f6927308&libraries=services"></script>
<script>


</script>


<c:forEach var="rfdto" items="${rfdtolist}" varStatus="status">
	<input type="hidden" name="r_file_no${status.count}" value="${rfdto.r_file_no}">
</c:forEach>
<div class="regist-wrap" align="center">
	<br>
	<h1>객실 상세 보기</h1>
	<br>
		<div>
			<table>
				<tbody>
					<tr>
						<td><label>방 이름</label></td>
						<td>
							<input type="hidden" value="${param.hotel_no}" name="hotel_no">
							<input class="form-control" type="text" value="${rdto.room_name}" readonly> 
						</td>
					</tr>
					<tr>
						<td><label>방 가격</label></td>
						<td><input class="form-control"
							type="text" value="${rdto.room_price}" readonly>
						</td>
					</tr>
					<tr>
						<td><label>소개</label></td>
						<td>
							<textarea class="form-control" readonly>${rdto.room_content }</textarea>
						</td>
					</tr>
					<tr>
						<td><label>최대 인원</label></td>
						<td>
							<input class="form-control" type="text" value="${rdto.room_people}" readonly>
						</td>
					</tr>
					<tr>
						<td><label>침대 타입</label></td>
						<td>
							<input class="form-control" type="text" value="${rdto.room_bed}" readonly>
						</td>
					</tr>
					
					<tr>
						<td><label>옵션사항</label></td>
						<td>
							<div class="custom-control custom-checkbox">
							<input type="checkbox" name="room_breakfast" value="Y" id="breakfast" class="custom-control-input" ${rdto.room_breakfast eq 'Y'?"checked":""} disabled>
							<label class="custom-control-label" for="breakfast">조식</label>
							</div><br>
							<div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="spa" name="room_spa" ${rdto.room_spa eq 'Y'?"checked":""} disabled>
						      <label class="custom-control-label" for="spa">스파</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="conditioner" name="room_conditioner" ${rdto.room_conditioner eq 'Y'?"checked":""} disabled>
						      <label class="custom-control-label" for="conditioner">에어컨</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="tv" name="room_tv" ${rdto.room_tv eq 'Y'?"checked":""} disabled>
						      <label class="custom-control-label" for="tv">TV</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="refrigerator" name="room_refrigerator" ${rdto.room_refrigerator eq 'Y'?"checked":""} disabled>
						      <label class="custom-control-label" for="refrigerator">냉장고</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="shower_room" name="room_shower_room" ${rdto.room_shower_room eq 'Y'?"checked":""} disabled>
						      <label class="custom-control-label" for="shower_room">샤워실</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="bath" name="room_bath" ${rdto.room_bath eq 'Y'?"checked":""} disabled>
						      <label class="custom-control-label" for="bath">욕조</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="hair" name="room_hair" ${rdto.room_hair eq 'Y'?"checked":""} disabled>
						      <label class="custom-control-label" for="hair">헤어드라이기</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="cookoo" name="room_cookoo" ${rdto.room_cookoo eq 'Y'?"checked":""} disabled>
						      <label class="custom-control-label" for="cookoo">전기밥솥</label>
					    	</div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="smoking" name="room_smoking" ${rdto.room_smoking eq 'Y'?"checked":""} disabled>
						      <label class="custom-control-label" for="smoking">흡연</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="cooking" name="room_cooking" ${rdto.room_cooking eq 'Y'?"checked":""} disabled>
						      <label class="custom-control-label" for="cooking">요리</label>
						    </div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p class="Thumbnail">객실 사진</p>
								<c:if test="${not empty rfdtolist[0]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/4?img_name=${rfdtolist[0].r_file_name}">
								</c:if>
								<c:if test="${not empty rfdtolist[1]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/4?img_name=${rfdtolist[1].r_file_name}">
								</c:if><br>
								<c:if test="${not empty rfdtolist[2]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/4?img_name=${rfdtolist[2].r_file_name}">
								</c:if>
								<c:if test="${not empty rfdtolist[3]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/4?img_name=${rfdtolist[3].r_file_name}">
								</c:if><br>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" class="end-line">
							<a href="${pageContext.request.contextPath}/room/edit?room_no=${rdto.room_no}"><button class="btn btn-danger end-btn">수정</button></a>
							<a href="${pageContext.request.contextPath}/room/list?hotel_no=${rdto.hotel_no}"><button class="btn btn-danger end-btn">목록 </button></a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
</div>


<jsp:include page="/WEB-INF/views/seller/seller_template/footer.jsp"></jsp:include>