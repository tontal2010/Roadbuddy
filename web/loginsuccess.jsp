<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="net.roadbuddy.database.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<%
    String username = (String) session.getAttribute("username");
    if (null == username) {
        session.setAttribute("errorMessage", "คุณต้องทำการเข้าสู่ระบบก่อน ! ");
        response.sendRedirect("login.jsp");
    }
%>
<body>
<div align="center">
    <h1>ยินดีด้วยล็อคอินสำเร็จ</h1>
</div>
<a href="login2.jsp">Login</a>
</body>
</html>