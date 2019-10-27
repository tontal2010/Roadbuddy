<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 20-Oct-19
  Time: 4:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = session.getAttribute("name").toString();
    String lname = session.getAttribute("lname").toString();
    String from = session.getAttribute("from").toString();
    String too = session.getAttribute("too").toString();
    String date = session.getAttribute("date").toString();
    String year = session.getAttribute("year").toString();
    String time = session.getAttribute("time").toString();
    String month = session.getAttribute("month").toString();
    String minute = session.getAttribute("minute").toString();
    String pic = session.getAttribute("pic").toString();
    String ownerid = session.getAttribute("ownerid").toString();
    String postid =  session.getAttribute("postid").toString();
    String id = session.getAttribute("id").toString();
    String img1 = "data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs%3D";
    String img2 = "data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs%3D";
    String img3 = "data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs%3D";
    String img4 = "data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs%3D";
    String img5 = "data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs%3D";
    String passid1 = "";
    String passid2 = "";
    String passid3 = "";
    String passid4 = "";
    String passid5 = "";
    String type = "submit";
    String btntxt = "JOIN";
    String sty1 = "hidden";
    String sty2 = "hidden";
    String sty3 = "hidden";
    String sty4 = "hidden";
    String sty5 = "hidden";

    String passid = "";
    String passen = "";
    int numslash = 1;
    try {
        passid = session.getAttribute("passid").toString();
        System.out.println(passid);

        String passen1 = "";
        String passen2 = "";
        String passen3 = "";
        String passen4 = "";
        String passen5 = "";
        int leng = passid.length();

        for (int a = 0; a < leng; a++) {
            char s = passid.charAt(a);

            if (s != '#') {

                if (numslash == 1) {
                    passen1 = passen1 + s;
                }
                if (numslash == 2) {
                    passen2 = passen2 + s;
                }
                if (numslash == 3) {
                    passen3 = passen3 + s;
                }
                if (numslash == 4) {
                    passen4 = passen4 + s;
                }
                if (numslash == 5) {
                    passen5 = passen5 + s;
                }

            } else {
                if (numslash == 1) {

                    System.out.println("string passen1 = " + passen1);
                    numslash = numslash + 1;
                } else if (numslash == 2) {
                    System.out.println("string passen2 = " + passen2);

                    numslash = numslash + 1;
                } else if (numslash == 3) {

                    System.out.println("string passen3 = " + passen3);
                    numslash = numslash + 1;
                } else if (numslash == 4) {
                    System.out.println("string passen4 = " + passen4);
                    numslash = numslash + 1;
                } else if (numslash == 5) {
                    System.out.println("string passen5 = " + passen5);
                    numslash = numslash + 1;
                }
            }
        }
        passen = "";
        String connectionUrl = "jdbc:mysql://167.71.211.97:3306/rb_2";
        String userid = "roadbuddy";
        String password = "roadbuddyadmin1";
        if(id.equals(passen1) || id.equals(passen2) || id.equals(passen3) || id.equals(passen4) || id.equals(passen5)){
            type = "button";
            btntxt = "Already Join";
        }else{
            type = "submit";
        }

        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        ResultSet resultSet2 = null;
        ResultSet resultSet3 = null;
        ResultSet resultSet4 = null;
        ResultSet resultSet5 = null;


        try{
            connection = DriverManager.getConnection(connectionUrl, userid, password);
            statement=connection.createStatement();
            if(numslash >= 2) {
                String sql = "select * from rb_member where userid = '" + passen1 + "'";
                resultSet = statement.executeQuery(sql);
                sty1 = "image";
                while (resultSet.next()) {
                    img1 = resultSet.getString("img");
                    passid1 = resultSet.getString("userid");
                }
            }else {
                sty1 = "hidden";
            }
            if(numslash >= 3) {
                String sql2 = "select * from rb_member where userid = '" + passen2 + "'";
                resultSet2 = statement.executeQuery(sql2);
                sty2 = "image";
               while (resultSet2.next()) {
                   img2 = resultSet2.getString("img");
                   passid2 = resultSet2.getString("userid");
               }
            }else {
                sty2 = "hidden";
            }
            if(numslash >= 4) {
                String sql3 = "select * from rb_member where userid = '" + passen3 + "'";
                resultSet3 = statement.executeQuery(sql3);
                sty3 = "image";
                while (resultSet3.next()) {
                    img3 = resultSet3.getString("img");
                    passid3 = resultSet3.getString("userid");
                }
            }else {
                sty3 = "hidden";
            }

            if(numslash >= 5) {
                String sql4 = "select * from rb_member where userid = '" + passen4 + "'";
                resultSet4 = statement.executeQuery(sql4);
                sty4 = "image";
                while (resultSet4.next()) {
                    img4 = resultSet4.getString("img");
                    passid4 = resultSet4.getString("userid");
                }
            }else {
                sty4 = "hidden";
            }
            if(numslash >= 6) {
                String sql5 = "select * from rb_member where userid = '" + passen5 + "'";
                resultSet5 = statement.executeQuery(sql5);
                sty5 = "image";
                while (resultSet5.next()) {
                    img5 = resultSet5.getString("img");
                    passid5 = resultSet5.getString("userid");
                }
            }else {
                sty5 = "hidden";
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }catch (NullPointerException e){
        passen = "None";
    }

%>
<html>
<head>
    <title>join tavel - เข้าร่วมการเดินทาง</title>
    <link rel="stylesheet" href="css_jointavel.css">
    <style>
        body{background: #e6e6e6;
            font-family: srinakharinwirot , sans-serif;
            font-size: 1em;
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
        <li><a href="chat.jsp">Chat</a>
        <li><a href="notification.jsp">Notifications</a></li>
        <li><a href="${pageContext.request.contextPath}/logoutprocess">Log out</a>
    </ul>
</nav>
<div class="pageBox">
<h1>ร่วมเดินทางจาก <%=from%> ไป <%=too%> </h1>
    <div class="tbJoin" align="center">
        <table width="100%" >
            <tr>
                <td>
                    <center><img src="<%=pic%>" class="profileDriver-img" /></center>
                </td>
                <td>
                    <h3><%=name%> <%=lname%></h3>
                    <table>
                        <tr>
                            <td><p>Status </p></td><td><p>Driver</p></td>
                        </tr>
                        <tr>
                            <td><p>Time</p></td><td><p><%=time%>:<%=minute%></p></td>
                        </tr>
                        <tr>
                            <td><p>Date</p></td><td><p><%=date%> <%=month%> <%=year%></p></td>
                        </tr>
                        <tr>
                           <td><p>Passenger</p><td><%=passen%><form style="width: 0px;height: 0px;display: inline;" action="${pageContext.request.contextPath}/clickprofileprocess" method="get"><input type="hidden" value="<%=passid1%>" name="id2"> <input type="<%=sty1%>" src="<%=img1%>" alt="Submit" class="profilePassenger-img" /></form> <form style="width: 0px;height: 0px;display: inline;" action="${pageContext.request.contextPath}/clickprofileprocess" method="get"><input type="hidden" value="<%=passid2%>" name="id2"><input type="<%=sty2%>" alt="Submit" src="<%=img2%>" class="profilePassenger-img" /></form> <form style="width: 0px;height: 0px;display: inline;" action="${pageContext.request.contextPath}/clickprofileprocess" method="get"><input type="hidden" value="<%=passid3%>" name="id2"><input type="<%=sty3%>" alt="Submit" src="<%=img3%>" class="profilePassenger-img" /></form> <form style="width: 0px;height: x0px;display: inline;" action="${pageContext.request.contextPath}/clickprofileprocess" method="get"><input type="hidden" value="<%=passid4%>" name="id2"><input alt="Submit" type="<%=sty4%>" src="<%=img4%>" class="profilePassenger-img" /></form> <form style="width: 0px;height: 0px;display: inline;" action="${pageContext.request.contextPath}/clickprofileprocess" method="get"><input type="hidden" value="<%=passid5%>" name="id2"><input alt="Submit" type="<%=sty5%>" src="<%=img5%>" class="profilePassenger-img" /></form> </td>
                           <!-- <td><p>Passenger</p><td></td> -->
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br>
        <div class="btBack"  align="left">
            <button class="buttonBack"  style="vertical-align:middle"   onclick="window.location.href = 'home.jsp';"><span>BACK </span> </button>
        </div>
        <div class="btJoin" align="right" >
            <form action="${pageContext.request.contextPath}/joinserv" method="post">

                <input type="hidden" name="passid" value="<%=id%>"/>
                <input type="hidden" name="postid" value="<%=postid%>"/>
            <button class="buttonJoin" style="vertical-align:middle;" type="<%=type%>"><span><%=btntxt%> </span></button>
            </form>
        </div>

    </div>
</div>


</body>
</html>
