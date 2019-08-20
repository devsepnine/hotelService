<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	footer{
		width: 100%;
	}
	.footer-info{
		margin-top:100px;
		background-color: #f0e1bf;
		width: 100%;
		text-align: center;
	}
</style>
</div>
</div>

<footer>
	<div class="footer-info">
		<p>copyright &copy;</p>
		<p>회원 번호 : ${sessionScope.no}</p>
		<p>회원 아이디 : ${sessionScope.ok}</p>
		<p>회원 권한 : ${sessionScope.auth}</p>
	</div>
</footer>

</body>
</html>