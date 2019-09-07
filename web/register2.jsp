<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 04-Sep-19
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<style>
    h3{
        text-align: center;
    }
    h3 span {
        background-color: red;
    }
</style>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String errorMessage = (String) session.getAttribute("errorMessage");
    if (null !=errorMessage) { %>
<h3><span> <%=errorMessage %></span></h3>
<%
    session.removeAttribute("errorMessage");
    %>
<%}
%>
<html>
<head>
    <title>Register-ลงทะเบียน</title>
    <link rel="stylesheet" href="css_register2.css">
    <style>
        body{font-family: srinakharinwirot , sans-serif;
        }
    </style>
</head>
<body>
<div class="loginBox">
    <h2>Register</h2>
    <form action="success.jsp" method="post">
        <p>Name</p>
        <input type="text" name="firstName" placeholder="Name">
        <p>Lastname</p>
        <input type="text" name="lastName" placeholder="Lastname">
        <SELECT name="sex">
            <OPTION SELECTED>Gender
            <OPTION VALUE=male>male
            <OPTION VALUE=female>female
            <OPTION VALUE=other>other
        </SELECT>
        <br><br>
        <p>Phone number</p>
        <input type="number" name="contact" placeholder="Phone number">
        <p>Emergency phone numbers</p>
        <input type="number" name="emercontact" placeholder="Emergency phone numbers">
        <p>Email</p>
        <input type="text" name="email" placeholder="Enter Email">
        <p>Password</p>
        <input type="password" name="password" placeholder="●●●●●●●●">
        <p>Password again</p>
        <input type="password" name="" placeholder="●●●●●●●●">

        <input type="submit" value="Submit">
    </form>
</div>

</body>
</html>
