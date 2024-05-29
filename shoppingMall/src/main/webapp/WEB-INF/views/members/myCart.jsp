<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cartView</title>
<style>
	.container li{
		list-style-type:none;
	}
</style>
</head>
<body>
	<header>
		<% if(session.getAttribute("logged") == null){ %>
			
			<a href="/members/loginForm">로그인</a>
			<a href="/members/regForm">회원가입</a>
			<a href="/main">홈으로</a>
		<% } else{ %>
			${sessionScope.logged}님, 안녕하세요
			<a href="/members/logout">로그아웃</a>
			<a href="/">홈으로</a>
		<% }%> 
	</header>
	
	<h2>${sessionScope.logged}님의 장바구니</h2>
	<div class="cartContainer">
	<c:forEach var="c" items=${cartList }>
		<ul>
			<li>상품번호: ${c.pno }</li>
			<li>상품명: ${c.pname }</li>
			<li><a href="/product/detail?pno=${c.pno}" }><img src="/images/${c.file }" alt="${h.pname }" width="150" height="200"></a></li>
			<li>가격: ${c.price }</li>
			<li>판매상태: ${c.saleState }</li>
			<li>수량: ${c.quantity }</li>
			<li>결제수단: ${c.payment }</li>
		</ul>
	</c:forEach>
	</div>
</body>
</html>