<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǰ ����Ʈ</title>
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
				<a href="/loginForm">�α���</a> <a href="/regForm">ȸ������</a>
			</c:when>
			<c:when test="${sessionScope.role eq 'ROLE_ADMIN'}">
				${sessionScope.logged}(������)��, �ȳ��ϼ��� <a href="/logout">�α׾ƿ�</a> 
				<a href="/admin/regProductForm">��ǰ���</a> <a href="/">Ȩ����</a>
			</c:when>
		</c:choose>
	</header>
<h2>��� ��ǰ ����Ʈ</h2>
	<div class="container">
		<c:forEach var="p" items="${plist }">
			<ul>
				<li>��ǰ��ȣ: ${p.pno } </li>
				<li>��ǰ��: ${p.pname }</li>
				<li><a href="/admin/aProdDetail?pno=${p.pno }"><img src="/images/${p.filename }" alt="${p.pname }" width="150" height="200"></a></li>
				<li>����: ${p.price }</li>
				<li>�Ǹ���: ${p.seller }</li>
				<li>�ǸŻ���: ${p.saleState }</li>
				<li>���: ${p.stock }</li>
				<li>���� �ֹ���: ${p.orderNum }</li>
				<li><a href="/admin/upProductForm?pno=${p.pno }">��ǰ ����</a></li>
				<li><a href="/admin/product/delete?pno=${p.pno }">��ǰ ����</a></li>
			</ul>
		</c:forEach>
	</div>
</body>
</html>