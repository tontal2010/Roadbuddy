package mainServletController;

import db.ChatDbOperations;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

@WebServlet("/joinserv")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class joinServlet extends HttpServlet {

    // database connection settings
    private String dbURL = "jdbc:mysql://167.71.211.97:3306/rb_2";
    private String dbUser = "roadbuddy";
    private String dbPass = "roadbuddyadmin1";

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        ServletContext context = request.getServletContext();
        InputStream inputStream = null; // input stream of the upload file
        RequestDispatcher dispatch =null;
        // obtains the upload file part in this multipart request
        String postid = request.getParameter("postid");
        String passid = request.getParameter("passid");
        System.out.println("postid = "+postid);
        System.out.println("passid = "+passid);
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client

        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            Statement statement2 = null;
            statement2=conn.createStatement();
            ResultSet resultSet2 = null;
            String sql2 = "select * from place where id = '" + postid + "'";
            resultSet2 = statement2.executeQuery(sql2);
            String passall = "";
            while (resultSet2.next()) {
                passall = resultSet2.getString("passengerid");
            }
            String strtoinput = "";
            if(passall == null){
                strtoinput = passid+"#";
            }else {
                strtoinput = passall+passid+"#";
            }

            System.out.println("strtoinput = "+strtoinput);
            // constructs SQL statement
            String sql = "UPDATE rb_2.place SET passengerid = ?  where id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1,strtoinput);
            statement.setString(2,postid);
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Successful join !";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            HttpSession session = request.getSession(true);
            request.setCharacterEncoding( "UTF-8" );

            User udetail = null;
           // String email = request.getParameter("email");
            /*try {
                udetail = ChatDbOperations.findUserWithEmail(email);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            */

            session =request.getSession();
            //session.setAttribute("loginUser", udetail);

            session.setAttribute("errorInNotSelect", message);
           // session.setAttribute("img2",s);
           // session.setAttribute("login","yes");

            // forwards to the message page
            //dispatch = context.getRequestDispatcher("/home.jsp");
            getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
        }
    }
}
