<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
    <link rel="stylesheet" type="text/css" href="style/bootstrap.min.css">
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
       *{
           box-sizing: border-box;
       }
    body{
        margin: 0;
    }
    .menubtn{
    	position:absolute;
    	left: 0px;
        width: 100%;
        height: 60px;
        z-index: 999;
        display: none;
        transition: left .3s ease-in;
    }
    .sidebar {
	    position: fixed;
	    width: 300px;
	    height: 100%;
	    background-image: url(https://post-phinf.pstatic.net/MjAxODAxMjZfMjE4/MDAxNTE2OTUwMTA4NDQz.8H38FcR90M8nUx6MZwIEfEZI12zkxlbJy7UU7mgPL_cg.z_IrPLg-7iqQJCgI0w1ZFAu0tqDtqTDhe8dHaiXFaZIg.JPEG/iphone-wallpaper13.jpg);
	    z-index: 999;
        transition: margin .3s ease-in;
    }
   .sidebar.active{
       margin-left: -300px;
   }
   .content.active{
        margin-left: 0px;
   }
    .content {
    margin-left: 300px;
    height: auto;
    width: auto;
    position: relative;
    background: #f00;
    overflow: auto;
        z-index: 1;
        transition: margin .3s ease-in;
    }
    .info {
    min-width: 720px;
    height: 6000px;
    position: relative;
    background-size: 1440px;
        z-index: 2;
    }
    @media (max-width:1224px) {
       .sidebar {
         margin-left: -300px;
       }
       .content {
         padding-top: 60px;
         margin-left: 0px;
       }
       .menubtn{
            display: block;
       }
       .menubtn.active{
       		left: 300px; 
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
<h1>이곳이 메뉴입니다.</h1>
</div>
<div class="menubtn">
<div style="width: 100%; background-color: black;">
	<button class="btn btn-default side-btn"><i class="fa fa-align-justify"></i></button>
</div>

</div>
<div class="content">


