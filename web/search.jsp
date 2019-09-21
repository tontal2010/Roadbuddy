<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 21-Sep-19
  Time: 12:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search-ค้นหา</title>
    <link rel="stylesheet" href="css_search.css">
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
    <h1 align="center">Result</h1><h2 align="center" >"คำที่ค้นหา"</h2>
    <div class="resultBox1" align="center">
        <table width="100%" >
            <tr>
                <td>
                    <center><img src="./img/rating2.jpg" class="profile-img"/></center>
                </td>
                <td>
                    <h3>Pichichai Srijan</h3>
                    <table>
                        <tr>
                            <td><p>Status </p></td><td><p>Driver</p></td>
                        </tr>
                        <tr>
                            <td><p>Frome</p></td><td><p>มหาวิทยาลัยศรีนครินทรวิโรฒ องครักษ์</p></td>
                        </tr>
                        <tr>
                            <td> <p>To</p></td><td><p>ฟิวเจอร์ปาร์ค รังสิต</p></td>
                        </tr>
                        <tr>
                            <td><p>Time</p></td><td><p>14:30</p></td>
                        </tr>
                        <tr>
                            <td><p>Date</p></td><td><p>15 Sep 2019</p></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div class="resultBox2" align="center">
        <table width="100%" >
            <tr>
                <td>
                    <center><img src="./img/rating2.jpg" class="profile-img"/></center>
                </td>
                <td>
                    <h3>Pichichai Srijan</h3>
                    <table>
                        <tr>
                            <td><p>Status </p></td><td><p>Driver</p></td>
                        </tr>
                        <tr>
                            <td><p>Frome</p></td><td><p>มหาวิทยาลัยศรีนครินทรวิโรฒ องครักษ์</p></td>
                        </tr>
                        <tr>
                            <td> <p>To</p></td><td><p>ฟิวเจอร์ปาร์ค รังสิต</p></td>
                        </tr>
                        <tr>
                            <td><p>Time</p></td><td><p>14:30</p></td>
                        </tr>
                        <tr>
                            <td><p>Date</p></td><td><p>15 Sep 2019</p></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

    </div>
</div>
</body>
</html>
