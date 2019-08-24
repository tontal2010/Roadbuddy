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