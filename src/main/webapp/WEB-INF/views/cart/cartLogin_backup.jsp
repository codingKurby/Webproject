<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cartLogin.jsp</title>
</head>
<body>
<h1>Login Page</h1>
<form method="post">
<p>ID : <input type="text" name="memberId"></p>
<p>PW : <input type="text" name="memberPw"></p>
<p><input type="submit" value="login"></p>
</form>

	<c:if test="${param.result eq 0}">
		<h1>로그인이 실패 하였습니다.</h1>
	</c:if>

</body>
</html>