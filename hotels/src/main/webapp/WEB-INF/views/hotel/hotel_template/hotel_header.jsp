<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.nav_main_content{
	font-size: 18px;
}

</style>
 <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="collapse navbar-collapse">
    <ul class="navbar-nav ">
     <li class="nav-item nav_main_content">
        <a class="nav-link" href="${pageContext.request.contextPath}/seller/hotel/list">내호텔</a>
      </li>
      <li class="nav-item nav_main_content">
        <a class="nav-link" href="#">호텔별 월별 매출</a>
      </li>
      <li class="nav-item nav_main_content">
        <a class="nav-link" href="#">호텔별 날짜 매출</a>
      </li>
      <li class="nav-item nav_main_content">
        <a class="nav-link" href="#">비워놓기</a>
      </li>
    </ul>

  </div>
</nav>