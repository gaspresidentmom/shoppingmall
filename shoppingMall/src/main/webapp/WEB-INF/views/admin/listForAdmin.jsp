<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǰ ����Ʈ</title>
<style>
	.container li{
		list-style-type:none;
	}
</style>
</head>
<body>
	<header>
		<% if(session.getAttribute("logged") == null){ %>
			
			<a href="/members/loginForm">�α���</a>
			<a href="/members/regForm">ȸ������</a>
		<% } else{ %>
			${sessionScope.logged}��, �ȳ��ϼ���
			<a href="/members/logout">�α׾ƿ�</a>
			<a href="/members/cart">��ٱ���</a>
		<% }%> 
		
		<% if(session.getAttribute("logged") != null && session.getAttribute("role").equals("ROLE_ADMIN")){ %>
		
		<h1>${sessionScope.logged}��, �ȳ��ϼ���</h1>
		<a href="/admin/regProductForm">��ǰ���</a>
		<a href="/admin/upProduct">��ǰ����</a>
		<a href="/admin/delProduct">��ǰ����</a>
		<% }%>
	</header>
<h2>��� ��ǰ ����Ʈ</h2>
	<div class="container">
		<c:forEach var="p" items="${plist }">
			<ul>
				<li>��ǰ��ȣ: ${p.pno } </li>
				<li>��ǰ��: ${p.pname }</li>
				<li><a href="/product/detail"><img src="/images/${p.filename }" alt="${p.pname }" width="150" height="200"></a></li>
				<li>����: ${p.price }</li>
				<li>�Ǹ���: ${p.seller }</li>
				<li>�ǸŻ���: ${p.saleState }</li>
				<li>���: ${p.stock }</li>
				<li>���� �ֹ���: ${p.orderNum }</li>
				<li><a href="/admin/upProductForm?pno=${p.pno }">��ǰ ����</a></li>
				<li><a href="/product/delete?pno=${p.pno }">��ǰ ����</a></li>
			</ul>
		</c:forEach>
	</div>
</body>
</html>