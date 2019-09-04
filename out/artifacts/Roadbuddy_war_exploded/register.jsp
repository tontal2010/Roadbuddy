<%--
  Created by IntelliJ IDEA.
  User: zGalactose
  Date: 22/8/2562
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<%
    String errorMessage = (String) session.getAttribute("errorMessage");
    if (null !=errorMessage) { %>
<h4> <%=errorMessage %></h4>
<%}
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <style type="text/css">
        body{background-color: #3781c5 ;
            font-family: srinakharinwirot , sans-serif;
        }
    </style>
</head>
<body>
<center>
<table>
    <tr>
        <img src="./img/register.png" width="50%"/>
    </tr>
    <tr>
        <div style="float: contour;">
            <center>
                <form action="success.jsp" method="post">
                    <table style="with: 50%">
                        <tr>
                            <td>ชื่อ</td>
                        <!--      <td>ชื่อ</td>-->
                        <!--   <td><input type="text" name="firstName" /></td> -->
                            <td><input type="text" name="firstName" /></td>
                            <td></td> <td></td> <td></td> <td>นามสกุล</td>
                            <td><input type="text" name="lastName" /></td>
                        </tr>
                        <tr>

                        </tr>
                        <tr>
                            <td>อีเมล์</td>
                            <td><input type="text" name="email" /></td>
                        </tr>
                        <tr>
                            <td>รหัสผ่าน</td>
                            <td><input type="password" name="password" /></td>
                        </tr>
                        <tr>
                            <td>ยืนยันรหัสผ่าน</td>
                            <td><input type="password" name="confirmpassword" /></td>
                        </tr>
                        <tr>
                            <td>เพศ</td>
                            <td><input type="text" name="sex" /></td>
                        </tr>
                        <tr>
                            <td>วันเดือนปีเกิด</td>
                            <td><input type="text" name="borndate" /></td>
                        </tr>
                        <tr>
                            <td>เบอร์ติดต่อ</td>
                            <td><input type="text" name="contact" /></td>
                        </tr>
                        <tr>
                            <td>เบอร์ติดต่อ (กรณีฉุกเฉิน)</td>
                            <td><input type="text" name="emercontact" /></td>
                        </tr>
                    </table>
                    <br>
                    <input type="submit" value="Submit" /></form>
            </center>
        </div>
    </tr>
</table>
</center>

</body>

</html>