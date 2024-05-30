<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원용 상품 디테일</title>
<style>
.container li {
	list-style-type: none;
}
</style>
</head>
<body>
	<header>
		<%
		if (session.getAttribute("logged") == null) {
		%>

		<a href="/members/loginForm">로그인</a> <a href="/members/regForm">회원가입</a>
		<%
		} else {
		%>
		${sessionScope.logged}님, 안녕하세요 <a href="/members/logout">로그아웃</a> <a
			href="/members/cart">장바구니</a>
		<%
		}
		%>

	</header>
	<h2>${product.pname } 상세정보</h2>
	<div class="container">
		<ul>
			<li>상품번호: ${product.pno }</li>
			<li>상품명: ${product.pname }</li>
			<li><img src="/images/${product.filename }" alt="${product.pname }"
				width="200" height="250"></li>
			<li>가격: ${product.price }</li>
			<li>판매자: ${product.seller }</li>
			<li>판매상태: ${product.saleState }</li>
			<li>재고: ${product.stock }</li>
			<li>누적 주문수: ${product.orderNum }</li>
			<li>
			<form action="/members/saveCart" method="post">
				<input type="hidden" name="pno" value="${product.pno }">
				수량<input type="number" name="quantity">
				<input type="submit" value="장바구니에 담기">
			</form>
			</li>
		</ul>
	</div>
</body>


</html>