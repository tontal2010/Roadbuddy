<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 06-Sep-19
  Time: 7:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    String owner = session.getAttribute("owner").toString();
    String followdisplay = "block";
    String unfollowdisplay = "block";
    String messagedisplay = "block";
    String historydisplay = "block";
    String editdisplay = "block";
    if(owner.equals("1")) {
        followdisplay = "none";
        unfollowdisplay = "none";
        messagedisplay = "none";
        historydisplay = "block";
        editdisplay = "block";
    }
    if(owner.equals("0")) {
        followdisplay = "block";
        unfollowdisplay = "none";
        messagedisplay = "block";
        historydisplay = "block";
        editdisplay = "none";
    }
    String name = "",emerpnum="",bio = "",lname = "",email ="",pnum ="",fullimg ="",sex ="",byear ="",loginuser ="";
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
        emerpnum = session.getAttribute("emerpnum").toString();
        bio = session.getAttribute("bio").toString();

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
    <title>profile-โปรไฟล์</title>
    <link rel="stylesheet" href="css_profile2.css" type="text/css">
    <style>
        body{
            font-family: srinakharinwirot , sans-serif;
        }
    </style>
</head>
<body>
<nav>
    <div class="toggle">
        <i class="fa fa-bars menu" aria-hidden="true"></i>
    </div>
    <ul>
        <li><a href="home.jsp">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/profileprocess">Profile</a>
        <li><a href="#">Chat</a>
        <li><a href="notification.jsp">Notifications</a></li>
        <li><a href="${pageContext.request.contextPath}/logoutprocess">Log out</a>
    </ul>
</nav>

<div class="wrapper">
    <div class="container">
        <img src="<%=fullimg%>" alt="" class="profile-img">

        <div class="content">
            <div class="sub-content">
                <h1><%=name%> <%=lname%></h1>
                <span><%=bio%></span>
            </div>

            <br>
            <div class="sub-content2">
                <img src="./img/icon_age.png" width="25px"/><span> <%=year%> Years </span><br>
                <img src="./img/icon_gender.png" width="25px"/><span> <%=sex%></span><br>
                <img src="./img/icon_tel.png"width="25px"/><span> <%=pnum%></span><br>
                <img src="./img/icon_email.png"width="25px"/><span> <%=email%></span><br>
            </div>
            <br>
            <div class="btnAll" align="center">
                <button class="buttonFollow"  style="vertical-align:middle;display: <%=followdisplay%>;"><span>Follow</span> </button>
                <button class="buttonUnFollow"  style="vertical-align:middle;display: <%=unfollowdisplay%>;"><span>UnFollow</span> </button>
                <button class="buttonMessenger"  style="vertical-align:middle;display: <%=messagedisplay%>;"><span>Messenger</span> </button>
                <br>
                <button class="buttonHistory"  style="vertical-align:middle;display: <%=historydisplay%>;"><span>History</span> </button>
                <br>
                <button class="buttonEditProfile" onclick="window.location.href = 'edit_profile.jsp';"  style="vertical-align:middle;display: <%=editdisplay%>;"><span>Edit Profile</span> </button>

            </div>
        </div>
    </div>
</div>


</body>
</html>
