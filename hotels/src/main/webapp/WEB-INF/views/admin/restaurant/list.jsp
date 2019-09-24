<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>

<!-- 자바스크립트를 이용하여 페이지 이동을 처리 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
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

<script>
	$(function(){
		$(".exitbtn").click(function(){
			var rest_no = $(this).attr("data-restaurant_no");
			$(".del-rest-no").text(rest_no);
		})
		
		$("#deleteBtn").click(function(){
			var pw = $("input[name=pw]").val();
			var encPw = CryptoJS.SHA256(pw).toString();
			var rest_no = $(".del-rest-no").text();
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/check_pw_restaurant",
				type: "post",
				data : {
					pw : encPw
				},
				dataType : "text",
				success : function(resp) {
					if (resp == "Y") {
						location.href="${pageContext.request.contextPath}/admin/restaurant/exit?no="+rest_no;
					}
					else {
						window.alert("비밀번호가 일치하지 않습니다")
					}
				}
			});
		});
		
	});
	
</script>

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
	
	.navigator .current {
		background-color : #726454;
	}
	
	.navigator .current a{
		color: white;
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

<input type="hidden" id="restaurant_no" value="${rdto.restaurant_no}">
<div style="height: 100px;"></div>
<div class="content-line">
<div class="list_wrap">
<div class="headtit">
<h3>레스토랑 리스트</h3>
</div>
<div class="table-box">
<table class="table_ny_two" border="1" >
	<thead>
		<tr>
			<th width="25%">대표 사진</th>
			<th width="15%">레스토랑 이름</th>
			<th width="35%">주소</th>
			<th width="12.5%">상세 정보</th>
			<th width="12.5%">삭제</th>
		</tr>
	</thead>
	<tbody align="center">
		<c:forEach var="rdto" items="${list}">
		<tr class="restaurant_info">
			<td>
				<img src="${pageContext.request.contextPath}/img_v/2?img_name=${rdto.restaurant_file_name}" width="150px" height="150px">
			</td>
			<td>${rdto.restaurant_name}</td>
			<td>${rdto.restaurant_addr1} ${rdto.restaurant_addr2}</td>
			<td>
			<a href="detail?no=${rdto.restaurant_no}">
				<input type="button" class="btn btn-danger" value="DETAIL">
			</a>
			</td>
			<td>
				<button type="button" name="exitbtn"  class="btn btn-danger exitbtn" data-toggle="modal" data-target="#deleteCheckModal" data-restaurant_no="${rdto.restaurant_no}">DELETE</button>
			</td>
		</tr>
		</c:forEach>
	</tbody>
		<!-- 레스토랑 등록 버튼 -->
		<tfoot>
			<tr>
				<td colspan="8" align="right" >
					<a href="regist" class="btn btn-danger">레스토랑 등록</a>
				</td>
			</tr>
		</tfoot>
</table>
</div>
<!-- 네비게이션 + 검색창 -->

<div class="empty"></div>

<form class="form" action="list" method="get">

<input type="hidden" name="page" value="1">

<select name="type" class="custom-select" style="width:140px">
	<option value="restaurant_name">레스토랑명</option>
	<option value="restaurant_addr1">주소</option>
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

<!-- 삭제할 때 삭제할건지 확인하는 모달 시작 -->
<!--modal 참고 url : https://getbootstrap.com/docs/4.0/components/modal/ -->
<div class="modal" id="deleteCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">비밀번호 확인</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
			<div class="modal-body">
			비밀번호를 입력후 확인을 누르시면 삭제됩니다
			<!--해당 글 삭제하는 주소값받는 input 태그-->
				<input type="password" class="form-control" name="pw" id="pw" placeholder="PASSWORD를 입력하세요" required>
				<img id="deleteUrl" src="">
			
			</div>
			<div class="modal-footer">
<!-- 				리스트번호전달을 위해 스펜에 값 입력 -->
				<span class="del-rest-no" style="display: none;"></span> 
				<button type="button" class="btn btn-primary" id="deleteBtn">확인</button>
				
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>