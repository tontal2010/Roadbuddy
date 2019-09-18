package mainServletController;
import java.io.*;
import java.sql.*;
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

            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            String dbURL = "jdbc:mysql://206.189.147.236:3306/rb_2";
            String dbUser = "roadbuddy";
            String dbPass = "roadbuddyadmin1";
            Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass);

            PreparedStatement ps = con.prepareStatement("select * from rb_2.place where too like  '%" + roll + "%'");
           // ps.setString(1, roll);

            out.print("<table width=50% border=1>");
            out.print("<caption>Result:</caption>");
            ResultSet rs = ps.executeQuery();

            /* Printing column names */
            ResultSetMetaData rsmd = rs.getMetaData();
            int total = rsmd.getColumnCount();
            out.print("<tr>");
            for (int i = 1; i <= total; i++) {
                out.print("<th>" + rsmd.getColumnName(i) + "</th>");

            }
            out.print("</tr>");
            out.print("<input id=\"driver\" type=\"radio\" name=\"check\" value=\"Driver\" >");

            /* Printing result */
            while (rs.next()) {
                out.print("<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(4) + "</td><td>" + rs.getString(5) + "</td><td>" + rs.getString(6) + "</td><td>" + rs.getString(7) +"</td><td>" + rs.getString(8) +"</td><td>" + rs.getString(9) +"</td><td>" + rs.getString(10) +"</td></tr>");

            }
            out.print("</table>");

        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }

}
