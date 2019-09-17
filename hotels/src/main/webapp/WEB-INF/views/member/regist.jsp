<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>

<style>
form h4 {
	display: none
	}
	

	
	form label {
	font-size: 20px;
	/* 	background-color:yellow; */
	}
	
	.regist-wrap{
		width: 1000px;
		margin: auto;
	}
	.cert_check{
 	display: none; 
}


</style>
<script>

$(function(){
	$("input[name=registbtn]").prop("disabled", true)
								.css("background-color", "lightgray");
	$("input[name=id_check_btn]").prop("disabled", true)
								.css("background-color", "lightgray");
});


$(function(){
    $("input[name=postcode_find]").click(findAddress);
});

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

$(function() {
	$("input[name=member_id]").blur(
			function() {
				var m_id = $("#m_id").val();
				var regex = /^[a-z0-9]{8,15}$/;

				//정규표현식으로 m_id값 검사
				var result = regex.test(m_id);
			
				if($("input[name=member_id]").val().length>0){
					if(result){	
				
					$.ajax({
						url : "id_check",
						data : {
							member_id : $("input[name=member_id]").val()
						},
						dataType : "text",
						success : function(resp) {
							if (resp == "N") {
								window.alert("이미 사용중인 아이디입니다");
								$("input[name=member_id]").val('');
								$("input[name=member_id]").select();
							}
							else {
								window.alert("사용 가능한 아이디입니다");
							}
						}
					});
					}else{
						window.alert("8~15자의 영문 소문자, 숫자로 입력해주세요");
						}
					}

			});
	$("input[name=member_phone]").blur(
			function() {
				var m_phone = $("#m_phone").val();
				var regex =/^01[016-9]-[0-9]{3,4}-[0-9]{4}$/;

				//정규표현식으로 m_phone값 검사
				var result = regex.test(m_phone);
			
				if($("input[name=member_phone]").val().length>0){
					if(result){	
				
					$.ajax({
						url : "check_phone",
						data : {
							member_phone : $("input[name=member_phone]").val()
						},
						dataType : "text",
						success : function(resp) {
							if (resp == "N") {
								window.alert("이미 사용중인 핸드폰 번호입니다");
								$("input[name=member_phone]").val('');
								$("input[name=member_phone]").select();
							}
							else {
								window.alert("사용 가능한 핸드폰 번호입니다");
							}
						}
					});
					}else{
						window.alert("- 포함 번호를 입력해 주세요");
						}
					}

			});

	
	//이메일주소 옵션에서 선택했을때 왼쪽 입력창에 value 표시
	$("#email_address").change(function(){
		$("#m_email_address").val($(this).val())
		
		 //if($(this).val() == ""){
		//선책 옵션에서 직접입력을 선택하면 입력창 활성화시켜서 직접 입력받고
		if(!$(this).val()){
             $(this).prev().prop("readonly", false);
         }
		//선택 옵션에서 직접입력 제외하고 선택하면 입력창에 value값 찍어주고 수정못하게 비활성화
         else{
        	 $(this).prev().prop("readonly", true);
         }
	});
});

//아이디 검사 후 형식에 안맞을시 보조메세지 출력


//비밀번호 검사 후 형식에 안맞을시 보조메세지 출력	
function checkPw(){
    var m_pw = document.querySelector("#m_pw").value;
    var regex = /^[a-zA-Z0-9!@#$\-_]{8,15}$/;
    
  //정규표현식으로 m_pw값 검사
    var result = regex.test(m_pw);
    
    var div = document.querySelector(".m_pwD");

    if(result) {
        div.innerHTML = ""
    }
    
	//m_pw가 형식에 맞지 않으면 메세지 춮력
    else {
        div.innerHTML = "<font color = 'gray' size = '2'>8~15자의 영문 대소문자, 숫자, 특수문자(!@#$-_)로 입력해주세요</font>"
        
    }
}

//이름 검사 후 형식에 안맞을시 보조메세지 출력
function checkName(){
    var m_name = document.querySelector("#m_name").value;
    var regex = /^[가-힣]{2,7}$/;
    
  	//정규표현식으로 m_name값 검사
    var result = regex.test(m_name);
    
    var div = document.querySelector(".m_nameD");

    if(result) {
        div.innerHTML = ""
    }
    
  	//m_name이 형식에 맞지 않으면 메세지 춮력
    else {
        div.innerHTML = "<font color = 'gray' size = '2'>2~7자의 한글로 입력해주세요</font>"
    }
}

//핸드폰 번호 검사 후 형식에 안맞을시 보조메세지 출력
function checkPhone(){
    var m_phone = document.querySelector("#m_phone").value;
    var regex = /^01[016-9]-[0-9]{3,4}-[0-9]{4}$/;
    
  	//정규표현식으로 m_phone값 검사
    var result = regex.test(m_phone);
    
    var div = document.querySelector(".m_phoneD");

    if(result) {
        div.innerHTML = ""
    }
    
  	//m_phone이 형식에 맞지 않으면 메세지 춮력
    else {
        div.innerHTML = "<font color = 'gray' size = '2'> -포함 숫자로 입력해주세요</font>"
        
    }
}

	//이메일 검사 후 형식에 안맞을시 보조메세지 출력
function checkEmail(){
    var m_email = document.querySelector("#m_email").value;
    var regex = /^[a-z0-9]{8,15}$/;
    
  	//정규표현식으로 m_email값 검사
    var result = regex.test(m_email);
    
    var div = document.querySelector(".m_emailD");

    if(result) {
        div.innerHTML = ""
    }
  	//m_email이 형식에 맞지 않으면 메세지 춮력
    else {
        div.innerHTML = "<font color = 'gray' size = '2'>8~15자의 영문 소문자, 숫자로 입력해주세요</font>"
    }
}
$(function() {
	$('#m_pw').keyup(function() {
		$('font[name=check]').text('');
	}); //#user_pass.keyup

	$('#chpass').keyup(function() {
		if ($('#m_pw').val() != $('#chpass').val()) {
			$('font[name=check]').text('');
			$('font[name=check]').html("암호가 일치하지 않습니다");
		} else {
			$('font[name=check]').text('');
			$('font[name=check]').html("암호가 일치 합니다");
		}
	}); //#chpass.keyup
});
$(function(){
	$("form").submit(function(e){
		e.preventDefault();	
		
		var pw = $("input[name=member_pw]").val();
		var encPw = CryptoJS.SHA256(pw).toString();
		
		var ck_pw = $("input[name=pw_check]").val();
		
		$("input[name=member_pw]").attr("name","");
		var newInput1 = $("<input/>").attr("name","member_pw").val(encPw).attr("type","hidden");
		
		$("input[name=pw_check]").attr("name","");
		
		
		$(this).append(newInput1);
		this.submit();
	});
});

$(function(){
	$(".btn-cert_no").click(
		function(){
			$.ajax({
				url : "emailcert",
				data : {
					member_email1 : $("input[name=member_email1]").val(),
					member_email2 : $("input[name=member_email2]").val()
				},
				success:function(resp){
					if (resp == "Y") {
						$(".cert_check").css("display","inline-block");
					}
				}
			});
		});
	});

$(function() {
	$(".btn-cert_no_check").click(
			function() {
				$.ajax({
					url : "email_cert_check",
					data : {
						member_email_cert : $("input[name=member_email_cert]").val()
					},
					dataType : "text",
					success : function(resp) {
						if (resp == "Y") {
							window.alert("올바른 인증번호 입니다");
							$("input[name=registbtn]").prop("disabled",
									false).css("background-color",
									"#726454");
						}
						else {
							window.alert("인증번호가 올바르지 않습니다")
							$("input[name=member_email_cert]").select();
						}
					}
				});
			});
});
</script>

<div class="regist-wrap" align="center">
<br><h1>가입 정보 입력</h1><br>
<form action="regist" method="post">
	<div>
		<table class="table table-hamburg table-stripe">
			<tbody>
					<tr>
						<td><label for="m_id">ID</label></td>
						<td>
							<input class="form-control" onblur="checkId();"
							type="text" name="member_id" id="m_id" pattern="^[a-z0-9]{8,15}$" required> 
							<div class="m_idD"></div>
						</td>
					</tr>
				<tr>
							<td><label for="m_pw">PASSWORD</label></td>
							<td>
								<input onblur="checkPw();" type="password" class="form-control" name="member_pw" id="m_pw" pattern="^[a-zA-Z0-9!@#$\-_]{8,15}$" required>
								<div class="m_pwD"></div>
							</td>   
						</tr>
				<tr>
					<td><label>PASSWORD CHECK</label></td>
					<td><input class="form-control" type="password" id="chpass" name="pw_check"
							placeholder="비밀번호 확인" required>
							 <font name="check"	size="3" color="red"></font></td><br> 
					
				</tr>
				<tr> 
							<td><label for="m_name">NAME</label></td>
							<td>
								<input class="form-control" onblur="checkName();" type="text" name="member_name" id="m_name" pattern="^[가-힣]{2,7}$" required>
								<div class="m_nameD"></div>
							</td>
						</tr>
						<tr>
							<td><label for="m_addr">ADDRESS</label></td>
							<td>
								<input class="form-control" type="text" name="member_zip_code" placeholder="우편번호" required readonly ><br>
									<input class="btn btn-danger"  type="button" value="우편번호 찾기" name="postcode_find"><br>
									<input class="form-control" type="text" name="member_basic_addr" placeholder="주소" required readonly ><br>
									<input class="form-control" type="text" name="member_detail_addr" placeholder="상세주소" >
							</td>
						</tr>
				
				<tr>
							<td><label for="m_phone">PHONE</label></td>
							<td>
								<input class="form-control" onblur="checkPhone();" type="tel" name="member_phone" id="m_phone"  pattern="^01[016-9]-[0-9]{3,4}-[0-9]{4}$" required>
								<div class="m_phoneD"></div>
							</td>
						</tr>
				<tr>
							<td><label for="m_birth">BIRTH</label></td>
							<td>
								<input class="form-control" type="date" name="member_birthday" id="m_birth"  required>
							</td>
						</tr>
				<tr>
						<td><label for="m_email">EMAIL</label></td>
						<td><input class="form-control" style=width:30%;display:inline-block; onblur="checkEmail();"
								type="text" name="member_email1" id="m_email"
										pattern="^[a-z0-9]{8,15}$" required> 
							<span>@</span> 
							<input class="form-control" style=width:30%;display:inline-block; type="text" name="member_email2"
										id="m_email_address" pattern="^.*?\..*?$" required> 
							<select id="email_address" class="form-control" style=width:22%;display:inline-block;>
								<option value="">직접입력</option>
								<option>nate.com</option>
								<option>naver.com</option>
								<option>daum.net</option>
								<option>gmail.com</option>
							</select>
							<input type="button" id="btn-cert_no" class="bbtn btn-danger btn-cert_no" value="인증하기">
							<input class="form-control cert_check" style=width:20%; type="text" name="member_email_cert"
									id="member_email_cert" required>
							<input type="button" id="btn-cert_no_check" class="btn btn-danger cert_check btn-cert_no_check" value="인증번호확인">
							<div class="m_emailD"></div>
						</td>
					</tr>
				<tr>
					<td colspan="2"><input class="btn btn-danger btn-block"  type="submit" value="가입하기" name = "registbtn"></td>
				</tr>
			</tbody>
		</table>
	</div>
</form>
</div>

    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>