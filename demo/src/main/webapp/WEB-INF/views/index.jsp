<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Index
<hr>
<div>
	<form action="/board/regBoardProc" method="post">
		<input type="text" name="comment" placeholder="Input comment....."><br>
		<input type="text" name="username" placeholder="Input writer id....."><br>
		<input type="submit" value="등록"	>
	</form>
</div>
</body>
</html>