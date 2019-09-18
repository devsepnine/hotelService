<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    	.error_image {
    		margin : auto;
    		margin-top : 200px;
    		width : 404px;
    		height : 423px;
    		background-image: url("${pageContext.request.contextPath}/img/err/403.png");
    		background-repeat: no-repeat;
    	}
    	.home{
    		margin: auto;
    		width:88px;
    	}
    </style>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/bootstrap.css">
    <div class="error_image">
    </div>
    <div class="home">
    	<a href="${pageContext.request.contextPath}" class="btn btn-reserve">HOME</a>
    </div>