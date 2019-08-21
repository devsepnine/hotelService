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
		margin-top: 50px;
	}

</style>

<div class="list_wrap">
<!-- 표 -->
<table class="table_ny_two" width="1000" border="1" align="center">
	<!-- 제목 -->
	<thead>
		<tr>
			<th>번호</th>
			<th width="40%">제목</th>
			<th>작성일</th>
			<th>조회수</th>
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
			<td>${ndto.notice_when}</td>
			<td>${ndto.notice_read}</td>
		</tr>
		</c:forEach>
	</tbody>
	<%-- if(관리자 일 때)--%>
	<c:if test="${mdto.member_auth == '관리자'}">
		<!-- 글쓰기 버튼 -->
		<tfoot>
			<tr>
				<td colspan="8" align="right">
					<a href="write">글쓰기</a>
				</td>
			</tr>
		</tfoot>
	</c:if>
</table>

<!-- 네비게이션 + 검색창 -->

<div class="empty"></div>

<form class="form" action="list" method="get" align="center">

<input type="hidden" name="page" value="1">

<select name="type">
	<option value="notice_title">제목</option>
	<option value="notice_writer">작성자</option>
</select>

<input type="search" name="keyword" placeholder="검색어" required value="${param.keyword}">

<input type="submit" value="검색">
</form>

<div class="empty"></div>

<ul class="navigator">
	<%-- 이전 구간 링크 --%>
	<c:if test="${startBlock > 1}">
		<c:choose>
			<c:when test="${param.type != null and param.keyword != null}">
				<li><a href="list?page=?${startBlock - 1}&type=${param.type}&keyword=${param.keyword}">&lt;&lt;</a></li>		
			</c:when>
			<c:otherwise>
				<li><a href="list?page=?${startBlock - 1}">&lt;&lt;</a></li>		
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
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>