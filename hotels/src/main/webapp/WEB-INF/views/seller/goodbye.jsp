<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<style>
	.goodbye-wrap{
		width: 100%;
		text-align: center;
	}

</style>



<div align="center" class="goodbye-wrap">
	<h2><font style="font-weight: bold; font-style: italic;">그동안 이용해 주셔서 감사합니다</font></h2>
	<h4><font color="blue"></font></h4>
	<h3><a href="<%=request.getContextPath()%>"><button class="btn btn-danger">메인으로</button></a></h3>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>