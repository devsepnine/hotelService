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
		<span>copyright &copy;</span>
		<span>회원 번호 : ${sessionScope.no}</span>
		<span>회원 아이디 : ${sessionScope.ok}</span>
		<span>회원 권한 : ${auth}</span>
		<br>
		<span>판매자 번호 : ${sessionScope.s_no}</span>
		<span>판매자 아이디 : ${sessionScope.s_ok}</span>
		<br>
		<span>세션 정보 : <%=session.getId()%>  <%=session.isNew() %></span><br>
		<span>동시접속자수 : ${applicationScope.usercnt}</span>

<script id="_waur7b">var _wau = _wau || []; _wau.push(["map", "a97laxk81m", "r7b", "308", "154", "dashmap", "spinner-orange"]);</script>
<script async src="//waust.at/m.js"></script>

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