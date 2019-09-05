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


<form action="regist" method="post">
<div style="height: 100px;"></div>
<div class="content-line">
<div class="coupon_wrap">
<div class="headtit">
<h3>[ ${cdto.coupon_name} ]</h3>
</div>
		<table class="table_ny_one" align="center" >
			<tbody>
				<tr>
					<th style="width:180px">
						<label>이름</label>
					</th>
					<td class="td-line">${cdto.coupon_name}</td>
				</tr>
				<tr>
					<th style="width:180px">
						<label>할인 가격</label>
					</th>
					<td class="td-line">${cdto.coupon_price}</td>
				</tr>
				<tr>
					<th style="width:180px">
						<label>사용 기간</label>
					</th>
					<td class="td-line">${cdto.coupon_date1.substring(0,10)}&emsp;~&emsp;${cdto.coupon_date2.substring(0,10)}</td>
				</tr>
				<tr>
					<th style="width:180px">
						<label>최소 결제 금액</label>
					</th>
					<td class="td-line">${cdto.coupon_minimum}</td>
				</tr>
				<tr>
					<th style="width:180px">
						<label>쿠폰 상태</label>
					</th>
					<td>${cdto.coupon_condition}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td class="td-line" colspan="2" style="text-align: right;">
						<a href ="edit?no=${cdto.coupon_no}"><input type="button" value="수정" name="edit" class="btn btn-danger"></a>
						<a href ="list"><input type="button" value="목록" name="list" class="btn btn-danger"></a>
					</td>
				</tr>
		</tfoot>
		</table>
	</form>
</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>