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
    <script>
        var loadFile = function(event) {
            var output = document.getElementById('output');
            output.src = URL.createObjectURL(event.target.files[0]);
            loca = URL.createObjectURL(event.target.files[0]);
            document.getElementById('userimg').style.display = 'none';
            document.getElementById('output').style.width = '150px';
            document.getElementById('output').style.heighth = '150px';
            document.getElementById('output').style.objectFit = 'cover';
            document.getElementById('imgup').style.display = 'block';
            document.getElementById('output').style.borderRadius = '50%';

            $(function() {
                var basic = $('#imgup').croppie({
                    viewport: {
                        width: 150,
                        height: 150,
                        type: 'circle'
                    }
                });
                basic.croppie('bind', {
                    url: loca,
                    points: [77, 469, 280, 739]
                });
                basic.croppie('result', 'html').then(function(html) {
                    // html is div (overflow hidden)
                    // with img positioned inside.
                });
            });
        };

    </script>
</head>
<body>
<div id="demo-basic"></div>
<div class="loginBox">
    <h2>Register</h2>
    <label for="file-input">
        <center><img class="user2" src="./img/user1.png" id="userimg"/></center>
    </label>
    <center><div style="width: 200px; height: 200px; display: none;" id="imgup"><img id="output"style="display: none"/></div><input accept="image/*" onchange="loadFile(event)" class="t1" id="file-input" type="file" /><!--<img src="./img/user1.png" class="user2">--></center>
    <br><br>

    <h3>Upload profile picture</h3>
    <button id="result" class="basic-result">Upload</button>
    <form action="success.jsp" method="post">



        <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>
