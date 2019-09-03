<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>

<!-- 자바스크립트를 이용하여 페이지 이동을 처리 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>

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
	
	.detail_wrap_seller {
		text-align: center;
	}
	
	.headtit{
		border-bottom: #432c10 solid 10px;
		max-width:700px;
		margin:auto;
		text-align: left;
		margin-bottom: 50px;
	}
	
	.detail_wrap_seller > .table-box > .table_ny_two {
		margin-top : 50px;
		border-top: 3px solid #432c10;
  		border-bottom: 3px solid #432c10;
   		border-left: none;
  		border-right: none;
  		max-width: 600px;
	}
	
	.detail_wrap_seller > .table-box > .table_ny_two > thead > tr > th,
	.detail_wrap_seller > .table-box > .table_ny_two > tbody > tr > th,
	.detail_wrap_seller > .table-box > .table_ny_two > tfoot > tr > th,
	.detail_wrap_seller > .table-box > .table_ny_two > tfoot > tr > td {
		border: none;
  		padding:10px 10px;
  		font-size: 16px;
	}
	
	.detail_wrap_seller > .table-box > .table_ny_two > thead > tr > td,
	.detail_wrap_seller > .table-box > .table_ny_two > tbody > tr > td {
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
	.btn-danger{
		height: 45px;
		width: 130px;
	}
</style>

<div style="height: 100px;"></div>
<div class="content-line">
<div class="detail_wrap_seller">
<div class="headtit">
<h3>[${sdto.seller_id}]님의 상세 정보</h3>
</div>
<div class="table-box">
<table class="table_ny_two" border="1" >
	<tbody align="center">
		<tr>
			<th>판매자 번호</th>
			<td>${sdto.seller_no}</td>
		<tr>
		<tr>
			<th>아이디</th>
			<td>${sdto.seller_id}</td>
		<tr>
		<tr>
			<th>이름</th>
			<td>${sdto.seller_name}</td>
		<tr>
		<tr>
			<th>사업자 등록번호 </th>
			<td>${sdto.seller_lisence}</td>
		<tr>
		<tr>
			<th>생년월일</th>
			<td>${sdto.seller_birth.substring(0,10)}</td>
		<tr>
		<tr>
			<th>이메일</th>
			<td>${sdto.seller_email_id}@${sdto.seller_email_addr}</td>
		<tr>
		<tr>
			<th>핸드폰 번호</th>
			<td>${sdto.seller_phone}</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>${sdto.seller_regist.substring(0,10)}</td>
		</tr>
		<tr>
			<th>블랙리스트 여부</th>
			<td>${sdto.seller_blacklist eq 'Y'?"blacklist":"clean"}</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="2">
				<div style = "margin-top:40px">
					<a href ="edit?no=${sdto.seller_no}" style = "margin-right:30px; margin-left:170px"><input type="button" value="판매자 정보 수정" name="edit" class="btn btn-danger"></a>
					<a href ="exit?no=${sdto.seller_no}" ><input type="button" value="판매자 탈퇴" name="exit" class="btn btn-danger"></a>
				</div>
			</td>
		</tr>
	</tfoot>
</table>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>