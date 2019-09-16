<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<%-- 
		table_ny_one
		 - 위아래는 두껍고 안에는 얇은 선
		 - 좌우는 선 없음
	--%>

<style>
	.coupon_wrap > *{
		color:black;
	}
	
	.coupon_wrap > .table_ny_one {
		margin-top : 50px;
		border-top: 3px solid #432c10;
  		border-bottom: 3px solid #432c10;
   		border-left: none;
  		border-right: none;
  		max-width: 800px;
	}
	
	.coupon_wrap > .table_ny_one > thead > tr > th,
	.coupon_wrap > .table_ny_one > tbody > tr > th,
	.coupon_wrap > .table_ny_one > tfoot > tr > th {
		border: none;
  		padding:10px 10px;
  		font-size: 16px;
  		text-align: center;
	}
	
	.coupon_wrap > .table_ny_one > thead > tr > td,
	.coupon_wrap > .table_ny_one > tbody > tr > td,
	.coupon_wrap > .table_ny_one > tfoot > tr > td {
		border: 1px solid #432c10;
		border-left: none;
  		border-right: none;
  		padding:10px 10px;
	}
	
	.headtit{
		border-bottom: #432c10 solid 10px;
		width:650px;
		margin:auto;
	}
	
	.content-line{
		margin-top:100px;
		border: 5px solid white;
		max-width: 700px;
		margin: auto;
		padding: 20px 10px;
		box-shadow: 2px 2px 10px #EAEAEA;
	}
	
	.td-line{
		width: 400px;
		text-align: left;
	}
	
	.table_ny_one .btn{
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


<form action="regist" method="post">
<div style="height: 100px;"></div>
<div class="content-line">
<div class="coupon_wrap">
<div class="headtit">
<h3>쿠폰 추가</h3>
</div>
		<table class="table_ny_one" align="center" >
			<tbody>
				<tr>
					<th style="width:180px">
						<label>이름</label>
					</th>
					<td class="td-line">
						<input type="text" style="width:250px;" name="coupon_name" placeholder="쿠폰 이름" required>
					</td>
				</tr>
				<tr>
					<th style="width:180px">
						<label>할인 가격</label>
					</th>
					<td class="td-line">
						<input type="text" style="width:150px;" name="coupon_price" placeholder="숫자로 입력" required>
					</td>
				</tr>
				<tr>
					<th style="width:180px">
						<label>사용 기간</label>
					</th>
					<td class="td-line">
						<input type="date" style="width:160px;" name="coupon_date1" required>&emsp;~&emsp;<input type="date" style="width:160px;" name="coupon_date2" required>
					</td>
				</tr>
				<tr>
					<th style="width:180px">
						<label>최소 결제 금액</label>
					</th>
					<td class="td-line">
						<input type="text" style="width:150px;" name="coupon_minimum" placeholder="숫자로 입력" required>
					</td>
				</tr>
				<tr>
					<th style="width:180px">
						<label>쿠폰 상태</label>
					</th>
					<td>
						<select id="coupon_condition" style="width:150px;" class="form-control" name="coupon_condition">
							<option value="사용가능">사용 가능</option>
							<option value="사용불가능">사용 불가능</option>
						</select>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td class="td-line" colspan="2"  style="text-align: right;">
						<input type="submit" style="width:70px" class="btn btn-danger" value="쿠폰 등록">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>