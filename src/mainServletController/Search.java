package mainServletController;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/search")
public class Search extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {

            String roll = request.getParameter("keyword");
            System.out.println(roll);
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            String dbURL = "jdbc:mysql://206.189.147.236:3306/rb_2";
            String dbUser = "roadbuddy";
            String dbPass = "roadbuddyadmin1";
            Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass);

            PreparedStatement ps = con.prepareStatement("select * from rb_2.place where too like  '%" + roll + "%'");
           // ps.setString(1, roll);

            //out.print("<table width=50% border=1>");
            //out.print("<caption>Result:</caption>");
            ResultSet rs = ps.executeQuery();

            /* Printing column names */
            ResultSetMetaData rsmd = rs.getMetaData();


            /* Printing result */
            while (rs.next()) {
                //out.print("<tr><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(4) + "</td><td>" + rs.getString(5) + "</td><td>" + rs.getString(6) + "</td><td>" + rs.getString(7) +"</td><td>" + rs.getString(8) +"</td><td>" + rs.getString(9) +"</td><td>" + rs.getString(10) +"</td></tr>");
                out.print("<title>Search Result !</title>");
                out.print("<body style=\"background:rgba(78, 59, 238, 0.9);\">");
                out.print("<div style=\"background: rgba(118, 224, 255, 0.5);\" class=\"psPassenger\" align=\"center\">");
                out.print("<table width=\"100%\">");
                out.print("<tr>");
                out.print("<td>");
                out.print("<center>");
                out.print("<img style=\"width: 120px;\n" +
                        "    height: 120px;\n" +
                        "    border-radius: 50%;\" src=\"" + rs.getString("pic") + "\" class =\"profile-img\" /></center>");
                out.print("</td>");
                out.print("<td>");
                out.print("<h3>" + rs.getString("name") + " " + rs.getString("lname") + "</h3>");
                out.print("<table>");
                out.print("<tr>");
                out.print("<td><p>Status </p></td><td><p>Driver</p></td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td><p>From</p></td><td><p>" + rs.getString("from") + "</p></td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td> <p>To</p></td><td><p>" + rs.getString("too") + "</p></td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td><p>Time</p></td><td><p>" + rs.getString("time") + ":" + rs.getString("minute") + "</p></td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td><p>Date</p></td><td><p>" + rs.getString("date") + " " + rs.getString("month") + " " + rs.getString("year") + "</p></td>");
                out.print("</tr>");
                out.print("</table>");
                out.print("</td>");
                out.print("</tr>");
                out.print("</table>");
                out.print("</div>");
                out.print("<br>");
                out.print("</body>");
            }
            out.print("</table>");

        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }

}
