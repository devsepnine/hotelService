<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
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
                
                }


                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.querySelector("[name=seller_zip_code]").value = data.zonecode;
                document.querySelector("[name=seller_basic_addr]").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.querySelector("[name=seller_detail_addr]").focus();
            }
        }).open();
    }
</script>
<body>
${sellerDto}
    <div class="regist_box">
        <div class="regist_content">
            <form action="regist" method="post">
                <input type="text" name="seller_id" placeholder="아이디 입력" required ><br>
                <input type="password" name="seller_pw" placeholder="비밀번호 입력"><br>
                <input type="text" name="seller_phone" placeholder="핸드폰 번호" required><br>
                <input type="text" name="seller_zip_code"  placeholder="우편번호">
                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" name="seller_basic_addr" placeholder="기본주소" required><br>
                <input type="text" name="seller_detail_addr" placeholder="상세주소"><br>
                <input type="date" name="seller_birth" required><br>
                <input type="text" name="seller_email_id" placeholder="이메일 아이디">@
                <input type="text" name="seller_email_addr" placeholder="이메일주소" required><br>
                <input type="submit" value="확인">
            </form>
        </div>
    </div>
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>