<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 20-Oct-19
  Time: 4:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = session.getAttribute("name").toString();
    String lname = session.getAttribute("lname").toString();
    String from = session.getAttribute("from").toString();
    String too = session.getAttribute("too").toString();
    String date = session.getAttribute("date").toString();
    String year = session.getAttribute("year").toString();
    String time = session.getAttribute("time").toString();
    String month = session.getAttribute("month").toString();
    String minute = session.getAttribute("minute").toString();
    String pic = session.getAttribute("pic").toString();
%>
<html>
<head>
    <title>join tavel - เข้าร่วมการเดินทาง</title>
    <link rel="stylesheet" href="css_jointavel.css">
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
<h1>ร่วมเดินทางจาก <%=from%> ไป <%=too%> </h1>
    <div class="tbJoin" align="center">
        <table width="100%" >
            <tr>
                <td>
                    <center><img src="<%=pic%>" class="profileDriver-img" /></center>
                </td>
                <td>
                    <h3><%=name%> <%=lname%></h3>
                    <table>
                        <tr>
                            <td><p>Status </p></td><td><p>Driver</p></td>
                        </tr>
                        <tr>
                            <td><p>Time</p></td><td><p><%=time%>:<%=minute%></p></td>
                        </tr>
                        <tr>
                            <td><p>Date</p></td><td><p><%=date%> <%=month%> <%=year%></p></td>
                        </tr>
                        <tr>
                            <td><p>Passenger</p><td><img src="./img/rating1.jpg" class="profilePassenger-img" /> <img src="./img/rating3.jpg" class="profilePassenger-img" /> <img src="./img/rating4.jpg" class="profilePassenger-img" /> </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br>
        <div class="btBack"  align="left">
            <button class="buttonBack"  style="vertical-align:middle"><span>BACK </span> </button>
        </div>
        <div class="btJoin" align="right" >
            <button class="buttonJoin" style="vertical-align:middle"><span>JOIN </span></button>
        </div>

    </div>
</div>


</body>
</html>
