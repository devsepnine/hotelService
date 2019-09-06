<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/bootstrap.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<style>
   	@font-face { font-family: 'KOMACON'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff') format('woff'); font-weight: normal; font-style: normal; }
      *{
      		font-family:KOMACON;
      		box-sizing: border-box;
       }
	.admin_main_nav{
		background-color:  #f1e3c4;
		font-size: 18px;
	}
	
	.navbar-light .navbar-nav .nav-link{
		color : #555;
	}
	.navbar-light .navbar-nav .nav-link:hover{
		color: #555;
		border-bottom: 2px solid #555;
	}
	.navbar{
		padding: 0.6rem 1rem;
		min-width: 1200px;
		min-height: 55px;
	}
	.admin-main-wrap{
		width: 1300px;
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
	        <a class="nav-link" href="${pageContext.request.contextPath}">메인 화면</a>
	      </li>
	    </ul>
	  </div>
	</nav>
<div>

