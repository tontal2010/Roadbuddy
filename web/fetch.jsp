<%--
  Created by IntelliJ IDEA.
  User: zGalactose
  Date: 18/9/2562
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    ArrayList<String> lnames = new ArrayList<String>();
    ArrayList<String> from = new ArrayList<String>();
    ArrayList<String> too = new ArrayList<String>();
    ArrayList<String> time = new ArrayList<String>();
    ArrayList<String> minute = new ArrayList<String>();
    ArrayList<String> day = new ArrayList<String>();
    ArrayList<String> month = new ArrayList<String>();
    ArrayList<String> year = new ArrayList<String>();
    ArrayList<String> imgfull = new ArrayList<String>();
    try{
        connection = DriverManager.getConnection(connectionUrl, userid, password);
        statement=connection.createStatement();
        String sql ="select * from place";
        resultSet = statement.executeQuery(sql);

        while(resultSet.next()) {
            response.setCharacterEncoding("UTF-8");

            names.add((resultSet.getString("name")));
            lnames.add((resultSet.getString("lname")));
            from.add((resultSet.getString("from")));
            too.add((resultSet.getString("too")));
            time.add((resultSet.getString("time")));
            minute.add((resultSet.getString("minute")));
            day.add((resultSet.getString("date")));
            month.add((resultSet.getString("month")));
            year.add((resultSet.getString("year")));
            imgfull.add((resultSet.getString("pic")));


               /* for(int i =0; i<namers.length; i++){
                    System.out.println(namers[i]);
                }*/
            ResultSetMetaData rsmd = resultSet.getMetaData();
        }
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    String[] namers = new String[names.size()];
    String[] lnamear = new String[lnames.size()];
    String[] fromar = new String[from.size()];
    String[] tooar = new String[too.size()];
    String[] timear = new String[time.size()];
    String[] minutear = new String[minute.size()];
    String[] dayar = new String[day.size()];
    String[] monthar = new String[month.size()];
    String[] yearar = new String[year.size()];
    String[] imgfullar = new String[imgfull.size()];
    namers = names.toArray(namers);
    lnamear = lnames.toArray(lnamear);
    fromar = from.toArray(fromar);
    tooar = too.toArray(tooar);
    timear = time.toArray(timear);
    minutear = minute.toArray(minutear);
    dayar = day.toArray(dayar);
    monthar = month.toArray(monthar);
    yearar = year.toArray(yearar);
    imgfullar = imgfull.toArray(imgfullar);

%>

<html>
<head>
    <title>Fetchdata</title>

    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          rel="stylesheet">
    <style type="text/css">

        .psPassenger{
            position: relative;
            top: 17%;
            left: 50%;
            padding: 20px 10px ;
            transform: translate(-50%,-50%);
            width: 600px;
            height: 225px;

            box-sizing: border-box;
            background: rgba(118, 224, 255, 0.5);
        }
        .psPassenger2{
            position: relative;
            top: 17%;
            left: 50%;
            padding: 20px 10px ;
            transform: translate(-50%,-50%);
            width: 600px;
            height: 225px;

            box-sizing: border-box;
            background: rgba(101, 255, 153, 0.5);
        }
        .psPassenger2 .profile-img{
            width: 120px;
            height: 120px;
            border-radius: 50%;
        }
        .psPassenger .profile-img{
            width: 120px;
            height: 120px;
            border-radius: 50%;
        }
    </style>
</head>

<body>
<%
    System.out.println(namers.length);
    System.out.println(Arrays.toString(namers));
    for (int i = 0; i < namers.length; i++) {
        int a = i%2;
        System.out.println(i);
        System.out.println(a);

        if(a == 0) {
            System.out.println("blue");
            response.setContentType("text/html");
            out.print("<div class=\"psPassenger\" align=\"center\">");
            out.print("<table width=\"100%\">");
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
        }else {
            System.out.println("green");
            response.setContentType("text/html");
            out.print("<div class=\"psPassenger2\" align=\"center\">");
            out.print("<table width=\"100%\">");
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

        }
    }

%>



</body>
</html>
