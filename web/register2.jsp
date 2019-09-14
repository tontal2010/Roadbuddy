<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 04-Sep-19
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8"%>
<style type="text/css">
    h3{
        color: red;
        font-size: 20px;
    }
</style>
<%
    if ((session.getAttribute("login") == "yes")){
        response.sendRedirect("home.jsp");
    }
%>
<%
    String errorMessage = (String) session.getAttribute("errorMessage");
    if (null !=errorMessage) { %>
<h3> <%=errorMessage %></h3>
<%}
    session.removeAttribute("errorMessage");
%>


<html>
<head>
    <title>Register-ลงทะเบียน</title>
    <link rel="stylesheet" href="css_register2.css">
    <style>
        body{font-family: srinakharinwirot , sans-serif;
        }
    </style>
</head>
<body>
<div class="loginBox">
    <h2>Register</h2>
    <form name="myForm" action="${pageContext.request.contextPath}/createUserProcess" method="post" onsubmit="return validateForm()">
        <p>Name</p><p><font size="3" color="red">${errorInNameMsg}</font></p>
        <input type="text" name="name" placeholder="Name" value="${user.name}" >
        <p>Lastname</p><p><font size="3" color="red">${errorInLNameMsg}</font></p>
        <input type="text" name="lastname" placeholder="Lastname" value="${user.lname}" >
        <SELECT name="sex" required><p><font size="3" color="red">${errorInSex}</font></p>
            <OPTION SELECTED value="">Gender</OPTION>
            <OPTION VALUE=Male>male</OPTION>
            <OPTION VALUE=Female>female</OPTION>
            <OPTION VALUE=Other>other</OPTION>
        </SELECT>
        <br>
        <p> Brith Day </p>
        <select name="day">
            <OPTION SELECTED value="" >Day</OPTION>
            <OPTION VALUE=1>1</OPTION>
            <OPTION VALUE=2>2</OPTION>
            <OPTION VALUE=3>3</OPTION>
            <OPTION VALUE=4>4</OPTION>
            <OPTION VALUE=5>5</OPTION>
            <OPTION VALUE=6>6</OPTION>
            <OPTION VALUE=7>7</OPTION>
            <OPTION VALUE=8>8</OPTION>
            <OPTION VALUE=9>9</OPTION>
            <OPTION VALUE=10>10</OPTION>
            <OPTION VALUE=11>11</OPTION>
            <OPTION VALUE=12>12</OPTION>
            <OPTION VALUE=13>13</OPTION>
            <OPTION VALUE=14>14</OPTION>
            <OPTION VALUE=15>15</OPTION>
            <OPTION VALUE=16>16</OPTION>
            <OPTION VALUE=17>17</OPTION>
            <OPTION VALUE=18>18</OPTION>
            <OPTION VALUE=19>19</OPTION>
            <OPTION VALUE=20>20</OPTION>
            <OPTION VALUE=21>21</OPTION>
            <OPTION VALUE=22>22</OPTION>
            <OPTION VALUE=23>23</OPTION>
            <OPTION VALUE=24>24</OPTION>
            <OPTION VALUE=25>25</OPTION>
            <OPTION VALUE=26>26</OPTION>
            <OPTION VALUE=27>27</OPTION>
            <OPTION VALUE=28>28</OPTION>
            <OPTION VALUE=29>29</OPTION>
            <OPTION VALUE=30>30</OPTION>
            <OPTION VALUE=31>31</OPTION>
        </select>
        <select name="month">
            <OPTION SELECTED value="" >Months</OPTION>
            <OPTION VALUE=January>January</OPTION>
            <OPTION VALUE=February>February</OPTION>
            <OPTION VALUE=March>March</OPTION>
            <OPTION VALUE=April>April</OPTION>
            <OPTION VALUE=May>May</OPTION>
            <OPTION VALUE=June>June</OPTION>
            <OPTION VALUE=July>July</OPTION>
            <OPTION VALUE=August>August</OPTION>
            <OPTION VALUE=September>September</OPTION>
            <OPTION VALUE=October>October</OPTION>
            <OPTION VALUE=November>November</OPTION>
            <OPTION VALUE=December>December</OPTION>
        </select>
        <select name="year">
            <option selected value="" >Year</option>
            <OPTION VALUE=2019>2019</OPTION>
            <OPTION VALUE=2020>2020</OPTION>
            <OPTION VALUE=2021>2021</OPTION>
            <OPTION VALUE=2022>2022</OPTION>
            <OPTION VALUE=2022>2023</OPTION>
            <OPTION VALUE=2024>2024</OPTION>
            <OPTION VALUE=2025>2025</OPTION>
            <OPTION VALUE=2026>2026</OPTION>
            <OPTION VALUE=2027>2027</OPTION>
            <OPTION VALUE=2028>2028</OPTION>
            <OPTION VALUE=2029>2029</OPTION>
            <OPTION VALUE=2030>2030</OPTION>
            <OPTION VALUE=2031>2031</OPTION>
            <OPTION VALUE=2032>2032</OPTION>
        </select>
        <br><br>
        <p>Phone number</p><p><font size="3" color="red">${errorInPnum}</font></p>
        <input type="number" name="contact" placeholder="Phone number" value="${user.pnum}" >
        <p>Emergency phone numbers</p><p><font size="3" color="red">${errorInEmernum}</font></p>
        <input type="number" name="emercontact" placeholder="Emergency phone numbers" value="${user.emerpnum}" >
        <p>Email</p><p><font size="3" color="red">${errorInEmail}</font></p>
        <input type="email" name="email" placeholder="Enter Email" value="${user.email}">
        <p>Password</p><p><font size="3" color="red">${errorInPassMsg}</font></p>
        <input type="password" name="password" placeholder="●●●●●●●●" pattern="\S+" value="${user.pass}">
        <p>Password again</p><p><font size="3" color="red">${errorInPass2Msg}</font></p>
        <input type="password" name="password2" placeholder="●●●●●●●●">

        <input type="submit" value="Submit" >
    </form>
</div>
<script>
    function validateForm() {
        var x = document.forms["myForm"]["password2"].value;
        var y = document.forms["myForm"]["password"].value;
        var firstnamevar = document.forms["myForm"]["firstName"].value;
         if (x !== y) {
            alert("กรุณากรอกรหัสผ่านทั้งสองให้ตรงกัน !");
            return false;
        }
         else{
             sendLineNotify();
         }
    }
    function sendLineNotify(){

    }
</script>
</body>
</html>
