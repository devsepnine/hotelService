<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/bootstrap.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<style>
   @font-face{
   		font-family: hotel;
   		 src: url("/resources/DXMobrRExtraBold.ttf"),
   		 	url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangDeogyang.woff') format('woff');
   		 }
   
      *{
      		font-family:hotel;
      		box-sizing: border-box;
       }
	.admin_main_nav{
		background-color:  #f1e3c4;
		font-size: 18px;
	}
	
	.navbar-light .navbar-nav .nav-link{
		color : #555;
		border-bottom: 4px solid #f1e3c4;
	}
	.navbar-light .navbar-nav .nav-link:hover{
		color: #555;
		border-bottom: 4px solid #555;
	}
	.navbar{
		min-width: 1320px;
		height:80px;
	}
	.admin-main-wrap{
		width: 1400px;
		margin: auto;
		margin-top: 60px;
	}
	.navbar-nav {
		width:100%;
	}
	.navbar-nav > .nav-item{
		width: 12.5%;
		text-align:center;
	}
	.admin-btn{
    	position:fixed;
    	top : 20px;
		right: 80px;
        z-index: 999;
        margin: 0px;
        font-size: 15px;
        color:#ffd700;
        border-radius:10px;
        padding:10px;
        background-color: #3e2b2c;
    }
    .admin-btn:hover{
    	background-color: #726454;
    }
	
</style>

<div class="admin-main-wrap">
	<nav class="navbar navbar-expand-lg navbar-light admin_main_nav">
	  <div class="collapse navbar-collapse" id="navbarColor03">
	    <ul class="navbar-nav">
	     <li class="nav-item" >
	        <a class="nav-link" href="${pageContext.request.contextPath}/admin/main">전체 관리</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/admin/member/list">회원 관리</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/admin/seller/list">판매자 관리</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/admin/attraction/list">관광지 관리</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/admin/restaurant/list">레스토랑 관리</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/admin/partner/waiting_list">제휴 관리</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/admin/coupon/list">쿠폰 관리</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/admin/review/list">리뷰 관리</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	<c:if test="${sessionScope.auth eq '관리자'}">
		<div class="admin-btn">
			<a href="${pageContext.request.contextPath}/">
				<span class="btn btn-danger admin-btn"><i class="fa fa-key"></i>&nbsp;&nbsp;MAIN</span>
			</a>
		</div>
	</c:if>
<div>

