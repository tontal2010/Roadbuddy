<%--
  Created by IntelliJ IDEA.
  User: zGalactose
  Date: 22/8/2562
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="net.roadbuddy.database.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>

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
    }
%>
</body>
</html>