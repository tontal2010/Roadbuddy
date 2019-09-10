<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 04-Sep-19
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8"%>
<style type="text/css">
    h3{
        color: red;
        font-size: 20px;
    }
</style>

<%
    String errorMessage = (String) session.getAttribute("errorMessage");
    if (null !=errorMessage) { %>
<h3> <%=errorMessage %></h3>
<%}
%>


<html>
<head>
    <title>Register-ลงทะเบียน</title>
    <link rel="stylesheet" href="css_register2.css">
    <style>
        body{font-family: srinakharinwirot , sans-serif;
        }
    </style>
</head>
<body>
<div class="loginBox">
    <h2>Register</h2>
    <form name="myForm" action="${pageContext.request.contextPath}/createUserProcess" method="post" onsubmit="return validateForm()">
        <p>Name</p><p><font size="3" color="red">${errorInNameMsg}</font></p>
        <input type="text" name="name" placeholder="Name" value="${user.name}" >
        <p>Lastname</p><p><font size="3" color="red">${errorInLNameMsg}</font></p>
        <input type="text" name="lastname" placeholder="Lastname" value="${user.lname}" >
        <SELECT name="sex" required><p><font size="3" color="red">${errorInSex}</font></p>
            <OPTION SELECTED value="">Gender</OPTION>
            <OPTION VALUE=male>male</OPTION>
            <OPTION VALUE=female>female</OPTION>
            <OPTION VALUE=other>other</OPTION>
        </SELECT>
        <br><br>
        <p>Phone number</p><p><font size="3" color="red">${errorInPnum}</font></p>
        <input type="number" name="contact" placeholder="Phone number" value="${user.pnum}" >
        <p>Emergency phone numbers</p><p><font size="3" color="red">${errorInEmernum}</font></p>
        <input type="number" name="emercontact" placeholder="Emergency phone numbers" value="${user.emerpnum}" >
        <p>Email</p><p><font size="3" color="red">${errorInEmail}</font></p>
        <input type="email" name="email" placeholder="Enter Email" value="${user.email}">
        <p>Password</p><p><font size="3" color="red">${errorInPassMsg}</font></p>
        <input type="password" name="password" placeholder="●●●●●●●●" pattern="\S+" value="${user.pass}">
        <p>Password again</p><p><font size="3" color="red">${errorInPass2Msg}</font></p>
        <input type="password" name="password2" placeholder="●●●●●●●●">

        <input type="submit" value="Submit" >
    </form>
</div>
<script>
    function validateForm() {
        var x = document.forms["myForm"]["password2"].value;
        var y = document.forms["myForm"]["password"].value;
        var firstnamevar = document.forms["myForm"]["firstName"].value;
         if (x !== y) {
            alert("กรุณากรอกรหัสผ่านทั้งสองให้ตรงกัน !");
            return false;
        }
         else{
             sendLineNotify();
         }
    }
    function sendLineNotify(){

    }
</script>
</body>
</html>
