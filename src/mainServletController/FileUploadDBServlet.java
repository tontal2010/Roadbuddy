package mainServletController;
import db.ChatDbOperations;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {

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
        Part filePart = request.getPart("upload2");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }

        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client

        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            // constructs SQL statement
            String sql = "UPDATE rb_2.rb_member SET img=? ,uploadimg = ? where email =?";
            PreparedStatement statement = conn.prepareStatement(sql);
            String email = request.getParameter("email");
            System.out.println("Upload get Email : "+ email);
            statement.setString(2,"1");
            statement.setString(3,email);
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(1, inputStream);
            }

            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
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
            String s = request.getParameter("upload2");
            User udetail = null;
            String email = request.getParameter("email");
            try {
                udetail = ChatDbOperations.findUserWithEmail(email);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            session =request.getSession();
            session.setAttribute("loginUser", udetail);

            session.setAttribute("errorInNotSelect", message);
            session.setAttribute("img2",s);
            session.setAttribute("login","yes");

            // forwards to the message page
            //dispatch = context.getRequestDispatcher("/home.jsp");
            getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
        }
    }
}
