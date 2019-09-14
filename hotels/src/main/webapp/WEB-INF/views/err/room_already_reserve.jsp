<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	.alert-hotel{
		width: 600px;
		margin: auto;
		text-align: center;
	}
	.alert-hotel p{
		font-size: 20px;
	}
	.alert-hotel a{
		color: white;
	}
</style>
<div style="height: 120px"></div>
<div class="alert-hotel">
	<p>예약 하시려는 호텔의 객실은</p>
	<p>해당요일에는 예약완료되어 예약이 불가능합니다</p>
	
	<a href="${pageContext.request.contextPath}" class="btn btn-reserve">HOME</a>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>