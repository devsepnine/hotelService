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
	.table_ny_two > thead > tr > th {
		font-size: 15px;
	}
	.table_ny_two tbody > tr > td{
		font-size: 13px;
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
	
	.list_wrap {
		text-align: center;
	}
	
	.headtit{
		border-bottom: #432c10 solid 10px;
		max-width:1100px;
		margin:auto;
		text-align: left;
		margin-bottom: 50px;
	}
	
	.list_wrap > .table-box > .table_ny_two {
		margin-top : 50px;
		border-top: 3px solid #432c10;
  		border-bottom: 3px solid #432c10;
   		border-left: none;
  		border-right: none;
  		max-width: 1100px;
	}
	
	.list_wrap > .table-box > .table_ny_two > thead > tr > th,
	.list_wrap > .table-box > .table_ny_two > thead > tr > td,
	.list_wrap > .table-box > .table_ny_two > tbody > tr > th,
	.list_wrap > .table-box > .table_ny_two > tbody > tr > td,
	.list_wrap > .table-box > .table_ny_two > tfoot > tr > th,
	.list_wrap > .table-box > .table_ny_two > tfoot > tr > td {
		border: 1px solid #432c10;
		border-left: none;
  		border-right: none;
  		padding:10px 10px;
	}
	
	.content-line{
		margin-top:10px;
		border: 5px solid white;
		max-width: 1200px;
		margin: auto;
		padding: 20px 10px;
		box-shadow: 2px 2px 10px #EAEAEA;
	
	}
	.table-box{
		max-width: 1000px;
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
	}
</style>

<div style="height: 100px;"></div>
<div class="content-line">
<div class="list_wrap">
<div class="headtit">
<h3>${mdto.member_id}님의 상세 정보</h3>
</div>
<div class="table-box">
<table class="table_ny_two" border="1" >
	<!-- 제목 -->
	<thead>
		<tr>
			<th width="15%">번호</th>
			<th width="25%">아이디</th>
			<th width="20%">이름</th>
			<th width="20%">생년월일</th>
			<th width="20%">상세 정보</th>
		</tr>
	</thead>
	<!-- 게시글 -->
	<tbody align="center">
		<c:forEach var="mdto" items="${list}">
		<tr>
			<td>${mdto.member_no}</td>
			<td>
				${mdto.member_id}
			</td>
			<td>${mdto.member_name}</td>
			<td>${mdto.member_birthday.substring(0,10)}</td>
			<td>
				<a href="detail?no=${mdto.member_no}">
					<input type="button" value="DETAILS">
				</a>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>