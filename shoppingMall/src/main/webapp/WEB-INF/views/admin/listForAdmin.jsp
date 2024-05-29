<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품 리스트</title>
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
		<% } else{ %>
			${sessionScope.logged}님, 안녕하세요
			<a href="/members/logout">로그아웃</a>
			<a href="/members/cart">장바구니</a>
		<% }%> 
		
		<% if(session.getAttribute("logged") != null && session.getAttribute("role").equals("ROLE_ADMIN")){ %>
		
		<h1>${sessionScope.logged}님, 안녕하세요</h1>
		<a href="/admin/regProductForm">상품등록</a>
		<a href="/admin/upProduct">상품수정</a>
		<a href="/admin/delProduct">상품삭제</a>
		<% }%>
	</header>
<h2>등록 상품 리스트</h2>
	<div class="container">
		<c:forEach var="p" items="${plist }">
			<ul>
				<li>상품번호: ${p.pno } </li>
				<li>상품명: ${p.pname }</li>
				<li><a href="/product/detail"><img src="/images/${p.filename }" alt="${p.pname }" width="150" height="200"></a></li>
				<li>가격: ${p.price }</li>
				<li>판매자: ${p.seller }</li>
				<li>판매상태: ${p.saleState }</li>
				<li>재고: ${p.stock }</li>
				<li>누적 주문수: ${p.orderNum }</li>
				<li><a href="/admin/upProductForm?pno=${p.pno }">상품 수정</a></li>
				<li><a href="/product/delete?pno=${p.pno }">상품 삭제</a></li>
			</ul>
		</c:forEach>
	</div>
</body>
</html>