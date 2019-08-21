<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

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
	width: 1000px;
	margin: auto;
}
</style>
<script>
	$(function() {
		$("input[name=registbtn]").prop("disabled", true).css(
				"background-color", "lightgray");
		$("input[name=id_check_btn]").prop("disabled", true).css(
				"background-color", "lightgray");
	});

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
				$("input[name=seller_zip_code]").val(data.zonecode);
				$("input[name=seller_basic_addr]").val(addr);
				$("input[name=seller_detail_addr]").focus();
			}
		}).open();
	}

	$(function() {
		$("input[name=id_check_btn]").click(
				function() {
					$.ajax({
						url : "id_check",
						data : {
							seller_id : $("input[name=seller_id]").val()
						},
						dataType : "text",
						success : function(resp) {
							if (resp == "N") {
								window.alert("이미 사용중인 아이디입니다");
								$("input[name=seller_id]").select();
							}
							//중복검사해서 사용할 수 있는 아이디이면 가입버튼 활성화
							else {
								window.alert("사용 가능한 아이디입니다")
								$("input[name=registbtn]").prop("disabled",
										false).css("background-color",
										"#726454");
							}
						}
					});
				});

		//이메일주소 옵션에서 선택했을때 왼쪽 입력창에 value 표시
		$("#email_address").change(function() {
			$("#s_email_address").val($(this).val())

			//if($(this).val() == ""){
			//선책 옵션에서 직접입력을 선택하면 입력창 활성화시켜서 직접 입력받고
			if (!$(this).val()) {
				$(this).prev().prop("readonly", false);
			}
			//선택 옵션에서 직접입력 제외하고 선택하면 입력창에 value값 찍어주고 수정못하게 비활성화
			else {
				$(this).prev().prop("readonly", true);
			}
		});
	});

	//아이디 검사 후 형식에 안맞을시 보조메세지 출력
	function checkId() {
		var s_id = document.querySelector("#s_id").value;
		var regex = /^[a-z0-9]{8,15}$/;

		//정규표현식으로 m_id값 검사
		var result = regex.test(s_id);

		var div = document.querySelector(".s_idD");

		//형식에 맞으면 중복확인 버튼 활성화
		if (result) {
			div.innerHTML = ""
			$("input[name=id_check_btn]").prop("disabled", false);
		}
		//형식에 안맞으면 메세지 출력, 중복확인 버튼 비활성화
		else {
			div.innerHTML = "<font color = 'gray' size = '2'>8~15자의 영문 소문자, 숫자로 입력해주세요</font>"
			$("input[name=id_check_btn]").prop("disabled", true).css(
					"background-color", "lightgray");
		}
	}

	//비밀번호 검사 후 형식에 안맞을시 보조메세지 출력	
	function checkPw() {
		var s_pw = document.querySelector("#s_pw").value;
		var regex = /^[a-zA-Z0-9!@#$\-_]{8,15}$/;

		//정규표현식으로 m_pw값 검사
		var result = regex.test(s_pw);

		var div = document.querySelector(".s_pwD");

		if (result) {
			div.innerHTML = ""
		}

		//m_pw가 형식에 맞지 않으면 메세지 춮력
		else {
			div.innerHTML = "<font color = 'gray' size = '2'>8~15자의 영문 대소문자, 숫자, 특수문자(!@#$-_)로 입력해주세요</font>"

		}
	}

	//핸드폰 번호 검사 후 형식에 안맞을시 보조메세지 출력
	function checkPhone() {
		var s_phone = document.querySelector("#s_phone").value;
		var regex = /^01[016-9]-[0-9]{3,4}-[0-9]{4}$/;

		//정규표현식으로 m_phone값 검사
		var result = regex.test(s_phone);

		var div = document.querySelector(".s_phoneD");

		if (result) {
			div.innerHTML = ""
		}

		//m_phone이 형식에 맞지 않으면 메세지 춮력
		else {
			div.innerHTML = "<font color = 'gray' size = '2'> -포함 숫자로 입력해주세요</font>"

		}
	}

	//이메일 검사 후 형식에 안맞을시 보조메세지 출력
	function checkEmail() {
		var s_email = document.querySelector("#s_email").value;
		var regex = /^[a-z0-9]{8,15}$/;

		//정규표현식으로 m_email값 검사
		var result = regex.test(s_email);

		var div = document.querySelector(".s_emailD");

		if (result) {
			div.innerHTML = ""
		}
		//s_email이 형식에 맞지 않으면 메세지 춮력
		else {
			div.innerHTML = "<font color = 'gray' size = '2'>8~15자의 영문 소문자, 숫자로 입력해주세요</font>"
		}
	}
	$(function() {
		$('#s_pw').keyup(function() {
			$('font[name=check]').text('');
		}); //#user_pass.keyup

		$('#chpass').keyup(function() {
			if ($('#s_pw').val() != $('#chpass').val()) {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호틀림");
			} else {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호맞음");
			}
		}); //#chpass.keyup
	});
	$(function() {
		$("form").submit(
				function(e) {
					e.preventDefault();

					var pw = $("input[name=seller_pw]").val();
					var encPw = CryptoJS.SHA256(pw).toString();

					var ck_pw = $("input[name=pw_check]").val();

					$("input[name=seller_pw]").attr("name", "");
					var newInput1 = $("<input/>").attr("name", "seller_pw")
							.val(encPw).attr("type", "hidden");

					$("input[name=pw_check]").attr("name", "");

					$(this).append(newInput1);
					this.submit();
				});
	});
	
	});
	$(function(){
		$(".btn-cert_no").click(
			function(){
				$.ajax({
					url : "emailcert",
					success:function(resp){
						
					}
				});
			}
		});	
	
</script>

<div class="regist-wrap" align="center">
	<br>
	<h1>가입 정보 입력</h1>
	<br>
	<form action="regist" method="post">
		<div>
			<table>
				<tbody>
					<tr>
						<td><label for="s_id">ID</label></td>
						<td><input class="form-control" onblur="checkId();"
							type="text" name="seller_id" id="s_id" pattern="^[a-z0-9]{8,15}$"
							required> <input class="btn btn-danger" type="button"
							value="중복확인" name="id_check_btn">
							<div class="s_idD"></div></td>
					</tr>
					<tr>
						<td><label for="s_pw">PASSWORD</label></td>
						<td><input onblur="checkPw();" type="password"
							class="form-control" name="seller_pw" id="s_pw"
							pattern="^[a-zA-Z0-9!@#$\-_]{8,15}$" required>
							<div class="s_pwD"></div></td>
					</tr>
					<tr>
						<td><label>PASSWORD CHECK</label></td>
						<td><input class="form-control" type="password" id="chpass"
							name="pw_check" placeholder="비밀번호 확인" required> 
							<font name="check" size="3" color="red"></font></td>
					</tr>
					<tr>
						<td><label for="s_addr">ADDRESS</label></td>
						<td><input class="form-control" type="text"
								name="seller_zip_code" placeholder="우편번호" required readonly><br>
							<input class="btn btn-danger" type="button" value="우편번호 찾기"
								name="postcode_find"><br> <input
							class="form-control" type="text" name="seller_basic_addr"
								placeholder="주소" required readonly><br> <input
							class="form-control" type="text" name="seller_detail_addr"
								placeholder="상세주소"></td>
					</tr>

					<tr>
						<td><label for="s_phone">PHONE</label></td>
						<td><input class="form-control" onblur="checkPhone();"
							type="tel" placeholder="-없이 번호만 입력하세요" name="seller_phone" id="m_phone "
							pattern="^01[016-9][0-9]{3,4}[0-9]{4}$" required>
							<div class="s_phoneD"></div></td>
					</tr>
					<tr>
						<td><label for="s_birth">BIRTH</label></td>
						<td><input class="form-control" type="date"
							name="seller_birth" id="s_birth" value="2019-07-08" required>
						</td>
					</tr>
					<tr>
						<td><label for="s_email">EMAIL</label></td>
						<td><input class="form-control" style=width:33%;display:inline-block; onblur="checkEmail();"
								type="text" name="seller_email_id" id="s_email"
										pattern="^[a-z0-9]{8,15}$" required> 
							<span>@</span> 
							<input class="form-control" style=width:32%;display:inline-block; type="text" name="seller_email_addr"
										id="s_email_address" pattern="^.*?\..*?$" required> 
							<select id="email_address" class="form-control" style=width:18%;display:inline-block;>
								<option value="">직접입력</option>
								<option>nate.com</option>
								<option>naver.com</option>
								<option>daum.net</option>
								<option>gmail.com</option>
							</select>
							<input type="button" id="btn-cert_no" class="btn-light" value="인증번호">
							
							<div class="s_emailD"></div></td>
					</tr>
					<tr>
						<td colspan="2"><input class="btn btn-danger btn-block"
							type="submit" style="margin-top: 30px;" value="가입하기" name="registbtn"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>