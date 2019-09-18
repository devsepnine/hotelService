<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/seller/seller_template/header.jsp"></jsp:include>
    <style>
    	.error_image {
    		margin : auto;
    		margin-top : 200px;
    		width : 404px;
    		height : 423px;
    		background-image: url("${pageContext.request.contextPath}/img/err/403.png");
    	}
    </style>

    <div class="error_image">
    </div>
    
    <jsp:include page="/WEB-INF/views/seller/seller_template/footer.jsp"></jsp:include>