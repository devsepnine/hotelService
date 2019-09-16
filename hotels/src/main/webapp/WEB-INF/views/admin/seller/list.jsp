<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>

<!-- 자바스크립트를 이용하여 페이지 이동을 처리 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		//목표 : 페이지 번호를 누르면 해당하는 번호의 페이지로 이동 처리
		//			이동은 form을 전송하는 것으로 대체
		$(".navigator-page").click(function(){
			var p = $(this).text();
			move(p);
		});
		
		//이동 함수
		function move(no){
			//input[name=page]에 no를 설정한 뒤 form을 전송
			$("input[name=page]").val(no);
			$("form").submit();
		}
		
		//select[name=type]인 항목의 값을 선택
		var type = "${param.type}";
		if(type){
			$("select[name=type]").val(type);
		}
	});
	
</script>

<style>
	.table_ny_three thead,
	.table_ny_three tbody{
		color:black;
	}
	.table_ny_three > thead > tr > th {
		font-size: 15px;
	}
	.table_ny_three tbody > tr > td{
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
	
	.navigator .current {
		background-color : #726454;
	}
	
	.navigator .current a{
		color: white;
	}
	
	.list_wrap {
		text-align: center;
	}
	
	.list_headtit{
		border-bottom: #432c10 solid 10px;
		max-width:1100px;
		margin:auto;
		text-align: left;
	}
	
	.list_wrap > .table-box > .table_ny_three {
		border-top: 3px solid #432c10;
  		border-bottom: 3px solid #432c10;
   		border-left: none;
  		border-right: none;
  		max-width: 1100px;
	}
	
	.list_wrap > .table-box > .table_ny_three > thead > tr > th,
	.list_wrap > .table-box > .table_ny_three > thead > tr > td,
	.list_wrap > .table-box > .table_ny_three > tbody > tr > th,
	.list_wrap > .table-box > .table_ny_three > tbody > tr > td,
	.list_wrap > .table-box > .table_ny_three > tfoot > tr > th,
	.list_wrap > .table-box > .table_ny_three > tfoot > tr > td {
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
	
	.table_ny_three{
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
	
	input[name=BLACK_LIST]{
		margin-top:20px;
		margin-bottom: 20px;
 		margin-right : 850px;
	}
	
	.btn-blacklist {
	  color: #fff;
	  background-color: black;
	  border-color: #d9534f;
	}
	
</style>

<div style="height: 100px;"></div>
<div class="content-line">
<div class="list_wrap">
<div class="list_headtit">
<h3>판매자 리스트</h3>
</div>
	<a href="blacklist">
		<input type="button" class="btn btn-blacklist" name="BLACK_LIST" value="BLACK LIST">
	</a>
<div class="table-box">
<table class="table_ny_three" border="1" >
	<thead>
		<tr>
			<th width="15%">판매자 번호</th>
			<th width="20%">아이디</th>
			<th width="20%">이름</th>
			<th width="25%">사업자 번호</th>
			<th width="20%">상세 정보</th>
		</tr>
	</thead>
	<tbody align="center">
		<c:forEach var="sdto" items="${list}">
		<tr>
			<td>${sdto.seller_no}</td>
			<td>${sdto.seller_id}</td>
			<td>${sdto.seller_name}</td>
			<td>${sdto.seller_lisence}</td>
			<td>
				<a href="detail?no=${sdto.seller_no}">
					<input type="button" class="btn btn-danger" value="DETAIL">
				</a>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<!-- 네비게이션 + 검색창 -->

<div class="empty"></div>

<form class="form" action="list" method="get">

<input type="hidden" name="page" value="1">

<select name="type" class="custom-select" style="width:140px">
	<option value="seller_id">아이디</option>
	<option value="seller_name">이름</option>
	<option value="seller_lisence">사업자 번호</option>
	<option value="seller_email_id">이메일</option>
	<option value="seller_phone">핸드폰번호</option>
</select>

<input type="search" name="keyword" class="form-control" placeholder="검색어를 입력하세요" required value="${param.keyword}">

<input type="submit" class="btn btn-danger" value="검색">
</form>

<div class="empty"></div>

<ul class="navigator">
	<%-- 이전 구간 링크 --%>
	<c:if test="${startBlock > 1}">
		<c:choose>
			<c:when test="${param.type != null and param.keyword != null}">
				<li><a href="list?page=${startBlock - 1}&type=${param.type}&keyword=${param.keyword}">&lt;&lt;</a></li>		
			</c:when>
			<c:otherwise>
				<li><a href="list?page=${startBlock - 1}">&lt;&lt;</a></li>		
			</c:otherwise>
		</c:choose>
	</c:if>
	
	<%-- 이전 페이지 링크(pno - 1) --%>
	<c:if test="${page > 1}">
		<c:choose>
			<c:when test="${param.type != null and param.keyword != null}">
				<li><a href="list?page=${page-1}&type=${param.type}&keyword=${param.keyword}">&lt;</a></li>		
			</c:when>
			<c:otherwise>
				<li><a href="list?page=${page-1}">&lt;</a></li>		
			</c:otherwise>
		</c:choose>
	</c:if>
	
	<%-- 페이지 출력 --%>
	<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
		<c:choose>
			<c:when test="${param.type != null and param.keyword != null}">
				<li class="${page == i?'current':''}"><a href="list?page=${i}&type=${param.type}&keyword=${param.keyword}">${i}</a></li>		
			</c:when>
			<c:otherwise>
				<li class="${page == i?'current':''}"><a href="list?page=${i}">${i}</a></li>		
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<%-- 다음 페이지 링크(pno + 1) --%>
	<c:if test="${page < pageCount}">
		<c:choose>
			<c:when test="${param.type != null and param.keyword != null}">
				<li><a href="list?page=${page+1}&type=${param.type}&keyword=${param.keyword}">&gt;</a></li>		
			</c:when>
			<c:otherwise>
				<li><a href="list?page=${page+1}">&gt;</a></li>	
			</c:otherwise>
		</c:choose>
		
	</c:if>
	
	<%-- 다음 구간 --%>
	<c:if test="${endBlock < pageCount}">
		<c:choose>
			<c:when test="${param.type != null and param.keyword != null}">
				<li><a href="list?page=${endBlock + 1}&type=${param.type}&keyword=${param.keyword}">&gt;&gt;</a></li>		
			</c:when>
			<c:otherwise>
				<li><a href="list?page=${endBlock + 1}">&gt;&gt;</a></li>		
			</c:otherwise>
		</c:choose>
	</c:if>
</ul>

</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>