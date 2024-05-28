<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	<h2>!HOT! items</h2>
	 
	
	
	
	<h2>!NEW! items</h2>
</body>
</html>