<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 20-Oct-19
  Time: 8:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Profile-แก้ไขโปรไฟล์</title>
    <link rel="stylesheet" href="css_editprofile.css">
    <style>
        body{background: #e6e6e6;
            font-family: srinakharinwirot , sans-serif;
            font-size: 1em;
        }
    </style>
</head>
<body>
<nav>
    <div class="toggle">
        <i class="fa fa-bars menu" aria-hidden="true"></i>
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
    <h1>Edit Profile | แก้ไขโปรไฟล์ </h1>
    <center><img src="./img/rating2.jpg" width="200" height="200" class="profile-img" /></center>
    <p>Name</p><input type="text" name="name">
    <p>Bio</p><input type="text" name="name">
    <h3>ข้อมูลส่วนตัว</h3>
    <p>Phone number</p><input type="number" name="contact">
    <p>Emergency phone numbers</p><input type="number" name="emercontact">
    <p>Email</p><input type="email">
    <br>
    <input type="submit" value="Submit">
    <br>
    <br>
</div>
</body>
</html>
