<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 24-Aug-19
  Time: 4:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>home</title>
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
</head>
<body>
<img src="./img/header.png" width="100%" style="float: top"/>
<img src="./img/layerpost.png " width="100%" style="float: top">
<img src="./img/laayerhome2.png" width="100%" style="float: bottom">
<center><img src="./img/fids.png" width="13%" style="vertical-align: bottom" ></center>
<img src="./img/layerevent.png" width="100%" style="float: bottom"/>
<img src="./img/layeradvie.png" width="100%" style="float: bottom"/>
<img src="./img/layerpostdriver.png" width="100%" style="float: bottom"/>
<form id="placesearch" name="placesearch" onsubmit="myFunction()">
    <input type="text" name="from" placeholder="From">
    <input type="text" name="to" placeholder="To">
    <input type="image" src="./img/fids.png" name="submit" value="submit">
</form>
</body>
</html>
