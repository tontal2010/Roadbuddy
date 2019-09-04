<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8"%>

<%
    String message=(String)session.getAttribute("login_message");
    if(message!=null){
%>
<h4> <%=message %></h4>
<%session.removeAttribute("login_message");%>
<%} %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>เข้าสู่ระบบ-login</title>
    <style type="text/css">
        body{background: #3781c5 ;
            font-family: srinakharinwirot , sans-serif;
        }
    </style>
</head>
<body>

<center>
<table>
    <tr>
        <img src="./img/signin.png" width="50%"/>
    </tr>
    <tr>
        <div align="center" style="position: absolute; top: 20%">
        <div  style="float: contour">
            <center>
                <div align="center" style="position: absolute; top: 40%">

                    <form action="profile/controller/Sign_in_controller.jsp" method="post">
                        <table style="with: 100%">
                            <tr>
                                <td><font size="6em"> Username</font></td>
                            </tr>
                            <tr>
                                <td><input type="text" name="email" /></td>
                            </tr>
                            <tr>
                                <td><font size="6em">Password</font></td>
                            </tr>
                            <tr>
                                <td><input type="password" name="password" /></td>
                            </tr>
                        </table>
                        <br>
                        <div style="float: contour">
                            <center> <input type="image" src="./img/bt_login.png" width="25%" alt="Submit"/></center>
                        </div>
                    </form>
                </div>
            </center>
        </div>
        </div>
    </tr>
    <tr>
         <center><font size="3em">If you not member , please register here</font></center>
        <center><a href="register.jsp"> Register ? </a></center>
    </tr>
</table>
</center>
</body>
</html>
