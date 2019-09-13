<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 06-Sep-19
  Time: 8:25 PM3
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register-ลงทะเบียน</title>
    <link rel="stylesheet" href="css_register3.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="croppie.css">
    <script src="croppie.js"></script>

    <style>
        .loginBox .t1 {
            display: none;
        }

        body{
            font-family: srinakharinwirot , sans-serif;
        }

    </style>

</head>
<body>
<div id="demo-basic"></div>
<div class="loginBox">
    <h2>Register</h2>
    <label for="upload">
        <center><img class="user2" src="./img/user1.png" id="userimg"/></center>
    </label>
    <center><div style="width: 200px; height: 200px; display: none;" id="upload-demo"><img id="output"style="display: none"/></div><input accept="image/*" onchange="loadFile(event)" class="t1" id="upload" type="file" /><!--<img src="./img/user1.png" class="user2">--></center>
    <br><br>

    <h3>Upload profile picture</h3>
    <button  class="upload-result">Upload</button>
    <form action="success.jsp" method="post">



        <input type="submit" value="Submit">
    </form>
</div>


<script src="./demo.js"></script>
<script>
    Demo.init();
</script>
</body>
</html>
