<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<c:choose>
			<c:when test="${sessionScope.logged == null}">
				<a href="/loginForm">로그인</a> <a href="/regForm">회원가입</a>
			</c:when>
			<c:when test="${sessionScope.role eq 'ROLE_MEMBER'}">
				${sessionScope.logged}님, 안녕하세요 <a href="/logout">로그아웃</a> 
				<a href="/members/cart">장바구니</a> <a href="/">홈으로</a>
			</c:when>
		</c:choose>
	</header>
	<h2>${product.pname } 상세정보</h2>
	<div class="container">
		<ul>
			<li>상품번호: ${product.pno }</li>
			<!-- <li>상품명: ${product.pname }</li> -->
			<li><img src="/images/${product.filename }" width="200" height="250"></li>
			<li>가격: ${product.price }</li>
			<li>판매자: ${product.seller }</li>
			<li>판매상태: ${product.saleState }</li>
			<li>재고: ${product.stock }</li>
			<li>누적 주문수: ${product.orderNum }</li>
			<li>
			<form action="/members/saveCart" method="post">
				<input type="hidden" name="pno" value="${product.pno }">
				<!-- <input type="hidden" name="username" value="${sessionScope.logged }"> -->
				수량<input type="number" name="quantity">
				<input type="submit" value="장바구니에 담기">
			</form>
			</li>
		</ul>
	</div>
</body>


</html>