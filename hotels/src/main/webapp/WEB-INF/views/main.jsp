<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
  <script>
    $(document).ready(function(){
      $('.slider').bxSlider();
    });
  </script>
<div class="slider" style="height: 300px;">
   <div><img src="img/1.jpg"></div>
   <div><img src="img/2.jpg"></div>
   <div><img src="img/3.jpg"></div>
</div>
<div>
<span> 여기에 메인 내용을 넣으시면 됩니다.</span>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>