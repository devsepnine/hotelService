<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    
<style>
	.lisence_box{
		margin: auto;
		min-width: 400px;
		max-width: 500px;
		padding-top: 200px;
	}
</style>


	<div class="lisence_box">
        <form action="lisence" method="post">
            <input type="text" class="form-control" name="seller_lisence" placeholder="사업자 등록번호를 입력하세요" required  pattern="^[0-9]{10}$"><br>
            <input type="text" class="form-control" name="seller_name" placeholder="이름을 입력하세요"><br>
            <input type="submit" class="btn btn-danger btn-block" value="확인">
        </form>
	</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>