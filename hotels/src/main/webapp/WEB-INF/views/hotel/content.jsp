<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f6577d0e4ec93da30c028985f6927308&libraries=services"></script>

<script>
        $(function(){
        	var markerPosition  = new kakao.maps.LatLng(${adto.attraction_lat}, ${adto.attraction_lng}); 

        	// 이미지 지도에 표시할 마커입니다
        	// 이미지 지도에 표시할 마커는 Object 형태입니다
        	var marker = {
        	    position: markerPosition
        	};

        	var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
        	    staticMapOption = { 
        	        center: new kakao.maps.LatLng(${hdto.attraction_latitude}, ${hdto.attraction_longitude}), // 이미지 지도의 중심좌표
        	        level: 3, // 이미지 지도의 확대 레벨
        	        marker: marker // 이미지 지도에 표시할 마커 
        	    };    

        	// 이미지 지도를 생성합니다
        	var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
        });
        
        
    </script>


<jsp:include page="/WEB-INF/views/hotel/hotel_template/hotel_header.jsp"></jsp:include>
<div class="regist-wrap" align="center">
	<br>
	<h1>호텔 등록 페이지</h1>
	<br>
	<form action="regist" method="post" enctype="multipart/form-data">
		<div>
			<table>
				<tbody>
					<tr>
						<td><label for="s_id">호텔 이름</label></td>
						<td>
							<input class="form-control" type="text" value="${hdto.hotel_name}" readonly> 
						</td>
					</tr>
					<tr>
						<td><label for="h_tel">호텔 번호</label></td>
						<td><input class="form-control"	type="tel" value="${hdto.hotel_tel}" readonly></td>
					</tr>
					<tr>
						<td><label for="h_addr">ADDRESS</label></td>
						<td><input class="form-control" type="text" style="display: inline-block;width: 40%"
							value="${hdto.hotel_code_zip}" readonly>
							<input class="form-control" type="text" value="${hdto.hotel_basic_addr}" readonly>
							<input class="form-control" type="text" value="${hdto.hotel_detail_addr}" readonly>
						</td>
					</tr>
					<tr>
						<td><label>소개</label></td>
						<td>
							<textarea class="form-control" readonly>${hdto.hotel_content}</textarea>
						</td>
					</tr>
					<tr>
						<td><label>호텔 성급</label></td>
						<td>
							<input type="text" value="${hdto.hotel_star }" readonly>
						</td>
					</tr>
					
					<tr>
						<td><label>옵션사항</label></td>
						<td>
							<div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="parking" name="hotel_parking">
						      <label class="custom-control-label" for="parking">주차장</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="fitness" name="hotel_fitness">
						      <label class="custom-control-label" for="fitness">피트니스</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="pool" name="hotel_pool">
						      <label class="custom-control-label" for="pool">수영장</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="sauna" name="hotel_sauna">
						      <label class="custom-control-label" for="sauna">사우나</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="lounge" name="hotel_lounge">
						      <label class="custom-control-label" for="lounge">라운지</label>
						    </div><br>
						    <div style="display: block;height: 15px;"></div>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="bbq" name="hotel_bbq">
						      <label class="custom-control-label" for="bbq">바베큐장</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="cafe" name="hotel_cafe">
						      <label class="custom-control-label" for="cafe">카페</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="conveni" name="hotel_convenience_store">
						      <label class="custom-control-label" for="conveni">편의점</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="karaoke" name="hotel_karaoke">
						      <label class="custom-control-label" for="karaoke">노래방</label>
					    	</div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="internet" name="hotel_internet">
						      <label class="custom-control-label" for="internet">인터넷</label>
						    </div>
						</td>
					</tr>
					<tr>
						<td>
							<div id="staticMap" style="width:100%;height:300px;"></div>
							<input type="hidden" id="h_longitude" name="" value="${hotel_longitude}">
							<input type="hidden" id="h_latitude"  value="${hotel_latitude}">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p class="Thumbnail">썸네일 사진  </p><input type="file" name="file" accept = ".jpg, .png, .gif" required><br><br>
							
							<p class="Thumbnail">호텔 사진</p>

									<img height="100px;" src="${pageContext.request.contextPath}/img_v/3?img_name=${hdto.hotel_title}">
								<c:if test="${not empty hfdtolist[0]}">
									<img height="100px;" src="${pageContext.request.contextPath}/img_v/3?img_name=${afdtolist[0].attraction_file_name}">
								</c:if>
								<c:if test="${not empty afdtolist[1]}">
									<img height="100px;" src="${pageContext.request.contextPath}/img_v/3?img_name=${afdtolist[1].attraction_file_name}">
								</c:if>
								<c:if test="${not empty afdtolist[2]}">
									<img height="100px;" src="${pageContext.request.contextPath}/img_v/3?img_name=${afdtolist[2].attraction_file_name}">
								</c:if>
								<c:if test="${not empty hfdtolist[3]}">
									<img height="100px;" src="${pageContext.request.contextPath}/img_v/3?img_name=${afdtolist[0].attraction_file_name}">
								</c:if>
								<c:if test="${not empty afdtolist[4]}">
									<img height="100px;" src="${pageContext.request.contextPath}/img_v/3?img_name=${afdtolist[1].attraction_file_name}">
								</c:if>
								<c:if test="${not empty afdtolist[5]}">
									<img height="100px;" src="${pageContext.request.contextPath}/img_v/3?img_name=${afdtolist[2].attraction_file_name}">
								</c:if>
								<c:if test="${not empty hfdtolist[6]}">
									<img height="100px;" src="${pageContext.request.contextPath}/img_v/3?img_name=${afdtolist[0].attraction_file_name}">
								</c:if>
								<c:if test="${not empty afdtolist[7]}">
									<img height="100px;" src="${pageContext.request.contextPath}/img_v/3?img_name=${afdtolist[1].attraction_file_name}">
								</c:if>
								<c:if test="${not empty afdtolist[8]}">
									<img height="100px;" src="${pageContext.request.contextPath}/img_v/3?img_name=${afdtolist[2].attraction_file_name}">
								</c:if>
								<c:if test="${not empty hfdtolist[9]}">
									<img height="100px;" src="${pageContext.request.contextPath}/img_v/3?img_name=${afdtolist[0].attraction_file_name}">
								</c:if>

						</td>
					</tr>
					
					<tr>
						<td colspan="2"><input class="btn btn-danger btn-block"
							type="submit" style="margin-top: 30px;" value="등록하기"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</div>


<jsp:include page="/WEB-INF/views/seller/seller_template/footer.jsp"></jsp:include>