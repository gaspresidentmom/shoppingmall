<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> LogIn Page </h2>
	
	<form action="/members/getLogin" method="post">
	username <input type="text" name="username" placeholder="username을 입력해주세요.">
	password <input type="password" name="pw" placeholder="비밀번호를 입력해주세요.">
	<input type="submit" value="로그인">
	</form>
</body>
</html>