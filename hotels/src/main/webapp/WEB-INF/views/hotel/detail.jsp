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
.left_info{
	width:40%;
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
.hotel_info{ 
 	width: 70%; 
} 

.buttonclass{
	text-align: right;
	
}
.btnstyle{
	
	width: 80px;
	background: black;
	color: white;
}
table{
	width: 70%;
}
.a_btn{
	text-align:center;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f6577d0e4ec93da30c028985f6927308&libraries=services"></script>

<script>
        $(function(){
        	var markerPosition  = new kakao.maps.LatLng(${hdto.hotel_latitude}, ${hdto.hotel_longitude}); 

        	// 이미지 지도에 표시할 마커입니다
        	// 이미지 지도에 표시할 마커는 Object 형태입니다
        	var marker = {
        	    position: markerPosition
        	};

        	var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
        	    staticMapOption = { 
        	        center: new kakao.maps.LatLng(${hdto.hotel_latitude}, ${hdto.hotel_longitude}), // 이미지 지도의 중심좌표
        	        level: 4, // 이미지 지도의 확대 레벨
        	        marker: marker // 이미지 지도에 표시할 마커 
        	    };    

        	// 이미지 지도를 생성합니다
        	var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
        });
        
        
    </script>


<jsp:include page="/WEB-INF/views/hotel/hotel_template/hotel_header.jsp"></jsp:include>
<div class="regist-wrap" align="center">
	<br>
	<h1>호텔 상세보기 페이지</h1>
	<br>
		<div>
			<table class="hotel_info">
				<tbody>
					<tr>
						<td class="left_info"><label for="s_id">호텔 이름</label></td>
						<td>
							<input class="form-control" type="text" value="${hdto.hotel_name}" readonly> 
						</td>
					</tr>
					<tr>
						<td class="left_info"><label for="h_tel">호텔 번호</label></td>
						<td><input class="form-control"	type="tel" value="${hdto.hotel_tel}" readonly></td>
					</tr>
					<tr>
						<td class="left_info"><label for="h_addr">ADDRESS</label></td>
						<td><input class="form-control" type="text" style="display: inline-block;width: 40%"
							value="${hdto.hotel_zip_code}" readonly>
							<input class="form-control" type="text" value="${hdto.hotel_basic_addr}" readonly>
							<input class="form-control" type="text" value="${hdto.hotel_detail_addr}" readonly>
						</td>
					</tr>
					<tr>
						<td class="left_info"><label>소개</label></td>
						<td>
							<textarea class="form-control" readonly style="resize: none;" rows="7">${hdto.hotel_content}</textarea>
						</td>
					</tr>
					<tr>
						<td class="left_info"><label>호텔 성급</label></td>
						<td>
							<input type="text" value="${hdto.hotel_star}" readonly>
						</td>
					</tr>
					
					<tr>
						<td class="left_info"><label>옵션사항</label></td>
						<td>
							<div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="parking" disabled name="hotel_parking" ${hdto.hotel_parking eq 'Y'?"checked":""}>
						      <label class="custom-control-label" for="parking">주차장</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="fitness" disabled name="hotel_fitness" ${hdto.hotel_fitness eq 'Y'?"checked":""}>
						      <label class="custom-control-label" for="fitness">피트니스</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="pool" disabled name="hotel_pool" ${hdto.hotel_pool eq 'Y'?"checked":""}>
						      <label class="custom-control-label" for="pool">수영장</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="sauna" disabled name="hotel_sauna" ${hdto.hotel_sauna eq 'Y'?"checked":""}>
						      <label class="custom-control-label" for="sauna">사우나</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="lounge" disabled name="hotel_lounge" ${hdto.hotel_lounge eq 'Y'?"checked":""}>
						      <label class="custom-control-label" for="lounge">라운지</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="bbq" disabled name="hotel_bbq" ${hdto.hotel_bbq eq 'Y'?"checked":""}>
						      <label class="custom-control-label" for="bbq">바베큐장</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="cafe" disabled name="hotel_cafe" ${hdto.hotel_cafe eq 'Y'?"checked":""}>
						      <label class="custom-control-label" for="cafe">카페</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="conveni" disabled name="hotel_convenience_store" ${hdto.hotel_convenience_store eq 'Y'?"checked":""}>
						      <label class="custom-control-label" for="conveni">편의점</label>
						    </div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="karaoke" disabled name="hotel_karaoke" ${hdto.hotel_karaoke eq 'Y'?"checked":""}>
						      <label class="custom-control-label" for="karaoke">노래방</label>
					    	</div><br>
						    <div class="custom-control custom-checkbox">
						      <input type="checkbox" value="Y" class="custom-control-input" id="internet" disabled name="hotel_internet" ${hdto.hotel_internet eq 'Y'?"checked":""}>
						      <label class="custom-control-label" for="internet">인터넷</label>
						    </div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="staticMap" style="width:100%;height:300px;" ></div>
							<input type="hidden" id="h_longitude" name="" value="${hotel_longitude}">
							<input type="hidden" id="h_latitude"  value="${hotel_latitude}">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p class="Thumbnail">썸네일 사진  </p>
								<img width="100%;" src="${pageContext.request.contextPath}/img_v/3?img_name=${hdto.hotel_title}">
							<br><br>
						</td>
					</tr>
					<tr>	
						<td colspan="2">	
							<p class="Thumbnail">호텔 사진</p>

								<c:if test="${not empty hfdtolist[0]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/3?img_name=${hfdtolist[0].h_file_name}">
								</c:if>
								<c:if test="${not empty hfdtolist[1]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/3?img_name=${hfdtolist[1].h_file_name}">
								</c:if><br>
								<c:if test="${not empty hfdtolist[2]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/3?img_name=${hfdtolist[2].h_file_name}">
								</c:if>
								<c:if test="${not empty hfdtolist[3]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/3?img_name=${hfdtolist[3].h_file_name}">
								</c:if><br>
								<c:if test="${not empty hfdtolist[4]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/3?img_name=${hfdtolist[4].h_file_name}">
								</c:if>
								<c:if test="${not empty hfdtolist[5]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/3?img_name=${hfdtolist[5].h_file_name}">
								</c:if><br>
								<c:if test="${not empty hfdtolist[6]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/3?img_name=${hfdtolist[6].h_file_name}">
								</c:if>
								<c:if test="${not empty hfdtolist[7]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/3?img_name=${hfdtolist[7].h_file_name}">
								</c:if><br>
								<c:if test="${not empty hfdtolist[8]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/3?img_name=${hfdtolist[8].h_file_name}">
								</c:if>
								<c:if test="${not empty hfdtolist[9]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/3?img_name=${hfdtolist[9].h_file_name}">
								</c:if>
						</td>
					</tr>
				</tbody>
			</table>
			<div style="height: 70px"></div>
				<div style="text-align: right; width: 560px;margin: auto;">
					<a href="${pageContext.request.contextPath}/seller/hotel/edit?hotel_no=${hdto.hotel_no}" class="btn btn-primary">호텔수정</a>
					<a href="${pageContext.request.contextPath}/seller/hotel/list" class="btn btn-primary">호텔목록</a>
					<a href="${pageContext.request.contextPath}/room/list?hotel_no=${hdto.hotel_no}" class="btn btn-primary">방 목록</a>
					<a href="${pageContext.request.contextPath}/seller/hotel/partner/list?hotel_no=${hdto.hotel_no}" class="btn btn-primary">제휴목록</a>
				</div>			
		</div>
</div>


<jsp:include page="/WEB-INF/views/seller/seller_template/footer.jsp"></jsp:include>