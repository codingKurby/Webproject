<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>
<h1>상품 목록</h1>
<table border="1">
<tr><th>Name</th><th>Category</th><th>Price</th></tr>
<c:forEach var = "b" items="${data }">
<tr><td><a href="goodsListDetail?Id=${b.Id }">${b.Name }</a></td>
<td>${b.category }</td>
<td>${b.price }</td></tr>
</c:forEach>
</table>
</body>
</html>