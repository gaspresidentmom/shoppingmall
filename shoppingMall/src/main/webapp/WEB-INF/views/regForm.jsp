<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 회원가입 페이지 </h2>
	<form action="/registMember" method="post">
		username <input type="text" name="username" placeholder="username을 입력하세요"><br>
		password <input type="password" name="pw" placeholder="비밀번호를 입력하세요"><br>
		연락처 <input type="text" name="tel" placeholder="연락처를 입력하세요"><br>
		role <select name="role">
			<option value="ROLE_MEMBER">회원</option>
			<option value="ROLE_ADMIN">관리자</option>
		</select><br>
		<input type="submit" value="등록하기">
	</form>
</body>
</html>