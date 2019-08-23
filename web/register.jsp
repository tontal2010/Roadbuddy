<%--
  Created by IntelliJ IDEA.
  User: zGalactose
  Date: 22/8/2562
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="utf-8"%>

<%
    String errorMessage = (String) session.getAttribute("errorMessage");
    if (null !=errorMessage) { %>
<h4> <%=errorMessage %></h4>
<%}
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>

<body>
<h1>Test Register Form</h1>
<form action="success.jsp" method="post">
    <table style="with: 50%">
        <tr>
            <td>First Name</td>
            <td><input type="text" name="firstName" /></td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td><input type="text" name="lastName" /></td>
        </tr>
        <tr>
            <td>UserName</td>
            <td><input type="text" name="username" /></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="password" name="password" /></td>
        </tr>
        <tr>
            <td>Address</td>
            <td><input type="text" name="address" /></td>
        </tr>
        <tr>
            <td>Contact No</td>
            <td><input type="text" name="contact" /></td>
        </tr>
    </table>
    <input type="submit" value="Submit" /></form>
</body>

</html>