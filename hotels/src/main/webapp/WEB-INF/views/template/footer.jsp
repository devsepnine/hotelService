<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	footer{
		width: 100%;
	}
	.footer-info{
		margin-top:100px;
		background-color: #716353;
		width: 100%;
		text-align: center;
		color: white;
	}
	.footer-local{
		background-color:#c9c6be;
		text-align: right;
	}
	.footer-local > ul{
		list-style: none;
	}
	.footer-local > ul > li{
		display: inline-block;
	}
</style>
</div>
<footer>
	<div class="footer-info">
		<p>copyright &copy;</p>
		<p>회원 번호 : ${sessionScope.no}</p>
		<p>회원 아이디 : ${sessionScope.ok}</p>
		<p>회원 권한 : ${auth}</p>
	</div>
	<div class="footer-local">
		<ul>
			<li>이용 약관</li>
			<li>개인정보처리방침</li>
			<li>이메일무단수집금지</li>
			<li>윤리경영</li>
		</ul>
	</div>
</footer>
</div>



</body>
</html>