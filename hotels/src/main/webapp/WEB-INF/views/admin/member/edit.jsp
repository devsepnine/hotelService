<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>

<!-- 자바스크립트를 이용하여 페이지 이동을 처리 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(function(){
    $("input[name=postcode_find]").click(findAddress);
    
    function findAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
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
                $("input[name=member_zip_code]").val(data.zonecode);
                $("input[name=member_basic_addr]").val(addr);
                $("input[name=member_detail_addr]").focus();
            }
        }).open();
    }
});

</script>

<script>
//이름 검사 후 형식에 안맞을시 보조메세지 출력
function checkName(){
    var member_name = document.querySelector("#member_name").value;
    var regex = /^[가-힣]{2,7}$/;
    
  	//정규표현식으로 m_name값 검사
    var result = regex.test(member_name);
    
    var div = document.querySelector(".member_nameD");

    if(result) {
        div.innerHTML = ""
    }
    
  	//member_name이 형식에 맞지 않으면 메세지 춮력
    else {
        div.innerHTML = "<font color = 'gray' size = '2'>2~7자의 한글로 입력해주세요</font>"
    }
}

//핸드폰 번호 검사 후 형식에 안맞을시 보조메세지 출력
function checkPhone(){
    var member_phone = document.querySelector("#member_phone").value;
    var regex = /^01[016-9]-[0-9]{3,4}-[0-9]{4}$/;
    
  	//정규표현식으로 m_phone값 검사
    var result = regex.test(member_phone);
    
    var div = document.querySelector(".member_phoneD");

    if(result) {
        div.innerHTML = ""
    }
    
  	//m_phone이 형식에 맞지 않으면 메세지 춮력
    else {
        div.innerHTML = "<font color = 'gray' size = '2'> -포함 숫자로 입력해주세요</font>"
        
    }
}
</script>
<script>
//member_auth 옵션값 선택
	$(function(){
		$("select[name=member_auth]").val("${mdto.member_auth}");
	});
</script>

<style>
	.table_ny_two thead,
	.table_ny_two tbody{
		color:black;
	}
	
	.empty {
		height:50px;
	}
	
	.navigator {
	    list-style: none;
	    padding: 0px;
	    margin: 0px;
	    display: inline-block;
	    width: auto;
	    margin: auto;
	    text-align: center;
	}
	
	.navigator > li {
	    display: inline-block;
	    padding: 0.5rem;
	    min-width: 40px;
	    text-align: center;
	}
	
	.edit_wrap_member {
		text-align: center;
	}
	
	.headtit{
		border-bottom: #432c10 solid 10px;
		max-width:700px;
		margin:auto;
		text-align: left;
		margin-bottom: 50px;
	}
	
	.edit_wrap_member > .table-box > .table_ny_two {
		margin-top : 50px;
		border-top: 3px solid #432c10;
  		border-bottom: 3px solid #432c10;
   		border-left: none;
  		border-right: none;
  		max-width: 600px;
	}
	
	.edit_wrap_member > .table-box > .table_ny_two > thead > tr > th,
	.edit_wrap_member > .table-box > .table_ny_two > tbody > tr > th,
	.edit_wrap_member > .table-box > .table_ny_two > tfoot > tr > th,
	.edit_wrap_member > .table-box > .table_ny_two > tfoot > tr > td {
		border: none;
  		padding:10px 10px;
  		font-size: 16px;
	}
	
	.edit_wrap_member > .table-box > .table_ny_two > thead > tr > td,
	.edit_wrap_member > .table-box > .table_ny_two > tbody > tr > td {
		border: 1px solid #919aa1;
		border-left: none;
  		border-right: none;
  		padding:10px 10px;
  		font-size: 13px;
	}
	
	.content-line{
		margin-top:10px;
		border: 5px solid white;
		max-width: 900px;
		margin: auto;
		padding: 20px 10px;
		box-shadow: 2px 2px 10px #EAEAEA;
	
	}
	.table-box{
		max-width: 600px;
		margin: auto;
	}
	.table_ny_two{
		width:100%;
		text-align: center;
		margin: auto;
	}
	.custom-select{
		display:inline-block;
		width:100px;
	}
	input[name=keyword]{
		display:inline-block;
		max-width: 200px;
	}
	.table_ny_two .btn-danger{
		height: 45px;
		width: 118px;
	}
	
</style>

<form action="edit" method="post">
<input type="hidden" name="member_no" value="${mdto.member_no}">
<input type="hidden" name="member_id" value="${mdto.member_id}">
<div style="height: 100px;"></div>
<div class="content-line">
<div class="edit_wrap_member">
<div class="headtit">
<h3>[${mdto.member_id}]님의 정보 수정</h3>
</div>
<div class="table-box">
<table class="table_ny_two" border="1" >
	<tbody align="center">
		<tr>
			<th>아이디</th>
			<td>${mdto.member_id}</td>
		<tr>
		<tr>
			<th><label for="member_name">이름</label></th>
			<td>
				<input class="form-control" onblur="checkName();" type="text" name="member_name" id="member_name" value="${mdto.member_name}" pattern="^[가-힣]{2,7}$" required>
				<div class="member_nameD"></div>
			</td>
		<tr>
		<tr>
			<th>주소</th>
			<td>
				<div style="margin:5px 0px; text-align:left;">
					<input class="form-control" type="text" name="member_zip_code" placeholder="우편번호" value="${mdto.member_zip_code}" required readonly style="width:200px; display: inline-block;">
					<input class="btn btn-danger"  type="button" value="우편번호 찾기" name="postcode_find" style="margin-left:50px;">
				</div>
				<div style="margin:5px 0px; text-align:left;">
					<input class="form-control" type="text" name="member_basic_addr" value="${mdto.member_basic_addr}" required readonly>
				</div>
				<div style="margin:5px 0px; text-align:left;">
					<input class="form-control" type="text" name="member_detail_addr" value="${mdto.member_detail_addr}">
				</div>
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input class="form-control" type="date" name="member_birthday" id="m_birth" value="${mdto.member_birthday.substring(0,10)}" required></td>
		<tr>
		<tr>
			<th>이메일</th>
			<td>${mdto.member_email1}@${mdto.member_email2}</td>
		<tr>
		<tr>
			<th>핸드폰 번호</th>
			<td>
				<input class="form-control" onblur="checkPhone();" type="tel" name="member_phone" id="member_phone"  value="${mdto.member_phone}" pattern="^01[016-9]-[0-9]{3,4}-[0-9]{4}$" required>
				<div class="member_phoneD"></div>
			</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>${mdto.member_when.substring(0,10)}</td>
		</tr>
		<tr>
			<th>권한</th>
			<td>
				<select id="member_auth" class="form-control" name="member_auth">
					<option>일반</option>
					<option>VIP</option>
					<option>MVIP</option>
					<option>관리자</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>최종 접속일</th>
			<td>${mdto.member_recent}</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="2">
				<div style = "margin-top:40px">
					<input class="btn btn-danger btn-block"  type="submit" value="수정하기">
				</div>
			</td>
		</tr>
	</tfoot>
</table>
</div>
</div>
</div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>