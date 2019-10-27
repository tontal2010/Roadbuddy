<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 20-Oct-19
  Time: 8:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
   String status =  (String) session.getAttribute("updateuser");
   if (status == null){
       status = "none";
   }
   session.removeAttribute("updateuser");
   System.out.println("status = "+status);
String name = "",id="",bio = "",emerpnum = "",lname = "",email ="",pnum ="",fullimg ="",sex ="",byear ="",loginuser ="";
    int year=0;

    try {

        loginuser = session.getAttribute("loginUser").toString();
        session.setAttribute("loginUser",loginuser);
        name = session.getAttribute("name").toString();
        lname = session.getAttribute("lname").toString();
        email = session.getAttribute("email").toString();
        pnum = session.getAttribute("pnum").toString();
        sex = session.getAttribute("sex").toString();
        byear = session.getAttribute("year").toString();
        fullimg = session.getAttribute("imgfull").toString();
        bio = session.getAttribute("bio").toString();
        id = session.getAttribute("id").toString();
        emerpnum = session.getAttribute("emerpnum").toString();
        Integer result = Integer.valueOf(byear);
        System.out.println("byear = "+ byear + "result" +result );
        int thisy=2019;
        year = thisy - result;
        System.out.println("year = "+year);
    }catch (NullPointerException e){
        e.printStackTrace();
        session.setAttribute("errorMessage", "Please relogin !");
        response.sendRedirect("login2.jsp");
    }
%>
<html>
<head>
    <title>Edit Profile-แก้ไขโปรไฟล์</title>
    <link rel="stylesheet" href="css_editprofile.css">
    <style>
        body{background: #e6e6e6;
            font-family: srinakharinwirot , sans-serif;
            font-size: 1em;
        }


        .modal {
             /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 20% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */
        }
        hz{
           size: 150px;
            font-weight: bold;
            color: #1b66ff;
            position: center;
        }

    </style>
    <script>
        var delayInMilliseconds = 5000;
        window.onload = function() {
            setTimeout(function() {
                document.forms["<%=status%>"].submit();
            }, delayInMilliseconds);

        };




    </script>
</head>
<body>
<nav>
    <div class="toggle">
        <i class="fa fa-bars menu" aria-hidden="true"></i>
    </div>
    <ul>
        <li><a href="home.jsp">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/profileprocess">Profile</a>
        <li><a href="chat.jsp">Chat</a>
        <li><a href="notification.jsp">Notifications</a></li>
        <li><a href="${pageContext.request.contextPath}/logoutprocess">Log out</a>
    </ul>
</nav>
<div class="modal" style="display: <%=status%>;">
    <div class="modal-content">
        <form name="block" action="${pageContext.request.contextPath}/profileprocess" method="get"></form>
        <hz>ทำการแก้ไขข้อมูลสำเร็จ !</hz>
        <h4>ระบบกำลังจะพาไปหน้า Profile . . .</h4>

    </div>
</div>
<div class="pageBox">
    <h1>Edit Profile | แก้ไขโปรไฟล์ </h1>
    <center><img src="<%=fullimg%>" width="200" height="200" class="profile-img" /></center>
    <form action="${pageContext.request.contextPath}/updateUserProcess" method="post">
    <p>Name</p><p><font size="3" color="red">${errorInNameMsg}</font></p><input type="text" name="name" value="<%=name%>">
    <p>LastName</p><p><font size="3" color="red">${errorInLNameMsg}</font></p><input type="text" name="lastname" value="<%=lname%>">
    <p>Bio</p><p><font size="3" color="red">${errorInBio}</font></p><input type="text" name="bio" value="<%=bio%>">
    <h3>ข้อมูลส่วนตัว</h3><input type="hidden" name="id" value="<%=id%>">
    <p>Phone number</p><p><font size="3" color="red">${errorInPnum}</font></p><input type="number" name="contact" value="<%=pnum%>">
    <p>Emergency phone numbers</p><p><font size="3" color="red">${errorInEmernum}</font></p><input type="number" name="emercontact" value="<%=emerpnum%>">
    <p>Email</p><p><font size="3" color="red">${errorInEmail}</font></p><input type="email" name="email" value="<%=email%>">
    <br>
    <input type="submit" value="Submit">
    </form>
    <br>
    <br>
</div>
</body>
</html>
