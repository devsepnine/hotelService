<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/seller/seller_template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.hotel-list-wrap{
		
		padding: 50px;
	}
</style>

<br>
<br>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  

  <div class="collapse navbar-collapse" id="navbarColor03">
    <ul class="navbar-nav ">
     <li class="nav-item">
        <a class="nav-link" href="#">내호텔</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">호텔매출</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">비워놓기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">비워놓기</a>
      </li>
    </ul>
    
  </div>
</nav>




<div align="center" class="hotel-list-wrap">
	<table class="table table-hamburg table-stripe">
		
		<tbody>
			<tr>
				<td style="width: 20px;" rowspan="3">
					<div class="form-group">
					    <div class="custom-control custom-checkbox">
					      <input type="checkbox" class="custom-control-input" id="customCheck1" >
					      <label class="custom-control-label" for="customCheck1"></label>
					    </div>
					</div>
				</td>
				<td rowspan="3" style="width: 180px;"><img src="https://via.placeholder.com/150"></td>
				<td>호텔명</td>
			</tr>
			<tr>
			
				<td >주소</td>
			</tr>
			<tr>
				
				<td>전화번호</td>
			</tr>
		</tbody>
	</table>
	<input class="btn btn-danger" type="button" name="#" value="호텔등록">
	<input class="btn btn-danger" type="button" name="#" value="선택삭제">
</div>




<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>











