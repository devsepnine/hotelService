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
table{
	width: 70%;
}
.end_line{
	text-align: center;
}
.btn_list{
	background-color: lightblue;
	margin-top: 30px;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f6577d0e4ec93da30c028985f6927308&libraries=services"></script>
<script>


$(function(){
	var markerPosition  = new kakao.maps.LatLng(${pdto.partner_latitude}, ${pdto.partner_longitude}); 

	// 이미지 지도에 표시할 마커입니다
	// 이미지 지도에 표시할 마커는 Object 형태입니다
	var marker = {
	    position: markerPosition
	};

	var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
	    staticMapOption = { 
	        center: new kakao.maps.LatLng(${pdto.partner_latitude}, ${pdto.partner_longitude}), // 이미지 지도의 중심좌표
	        level: 3, // 이미지 지도의 확대 레벨
	        marker: marker // 이미지 지도에 표시할 마커 
	    };    

	// 이미지 지도를 생성합니다
	var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
});
</script>

<div class="regist-wrap" align="center">
	<br>
	<h1>제휴 정보 입력</h1>
	<br>
		<div>
			<table>
				<tbody>
					<tr>
						<td><label>제휴 이름</label></td>
						<td>
							<input class="form-control" type="text" value="${pdto.partner_name}" readonly> 
						</td>
					</tr>
					<tr>
						<td><label>ADDRESS</label></td>
						<td><input class="form-control" type="text" value="${pdto.partner_zip_code}" readonly>
							<input class="form-control" type="text" value="${pdto.partner_basic_addr}" readonly>
							<input class="form-control" type="text" value="${pdto.partner_detail_addr}" readonly>
						</td>
					</tr>
					<tr>
						<td><label>제휴 번호</label></td>
						<td><input class="form-control" type="tel" value="${pdto.partner_tel}" readonly></td>
					</tr>
					<tr>
						<td><label>소개</label></td>
						<td>
							<textarea class="form-control" readonly>${pdto.partner_content}</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="staticMap" style="width:100%;height:300px;" ></div>
							<input type="hidden" id="h_longitude" name="" value="${partner_longitude}">
							<input type="hidden" id="h_latitude"  value="${partner_latitude}">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p class="Thumbnail">제휴 사진</p>
								<c:if test="${not empty pfdtolist[0]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/5?img_name=${pfdtolist[0].p_file_name}">
								</c:if>
								<c:if test="${not empty pfdtolist[1]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/5?img_name=${pfdtolist[1].p_file_name}">
								</c:if><br>
								<c:if test="${not empty pfdtolist[2]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/5?img_name=${pfdtolist[2].p_file_name}">
								</c:if>
								<c:if test="${not empty pfdtolist[3]}">
									<img width="49%;" src="${pageContext.request.contextPath}/img_v/5?img_name=${pfdtolist[3].p_file_name}">
								</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="end_line">
							<a href="${pageContext.request.contextPath}/seller/hotel/partner/list?hotel_no=${pdto.hotel_no}"><button class="btn btn_warning btn_list">목록</button></a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
</div>


<jsp:include page="/WEB-INF/views/seller/seller_template/footer.jsp"></jsp:include>