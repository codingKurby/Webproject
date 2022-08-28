<%@page import="com.spring.bread.model.MemberVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<%
List<MemberVo> data = (List<MemberVo>)request.getAttribute("data");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>list test</h1>
<table border=1>
<tr><th>id</th><th>name</th></tr>
<%for(MemberVo v:data){ %>
<tr><td><%=v.getMemberId() %></td><td><%=v.getMemberName() %></td></tr>
<%} %>
</table>


</body>
</html>