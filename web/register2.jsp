<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 04-Sep-19
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register-ลงทะเบียน</title>
    <link rel="stylesheet" href="css_register1.css">
    <style>
        body{font-family: srinakharinwirot , sans-serif;
        }
    </style>
</head>
<body>
<div class="loginBox">
    <h2>Register</h2>
    <form>
        <p>Name</p>
        <input type="text" name="" placeholder="Name">
        <p>Lastname</p>
        <input type="text" name="" placeholder="Lastname">
        <SELECT>
            <OPTION SELECTED>Gender
            <OPTION VALUE=1>male
            <OPTION VALUE=2>female
            <OPTION VALUE=3>other
        </SELECT>
        <br><br>
        <p>Phone number</p>
        <input type="number" name="" placeholder="Phone number">
        <p>Emergency phone numbers</p>
        <input type="number" name="" placeholder="Emergency phone numbers">
        <p>Email</p>
        <input type="text" name="" placeholder="Enter Email">
        <p>Password</p>
        <input type="password" name="" placeholder="●●●●●●●●">
        <p>Password again</p>
        <input type="password" name="" placeholder="●●●●●●●●">

        <input type="submit" name="" value="Next">
        <input type="submit" name="" value="Back to login">
    </form>
</div>

</body>
</html>
