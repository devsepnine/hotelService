<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/bootstrap.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
   	
  <script>
        $(function(){
            $(".side-btn").click(function(){
                                console.log($(window).width())
                                $(".sidebar").toggleClass("active")
                                $(".content").toggleClass("active")
                                $(".menubtn").toggleClass("active") 
                                })
            
            $(window).resize(function(){
                if($(window).width() > 1224){
                    $(".sidebar").removeClass("active")
                    $(".content").removeClass("active")
                    $(".menubtn").removeClass("active") 
                }
            })
        })
      
    </script>
   <style>
   		@font-face { font-family: 'KOMACON'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff') format('woff'); font-weight: normal; font-style: normal; }
      *{
      		font-family:KOMACON;
           box-sizing: border-box;
       }
    body{
        margin: 0;
    }
    .menubtn{
    	position:fixed;
    	top : 0px;
		right:0px;
        height: 100px;
        z-index: 999;
        display: none;
        transition: left .3s ease-in;
    }
    .sidebar {
	    position: fixed;
	    width: 200px;
	    height: 100%;
	    background-color : #f1e3c4;
	    z-index: 999;
        transition: margin .3s ease-in;
    }
   .sidebar.active{
       margin-left: -200px;
   }
   .content.active{
        margin-left: 0px;
   }
    .content {
    margin-left: 200px;
    height: 2500px;
    width: auto;
    position: relative;
    background: white;
    overflow: auto;
        z-index: 1;
        transition: margin .3s ease-in;
    }
    .info {
    min-width: 720px;
    height: 1080px;
    background-color:white;
    position: relative;
    background-size: 1440px;
        z-index: 2;
    }
    .sidebar-list{
    	margin-top: 60px;
    }
    .sidebar-list ul li{
    	list-style: none;
    	font-size: 30px;
    	color: #81725f;
    	font-weight: bold;
    }
    @media (max-width:1224px) {
       .sidebar {
         margin-left: -200px;
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
<ul>
	<li><a href="${pageContext.request.contextPath}"><img alt="home" src="${pageContext.request.contextPath}/img/homebtn.png" width="100px" height="100px"></a></li>
	<li><a href="${pageContext.request.contextPath}/notice">공지사항</a></li>
	<li>호텔 예약</li>
	<li>호텔 검색</li>
	<li>뭐넣지</li>
	<li><a href="${pageContext.request.contextPath}/join">회원가입</a></li>
	<li><a href="${pageContext.request.contextPath}/member/login">로그인</a></li>
</ul>
</div>
</div>
</div>
<div class="menubtn">
<div style="width: 100%; background-color: none;">
	<button class="btn btn-default side-btn"><i style="color: #f1e3c4;" class="fa fa-bars fa-3x"></i></button>
</div>
</div>
<div class="content">
<div class="info">

