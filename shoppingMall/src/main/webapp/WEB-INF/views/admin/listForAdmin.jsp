<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품 리스트</title>
<style>
	.container{
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
				<a href="/admin/regProductForm">상품등록</a> <a href="/">홈으로</a>
			</c:when>
		</c:choose>
	</header>
<h2>등록 상품 리스트</h2>
	<div class="container">
		<c:forEach var="p" items="${plist }">
			<ul>
				<li>상품번호: ${p.pno } </li>
				<li>상품명: ${p.pname }</li>
				<li><a href="/admin/aProdDetail?pno=${p.pno }"><img src="/images/${p.filename }" alt="${p.pname }" width="150" height="200"></a></li>
				<li>가격: ${p.price }</li>
				<li>판매자: ${p.seller }</li>
				<li>판매상태: ${p.saleState }</li>
				<li>재고: ${p.stock }</li>
				<li>누적 주문수: ${p.orderNum }</li>
				<li><a href="/admin/upProductForm?pno=${p.pno }">상품 수정</a></li>
				<li><a href="/admin/product/delete?pno=${p.pno }">상품 삭제</a></li>
			</ul>
		</c:forEach>
	</div>
</body>
</html>