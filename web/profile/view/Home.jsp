<%@page import="net.roadbuddy.bean.Login_Bean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>Home</head>


<%
    Login_Bean obj_Login_Bean=(Login_Bean)session.getAttribute("user_session");
    if(obj_Login_Bean==null){
        session.setAttribute("login_message", "Please login first ");
%>
    <script type="text/javascript">
        window.location.href="https://roadbuddy.social/w/login2.jsp";
    </script>
<%
}else{
%>
<center>
    <h1>Home Page</h1>
    <table border="1">
        <tr>
            <td><a href="https://roadbuddy.social/w/user">Home</a> </td>
            <td><a href="https://roadbuddy.social/w/user-profile">Profile</a> </td>
            <td> Welcome <%=obj_Login_Bean.getEmail() %></td>
            <td>
                <a href="https://roadbuddy.social/w/Signoutcontroller">Log Out</a>
            </td>
        </tr>
    </table>
    <%
        }
    %>
</center>

</body>
</html>