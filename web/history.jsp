<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 21-Sep-19
  Time: 2:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>History-ประวัติการใช้งาน </title>
    <link rel="stylesheet" href="css_history.css">
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
    <h1>History | ประวัติการใช้งาน</h1>
    <div class="historyBox1">
        <table style="line-height: 15pt">
            <tr>
                <h3>Passenger</h3>
            </tr>
            <tr>
                <td><p>Go to </p></td> <td>Huahin</td>
            </tr>
            <tr>
                <td><p>Date </p></td><td>8 Sep 2019</td>
            </tr>
            <tr>
                <td><p>Time </p></td> <td> 18:30</td>
            </tr>
            <tr>
                <td><p>Buddy</p></td> <td>Pichitcahi Srijan , Rujira Pakdee</td>
            </tr>
        </table>
    </div>
    <div class="historyBox2">
        <table style="line-height: 15pt">
            <tr>
                <h3>Driver</h3>
            </tr>
            <tr>
                <td><p>Go to </p></td> <td>Huahin</td>
            </tr>
            <tr>
                <td><p>Date </p></td><td>10 Sep 2019</td>
            </tr>
            <tr>
                <td><p>Time </p></td> <td> 17:30</td>
            </tr>
            <tr>
                <td><p>Buddy</p></td> <td>Rujira Pakdee , Krisana Yawichai</td>
            </tr>
        </table>
    </div>
    <div class="historyBox3">
        <table style="line-height: 15pt">
            <tr>
                <h3>Passenger</h3>
            </tr>
            <tr>
                <td><p>Go to </p></td> <td>Paris</td>
            </tr>
            <tr>
                <td><p>Date </p></td><td>1 Sep 2019</td>
            </tr>
            <tr>
                <td><p>Time </p></td> <td> 10:30</td>
            </tr>
            <tr>
                <td><p>Buddy</p></td> <td>Natika Saosimma</td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
