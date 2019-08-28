<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

	<%-- 
		table_ny_one
		 - 위아래는 두껍고 안에는 얇은 선
		 - 좌우는 선 없음
	--%>
<style>
	.detail_wrap > *{
		color:black;
	}
	
	.detail_wrap > .table_ny_one {
		margin-top : 50px;
		border-top: 3px solid #432c10;
  		border-bottom: 3px solid #432c10;
   		border-left: none;
  		border-right: none;
  		max-width: 1100px;
	}
	
	.detail_wrap > .table_ny_one > thead > tr > th,
	.detail_wrap > .table_ny_one > thead > tr > td,
	.detail_wrap > .table_ny_one > tbody > tr > th,
	.detail_wrap > .table_ny_one > tbody > tr > td,
	.detail_wrap > .table_ny_one > tfoot > tr > th,
	.detail_wrap > .table_ny_one > tfoot > tr > td {
		border: 1px solid #432c10;
		border-left: none;
  		border-right: none;
  		padding:10px 10px;
	}
	
	.headtit{
		border-bottom: #432c10 solid 10px;
		width:1100px;
		margin:auto;
	}
	
	.content-line{
		margin-top:100px;
		border: 5px solid white;
		max-width: 1200px;
		margin: auto;
		padding: 20px 10px;
		box-shadow: 2px 2px 10px #EAEAEA;
	}
	
	.td-line{
		width: 950px;
		text-align: right;
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

<c:forEach var="afdto" items="${afdtolist}" varStatus="status">
	<input type="hidden" name="attraction_file_no${status.count}" value="${afdto.attraction_file_no}">
</c:forEach>
<div style="height: 100px;"></div>
<div class="content-line">
<div class="detail_wrap">
<div class="headtit">
<h3>${adto.attraction_name}</h3>
</div>
	<table class="table_ny_one" align="center" >
		<tbody>
			<tr>
				<td colspan="2">
					주소 ${adto.attraction_addr}
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div style="width: 400px; display: inline-block;">
						위도&emsp;${adto.attraction_lat}
					</div>
					<div style="width: 400px;display: inline-block;">
						경도&emsp;${adto.attraction_lng}
					</div>
				</td>
			</tr>
			<tr height="500">
				<td valign="top" colspan="2">
				<c:if test="${not empty afdtolist[0]}">
					<img height="100px;" src="${pageContext.request.contextPath}/atimg?attraction_file_name=${afdtolist[0].attraction_file_name}">
				</c:if>
				<c:if test="${not empty afdtolist[1]}">
					<img height="100px;" src="${pageContext.request.contextPath}/atimg?attraction_file_name=${afdtolist[1].attraction_file_name}">
				</c:if>
				<c:if test="${not empty afdtolist[2]}">
					<img height="100px;" src="${pageContext.request.contextPath}/atimg?attraction_file_name=${afdtolist[2].attraction_file_name}">
				</c:if>
					${adto.attraction_info}
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td class="td-line" colspan="2">
					<a href ="edit?no=${adto.attraction_no}"><input type="button" value="수정" name="edit" class="btn btn-danger"></a>
					<a href ="exit?no=${adto.attraction_no}"><input type="button" value="삭제" name="exit" class="btn btn-danger"></a>
					<a href ="list"><input type="button" value="목록" name="list" class="btn btn-danger"></a>
				</td>
			</tr>
		</tfoot>
	</table>
</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>