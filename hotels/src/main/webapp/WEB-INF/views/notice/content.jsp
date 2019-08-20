<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

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
  		padding:10px 0px;
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
	@media (max-width:1224px) {
		.td-line{
			text-align: left;
		}
	}
</style>

<br><br><br>

<div class="content-line">
<div class="notice_wrap">
<div class="headtit">
<h3>${ndto.notice_title}</h3>
</div>
	<table class="table_ny_one" align="center" >
		<tbody class="text-left">
			<tr>
				<td class="td-line" >
					${mdto.member_id} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${ndto.notice_when.substring(0,16)}
				</td>
			</tr>
			<tr height="500">
				<td valign="top" colspan="2">
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
					<%-- if(관리자 일 때)--%>
<%-- 					<c:if test="${mdto.member_auth == '관리자'}"> --%>
					<a href="write">글쓰기</a>
<%-- 					</c:if> --%>
					<%-- if(내글일 때)--%>
					<c:if test="${mdto.member_id == ok}">
					<a href="edit?no=${ndto.notice_no}">수정</a>
					<a href="delete?no=${ndto.notice_no}">삭제</a>
					</c:if>
					<a href="list">목록</a>
				</td>
			</tr>
		</tfoot>
	</table>
</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
