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


<div style="height: 100px;"></div>
<div class="content-line">
<div class="notice_wrap">
<div class="headtit">
<h3>${ndto.notice_title}</h3>
</div>
	<table class="table_ny_one" align="center" >
		<tbody>
			<tr>
				<td class="td-line" >
					${mdto.member_id} &emsp;&emsp; ${ndto.notice_when.substring(0,16)}
				</td>
			</tr>
			<tr height="500">
				<td valign="top" colspan="2">
				<c:if test="${not empty ndto.notice_file_name}">
					<img src="${pageContext.request.contextPath }/imgsrc?notice_file_name=${ndto.notice_file_name }">
				</c:if>
					${ndto.notice_content}
				</td>
			</tr>
			<tr>
				<td colspan="2">
					조회수 ${ndto.notice_read}
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td class="td-line" colspan="2">
					<%-- if(내글일 때)--%>
					<c:if test="${mdto.member_id == ok}">
					<a href ="edit?no=${ndto.notice_no}"><input type="button" value="수정" name="edit" class="btn btn-danger"></a>
					<a href ="delete?no=${ndto.notice_no}"><input type="button" value="삭제" name="delete" class="btn btn-danger"></a>
					</c:if>
					<a href ="list"><input type="button" value="목록" name="list" class="btn btn-danger"></a>
				</td>
			</tr>
		</tfoot>
	</table>
</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>