<%--
  Created by IntelliJ IDEA.
  User: zGalactose
  Date: 6/9/2562
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <form id="placesearch" name="placesearch" onsubmit="myFunction()" action="driveradd.jsp">
        <input type="text" name="from" placeholder="From">
        <input type="text" name="to" placeholder="To">
        <input type="text" name="date" placeholder="Date">
        <input type="text" name="time" placeholder="Time">
        <input type="text" name="partnernum" placeholder="Number Passenger">
        <input type="image" src="./img/fids.png" name="submit" value="submit">
    </form>
</body>
</html>
