<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>호텔델꾸와</title>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
   	<link rel="icon" type="image/png"  href="${pageContext.request.contextPath}/img/ico/hotel_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/bootstrap.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  	
  <script>
        $(function(){
        	$('[data-toggle="tooltip"]').tooltip();
            $(".menubtn").click(function(){
                                console.log($(window).width())
                                $(".sidebar").toggleClass("active")
                                $(".content").toggleClass("active")
                                })
            
            $(window).resize(function(){
                if($(window).width() > 1249){
                    $(".sidebar").removeClass("active")
                    $(".content").removeClass("active")
                    $(".menubtn").removeClass("active") 
                    setTimeout(function(){
                    	$(".content").removeClass("transition")
                    }, 300)
                }else{
                	setTimeout(function(){
                		$(".content").addClass("transition")
                    }, 300)
                	
                }
            })
        })
      
    </script>
   <style>
   		@font-face { font-family: 'ON-IGothic'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eleven@1.0/ON-IGothic.woff') format('woff'); font-weight: normal; font-style: normal; }
      *{
      		font-family:ON-IGothic;
           box-sizing: border-box;
       }
    a:link {  text-decoration: none;}
	a:visited {  text-decoration: none;}
	a:hover { text-decoration: none;}
    body{
        margin: 0;
    }
    .menubtn{
    	position:fixed;
    	top : 20px;
		right:10px;
        z-index: 999;
        display: none;
        margin: 0px;
        color: #f1e3c4;
    }
    .menubtn:hover{
    	text-shadow: 0px 0px 20px white;
    	color: lime;
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
    .sidebar {
	    position: fixed;
	    width: 250px;
	    height: 100%;
	    min-height:1080px;
 	    background-color : #f1e3c4;
/* 		background-image : url("${pageContext.request.contextPath}/img/vintage.jpg"); */
		background-repeat:no-repeat;
		background-size:auto 100%;
	   	box-shadow:1px 1px 3px #3e2b2c;
	    z-index: 999;
        transition: margin .3s ease-in;
    }
   .sidebar.active{
       margin-left: -250px;
   }
   .content.active{
        margin-left: 0px;
   }
   .content.transition{
   	transition: margin .3s ease-in;
   }
    .content {
    margin-left: 250px;
    min-height:1080px;
    min-width:360px;
    position: relative;
    background: white;
    overflow: auto;
    z-index: 1;
    }
    .info {
    min-width: 355px;
    min-height:1080px;
    background-color:white;
    position: relative;
    z-index: 2;
    }
    .sidebar-list{
    	text-align: center;
    }
    .sidebar-list p a{
    	font-size: 25px;
    	color: black;
    }
    @media (max-width:1250px) {
       .sidebar {
         margin-left: -250px;
       }
       .content {
         margin-left: 0px;
       }
       .info{
       }
       .menubtn{
            display: block;
       }
       .menubtn.active{
       		right: 0px; 
       }
       .sidebar.active{
           margin-left: 0px;
       }
       .content.active{
            margin-left: 0px;
       }
     }
</style>
</head>
<body>
<div class="sidebar">
<div>
<div class="sidebar-list">
	<div style="height: 40px;"></div>
	<p><a href="${pageContext.request.contextPath}/"><img alt="home" src="${pageContext.request.contextPath}/img/homebtn.png" width="100%"></a></p>
	<div style="width: 100px; border-bottom: 2px solid #3e2b2c;margin: auto;"></div>
	<br><br>
	<p><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></p>
	<p><a href="${pageContext.request.contextPath}/hotel/search">호텔 찾기</a></p>
	<c:if test="${empty sessionScope.ok}">
	<p><a href="${pageContext.request.contextPath}/join">회원가입</a></p>
	</c:if>
	<c:choose>
		<c:when test="${empty sessionScope.ok}">
			<p><a href="${pageContext.request.contextPath}/member/login">로그인</a></p>
		</c:when>
		<c:otherwise>
			<p><a href="${pageContext.request.contextPath}/reserve/list">예약내역</a></p>
			<p><a href="${pageContext.request.contextPath}/member/info">${sessionScope.username }님</a></p>
			<p><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></p>
		</c:otherwise>
	</c:choose>
</div>
</div>
</div>
<c:if test="${sessionScope.auth eq '관리자' }">
<div class="admin-btn">
	<a href="${pageContext.request.contextPath}/admin/main">
		<span class="btn btn-danger admin-btn"><i class="fa fa-key"></i>&nbsp;&nbsp;관리자</span>
	</a>
</div>
</c:if>
<div class="menubtn">
<div style="width: 100%; background-color: none;">
	<i class="fa fa-bars fa-3x"></i>
</div>
</div>
<div class="content">
<div class="info">

