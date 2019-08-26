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

<center><table>
    <tr id="header"><td><img src="./img/register.png" width=400 height=170/"></td></tr>
    <tr id="nav"><td>
        <img src="./img/layer1.png "width="1000" height="650/">
        <div style="position:absolute; top:280px; left:450px; width:300px; height:100px">
            <center>
            <h1>Test Register Form</h1>
            <form action="success.jsp" method="post">
                <table style="with: 50%">
                    <tr>
                        <td><h3>ชื่อ</h3></td>
                    </tr>
                  <!--      <td>ชื่อ</td>-->
                     <!--   <td><input type="text" name="firstName" /></td> -->
                    <tr>
                        <td><input type="text" name="firstName" /></td>
                    </tr>

                    <tr>
                        <td><h3>นามสกุล</h3></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="lastName" /></td>
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
                <input type="submit" value="Submit" /></form>
            </center>
        </div>
    </td></tr>
</table></center>




</body>

</html>