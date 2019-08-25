package net.roadbuddy.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import net.roadbuddy.bean.member;

public class memberDao {

    public int registerEmployee(member member_data) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO member_data" +
                "  (first_name, last_name, email, password, contact) VALUES " +
                " (?, ?, ?, ?,?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://209.97.166.241:3306/roadbuddy?useSSL=false", "roadbuddy", "roadbuddyadmin1");

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            //preparedStatement.setInt(1, 1);
            preparedStatement.setString(1, member_data.getFirstName());
            preparedStatement.setString(2, member_data.getLastName());
            preparedStatement.setString(3, member_data.getEmail());
            preparedStatement.setString(4, member_data.getPassword());
            preparedStatement.setString(5, member_data.getContact());

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