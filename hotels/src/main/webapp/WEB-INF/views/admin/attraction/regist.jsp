<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<script>
	$(function(){
	    ClassicEditor
	            .create( document.querySelector( 'textarea[name=attraction_info]' ), {
	            	removePlugins: [ 'ImageUpload', 'MediaEmbed' ]
	            })
	});
</script>
<script>
	$(function(){
		$("form").submit(function(e){
	    	e.preventDefault();
	    	if($(".ck-editor__editable").children("p").text().length==0){
	    		alert("관광지 설명을 입력하세요.")
	    	}else{
	    		this.submit();
	    	}
	    });
	});
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f6577d0e4ec93da30c028985f6927308&libraries=services"></script>
<script>


	$(function() {
		$("input[name=postcode_find]").click(findAddress);
	});

	function findAddress() { 
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.

				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				// document.querySelector('input[name=postcode]').value = data.zonecode;
				// document.querySelector("input[name=basicaddr]").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				// document.querySelector("input[name=detailaddr]").focus();

				// 이 코드는 jquery.js 를 먼저 불러온 경우만 사용 가능
				$("input[name=attraction_postcode]").val(data.zonecode);
				$("input[name=attraction_addr1]").val(addr);
				var addr = $("input[name=attraction_addr1]").val();
				  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  

					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
			
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
			
					// 주소로 좌표를 검색합니다
						geocoder.addressSearch(addr, function(result, status) {
				
						    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {
			
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					        var longitude = result[0].x;
					        var latitude = result[0].y;
					        $("#attraction_lng").val(longitude);
					        $("#attraction_lat").val(latitude);
			
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
			
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					});

				
				$("input[name=attraction_addr2]").focus();
			}
		}).open();
	}
</script>

<%-- 
		table_ny_one
		 - 위아래는 두껍고 안에는 얇은 선
		 - 좌우는 선 없음
	--%>
	
<style>
	.ck-editor__editable {
		min-height:500px;
		max-height:500px;
	}
</style>

<style>
	.attraction_wrap > *{
		color:black;
	}
	
	.attraction_wrap > .table_ny_one {
		margin-top : 50px;
		border-top: 3px solid #432c10;
  		border-bottom: 3px solid #432c10;
   		border-left: none;
  		border-right: none;
  		max-width: 1100px;
	}
	
	.attraction_wrap > .table_ny_one > thead > tr > th,
	.attraction_wrap > .table_ny_one > thead > tr > td,
	.attraction_wrap > .table_ny_one > tbody > tr > th,
	.attraction_wrap > .table_ny_one > tbody > tr > td,
	.attraction_wrap > .table_ny_one > tfoot > tr > th,
	.attraction_wrap > .table_ny_one > tfoot > tr > td {
		border: 1px solid #432c10;
		border-left: none;
  		border-right: none;
  		padding:10px 10px;
	}
	
	.headtit{
		border-bottom: #432c10 solid 10px;
		width:1100px;
		margin:auto;
	}
	
	.content-line{
		margin-top:100px;
		border: 5px solid white;
		max-width: 1200px;
		margin: auto;
		padding: 20px 10px;
		box-shadow: 2px 2px 10px #EAEAEA;
	}
	
	.td-line{
		width: 950px;
		text-align: left;
	}
	
	.btn{
		width: 50px;
		height: 40px;
		padding: 0px;
	}
	
	@media (max-width:1224px) {
		.td-line{
			text-align: left;
		}
	}
</style>


<form action="regist" method="post" enctype="multipart/form-data">
<div style="height: 100px;"></div>
<div class="content-line">
<div class="attraction_wrap">
<div class="headtit">
<h3>관광지 추가</h3>
</div>
		<table class="table_ny_one" align="center" >
			<tbody>
				<tr>
					<td class="td-line" style="width:100px">
						<label>이름</label>
					</td>
					<td class="td-line">
						<input type="text" style="width:300px;" name="attraction_name" placeholder="관광지 이름을 입력하세요" required>
					</td>
				</tr>
				<tr>
					<td style="width:100px">
						<label>주소</label>
					</td>
					<td><input class="form-control" type="text" style="display: inline-block;width: 40%" name="attraction_postcode" placeholder="우편번호" required readonly>
						<input class="btn btn-danger" type="button" style="width:100px" value="우편번호 찾기" name="postcode_find"><br> 
						<input class="form-control" type="text" name="attraction_addr1" placeholder="주소" required readonly>
						<input class="form-control" type="text" name="attraction_addr2" placeholder="상세주소">
					</td>
				</tr>
				<tr height="500">
					<td valign="top" colspan="2">
						<textarea name="attraction_info" placeholder="관광지 설명을 입력하세요"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="map" style="width:100%;height:300px;"></div>
						<input type="hidden" id="attraction_lng" name="attraction_lng" value="">
						<input type="hidden" id="attraction_lat" name="attraction_lat" value="">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="file" name="file1"  accept = ".jpg, .png, .gif" required>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="file" name="file2" accept = ".jpg, .png, .gif" required>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="file" name="file3" accept = ".jpg, .png, .gif" required>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td class="td-line" colspan="2"  style="text-align: right;">
						<input type="submit" style="width:70px" class="btn btn-danger" value="관광지 등록">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>