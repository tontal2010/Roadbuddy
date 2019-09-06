<%--
  Created by IntelliJ IDEA.
  User: zGalactose
  Date: 22/8/2562
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@page import="net.roadbuddy.database.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%@ page import="net.roadbuddy.bean.LineNotify" %>
<jsp:useBean id="member_data"
             class="net.roadbuddy.bean.member" />

<jsp:setProperty property="*" name="member_data" />

<%

    memberDao memberDao = new memberDao();
    int status = 0;

    try {
        status = memberDao.registerEmployee(member_data);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        System.out.print("Error Number status = "+status);
    }

    if (status > 0) {

        System.out.print("You are successfully registered");
        String user1="user1";
        session.setAttribute("user1",user1);
        response.sendRedirect("registersuccess.jsp");
        String firstname1 = request.getParameter("firstName");
        String lastname1 = request.getParameter("lastName");
        String email1 = request.getParameter("email");
        LineNotify lineNotify = new LineNotify ();
        lineNotify.callEvent("RI9xqCovsaGvrjdtqgGy2Z3qkOqlr54z0C5MrShWG6D","\nมีการสมัครสมาชิกใหม่ \nชื่อ: "+firstname1+" "+lastname1+"\nEmail: "+email1);

    }
%>
</body>
</html>