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
<%@ page import="java.util.Calendar" %>
<%@ page import="db.ChatDbOperations" %>
<%@ page import="javax.persistence.criteria.CriteriaBuilder" %>
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
    ArrayList<String> ids = new ArrayList<String>();
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
    String[] ides = new String[ids.size()];
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
    ides = ids.toArray(ides);
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
    int len = namers.length;
    for (int i = 0; i < namers.length; i++) {
        int a = i%2;

        if(a == 0) {

            response.setContentType("text/html");
            out.print("<form target=\"_blank\" class=\"Passenger\" action=\"/Roadbuddy_war_exploded/joincar\" method=\"get\">");
            out.print("<div onclick=\"javascript: document.form.submit();\" name=\"test\" class=\"psPassenger\" id=\"box"+i+"\" align=\"center\" >");
            out.print("<table width=\"100%\">");
            out.print("<tr>");
            out.print("<input type=\"hidden\" name=\"joinid\" value=\""+ides[i]+"\">");
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
            out.print("<form target=\"_blank\" class=\"Passenger2\" action=\"/Roadbuddy_war_exploded/joincar\" method=\"post\">");
            out.print("<div onclick=\"javascript: document.form.submit();\" name=\"test\" class=\"psPassenger2\" id=\"box"+i+"\" align=\"center\">");
            out.print("<table width=\"100%\">");
            out.print("<input type=\"hidden\" name=\"joinid\" value=\""+ides[i]+"\">");
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

<script>
    var form = document.getElementsByClassName("Passenger2");
    form.action = "${pageContext.request.contextPath}/joincar";
    var form2 = document.getElementsByClassName("Passenger");
    form2.action = "${pageContext.request.contextPath}/joincar";
    for( i = 0; i < <%=len%>; i++){
        var something = document.getElementById("box"+i);

        something.style.cursor = 'pointer';
      /*  something.onclick = function() {
            document.forms[0].submit();
        };*/
        something.onmouseover = function() {
            this.style.backgroundColor = 'red';
        };
        something.onmouseout = function() {
            this.style.backgroundColor = '';
        };
    }




</script>

</body>
</html>
