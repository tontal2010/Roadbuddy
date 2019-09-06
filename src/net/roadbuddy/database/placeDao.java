package net.roadbuddy.database;


import net.roadbuddy.bean.place;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class placeDao {



    public int registerEmployee(place placedriver) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO placedriver" +
                "  ('from', 'to', username, partnernum, date,time) VALUES " +
                " (?,?,?,?,?,?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://roadbuddy.social:3306/roadbuddy?useSSL=false", "roadbuddy", "roadbuddyadmin1");

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            //preparedStatement.setInt(1, 1);
            preparedStatement.setString(1, placedriver.getFrom());
            preparedStatement.setString(2, placedriver.getTo());
            preparedStatement.setString(3, placedriver.getUsername());
            preparedStatement.setString(4, placedriver.getPartnernum());
            preparedStatement.setString(5, placedriver.getDate());
            preparedStatement.setString(6, placedriver.getTime());


            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
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