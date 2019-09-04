<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 04-Sep-19
  Time: 2:12 PM
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
<%
    String login_message = (String) session.getAttribute("login_message");
    if (null !=login_message) { %>
<h3><span> <%=login_message %></span></h3>
<%
    session.removeAttribute("login_message");
%>
<%}
%>
<html>
<head>
    <title>login-เข้าสู่ระบบ</title>
    <link rel="stylesheet" href="css_login.css">
   <style>
        body{font-family: srinakharinwirot , sans-serif;
        }
    </style>
</head>
<body>
<div class="loginBox">
    <img src="./img/user1.png" class="user"/>
    <h2>log in here</h2>
    <form action="profile/controller/Sign_in_controller.jsp" method="post">
        <p>Email</p>

        <input type="text" name="email" placeholder="Enter Email">
        <p>Password</p>
        <input type="password" name="password" placeholder="●●●●●●●●">
        <input type="submit" name="Submit" value="Sign In">
        <a href="#">Forget Password</a>
        <br>
        <a>If you not member , please register here</a>
        <a href="register2.jsp">Register ?</a>
    </form>
</div>

</body>
</html>
