<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main page</title>
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
		<c:if test="${sessionScope.logged == null}">
			<a href="/loginForm">로그인</a> <a href="/regForm">회원가입</a>
		</c:if>
		<c:if test="${sessionScope.role eq 'ROLE_ADMIN'}">
			<h1>${sessionScope.logged}(관리자)님, 안녕하세요</h1>
			<a href="/admin/list">관리자 페이지</a>
			<a href="/logout">로그아웃</a>
		</c:if>
		<c:if test="${sessionScope.role eq 'ROLE_MEMBER'}">
			<h1>${sessionScope.logged}님, 안녕하세요</h1>
			<a href="/logout">로그아웃</a>
			<a href="/members/cart">장바구니</a>
		</c:if>
	</header>
	
	<!-- 비회원일 때 메인페이지 -->
	<c:if test="${sessionScope.logged == null}">
		<h2>!HOT! items</h2>
		 	<div class="hot_container">
			<c:forEach var="h" items="${hot }">
				<ul>
					<li>상품번호: ${h.pno }</li>
					<li>상품명: ${h.pname }</li>
					<li><a href="/members/mProdDetail?pno=${h.pno}" ><img src="/images/${h.filename }" alt="${h.pname }" width="150" height="200"></a></li>
					<li>가격: ${h.price }</li>
					<li>판매상태: ${h.saleState }</li>
				</ul>
			</c:forEach>
			</div>
		
		<h2>!NEW! items</h2>
			<div class="new_container">
				<c:forEach var="n" items="${n }">
					<ul>
						<li>상품번호: ${n.pno }</li>
						<li>상품명: ${n.pname }</li>
						<li><a href="/members/mProdDetail?pno=${n.pno}" ><img src="/images/${n.filename }" alt="${n.pname }" width="150" height="200"></a></li>
						<li>가격: ${n.price }</li>
						<li>판매상태: ${n.saleState }</li>
					</ul> 
				</c:forEach>
			</div>
	</c:if>	
	<!-- --------------------------------------------------------------------------------------- -->
	<!-- --------------------------------------------------------------------------------------- -->
	<!-- 회원일 때 메인페이지  -->
	<c:if test="${sessionScope.role eq 'ROLE_MEMBER'}">
		<h2>!HOT! items</h2>
		 	<div class="hot_container">
			<c:forEach var="h" items="${hot }">
				<ul>
					<li>상품번호: ${h.pno }</li>
					<li>상품명: ${h.pname }</li>
					<li><a href="/members/mProdDetail?pno=${h.pno}" ><img src="/images/${h.filename }" alt="${h.pname }" width="150" height="200"></a></li>
					<li>가격: ${h.price }</li>
					<li>판매상태: ${h.saleState }</li>
				</ul>
			</c:forEach>
			</div>
		
		<h2>!NEW! items</h2>
			<div class="new_container">
				<c:forEach var="n" items="${n }">
					<ul>
						<li>상품번호: ${n.pno }</li>
						<li>상품명: ${n.pname }</li>
						<li><a href="/members/mProdDetail?pno=${n.pno}" ><img src="/images/${n.filename }" alt="${n.pname }" width="150" height="200"></a></li>
						<li>가격: ${n.price }</li>
						<li>판매상태: ${n.saleState }</li>
					</ul> 
				</c:forEach>
			</div>
	</c:if>	
	<!-- --------------------------------------------------------------------------------------- -->
	<!-- --------------------------------------------------------------------------------------- -->
	<!-- 관리자일 때 메인페이지 -->
	<c:if test="${sessionScope.role eq 'ROLE_ADMIN'}">
		<h2>!HOT! items</h2>
		 	<div class="hot_container">
			<c:forEach var="h" items="${hot }">
				<ul>
					<li>상품번호: ${h.pno }</li>
					<li>상품명: ${h.pname }</li>
					<li><a href="/admin/aProdDetail?pno=${h.pno}" ><img src="/images/${h.filename }" alt="${h.pname }" width="150" height="200"></a></li>
					<li>가격: ${h.price }</li>
					<li>판매상태: ${h.saleState }</li>
				</ul>
			</c:forEach>
			</div>
		
		<h2>!NEW! items</h2>
			<div class="new_container">
				<c:forEach var="n" items="${n }">
					<ul>
						<li>상품번호: ${n.pno }</li>
						<li>상품명: ${n.pname }</li>
						<li><a href="/admin/aProdDetail?pno=${n.pno}" ><img src="/images/${n.filename }" alt="${n.pname }" width="150" height="200"></a></li>
						<li>가격: ${n.price }</li>
						<li>판매상태: ${n.saleState }</li>
					</ul> 
				</c:forEach>
			</div>
	</c:if>
</body>
</html>