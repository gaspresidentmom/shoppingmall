<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>상품 수정</h2>
	<form action="/product/regist" method="post" enctype="multipart/form-data">
		상품명 <input type="text" name="pname" value="${product.pname }"><br>
		상품 이미지 <input type="file"	name="file"><br>
		가격 <input type="number" name="price"  value="${product.price }"><br>
		<select name="saleState" onclick="판매">
			<option value="판매">판매</option>
			<option value="품절">품절</option>
		</select>
		재고 <input type="number" name="stock"  value="${product.stock }"><br>
		제조회사 <input type="text" name="seller"  value="${product.seller }"><br>
		상품등록일<input type="datetime" name="regDate" value="${product.regDate }"readonly="readonly">
		<input type="submit" value="등록">
	</form>
	<a href="/">홈으로</a>
</body>
</html>