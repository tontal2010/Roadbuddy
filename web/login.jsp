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
    <title>Insert titler here</title>
    <style type="text/css">
        body{background: #3781c5 ;
            font-family: srinakharinwirot , sans-serif;
        }
    </style>
</head>
<body>

<center>
            <div style="float: contour">
                <center> <img src="./img/signin.png" width="50%"/></center>
            </div>
            <div style="float: contour">
                <center>
                    <div align="center">

                        <form action="profile/controller/Sign_in_controller.jsp" method="post">
                            <table style="with: 100%">
                                <tr>
                                    <td>UserName</td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="email" /></td>
                                </tr>
                                <tr>
                                    <td>Password</td>
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
</center>
<div style="float: contour">
    <center> <font size="2em">If you not member , please register here</font> </center>
    <center><<a href="register.jsp"> Register ? </a></center>
</div>



</body>
</html>
