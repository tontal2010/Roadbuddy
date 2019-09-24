<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 21-Sep-19
  Time: 12:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");

    String email = request.getParameter("email");
    session.setAttribute("email",email);
    String roll = request.getParameter("keyword");
    System.out.println(roll);
    try  {


        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        String dbURL = "jdbc:mysql://167.71.211.97:3306/rb_2";
        String dbUser = "roadbuddy";
        String dbPass = "roadbuddyadmin1";
        Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass);

        PreparedStatement ps = con.prepareStatement("select * from rb_2.place where too like  '%" + roll + "%'");
        // ps.setString(1, roll);

        //out.print("<table width=50% border=1>");
        //out.print("<caption>Result:</caption>");
        ResultSet rs = ps.executeQuery() ;
        System.out.println(ps);
        String contextpath = "${pageContext.request.contextPath}";
        /* Printing column names */
        ResultSetMetaData rsmd = rs.getMetaData();
/*
        out.print("<html>");
        out.print("<head>");
        out.print("<title>Search-ค้นหา</title>");
        out.print("<link rel=\"stylesheet\" href=\"css_search.css\">");
        out.print("</head>");
        out.print("<body>");
        out.print("<nav>");
        out.print("<div class=\"toggle\">");
        out.print("<i class=\"fa fa-bars menu\" aria-hidden=\"true\"></i>");
        out.print("</div>");
        out.print("<ul>");
        out.print("<li><a href=\"home.jsp\">Home</a></li>");
        out.print("<li><a href=\"${pageContext.request.contextPath}/profileprocess\">Profile</a>");
        out.print("<li><a href=\"chat.jsp\">Chat</a>");
        out.print("<li><a href=\"notification.jsp\">Notifications</a></li>");
        out.print("<li><a href=\"${pageContext.request.contextPath}/logoutprocess\">Log out</a>");
        out.print("</ul>");
        out.print("</nav>");
        out.print("<div class=\"pageBox\">");
        out.print("<h1 align=\"center\">Result</h1><h2 align=\"center\" >\""+roll+"\"</h2>");
*/
        /* Printing result */













%>

<html>
<head>
    <title>Search-ค้นหา</title>
    <link rel="stylesheet" href="css_search.css">
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
    <h1 align="center">Result</h1><h2 align="center" >"<%=roll%>"</h2>
    <%
        while (rs.next()) {
            //out.print("<tr><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(4) + "</td><td>" + rs.getString(5) + "</td><td>" + rs.getString(6) + "</td><td>" + rs.getString(7) +"</td><td>" + rs.getString(8) +"</td><td>" + rs.getString(9) +"</td><td>" + rs.getString(10) +"</td></tr>");
            out.print("<div class=\"resultBox1\" align=\"center\">");
            out.print("<table width=\"100%\" >");
            out.print("<tr>");
            out.print("<td>");
            out.print("<center><img src=\""+rs.getString("pic")+"\" class=\"profile-img\"/></center>");
            out.print("</td>");
            out.print("<td>");
            out.print("<h3>"+rs.getString("name")+" "+rs.getString("lname")+"</h3>");
            out.print("<table>");
            out.print("<tr>");
            out.print("<td><p>Status </p></td><td><p>Driver</p></td>");
            out.print("</tr>");
            out.print("<tr>");
            out.print("<td><p>From</p></td><td><p>"+rs.getString("from")+"</p></td>");
            out.print("</tr>");
            out.print("<tr>");
            out.print("<td> <p>To</p></td><td><p>"+rs.getString("too")+"</p></td>");
            out.print("</tr>");
            out.print("<tr>");
            out.print("<td><p>Time</p></td><td><p>"+rs.getString("time")+":"+rs.getString("minute")+"</p></td>");
            out.print("</tr>");
            out.print("<tr>");
            out.print("<td><p>Date</p></td><td><p>"+rs.getString("date")+" "+rs.getString("month")+" "+rs.getString("year")+"</p></td>");
            out.print("</tr>");
            out.print("</table>");
            out.print("</td>");
            out.print("</tr>");
            out.print("</table>");
            out.print("</div>");


        }

    %>
    <!--
        <div class="resultBox1" align="center">
            <table width="100%" >
                <tr>
                    <td>
                        <center><img src="./img/rating2.jpg" class="profile-img"/></center>
                    </td>
                    <td>
                        <h3>Pichichai Srijan</h3>
                        <table>
                            <tr>
                                <td><p>Status </p></td><td><p>Driver</p></td>
                            </tr>
                            <tr>
                                <td><p>Frome</p></td><td><p>มหาวิทยาลัยศรีนครินทรวิโรฒ องครักษ์</p></td>
                            </tr>
                            <tr>
                                <td> <p>To</p></td><td><p>ฟิวเจอร์ปาร์ค รังสิต</p></td>
                            </tr>
                            <tr>
                                <td><p>Time</p></td><td><p>14:30</p></td>
                            </tr>
                            <tr>
                                <td><p>Date</p></td><td><p>15 Sep 2019</p></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>

        <div class="resultBox2" align="center">
            <table width="100%" >
                <tr>
                    <td>
                        <center><img src="./img/rating2.jpg" class="profile-img"/></center>
                    </td>
                    <td>
                        <h3>Pichichai Srijan</h3>
                        <table>
                            <tr>
                                <td><p>Status </p></td><td><p>Driver</p></td>
                            </tr>
                            <tr>
                                <td><p>Frome</p></td><td><p>มหาวิทยาลัยศรีนครินทรวิโรฒ องครักษ์</p></td>
                            </tr>
                            <tr>
                                <td> <p>To</p></td><td><p>ฟิวเจอร์ปาร์ค รังสิต</p></td>
                            </tr>
                            <tr>
                                <td><p>Time</p></td><td><p>14:30</p></td>
                            </tr>
                            <tr>
                                <td><p>Date</p></td><td><p>15 Sep 2019</p></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </div>-->
    </div>

    </body>
    </html>
    <%
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    %>