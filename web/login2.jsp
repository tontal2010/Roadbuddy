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
    <title>Insert title here</title>
    <style type="text/css">
        body{background-color: white ;
            font-family: srinakharinwirot , sans-serif;
        }
    </style>
</head>
<body>

<center><table>
    <tr id="header">
        <td><img src="./img/logo1.png" width="450" height="435"/> </td>
        <td><img src="./img/layer2signin.png" width="1000" height="1050" />
            <div style="position:absolute; top:280px; left:450px; width:300px; height:100px">
                <center>
                    <div align="center">
                    <h1>Login Test</h1>
                    <form action="profile/controller/Sign_in_controller.jsp" method="post">
                        <table style="with: 100%">
                            <tr>
                                <td>UserName</td>
                            </tr>
                            <tr>
                                <td><input type="text" name="user_name" /></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                            </tr>
                            <tr>
                                <td><input type="password" name="password" /></td>
                            </tr>
                            <tr><input type="submit" value="Submit" /></tr>

                        </table>
                       <!-- <input type="submit" value="Submit" /> -->
                        <table>
                            <tr>If you not member, please register here</tr>
                            <tr><a href="register.jsp"><U>Register ?</U></a></tr>
                        </table>
                    </form>
            </div>
                </center>
            </div>
        </td>
    </tr>
</table></center>




</body>
</html>