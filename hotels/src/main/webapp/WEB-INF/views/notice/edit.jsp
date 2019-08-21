<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<script>
	$(function(){
	    ClassicEditor
	            .create( document.querySelector( 'textarea[name=notice_content]' ), {
	            	removePlugins: [ 'ImageUpload' ] 	
	            })
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
	.notice_wrap > *{
		color:black;
	}
	
	.notice_wrap > .table_ny_one {
		margin-top : 50px;
		border-top: 3px solid #432c10;
  		border-bottom: 3px solid #432c10;
   		border-left: none;
  		border-right: none;
  		max-width: 1100px;
	}
	
	.notice_wrap > .table_ny_one > thead > tr > th,
	.notice_wrap > .table_ny_one > thead > tr > td,
	.notice_wrap > .table_ny_one > tbody > tr > th,
	.notice_wrap > .table_ny_one > tbody > tr > td,
	.notice_wrap > .table_ny_one > tfoot > tr > th,
	.notice_wrap > .table_ny_one > tfoot > tr > td {
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


<form action="edit" method="post" >
<input type="hidden" name="notice_no" value="${ndto.notice_no}">
<div style="height: 100px;"></div>
<div class="content-line">
<div class="notice_wrap">
<div class="headtit">
<h3>&emsp;</h3>
	</div>
		<table class="table_ny_one" align="center" >
			<tbody>
				<tr>
					<td class="td-line">
						<label>제목 &emsp; </label>
						<input type="text" name="notice_title" value="${ndto.notice_title}" required>
					</td>
				</tr>
				<tr height="500">
					<td valign="top" colspan="2">
						<textarea name="notice_content" value="${ndto.notice_content}"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="file" name="file">
						<!-- 수정할때도 사진이 유지되어야됨 -->
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td class="td-line" colspan="2">
						<input type="submit" class="btn btn-danger" value="수정하기">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>