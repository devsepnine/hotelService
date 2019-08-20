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
		margin-top : 70px;
	}
</style>

<div class="notice_wrap">
<div class="headtit">
<h3>${ndto.notice_title}</h3>
</div>
	<table class="table_ny_one" width="1000" align="center" >
		<tbody class="text-left">
			<tr>
				<td align="right" width="800">
					${mdto.member_id} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${ndto.notice_when.substring(0,16)}
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
				<td align="right" colspan="2">
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

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
