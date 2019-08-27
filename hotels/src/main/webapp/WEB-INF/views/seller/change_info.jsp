<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/seller/seller_template/header.jsp"></jsp:include>


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
                $("input[name=seller_zip_code]").val(data.zonecode);
                $("input[name=seller_basic_addr]").val(addr);
                $("input[name=seller_detail_addr]").focus();
            }
        }).open();
    }
});

</script>
<style>
	.info-wrap{
		
		padding: 100px;
		min-width: 625px;
	}
	.seller_info_change{
		width: 700px;
	}

</style>
<div align="center" class="info-wrap">
<h1>회원 정보 수정</h1>

	<form action="change" method="post">
		<table class="table table-hamburg table-stripe seller_info_change">
			<tbody>
				
				<tr>
					<td>이메일</td>
					<td>
						<input class="form-control" style="width: 45%;display: inline-block;" type="text" name="seller_email_id" value="${sdto.seller_email_id}">@
						<input class="form-control" style="width: 45%;display: inline-block;" type="text" name="seller_email_addr" value="${sdto.seller_email_addr}">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${sdto.seller_name}</td>
				</tr>
				<tr>
					<td>사업자등록번호</td>
					<td>${sdto.seller_lisence}</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>${sdto.seller_birth}</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input class="form-control" type="text" name="seller_phone" value="${sdto.seller_phone}">
					</td>
				</tr>
				<tr>
					<td>주소</td>
					
						<td>
						<input class="form-control" style="width: 49%;display: inline-block;" type="text" name="seller_zip_code" placeholder="우편번호" value="${sdto.seller_zip_code}" required readonly >
						<input class="btn btn-danger"  style="width: 50%;display: inline-block;" type="button" value="우편번호 찾기" name="postcode_find">
						<input class="form-control" type="text" name="seller_basic_addr" value="${sdto.seller_basic_addr}" placeholder="주소" required readonly >
						<input class="form-control" type="text" name="seller_detail_addr"  value="${sdto.seller_detail_addr}" placeholder="상세주소" >
						</td>
					
				</tr>
				<tr>
					
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2">
						<input class="btn btn-danger btn-block" type="submit" value="수정하기">
					</th>
				</tr>
			</tfoot>
		</table>
	</form>
</div>

<jsp:include page="/WEB-INF/views/seller/seller_template/footer.jsp"></jsp:include>