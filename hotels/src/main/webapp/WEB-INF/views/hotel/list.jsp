<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/seller/seller_template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.hotel-list-wrap{
		
		padding: 50px;
	}
	.content_title{
		color:black;
		border-right: 0.5px solid lightgray;
		text-align: center;
		width: 15%;
	}
	.end_line{
		border-bottom: 1px solid darkgray;
		text-align: right;
	}
	.delete_btn{
		background-color: #fe2c08;
		color : white;
	}

	
</style>
<script>
	$(function(){
		$(".delete_btn").click(
			function() {
				//this == button
				var that = this;
				
				$.ajax({
					url : "delete",
					data : {
						hotel_no : $("#hotel_no").val()
					},
					dataType : "text",
					success : function(resp) {
						//console.log(this);
						
						if (resp == "Y") {
 							$(that).parents(".hotel_info").remove();							
						}
						else {
							
						}
					}
				});
			});
	});
</script>

<br>
<br>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  

  <div class="collapse navbar-collapse">
    <ul class="navbar-nav ">
     <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/hotel/list">내호텔</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">호텔매출</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">비워놓기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">비워놓기</a>
      </li>
    </ul>
    
  </div>
</nav>




<div align="center" class="hotel-list-wrap">
	<c:forEach var="hdto" items="${list}">
		<table class="table table-hamburg table-stripe hotel_info">
			<tbody>
					<tr>
						<td rowspan="3" style="width: 180px;"><a href="content?no=${hdto.hotel_no}"><img src="${pageContext.request.contextPath}/img_v/3?img_name=${hdto.hotel_title}" width="240px" height="240px"></a></td>
						<td class="content_title">호텔 이름
							<input type="hidden" id="hotel_no" value="${hdto.hotel_no}">
						</td>
						<td><a href="content?no=${hdto.hotel_no}">${hdto.hotel_name}</a></td>
					</tr>
					<tr>
						<td class="content_title">호텔 주소</td>
						<td >${hdto.hotel_basic_addr}<br>${hdto.hotel_detail_addr}</td>
					</tr>
					<tr>
						<td class="content_title ">호텔 전화번호</td>
						<td class="">${hdto.hotel_tel}</td>
					</tr>
					<tr class="end_line">
						<td colspan="3"><button class="btn btn-danger delete_btn ">삭제</button></td>
					</tr>
			</tbody>
		</table>
	</c:forEach>
	<a href="${pageContext.request.contextPath}/hotel/regist"><input class="btn btn-danger" type="button" name="#" value="호텔등록"></a>
	<input class="btn btn-danger" type="button" name="#" value="선택삭제">
</div>




<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>











