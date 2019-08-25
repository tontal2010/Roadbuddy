<%@page import="net.roadbuddy.bean.Login_Bean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDX5ul9vrBlK9cLLBuOTCSBTvSA2Vnr4bU&libraries=places&callback=initMap"
            async defer></script>
    <script>
        var autocomplete;
        function initialize() {
            autocomplete = new google.maps.places.Autocomplete(
                /** @type {HTMLInputElement} */(document.getElementById('autocomplete')),
                { types: ['geocode'] });
            google.maps.event.addListener(autocomplete, 'place_changed', function() {
            });
        }
    </script>

</head>
<body onload="initialize()">
<div id="locationField" >
    <input id="autocomplete" placeholder="Enter your address" onFocus="geolocate()" type="text"></input>
</div>


<%
    Login_Bean obj_Login_Bean=(Login_Bean)session.getAttribute("user_session");
    if(obj_Login_Bean==null){
        session.setAttribute("login_message", "Please login first [CODE1]");
%>
<script type="text/javascript">
    window.location.href="https://roadbuddy.social/index.jsp";
</script>
<%
}else{
%>
<center>
    <h1>Home Page</h1>
    <table border="1">
        <tr>
            <td><a href="https://roadbuddy.social/user-home-page">Home</a> </td>
            <td><a href="https://roadbuddy.social/user-profile">Profile</a> </td>
            <td> Welcome <%=obj_Login_Bean.getEmail() %></td>
            <td>
                <a href="https://roadbuddy.social/Signoutcontroller">Log Out</a>
            </td>
        </tr>
    </table>
    <%
        }
    %>
</center>

</body>
</html>