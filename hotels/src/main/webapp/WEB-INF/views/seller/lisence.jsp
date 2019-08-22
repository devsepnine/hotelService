<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
$(function() {
	$("input[name=lisencebtn]").prop("disabled", true).css(
			"background-color", "lightgray");
	
	$("input[name=seller_lisence]").blur(
		function() {
			if($("input[name=seller_lisence]").val().length == 10){
				$.ajax({
					url : "lisence_check",
					data : {
						seller_lisence : $("input[name=seller_lisence]").val()
					},
					dataType : "text",
					success : function(resp) {
						if (resp == "N") {
							window.alert("이미 사용중인 사업자 번호입니다");
							$("input[name=seller_lisence]").val('');
							$("input[name=seller_lisence]").select();
							$("input[name=lisencebtn]").prop("disabled", true).css(
									"background-color", "lightgray");
						}
						else {
							window.alert("사용 가능한 사업자번호입니다")
							$("input[name=lisencebtn]").prop("disabled", false)
														.css("background-color", "#726454");
						}
					}
				});
			}else{
				$("input[name=lisencebtn]").prop("disabled", true).css(
						"background-color", "lightgray");
			}
		});
});
</script>
    
<style>
	.lisence_box{
		margin: auto;
		min-width: 400px;
		max-width: 500px;
		padding-top: 200px;
	}
	.lisence_check_btn{
		width: 100%;
		
	}
</style>


	<div class="lisence_box container">
        <form action="lisence" method="post">
            		<input type="text" class="form-control" name="seller_lisence" placeholder="사업자 등록번호를 입력하세요" required  pattern="^[0-9]{10}$">
            <input type="text" class="form-control" name="seller_name" placeholder="이름을 입력하세요" required><br>
            <input type="submit" class="btn btn-danger btn-block" name="lisencebtn" value="확인">
        </form>
	</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>