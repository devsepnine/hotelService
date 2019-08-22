<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

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
	.list_wrap > *{
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
<h3>공지사항</h3>
</div>
<div class="table-box">
<table class="table_ny_two" border="1" >
	<!-- 제목 -->
	<thead>
		<tr>
			<th width="13%">번호</th>
			<th width="47%">제목</th>
			<th width="25%">작성일</th>
			<th width="15%">조회수</th>
		</tr>
	</thead>
	<!-- 게시글 -->
	<tbody align="center">
		<c:forEach var="ndto" items="${list}">
		<tr>
			<td>${ndto.notice_no}</td>
			<td>
				
				<%-- content로 가기 위해 no를 첨부한다 --%>
				<a href="content?no=${ndto.notice_no}">
					${ndto.notice_title}
				</a>
				
			</td>
			<td>${ndto.notice_when.substring(0,16)}</td>
			<td>${ndto.notice_read}</td>
		</tr>
		</c:forEach>
	</tbody>
	<%-- if(관리자 일 때)--%>
	<c:if test="${sessionScope.auth == '관리자'}">
		<!-- 글쓰기 버튼 -->
		<tfoot>
			<tr>
				<td colspan="8" align="right" >
					<a href="write" class="btn btn-danger">글쓰기</a>
				</td>
			</tr>
		</tfoot>
	</c:if>
</table>
</div>
<!-- 네비게이션 + 검색창 -->

<div class="empty"></div>

<form class="form" action="list" method="get">

<input type="hidden" name="page" value="1">

<select name="type" class="custom-select">
	<option value="notice_title">제목</option>
	<option value="notice_content">내용</option>
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
				<li><a href="list?page=${i}&type=${param.type}&keyword=${param.keyword}">${i}</a></li>		
			</c:when>
			<c:otherwise>
				<li><a href="list?page=${i}">${i}</a></li>		
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