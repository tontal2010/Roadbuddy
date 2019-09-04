<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@page import="net.roadbuddy.database.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <meta http-equiv="Refresh" content="5; url=login2.jsp" />
</head>
<%
    String user1 = (String) session.getAttribute("user1");
    if (null == user1) {
        session.setAttribute("errorMessage", "คุณต้องสมัครสมาชิกก่อน! ");
        response.sendRedirect("register2.jsp");
    }
%>
<body>
<div align="center">
    <h1>สมัครสมาชิกเสร็จสมบูรณ์</h1>
    <h2>เรากำลังพาท่านไปยังหน้าล็อคอิน . . .</h2>
</div>
<%
session.removeAttribute("user1");
%>
</body>
</html>