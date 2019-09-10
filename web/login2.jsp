<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 04-Sep-19
  Time: 2:12 PM
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    h3{
        color: red;
        font-size: 20px;
    }
</style>

<%
    String errorMessage = (String) session.getAttribute("errorMessage");
    if (null !=errorMessage) { %>
<h3> <%=errorMessage %></h3>
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
    <form action="${pageContext.request.contextPath}/loginprocess" method="post">
        <p>Email</p><p><font size="3" color="red">${loginFailMsg}</font></p>
        <p><font size="3" color="red">${errorInNameMsg}</font></p>
        <input type="text" name="name" placeholder="Enter Email" value="${user.name}" autofocus>
        <p>Password</p><p><font size="3" color="red">${errorInPassMsg}</font> </p>
        <input type="password" name="password" placeholder="●●●●●●●●" value="${user.pass}">
        <input type="submit" name="Submit" value="Sign In">
        <a href="#"><u>Forget Password</u></a>
        <br>
        <a>If you not member , please register here</a>
        <a href="register2.jsp"><font color="#3781c5"><u>Register ?</u></font></a>
    </form>
</div>

</body>
</html>
