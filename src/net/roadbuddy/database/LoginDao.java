package net.roadbuddy.database;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import net.roadbuddy.bean.LoginBean;

public class LoginDao {

    public boolean validate(LoginBean loginBean) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://roadbuddy-do-user-6488064-0.db.ondigitalocean.com:25060/roadbuddy?useSSL=false", "doadmin", "ahgwrurult0k4481");

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection
                     .prepareStatement("select * from member_data where username = ? and password = ? ")) {
            preparedStatement.setString(1, loginBean.getUsername());
            preparedStatement.setString(2, loginBean.getPassword());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return status;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}