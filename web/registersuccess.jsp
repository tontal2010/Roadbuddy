<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="utf-8"%>
<%@page import="net.roadbuddy.database.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<%
    String username = (String) session.getAttribute("username");
    if (null == username) {
        session.setAttribute("errorMessage", "คุณต้องสมัครสมาชิกก่อน! ");
        response.sendRedirect("register.jsp");
    }
%>
<body>
<div align="center">
    <h1>You have register successfully</h1>
</div>
<a href="login.jsp">Login</a>
</body>
</html>