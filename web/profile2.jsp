<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 06-Sep-19
  Time: 7:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String name = "",lname = "",email ="",pnum ="",fullimg ="",sex ="",byear ="",loginuser ="";
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

        Integer result = Integer.valueOf(byear);
        System.out.println("byear = "+ byear + "result" +result );
        int thisy=2019;
        year = thisy - result;
        System.out.println("year = "+year);
    }catch (NullPointerException e){
        e.printStackTrace();
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
        <li><a href="#">Notifications</a></li>
        <li><a href="${pageContext.request.contextPath}/logoutprocess">Log out</a>
        <li><a href="https://www.facebook.com/pg/RoadBuddyFriendly/about/">ROAD BUDDY</a></li>
    </ul>
</nav>

<div class="wrapper">
    <div class="container">
        <img src="<%=fullimg%>" alt="" class="profile-img">

        <div class="content">
            <div class="sub-content">
                <h1><%=name%> <%=lname%></h1>
                <span>เดินทาง กรุงเทพ หัวหิน ทุกวันศุกร์ ใครสนใจร่วมเดินทางติดต่อได้เลยค่ะ</span>
            </div>

            <br>
            <div class="sub-content2">
                <img src="./img/icon_age.png" width="25px"/><span> 19 Years </span><br>
                <img src="./img/icon_gender.png" width="25px"/><span> <%=sex%></span><br>
                <img src="./img/icon_tel.png"width="25px"/><span> <%=pnum%></span><br>
                <img src="./img/icon_email.png"width="25px"/><span> <%=email%></span><br>
            </div>
            <br>
            <div class="btnAll" align="center">
            <button class="btnFollowMe">Follow me</button> <br>
            <button class="btnMessenger">Messenger</button> <br>
            <button class="btnHistory">History</button>
            </div>
        </div>
    </div>
</div>


</body>
</html>
