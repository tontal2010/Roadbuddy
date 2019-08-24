<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8"%>
<%
    String errorMessage = (String) session.getAttribute("errorMessage");
    if (null !=errorMessage) { %>
<h4> <%=errorMessage %></h4>
<%}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
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
            <center><img src="./img/logo1.png" width="500" height="480" style="float: right"/></center>
        </div>
        </td>
        <td></td>
        <td>
            <div style="position:absolute; top:520px; left:1000px; width:400px; height:150px">
                <center> <img src="./img/bt_login.png" width="160" height="50"/></center>
            </div>
            <div style="position:absolute; top:95px; left:920px; width:400px; height:150px">
                <center> <img src="./img/signin.png" width="260" height="135"/></center>
            </div>
            <div style="position:absolute; top:220px; left:940px; width:400px; height:150px">
                <center> <img src="./img/layer1signin.png" width="550" height="300"/></center>
            </div>
            <div style="position:absolute; top:280px; left:960px; width:300px; height:100px">
                <center>
                    <div align="center">
                    <h1>Login Test</h1>
                    <form action="<%=request.getContextPath()%>/login" method="post">
                        <table style="with: 100%">
                            <tr>
                                <td>UserName</td>
                                <td><input type="text" name="username" /></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><input type="password" name="password" /></td>
                            </tr>

                        </table>
                        <input type="submit" value="Submit" />
                    </form>
            </div>
                </center>
            </div>

        </td>
    </tr>
</table></center>




</body>
</html>