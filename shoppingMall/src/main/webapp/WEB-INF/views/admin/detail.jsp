<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 상품 디테일</title>
<style>
	.hot_container{
		display: flex;
		width: 1200px;
		justify-content: space-between;
		flex-wrap: wrap;
	}
	
	.new_container{
		display: flex;
		width: 1200px;
		justify-content: space-between;
		flex-wrap: wrap;
	}

	li{
		list-style-type:none;
	}
</style>
</head>
<body>
	<header>
		<c:choose>
			<c:when test="${sessionScope.logged == null}">
				<a href="/loginForm">로그인</a> <a href="/regForm">회원가입</a>
			</c:when>
			<c:when test="${sessionScope.role eq 'ROLE_ADMIN'}">
				${sessionScope.logged}(관리자)님, 안녕하세요 <a href="/logout">로그아웃</a> 
				<a href="/admin/regProductForm">관리자 페이지</a> <a href="/">홈으로</a>
			</c:when>
		</c:choose>
	</header>
	<h2>등록 상품 리스트</h2>
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
			<li><a href="/admin/upProductForm?pno=${product.pno }">상품 수정</a></li>
			<li><a href="/admin/product/delete?pno=${product.pno }">상품 삭제</a></li>
			<li>
		</ul>
	</div>
</body>
</html>