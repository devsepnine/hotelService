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
		<span>&copy; 2019 호텔델꾸와 HS.NY.WG.SH All rights reserved.<br>(주) 호텔델꾸와</span><br>
		<span>동시접속자수 : ${applicationScope.usercnt}</span><br>
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