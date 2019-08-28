<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<script>
	$(function(){
	    ClassicEditor
	            .create( document.querySelector( 'textarea[name=attraction_info]' ), {
	            	removePlugins: [ 'ImageUpload', 'MediaEmbed' ]
	            })
	});
</script>
<script>
	$(function(){
		$("form").submit(function(e){
	    	e.preventDefault();
	    	if($(".ck-editor__editable").children("p").text().length==0){
	    		alert("관광지 설명을 입력하세요.");
	    	}else{
	    		this.submit();
	    	}
	    });
	});
</script>

<%-- 
		table_ny_one
		 - 위아래는 두껍고 안에는 얇은 선
		 - 좌우는 선 없음
	--%>
	
<style>
	.ck-editor__editable {
		min-height:500px;
		max-height:500px;
	}
</style>

<style>
	.attraction_wrap > *{
		color:black;
	}
	
	.attraction_wrap > .table_ny_one {
		margin-top : 50px;
		border-top: 3px solid #432c10;
  		border-bottom: 3px solid #432c10;
   		border-left: none;
  		border-right: none;
  		max-width: 1100px;
	}
	
	.attraction_wrap > .table_ny_one > thead > tr > th,
	.attraction_wrap > .table_ny_one > thead > tr > td,
	.attraction_wrap > .table_ny_one > tbody > tr > th,
	.attraction_wrap > .table_ny_one > tbody > tr > td,
	.attraction_wrap > .table_ny_one > tfoot > tr > th,
	.attraction_wrap > .table_ny_one > tfoot > tr > td {
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


<form action="edit" method="post" enctype="multipart/form-data">
<input type="hidden" name="attraction_no" value="${adto.attraction_no}">
<c:forEach var="afdto" items="${afdtolist}" varStatus="status">
	<input type="hidden" name="attraction_file_no${status.count}" value="${afdto.attraction_file_no}">
</c:forEach>
<div style="height: 100px;"></div>
<div class="content-line">
<div class="attraction_wrap">
<div class="headtit">
<h3>&emsp;</h3>
</div>
		<table class="table_ny_one" align="center" >
			<tbody>
				<tr>
					<td class="td-line">
						<label>이름&emsp;</label>
						<input type="text" style="width:300px;" name="attraction_name" value="${adto.attraction_name}" required>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label>주소&emsp;</label>
						<input type="text" name="attraction_addr" style="width:200px;" value="${adto.attraction_addr}">
					</td>
				</tr>
				<tr>
					<td>
						<div style="width: 400px; display: inline-block;">
							<label>위도&emsp;</label>
							<input  type="text" style="width:200px;" name="attraction_lat" value="${adto.attraction_lat}" required>
						</div>
						<div style="width: 400px;display: inline-block;">
						<label>경도&emsp;</label>
						<input type="text" style="width:200px;" name="attraction_lng" value="${adto.attraction_lng}" required>
						</div>
					</td>
				</tr>
				<tr height="500">
					<td valign="top" colspan="2">
						<textarea name="attraction_info">${adto.attraction_info}</textarea>
					</td>	
				</tr>
				<tr>
					<td colspan="2">
						<input type="file" name="file1"  accept = ".jpg, .png, .gif">
						<c:if test="${not empty afdtolist[0]}">
							<img height="100px;" src="${pageContext.request.contextPath}/atimg?attraction_file_name=${afdtolist[0].attraction_file_name}">
						</c:if>							
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="file" name="file2" accept = ".jpg, .png, .gif">
						<c:if test="${not empty afdtolist[1]}">
							<img height="100px;" src="${pageContext.request.contextPath}/atimg?attraction_file_name=${afdtolist[1].attraction_file_name}">
						</c:if>		
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="file" name="file3" accept = ".jpg, .png, .gif">
						<c:if test="${not empty afdtolist[2]}">
							<img height="100px;" src="${pageContext.request.contextPath}/atimg?attraction_file_name=${afdtolist[2].attraction_file_name}">
						</c:if>		
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td class="td-line" colspan="2"  style="text-align: right;">
						<input type="submit" style="width:70px" class="btn btn-danger" value="관광지 수정">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>