<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>

<style>
	.coupon_list_download {
		background-image : url('${pageContext.request.contextPath}/resources/image/coupon.png');
		width :547px;
		height : 194px;
	}
</style>

<div>
	<table class="coupon_list_download" >
		<tr>
			<td style="width:600px;">안녕하세요</td>
		</tr>
		<tr>
			<td>감사해요</td>
		</tr>
		<tr>
			<td>잘있어요</td>
		</tr>
	</table>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
