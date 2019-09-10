<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: zGalactose
  Date: 6/9/2562
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String uname = (String) session.getAttribute("login");
    if (null == uname) {
        session.setAttribute("errorMessage", "กรุุณาเข้าสู่ระบบก่อน !");
        response.sendRedirect("login2.jsp");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <style>
        body{background: #e6e6e6;
            font-family: srinakharinwirot , sans-serif;
            font-size: 1em;
        }
        input[type="text"]{
            border: none;
            border-bottom: 5px solid chartreuse ;
            background: transparent;
            outline: none ;
            height: 40px;
            width: 300px;
            color: black;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
        }
    </style>
    <form id="placesearch" name="placesearch" action="${pageContext.request.contextPath}/createPlaceProcess" method="post">
        <p><font size="3" color="red">${errorInNameMsg}</font></p>
        <p><font size="3" color="red">${errorInPassMsg}</font></p>
        <input type="text" name="from" placeholder="From" value="${user.from}"><p><font size="3" color="red">${errorInFrom}</font></p>
        <input type="text" name="to" placeholder="To" value="${user.too}"><p><font size="3" color="red">${errorInToo}</font></p>
        <input type="text" name="date" placeholder="Date" value="${user.date}"><p><font size="3" color="red">${errorInDate}</font></p>
        <input type="text" name="time" placeholder="Time" value="${user.time}"><p><font size="3" color="red">${errorInTime}</font></p>
        <input type="text" name="number" placeholder="Number Passenger" value="${user.number}"><p><font size="3" color="red">${errorInNumber}</font></p>
        <input type="image" src="./img/fids.png" name="submit" value="submit">
    </form>
</body>
</html>
