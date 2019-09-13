<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery_number/jquery_number_min.js"></script>
<style>
	.reserve-wrap{
		width: 1000px;
		margin: auto;
	}
	.reserve-wrap:after {
		clear: both;
	}
	.reserve-wrap h3{
		color: black;
	}
	.left-wrap{
		float: left;
		width: 580px;
		height: 700px;
		padding: 10px;
	}
	.right-wrap{
		float:right;
		width: 400px;
		height: 700px;
		padding: 10px;
	}
	.left-con{
		margin-bottom: 40px;
	}
	.right-con{
		margin-bottom: 40px;
	}
	.right-title{
		font-size: 18px;
	}
	.right-desc{
		font-size: 20px;
		color: black;
	}
	.all-agree{
		color: black;
		font-weight: bold;
	}
	.agree-wrap span b{
		font-weight: bold;
		color: red;
	}
	.vat-desc{
		font-size: 18px;
		color: black
	}
	.vat-price-wrap{
		font-size: 30px;
		color: red;
		font-weight: bold
	}
</style>
 
 <!-- 기간 구하는 스크립트 -->
<script>
	$(function(){
		var check_in = new Date($(".check-in").text());
		var check_out = new Date($(".check-out").text());
		var gap = check_out - check_in;
		if(gap < 86400000){
			alert("입실일과 퇴실일이 같을수 없습니다.")	
			location.href="${pageContext.request.contextPath}";
		}else{
			$(".term").text(gap/24/3600/1000)
			var total_price = (gap/24/3600/1000) * ${rdto.room_price};
			$(".vat-price").text($.number(total_price));
			$(".reserve_price").val(total_price);
		}
	})
</script>

<!-- 전체 체크 -->
<script >
	$(function(){
		$("#a_check").click(function(){
			if($("#a_check").prop("checked")){
				$("input[type=checkbox]").prop("checked", true);
			}else{
				$("input[type=checkbox]").prop("checked", false);
			}
		})
		$("input[type=checkbox]").not("#a_check").change(function(){
			if($("#check_1").prop("checked") && $("#check_2").prop("checked") && $("#check_3").prop("checked") && $("#check_4").prop("checked")){
				$("#a_check").prop("checked", true);
			}else{
				$("#a_check").prop("checked", false);
			}
		})
	})
</script>
<!-- form 점검 -->
<script>
	
</script>
<%-- ${rdto} --%>
<%-- ${mdto} --%>
<%-- ${hdto} --%>
<div style="height: 60px;"></div>
<form action="${pageContext.request.contextPath}/payment/order" method="post">
<div class="reserve-wrap">
	<div class="left-wrap">
		<h3>예약자 정보</h3>
		<div style="height: 30px;"></div>
		<div class="left-con">
			<label for="reserve_name">예약자 이름</label>
			<input class="form-control" type="text" value="${mdto.member_name}" id="reserve_name" name="reserve_name" placeholder="체크인시 필요한 정보입니다." required>
		</div>
		
		<div class="left-con">
			<label for="reserve_phone">휴대폰 번호</label>
			<input class="form-control" type="text" value="${mdto.member_phone}" id="reserve_phone" name="reserve_phone" placeholder="체크인시 필요한 정보입니다." required>
		</div>
		
		<div class="left-con">
			<label for="reserve_people">총 인원 수 (최대인원 : ${rdto.room_people})</label>
			<input class="form-control" type="number" id="reserve_people" name="reserve_people" placeholder="체크인시 필요한 정보입니다." max="${rdto.room_people}" required>
		</div>
		
		<h3>결제수단 선택</h3>
		
		<div class="left-con">
			<select class="reserve_pay form-control" name="reserve_pay_type" style="width: 150px;">
				<option value="10">카카오페이</option>
				<option value="11">네이버페이</option>
			</select>
		</div>
		
		<div class="left-con agree-box">
			<div class="custom-control custom-checkbox">
		      <input type="checkbox" class="custom-control-input" id="a_check" required=true>
		      <label class="custom-control-label" for="a_check"><span class="all-agree">전체 동의</span></label>
		    </div>
		    <br>
		    <div class="custom-control custom-checkbox agree-wrap">
		      <input type="checkbox" class="custom-control-input" id="check_1" name="check_agree" required=true>
		      <label class="custom-control-label" for="check_1"></label>
		      <span>숙소이용규칙 및 취소/환불 규정 동의 <b>(필수)</b></span>
		    </div>
		    <br>
		    <div class="custom-control custom-checkbox agree-wrap">
		      <input type="checkbox" class="custom-control-input" id="check_2" name="check_agree" required=true>
		      <label class="custom-control-label" for="check_2"></label>
		      <span>개인정보 수집 및 이용 동의 <b>(필수)</b></span>
		    </div>
		    <br>
		    <div class="custom-control custom-checkbox agree-wrap">
		      <input type="checkbox" class="custom-control-input" id="check_3" name="check_agree" required=true>
		      <label class="custom-control-label" for="check_3"></label>
		      <span>개인정보 제 3자 제공 동의 <b>(필수)</b></span>
		    </div>
		    <br>
		    <div class="custom-control custom-checkbox agree-wrap">
		      <input type="checkbox" class="custom-control-input" id="check_4" name="check_agree" required=true>
		      <label class="custom-control-label" for="check_4"></label>
		      <span>만 14세 이상입니다. <b>(필수)</b></span>
		    </div>
		</div>
	</div>
	
	<div class="right-wrap">
		<div class="right-con">
			<div class="right-title">숙소 이름</div>
			<div class="right-desc">${hdto.hotel_name }</div>
			<input type="hidden" name="reserve_hotel_no" value="${hdto.hotel_no}">
		</div>
		
		<div class="right-con">
			<div class="right-title">객실이름/기간</div>
			<div class="right-desc">${rdto.room_name} /  <span class="term"></span>박</div>
			<input type="hidden" name="reserve_room_no" value="${rdto.room_no}">
			<input type="hidden" name="">
		</div>
		
		<div class="right-con">
			<div class="right-title">체크 인</div>
			<div class="right-desc"><span class="check-in">${param.check_in}</span> 15:00</div>
			<input type="hidden" value="${param.check_in}" name="reserve_in">
		</div>
		
		<div class="right-con">
			<div class="right-title">체크 아웃</div>
			<div class="right-desc"><span class="check-out">${param.check_out}</span> 11:00</div>
			<input type="hidden" value="${param.check_out}" name="reserve_out"> 
		</div>
		
		<hr>
		<div class="right-con">
			<div class="vat-desc">총 결제 금액(VAT포함)</div>
			<div class="vat-price-wrap"><span class="vat-price"></span>원</div>
			<br>
			<ul>
				<li>해당 객실가는 세금,봉사료가 포함된 금액입니다.</li>
				<li>결제완료 후 예약자 이름으로 바로 체크인 하시면 됩니다.</li>
			</ul>
			
			<input type="hidden" value=""  class="reserve_price" name="reserve_price" required>
			<input type="submit" class="btn btn-reserve btn-block" value="결제 하기">
		</div>
	</div>


</div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>