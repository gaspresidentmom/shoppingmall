<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container li{
		list-style-type:none;
	}
	.container ul{
		border-width: 2px;
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
		
		<h1>${sessionScope.logged}(관리자)님, 안녕하세요</h1>
		<a href="/admin/regProductForm">상품등록</a>
		<a href="/admin/list">상품리스트(수정, 삭제)</a>
		<% }%>
	</header>
	
	<% if(session.getAttribute("logged") != null && session.getAttribute("role").equals("ROLE_ADMIN")){ %>
	<!-- 관리자용 상품 디테일로 가기 -->
	<h2>!HOT! items</h2>
	 	<div class="container" >
		<c:forEach var="h" items="${hot }">
			<ul>
				<li>상품번호: ${h.pno }</li>
				<li>상품명: ${h.pname }</li>
				<li><a href="/admin/prodDetail?pno=${h.pno}" }><img src="/images/${h.filename }" alt="${h.pname }" width="150" height="200"></a></li>
				<li>가격: ${h.price }</li>
				<li>판매상태: ${h.saleState }</li>

			</ul>
		</c:forEach>
		</div>
	
	<h2>!NEW! items</h2>
		<div class="container">
			<c:forEach var="n" items="${n }">
				<ul>
					<li>상품번호: ${n.pno }</li>
					<li>상품명: ${n.pname }</li>
					<li><a href="/admin/prodDetail?pno=${n.pno}" }><img src="/images/${n.filename }" alt="${n.pname }" width="150" height="200"></a></li>
					<li>가격: ${n.price }</li>
					<li>판매상태: ${n.saleState }</li>
				</ul>
			</c:forEach>
		</div>
		<% }else if(session.getAttribute("logged") != null && session.getAttribute("role").equals("ROLE_MEMBER")){ %>
		<!-- 회원용 상품 디테일로 가기 -->
		<h2>!HOT! items</h2>
	 	<div class="container" >
		<c:forEach var="h" items="${hot }">
			<ul>
				<li>상품번호: ${h.pno }</li>
				<li>상품명: ${h.pname }</li>
				<li><a href="/members/prodDetail?pno=${h.pno}" }><img src="/images/${h.filename }" alt="${h.pname }" width="150" height="200"></a></li>
				<li>가격: ${h.price }</li>
				<li>판매상태: ${h.saleState }</li>

			</ul>
			
		</c:forEach>
	</div>
	
	<h2>!NEW! items</h2>
		<div class="container">
			<c:forEach var="n" items="${n }">
				<ul>
					<li>상품번호: ${n.pno }</li>
					<li>상품명: ${n.pname }</li>
					<li><a href="/members/prodDetail?pno=${n.pno}" }><img src="/images/${n.filename }" alt="${n.pname }" width="150" height="200"></a></li>
					<li>가격: ${n.price }</li>
					<li>판매상태: ${n.saleState }</li>
				</ul>
			</c:forEach>
		</div>
		<% } %>
</body>
</html>