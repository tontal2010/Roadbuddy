package mainServletController;

import db.ChatAppDataSource;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/joincar")
public class SearchJoincar extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

             response.setCharacterEncoding("UTF-8");
             HttpSession session = request.getSession(false);

            String roll = request.getParameter("postid");
            Integer rollint = Integer.parseInt(roll);
            System.out.println("post id = "+roll);
            /*DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            String dbURL = "jdbc:mysql://167.71.211.97:3306/rb_2";
            String dbUser = "roadbuddy";
            String dbPass = "roadbuddyadmin1";
            Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass);

            PreparedStatement ps = con.prepareStatement("SELECT * " + "FROM rb_2.place"
                    + "WHERE id = '" + roll + "'");/*
            //ps.setInt(1, Integer.parseInt(roll));

            //out.print("<table width=50% border=1>");
            //out.print("<caption>Result:</caption>");
            ResultSet rs = ps.executeQuery();
            String contextpath = "${pageContext.request.contextPath}";
            /* Printing column names */
            try {
                /*
                Connection dbConn;
                String queryStr = "SELECT * " + "FROM rb_2.place "
                        + "WHERE id = '" + rollint + "'";

                dbConn = ChatAppDataSource.getConnection();
                Statement queryStmt = dbConn.createStatement();
                ResultSet rs;
                rs = queryStmt.executeQuery(queryStr);*/
                Connection dbConn;
                dbConn = ChatAppDataSource.getConnection();
                String SQL_SELECT = "Select * FROM `rb_2`.`place` WHERE `id`= ? ;";
                PreparedStatement preparedStatement = dbConn.prepareStatement(SQL_SELECT);
                preparedStatement.setInt(1, rollint);

                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("name");
                    String lname = rs.getString("lname");
                    String from = rs.getString("from");
                    String too = rs.getString("too");
                    String date = rs.getString("date");
                    String month = rs.getString("month");
                    String year = rs.getString("year");
                    String time = rs.getString("time");
                    String minute = rs.getString("minute");
                    String pic = rs.getString("pic");
                    String ownerid = rs.getString("ownerid");
                    String passid = rs.getString("passengerid");
                    String postid = rs.getString("id");
                    String id = request.getParameter("id");
                    session.setAttribute("id",id);
                    session.setAttribute("name", name);
                    session.setAttribute("lname", lname);
                    session.setAttribute("from", from);
                    session.setAttribute("too", too);
                    session.setAttribute("date", date);
                    session.setAttribute("year", year);
                    session.setAttribute("time", time);
                    session.setAttribute("minute", minute);
                    session.setAttribute("month", month);
                    session.setAttribute("pic", pic);
                    session.setAttribute("passid", passid);
                    session.setAttribute("ownerid", ownerid);
                    session.setAttribute("postid",postid);
                    RequestDispatcher dispatch;
                    ServletContext context;
                    context = getServletContext();
                    dispatch = context.getRequestDispatcher("/join_travel.jsp");
                    dispatch.forward(request, response);
                }
            }catch (SQLException e){
                System.out.println(e);
            }


    }

}
