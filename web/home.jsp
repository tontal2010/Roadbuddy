<%@ page import="java.util.jar.JarException" %><%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 24-Aug-19
  Time: 4:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8"%>
<%

    String uname = (String) session.getAttribute("login");
   if(uname == null) {
       session.setAttribute("errorMessage", "Access Denied !");
       response.sendRedirect("login2.jsp");
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
    <title>home-หน้าแรก</title>
    <link rel="stylesheet" href="css_home.css">
    <style>
        body{background: #e6e6e6;
        font-family: srinakharinwirot , sans-serif;
        font-size: 1em;
        }
    </style>
    <%
        String name = "";
        String email = "";
        String lname = "";
        String pnum = "";
        String img = "";
        String imgfull = "";
        String year = "";
        String sex = "";
        String month = "";
        String day = "";
        String id = "";
        String bio = "";
        String emerpnum = "";
        try {

            response.setCharacterEncoding("UTF-8");
            request.setCharacterEncoding("UTF-8");
        String loginDetail = session.getAttribute("loginUser").toString();
        System.out.println(loginDetail);
        int numslash = 1;
        int leng = loginDetail.length();

        for (int a = 0; a < leng; a++) {
            char s = loginDetail.charAt(a);

            if (s != '#') {

                if (numslash == 1) {
                    name = name + s;
                }
                if (numslash == 2) {
                    lname = lname + s;
                }
                if (numslash == 3) {
                    email = email + s;
                }
                if (numslash == 4) {
                    pnum = pnum + s;
                }
                if (numslash == 5) {
                    img = img + s;
                }
                if (numslash == 6) {
                    imgfull = imgfull + s;
                }
                if (numslash == 7) {
                    sex = sex + s;
                }
                if (numslash == 8) {
                    year = year + s;
                }
                if (numslash == 9) {
                    month = month + s;
                }
                if (numslash == 10) {
                    day = day + s;
                }
                if (numslash == 11) {
                    id = id + s;
                }
                if (numslash == 12) {
                    bio = bio + s;
                }
                if (numslash == 13) {
                    emerpnum= emerpnum + s;
                }
            } else {
                if (numslash == 1) {

                    System.out.println("string name = " + name);
                    numslash = numslash + 1;
                } else if (numslash == 2) {
                    System.out.println("string lname = " + lname);

                    numslash = numslash + 1;
                } else if (numslash == 3) {

                    System.out.println("string email = " + email);
                    numslash = numslash + 1;
                } else if (numslash == 4) {
                    System.out.println("string pnum = " + pnum);
                    numslash = numslash + 1;
                } else if (numslash == 5) {
                    System.out.println("string imgUpload = " + img);
                    numslash = numslash + 1;
                } else if (numslash == 6) {
                    System.out.println("string imgUploadFull = " + imgfull);
                    numslash = numslash + 1;
                } else if (numslash == 7) {
                    System.out.println("string Sex = " + sex);
                    numslash = numslash + 1;
                } else if (numslash == 8) {
                    System.out.println("string Year = " + year);
                    numslash = numslash + 1;
                } else if (numslash == 9) {
                    System.out.println("string Month = " + month);
                    numslash = numslash + 1;
                } else if (numslash == 10) {
                    System.out.println("string Day = " + day);
                    numslash = numslash + 1;
                }else if (numslash == 11) {
                    System.out.println("string ID = " + id);
                    numslash = numslash + 1;
                }else if (numslash == 12) {
                    System.out.println("string bio = " + bio);
                    numslash = numslash + 1;
                }else if (numslash == 13) {
                    System.out.println("string emerpnum = " + emerpnum);
                    numslash = numslash + 1;
                }
            }
        }
        session.setAttribute("email", email);
        if (img.equals("0")) {

            session.setAttribute("errorMessage", "Please add your image profile !");
            response.sendRedirect("register3.jsp");
        }
    }catch (NullPointerException e){
        e.printStackTrace();
        session.setAttribute("errorMessage", "Please relogin !");

    }


    %>


</head>
<body>
<!--<img src="./img/header.png" width="100%" tyle="float: top"/>-->
<!--<img src="./img/layerpost.png " width="100%" style="float: top">
<img src="./img/laayerhome2.png" width="100%" style="float: bottom">
<center><img src="./img/fids.png" width="13%" style="vertical-align: bottom" ></center>
<img src="./img/layerevent.png" width="100%" style="float: bottom"/>
<img src="./img/layeradvie.png" width="100%" style="float: bottom"/>
<img src="./img/layerpostdriver.png" width="100%" style="float: bottom"/>-->
<nav>
    <div class="toggle">
        <i class="fa fa-bars menu" aria-hidden="true"></i>
    </div>
    <ul>
        <li><a href="home.jsp">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/profileprocess">Profile</a>
        <li><a href="chat.jsp">Chat</a>
        <li><a href="notification.jsp">Notifications</a></li>
        <li> <input name="keyword" type="text" id="IdUser" size="25" />
            <input type="submit" name="iFind"  id="IdUserName"  /> </li>
        <li><a href="${pageContext.request.contextPath}/logoutprocess">Log out</a>
    </ul>
</nav>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

    var objectToPass= {keyword:document.getElementById("keyword").value};
    //define the whole function and assign to a variable
    function popUp() {

        //here, dynamicallly add items

        localStorage.setItem("keyword", document.getElementById("keyword").value);
        //......other items......

        popUpObj = window.open('${pageContext.request.contextPath}/search?keyword='+document.getElementById("keyword").value, 'Search Complete !', "toolbar=no,scrollbars=no,location=no,statusbar=no,menubar=no,titlebar=0,directories=0,resizable=0,width=400,height=400");
        popUpObj.focus();
    }


</script>
<center><p><font size="3" color="red">${errorInNotSelect}</font></p></center>
<% session.removeAttribute("errorInNotSelect");%>
<div class="postBox" align="center">

<form id="formsend1" action="${pageContext.request.contextPath}/createPlaceProcess" method="post">
    <input type="hidden" name="name" value="<%=name%>"/>
    <input type="hidden" name="email" value="<%=email%>"/>
    <input type="hidden" name="lastname" value="<%=lname%>"/>
    <input type="hidden" name="contact" value="<%=pnum%>"/>
    <input type="hidden" name="id" value="<%=id%>"/>
    <input type="hidden" name="imgfull" value="<%=imgfull%>"/>

    <table>
        <tr>
            <p><font size="3" color="red">${errorInFrom}</font></p><td> From <input type="text" name="from" value="${user.from}" placeholder="Ex FutureparkRangsit"><br></td><td>To </td><p><font size="3" color="red">${errorInToo}</font></p><td><input type="text" name="to" value="${user.too}"placeholder="Ex Ongkharak"></td>
        </tr>
        <tr>
            <td>
                Time <select name="time">
                <OPTION VALUE=00>00</OPTION>
                <OPTION VALUE=01>01</OPTION>
                <OPTION VALUE=02>02</OPTION>
                <OPTION VALUE=03>03</OPTION>
                <OPTION VALUE=04>04</OPTION>
                <OPTION VALUE=05>05</OPTION>
                <OPTION VALUE=06>06</OPTION>
                <OPTION VALUE=07>07</OPTION>
                <OPTION VALUE=08>08</OPTION>
                <OPTION VALUE=09>09</OPTION>
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
            </select>
                :
                <select name="minute">
                    <OPTION VALUE=00>00</OPTION>
                    <OPTION VALUE=01>01</OPTION>
                    <OPTION VALUE=02>02</OPTION>
                    <OPTION VALUE=03>03</OPTION>
                    <OPTION VALUE=04>04</OPTION>
                    <OPTION VALUE=05>05</OPTION>
                    <OPTION VALUE=06>06</OPTION>
                    <OPTION VALUE=07>07</OPTION>
                    <OPTION VALUE=08>08</OPTION>
                    <OPTION VALUE=09>09</OPTION>
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
                    <OPTION VALUE=32>32</OPTION>
                    <OPTION VALUE=33>33</OPTION>
                    <OPTION VALUE=34>34</OPTION>
                    <OPTION VALUE=35>35</OPTION>
                    <OPTION VALUE=36>36</OPTION>
                    <OPTION VALUE=37>37</OPTION>
                    <OPTION VALUE=38>38</OPTION>
                    <OPTION VALUE=39>39</OPTION>
                    <OPTION VALUE=40>40</OPTION>
                    <OPTION VALUE=41>41</OPTION>
                    <OPTION VALUE=42>42</OPTION>
                    <OPTION VALUE=43>43</OPTION>
                    <OPTION VALUE=44>44</OPTION>
                    <OPTION VALUE=45>45</OPTION>
                    <OPTION VALUE=46>46</OPTION>
                    <OPTION VALUE=47>47</OPTION>
                    <OPTION VALUE=48>48</OPTION>
                    <OPTION VALUE=49>49</OPTION>
                    <OPTION VALUE=50>50</OPTION>
                    <OPTION VALUE=51>51</OPTION>
                    <OPTION VALUE=52>52</OPTION>
                    <OPTION VALUE=53>53</OPTION>
                    <OPTION VALUE=54>54</OPTION>
                    <OPTION VALUE=55>55</OPTION>
                    <OPTION VALUE=56>56</OPTION>
                    <OPTION VALUE=57>57</OPTION>
                    <OPTION VALUE=58>58</OPTION>
                    <OPTION VALUE=59>59</OPTION>
                </select>
            </td>
            <td>Date</td>
            <td>
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
            </td>
        </tr>
        <tr>
            <td>Number of passengers <select name="number">
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
            </select>
            </td>
            <td></td>
            <td><button type="submit">Post</button></td>
        </tr>
    </table>
</form>
</div>
<form id="searh"  action="search.jsp">
<div class="findsBox" align="center">
    Find places that you will travel<br>
    <input type="hidden" name="email" value="<%=email%>"/>
    <input name="keyword" type="text" id="keyword" size="25" />
    <input type="submit" name="iFind"  id="iFind"  />
</div>
</form>
<div class="evenBox" align="center">
    Travel together on the upcoming events soon <br>
    <img src="./img/even11.jpg"width="155" height="155"/>
    <img src="./img/even12.jpg"width="155" height="155"/>
    <img src="./img/even13.jpg"width="155" height="155"/>
    <img src="./img/event3.jpg"width="155" height="155"/>
</div>

<div class="box" align="center">
    Introduce the driver<br>
    <div class="container">
        <table>
            <tr>
                <div class="row">
                    <td>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                            <div class="our-team">
                                <div class="picture">
                                    <img class="img-fluid" src="./img/rating1.jpg">
                                </div>
                                <div class="team-content">
                                    <h3 class="name">Michele Miller</h3>
                                    <h4 class="title">18 Female</h4>
                                </div>
                                <ul class="social">
                                    <p>Profile</p>
                                </ul>
                            </div>
                        </div>
                    </td>

                    <td>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                            <div class="our-team">
                                <div class="picture">
                                    <img class="img-fluid" src="./img/rating2.jpg">
                                </div>
                                <div class="team-content">
                                    <h3 class="name">Patricia Knott</h3>
                                    <h4 class="title">19 Male</h4>
                                </div>
                                <ul class="social">
                                    <p>Profile</p>
                                </ul>
                            </div>
                        </div>
                    </td>

                    <td>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                            <div class="our-team">
                                <div class="picture">
                                    <img class="img-fluid" src="./img/rating3.jpg">
                                </div>
                                <div class="team-content">
                                    <h3 class="name">Justin Ramos</h3>
                                    <h4 class="title">18 Male</h4>
                                </div>
                                <ul class="social">
                                    <p>Profile</p>
                                </ul>
                            </div>
                        </div>
                    </td>

                    <td>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                            <div class="our-team">
                                <div class="picture">
                                    <img class="img-fluid" src="./img/rating4.jpg">
                                </div>
                                <div class="team-content">
                                    <h3 class="name">Mary Huntley</h3>
                                    <h4 class="title">19 Female</h4>
                                </div>
                                <ul class="social">
                                    <p>Profile</p>
                                </ul>
                            </div>
                        </div>
                    </td>

                </div>
            </tr>


        </table>
    </div>
</div>

<div class="postDriverPassengerBox"  align="center" >
    Post

</div>

<!-- Get data from database -->
<!--<object type="text/html" data="fetch.jsp"  class="psPassenger" ></object> -->

<!-- NEWCODE -->
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="db.ChatDbOperations" %>
<%@ page import="javax.persistence.criteria.CriteriaBuilder" %>
<%


    String connectionUrl = "jdbc:mysql://167.71.211.97:3306/rb_2";
    String userid = "roadbuddy";
    String password = "roadbuddyadmin1";
    try {
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
    } catch (SQLException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    ArrayList<String> names = new ArrayList<String>();
    ArrayList<String> ids = new ArrayList<String>();
    ArrayList<String> lnames = new ArrayList<String>();
    ArrayList<String> from = new ArrayList<String>();
    ArrayList<String> too = new ArrayList<String>();
    ArrayList<String> time = new ArrayList<String>();
    ArrayList<String> minute = new ArrayList<String>();
    ArrayList<String> day2 = new ArrayList<String>();
    ArrayList<String> month2 = new ArrayList<String>();
    ArrayList<String> year2 = new ArrayList<String>();
    ArrayList<String> imgfull2 = new ArrayList<String>();
    try{
        connection = DriverManager.getConnection(connectionUrl, userid, password);
        statement=connection.createStatement();
        String sql ="select * from place";
        resultSet = statement.executeQuery(sql);





        while(resultSet.next()) {

            Calendar now = Calendar.getInstance();
            int dayOfMonth = now.get(Calendar.DAY_OF_MONTH);
            int monthh = now.get(Calendar.MONTH);
            int yearr = now.get(Calendar.YEAR);
            String moninnum ="";
            String monthhinstr = resultSet.getString("month");
            if (monthhinstr.equals("January")){
                moninnum = "1";
            }if(monthhinstr.equals("February")){
                moninnum = "2";
            }if(monthhinstr.equals("March")){
                moninnum = "3";
            }if(monthhinstr.equals("April")){
                moninnum = "4";
            }if(monthhinstr.equals("May")){
                moninnum = "5";
            }if(monthhinstr.equals("June")){
                moninnum = "6";
            }if(monthhinstr.equals("July")){
                moninnum = "7";
            }if(monthhinstr.equals("August")){
                moninnum = "8";
            }if(monthhinstr.equals("September")){
                moninnum = "9";
            }if(monthhinstr.equals("October")){
                moninnum = "10";
            }if(monthhinstr.equals("November")){
                moninnum = "11";
            }if(monthhinstr.equals("December")){
                moninnum = "12";
            }
            String indate = resultSet.getString("date");
            String inyear = resultSet.getString("year");
            //moninnum is inmonth
            int dateint = Integer.parseInt(indate);
            int monthint = Integer.parseInt(moninnum);
            int yearint = Integer.parseInt(inyear);

            if(yearint < yearr ) {
                int placeid = resultSet.getInt("id");
                ChatDbOperations.deleteplace(placeid);
            }
            if(yearint == yearr) {
                if (monthint < monthh) {
                    int placeid = resultSet.getInt("id");
                    ChatDbOperations.deleteplace(placeid);
                }else if(dateint < dayOfMonth){
                    int placeid = resultSet.getInt("id");
                    ChatDbOperations.deleteplace(placeid);
                }

            }

            response.setCharacterEncoding("UTF-8");
            ids.add((resultSet.getString("id")));
            names.add((resultSet.getString("name")));
            lnames.add((resultSet.getString("lname")));
            from.add((resultSet.getString("from")));
            too.add((resultSet.getString("too")));
            time.add((resultSet.getString("time")));
            minute.add((resultSet.getString("minute")));
            day2.add((resultSet.getString("date")));
            month2.add((resultSet.getString("month")));
            year2.add((resultSet.getString("year")));
            imgfull2.add((resultSet.getString("pic")));


               /* for(int i =0; i<namers.length; i++){
                    System.out.println(namers[i]);
                }*/
            ResultSetMetaData rsmd = resultSet.getMetaData();
        }
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    String[] ides = new String[ids.size()];
    String[] namers = new String[names.size()];
    String[] lnamear = new String[lnames.size()];
    String[] fromar = new String[from.size()];
    String[] tooar = new String[too.size()];
    String[] timear = new String[time.size()];
    String[] minutear = new String[minute.size()];
    String[] dayar = new String[day2.size()];
    String[] monthar = new String[month2.size()];
    String[] yearar = new String[year2.size()];
    String[] imgfullar = new String[imgfull2.size()];
    namers = names.toArray(namers);
    ides = ids.toArray(ides);
    lnamear = lnames.toArray(lnamear);
    fromar = from.toArray(fromar);
    tooar = too.toArray(tooar);
    timear = time.toArray(timear);
    minutear = minute.toArray(minutear);
    dayar = day2.toArray(dayar);
    monthar = month2.toArray(monthar);
    yearar = year2.toArray(yearar);
    imgfullar = imgfull2.toArray(imgfullar);

%>
<style type="text/css">

    .psPassenger22{
        position: relative;
        top: 100px;
        left: 50%;
        padding: 20px 10px ;
        transform: translate(-50%,-50%);
        width: 600px;
        height: 225px;

        box-sizing: border-box;
        background: rgba(118, 224, 255, 0.5);
    }
    .psPassenger222{
        position: relative;
        top: 100px;
        left: 50%;
        padding: 20px 10px ;
        transform: translate(-50%,-50%);
        width: 600px;
        height: 225px;

        box-sizing: border-box;
        background: rgba(101, 255, 153, 0.5);
    }
    .psPassenger222 .profile-img{
        width: 120px;
        height: 120px;
        border-radius: 50%;
    }
    .psPassenger22 .profile-img{
        width: 120px;
        height: 120px;
        border-radius: 50%;
    }
</style>
<div class="psPassenger" style="overflow-y: scroll;height:800px">
    <%
        System.out.println(namers.length);
        System.out.println(Arrays.toString(namers));
        int len = namers.length;
        for (int i = 0; i < namers.length; i++) {
            int a = i%2;

            if(a == 0) {

                response.setContentType("text/html");
                out.print("<form id=\""+i+"\" target=\"_parent\" class=\"Passenger\" action=\"/Roadbuddy_war_exploded/joincar\" method=\"get\">");
                out.print("<div  name=\"test\" class=\"psPassenger22\" id=\"box"+i+"\" align=\"center\" >");
                out.print("<table width=\"100%\">");
                out.print("<tr>");
                out.print("<input type=\"hidden\" name=\"id\" value=\""+id+"\">");
                out.print("<input type=\"hidden\" name=\"postid\" value=\""+ides[i]+"\">");
                out.print("<td>");
                out.print("<center>");
                out.print("<img src=\"" + imgfullar[i] + "\" class =\"profile-img\" /></center>");
                out.print("</td>");
                out.print("<td>");
                out.print("<h3>" + namers[i] + " " + lnamear[i] + "</h3>");
                out.print("<table>");
                out.print("<tr>");
                out.print("<td><p>Status </p></td><td><p>Driver</p></td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td><p>From</p></td><td><p>" + fromar[i] + "</p></td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td> <p>To</p></td><td><p>" + tooar[i] + "</p></td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td><p>Time</p></td><td><p>" + timear[i] + ":" + minutear[i] + "</p></td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td><p>Date</p></td><td><p>" + dayar[i] + " " + monthar[i] + " " + yearar[i] + "</p></td>");
                out.print("</tr>");
                out.print("</table>");
                out.print("</td>");
                out.print("</tr>");
                out.print("</table>");
                out.print("</div>");
                out.print("</form>");
            }else {

                response.setContentType("text/html");
                out.print("<form id=\""+i+"\" target=\"_parent\" class=\"Passenger2\" action=\"/Roadbuddy_war_exploded/joincar\" method=\"get\">");
                out.print("<div name=\"test\" class=\"psPassenger222\" id=\"box"+i+"\" align=\"center\">");
                out.print("<table width=\"100%\">");
                out.print("<input type=\"hidden\" name=\"id\" value=\""+id+"\">");
                out.print("<input type=\"hidden\" name=\"postid\" value=\""+ides[i]+"\">");
                out.print("<tr>");
                out.print("<td>");
                out.print("<center>");
                out.print("<img src=\"" + imgfullar[i] + "\" class =\"profile-img\" /></center>");
                out.print("</td>");
                out.print("<td>");
                out.print("<h3>" + namers[i] + " " + lnamear[i] + "</h3>");
                out.print("<table>");
                out.print("<tr>");
                out.print("<td><p>Status </p></td><td><p>Driver</p></td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td><p>From</p></td><td><p>" + fromar[i] + "</p></td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td> <p>To</p></td><td><p>" + tooar[i] + "</p></td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td><p>Time</p></td><td><p>" + timear[i] + ":" + minutear[i] + "</p></td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td><p>Date</p></td><td><p>" + dayar[i] + " " + monthar[i] + " " + yearar[i] + "</p></td>");
                out.print("</tr>");
                out.print("</table>");
                out.print("</td>");
                out.print("</tr>");
                out.print("</table>");
                out.print("</div>");
                out.print("</form>");

            }
        }

    %>

</div>

<script>
    var form = document.getElementsByClassName("Passenger2");
    form.action = "Roadbuddy_war_exploded/joincar";// /w/joincar
    var form2 = document.getElementsByClassName("Passenger");
    form2.action = "Roadbuddy_war_exploded/joincar";
    for( i = 0; i < <%=len%>; i++){
        var something = document.getElementById("box"+i);

        something.style.cursor = 'pointer';
        something.onclick = function() {

            this.parentNode.submit();

        };
        something.onmouseover = function() {
            this.style.backgroundColor = 'red';
        };
        something.onmouseout = function() {
            this.style.backgroundColor = '';
        };
    }




</script>


<!-- NEWCODE -->


</body>
</html>
