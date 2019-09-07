<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 04-Sep-19
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<style>
    h3{
        text-align: center;
    }
    h3 span {
        background-color: red;
    }
</style>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String errorMessage = (String) session.getAttribute("errorMessage");
    if (null !=errorMessage) { %>
<h3><span> <%=errorMessage %></span></h3>
<%
    session.removeAttribute("errorMessage");
    %>
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
    <form name="myForm" action="success.jsp" method="post" onsubmit="return validateForm()">
        <p>Name</p>
        <input type="text" name="firstName" placeholder="Name" required>
        <p>Lastname</p>
        <input type="text" name="lastName" placeholder="Lastname"required>
        <SELECT name="sex" required>
            <OPTION SELECTED value="">Gender</OPTION>
            <OPTION VALUE=male>male</OPTION>
            <OPTION VALUE=female>female</OPTION>
            <OPTION VALUE=other>other</OPTION>
        </SELECT>
        <br><br>
        <p>Phone number</p>
        <input type="number" name="contact" placeholder="Phone number" required>
        <p>Emergency phone numbers</p>
        <input type="number" name="emercontact" placeholder="Emergency phone numbers" required>
        <p>Email</p>
        <input type="email" name="email" placeholder="Enter Email" required>
        <p>Password</p>
        <input type="password" name="password" placeholder="●●●●●●●●" required pattern="\S+">
        <p>Password again</p>
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
