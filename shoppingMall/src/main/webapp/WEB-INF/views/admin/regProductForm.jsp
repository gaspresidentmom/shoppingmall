<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product registration</title>
</head>
<body>
	<h2>상품 등록</h2>
	<form action="/product/regist" method="post" enctype="multipart/form-data">
	상품명 <input type="text" name="pname" placeholder="상품명을 입력하세요"><br>
	상품 이미지 <input type="file"	name="file"><br>
	가격 <input type="number" name="price" placeholder="가격을 입력하세요"><br>
	<select name="saleState">
		<option value="sale">판매</option>
		<option value="outOfStock">품절</option>
	</select>
	재고 <input type="number" name="quantity" placeholder="재고량을 입력하세요"><br>
	제조회사 <input type="text" name="manufacturer" placeholder="제조회사명을 입력하세요"><br>
	<input type="submit" value="등록">
	
	</form>
	
</body>
</html>