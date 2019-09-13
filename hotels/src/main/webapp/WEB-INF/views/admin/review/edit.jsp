<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script>
	//review_state 옵션값 선택
	$(function(){//문서가 다 생기면
		$("select[name=review_state]").val("${rdto.review_state}");
	});
</script>
<%-- 
		table_ny_one
		 - 위아래는 두껍고 안에는 얇은 선
		 - 좌우는 선 없음
	--%>

<style>
	.admin_review_wrap > *{
		color:black;
	}
	
	.admin_review_wrap > .table_ny_one {
		margin-top : 50px;
		border-top: 3px solid #432c10;
  		border-bottom: 3px solid #432c10;
   		border-left: none;
  		border-right: none;
  		max-width: 800px;
	}
	
	.admin_review_wrap > .table_ny_one > thead > tr > th,
	.admin_review_wrap > .table_ny_one > tbody > tr > th,
	.admin_review_wrap > .table_ny_one > tfoot > tr > th {
		border: none;
  		padding:10px 10px;
  		font-size: 16px;
  		text-align: center;
	}
	
	.admin_review_wrap > .table_ny_one > thead > tr > td,
	.admin_review_wrap > .table_ny_one > tbody > tr > td,
	.admin_review_wrap > .table_ny_one > tfoot > tr > td {
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


<form action="edit" method="post">
<input type="hidden" name="review_no" value="${rdto.review_no}">
<div style="height: 100px;"></div>
<div class="content-line">
<div class="admin_review_wrap">
<div class="headtit">
<h3>&emsp;</h3>
</div>
		<table class="table_ny_one" align="center" >
			<tbody>
				<tr>
					<th style="width:180px">
						<label>호텔 번호</label>
					</th>
					<td class="td-line">${rdto.review_hotel}</td>
				</tr>
				<tr>
					<th style="width:180px">
						<label>예약 번호</label>
					</th>
					<td class="td-line">${rdto.review_reserve}</td>
				</tr>
				<tr>
					<th style="width:180px">
						<label>리뷰 내용</label>
					</th>
					<td class="td-line">${rdto.review_content}</td>
				</tr>
				<tr>
					<th style="width:180px">
						<label>리뷰 상태</label>
					</th>
					<td>
						<select id="review_state" style="width:160px;" class="form-control" name="review_state">
							<option value="등록">clean</option>
							<option value="블랙">black</option>
						</select>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td class="td-line" colspan="2"  style="text-align: right;">
						<input type="submit" style="width:70px" class="btn btn-danger" value="리뷰 수정">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>