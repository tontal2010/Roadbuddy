<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 21-Sep-19
  Time: 2:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chat-สนทนา</title>
    <link rel="stylesheet" href="css_chat.css">
</head>
<body>

<nav>
    <div class="toggle">
    </div>
    <ul>
        <li><a href="home.jsp">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/profileprocess">Profile</a>
        <li><a href="chat.jsp">Chat</a>
        <li><a href="notification.jsp">Notifications</a></li>
        <li><a href="${pageContext.request.contextPath}/logoutprocess">Log out</a>
    </ul>
</nav>

<div class="pageBox">
    <h1>Chat | การสนทนา </h1>
</div>
</body>
</html>
