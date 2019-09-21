<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 21-Sep-19
  Time: 2:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Notifications- การแจ้งเตือน</title>
    <link rel="stylesheet" href="css_notifications.css">
    <link rel="stylesheet" href= "https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><title>Title</title>
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
    <h1>Notifications | การแจ้งเตือน</h1>
    <div class="notificationBox1">
        <table style="line-height: 5pt">
            <tr>
                <td>
                    <center><img src="./img/rating2.jpg" class="profile-img"/></center>
                </td>
                <td>
                    <h3>Pichichai Srijan</h3>
                    <p>ได้เริ่มติดตามคุณ</p>
                    <i class="fa fa-user-plus"></i>
                </td>
            </tr>
        </table>
    </div>
    <div class="notificationBox2">
        <table style="line-height: 5pt">
            <tr>
                <td>
                    <center><img src="./img/rating3.jpg" class="profile-img"/></center>
                </td>
                <td>
                    <h3>Kritsan Yawicgai</h3>
                    <p>ได้เริ่มติดตามคุณ</p>
                    <i class="fa fa-user-plus"></i>
                </td>
            </tr>
        </table>
    </div>
    <div class="notificationBox3">
        <table style="line-height: 5pt">
            <tr>
                <td>
                    <center><img src="./img/rating1.jpg" class="profile-img"/></center>
                </td>
                <td>
                    <h3>Rujira Pakdee</h3>
                    <p>ได้เริ่มติดตามคุณ</p>
                    <i class="fa fa-user-plus"></i>
                </td>
            </tr>
        </table>
    </div>
    <div class="notificationBox4">
        <table style="line-height: 5pt">
            <tr>
                <td>
                    <center><img src="./img/rating4.jpg" class="profile-img"/></center>
                </td>
                <td>
                    <h3>Pichichai Srijan</h3>
                    <p>ได้เริ่มติดตามคุณ</p>
                    <i class="fa fa-user-plus"></i>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
