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
    if ((session.getAttribute("login") == "yes")){
        response.sendRedirect("home.jsp");
    }

    String src = "./img/user1.png";
    try{
        src = session.getAttribute("img").toString();
        System.out.println(src);

    }catch (NullPointerException e){
        src = "./img/user1.png";
    }




%>
<%

    String errorMessage = (String) session.getAttribute("errorMessage");
    if (null !=errorMessage) { %>
<h3> <%=errorMessage %></h3>
<%}
    session.removeAttribute("errorMessage");
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
    <img src="<%=src%>" class="user"/>
    <h2>log in here</h2>
    <form action="${pageContext.request.contextPath}/loginprocess" method="post">
        <p>Email</p><p><font size="3" color="red">${loginFailMsg}</font></p>
        <p><font size="3" color="red">${errorInNameMsg}</font></p>
        <input type="text" name="email" placeholder="Enter Email" value="${user.email}" autofocus>
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
