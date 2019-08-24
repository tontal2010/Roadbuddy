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
        body{background-image: url("./img/bg_login.png") ;
            font-family: srinakharinwirot , sans-serif;
        }
    </style>
</head>
<body>

<center><table>
    <tr id="header">
        <td><div style="position:absolute; top:130px; left:200px; width:400px; height:150px">
            <center><img src="./img/logo1.png" width="130%" style="float: right"/></center>
        </div>
        </td>
        <td></td>
        <td>
            <div style="position:absolute; top:520px; left:1000px; width:400px; height:150px">
                <center> <img src="./img/bt_login.png" width="50%" /></center>
            </div>
            <div style="position:absolute; top:95px; left:920px; width:400px; height:150px">
                <center> <img src="./img/signin.png" width="65%"/></center>
            </div>
            <div style="position:absolute; top:220px; left:940px; width:400px; height:150px">
                <center> <img src="./img/layer1signin.png" width="115%" /></center>
            </div>
            <div style="position:absolute; top:280px; left:960px; width:300px; height:100px">
                <center>
                    <div align="center">
                        <h1>Login Test</h1>
                        <form action="profile/controller/Sign_in_controller.jsp" method="post">
                            <table style="with: 100%">
                                <tr>
                                    <td>UserName</td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="username" /></td>
                                </tr>
                                <tr>
                                    <td>Password</td>
                                </tr>
                                <tr>
                                    <td><input type="password" name="password" /></td>
                                </tr>
                            </table>

                            <div style="position:absolute; top:250px; left:45px; width:400px; height:150px">
                                <center> <input type="image" src="./img/bt_login.png" width="160" height="50" alt="Submit"/></center>
                            </div>
                        </form>
                    </div>
                </center>
            </div>

        </td>
    </tr>
</table></center>




</body>
</html>
