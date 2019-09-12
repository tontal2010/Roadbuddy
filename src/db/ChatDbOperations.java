package db;

import exceptions.ChatDbFailure;

import model.User;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ChatDbOperations {


	public static void insertUser(User user) throws SQLException{
		Connection dbConn;
		System.out.println("Trying to create dbConn");
		dbConn = ChatAppDataSource.getConnection();
		
		// Turn off auto-commit of db changes as they occur
		dbConn.setAutoCommit(false);
		
		String insertStmt = "INSERT INTO `rb_2`.`rb_member`  (`name`, `pass`,`sex`,`pnum`,`emerpnum`,`email`,`lname`,`status`)  " +
				"VALUES (? ,?,?,?,?,?,?,?);";

				
		PreparedStatement queryStmt ;
		queryStmt = dbConn.prepareStatement(insertStmt);
		queryStmt.setString(1, user.getName());
		queryStmt.setString(2,user.getPass());
		queryStmt.setString(3,user.getSex());
		queryStmt.setString(4,user.getPnum());
		queryStmt.setString(5,user.getEmerpnum());
		queryStmt.setString(6,user.getEmail());
		queryStmt.setString(7,user.getLname());
		queryStmt.setString(8,"offline");
		System.out.println(queryStmt);
		try {
			queryStmt.executeUpdate();
			dbConn.commit(); // make changes permanent
			dbConn.close();
		} catch (SQLException ex) {
			dbErrorRollBackTx(dbConn); // call this function to give error and ROLLBACK
		}
	}
    public static void insertPlace(User user) throws SQLException{
        Connection dbConn;
        System.out.println("Trying to create dbConn");
        dbConn = ChatAppDataSource.getConnection();

        // Turn off auto-commit of db changes as they occur
        dbConn.setAutoCommit(false);

        String insertStmt = "INSERT INTO `rb_2`.`place`  (`name`, `lname`,`from`,`too`,`date`,`time`,`numberpass`,`platenum`,`numjoin`,`pnum`)  " +
                "VALUES (? ,?,?,?,?,?,?,?,?,?);";


        PreparedStatement queryStmt ;
        queryStmt = dbConn.prepareStatement(insertStmt);
       // queryStmt.setString(1, user.getName());
       // queryStmt.setString(2,user.getLname());
		User data = new User();
		queryStmt.setString(1, data.getName());
		queryStmt.setString(2,data.getLname());
        queryStmt.setString(3,user.getFrom());
        queryStmt.setString(4,user.getToo());
        queryStmt.setString(5,user.getDay());
        queryStmt.setString(6,user.getTime());
        queryStmt.setString(7,user.getNumber());
        queryStmt.setString(8,"OOO33กน");
        queryStmt.setString(9,"O");
        queryStmt.setString(10,user.getPnum());
        System.out.println(queryStmt);
        try {
            queryStmt.executeUpdate();
            dbConn.commit(); // make changes permanent
            dbConn.close();
        } catch (SQLException ex) {
            dbErrorRollBackTx(dbConn); // call this function to give error and ROLLBACK
        }
    }

	public static User loginToAccount(String userName, String password) throws ChatDbFailure,SQLException {
		Connection dbConn;
		int rowsAffected;
		String queryStr = "SELECT * " + "FROM rb_2.rb_member "
				+ "WHERE email = '" + userName + "' and pass = '" + password + "'";
		
		dbConn = ChatAppDataSource.getConnection();
		Statement queryStmt = dbConn.createStatement();
		ResultSet results;
		
		User loggedInUser= new User();
		int userid;
		
		results = queryStmt.executeQuery(queryStr);
		
		if(results.last()){
			rowsAffected =  results.getRow();
		} else {
    	   rowsAffected = 0; //just cus I like to always do some kinda else statement.
		}
		
		if (rowsAffected != 1) {
			throw  new ChatDbFailure(ChatDbFailure.INVALID_CREDENTIAL);
		} else {
			userid = results.getInt("userid");

			String lname = results.getString("lname");
			String sex = results.getString("sex");
			String pnum = results.getString("pnum");
			String emerpnum = results.getString("emerpnum");
			String email = results.getString("email");
			String name = results.getString("name");

			loggedInUser.setName(name);System.out.println("Set "+ name);
			loggedInUser.setLname(lname);System.out.println("Set "+ lname);
			loggedInUser.setPnum(pnum);System.out.println("Set "+ pnum);
			loggedInUser.setEmail(userName);System.out.println("Set "+ userName);
			loggedInUser.setPass(password);System.out.println("Set "+ password);




            changeUserStatus(userid, User.ONLINE);
			
			loggedInUser.setStatus(User.ONLINE);
			
			// Free resources
			results.close();
			queryStmt.close();
			dbConn.close();
			System.out.println("welcome " +userName+" Login Sucessful !! ");
			return loggedInUser;
		}
		
	}

	/**
	 * Updating Users with status to offline
	 * @param userid - userId
	 * @throws SQLException  When unable to connect to DB or failed Query
	 */
	public static void logOutUser(int userid) throws SQLException, ChatDbFailure {
		changeUserStatus(userid, User.OFFLINE);
		System.out.println("Logout Sucessfull !! ");
	}

	public static void logOutUserWithName(String name) throws SQLException, ChatDbFailure {
		changeUserStatus(name, User.OFFLINE);
		System.out.println("Logout Sucessfull !! ");
	}

	public static void changeUserStatus(int userid, String newStatus)throws ChatDbFailure,SQLException {
		Connection dbConn;
		int rowsAffected;
		String queryStr = "UPDATE rb_2.rb_member SET status = ? where userid = ?;";
		
		dbConn = ChatAppDataSource.getConnection();
		
		// Turn off auto-commit so we can use transactions
        dbConn.setAutoCommit(false);

		// Update the balance 
		try (PreparedStatement updateCurBalStmt = dbConn.prepareStatement(queryStr)) {
			updateCurBalStmt.setString(1, newStatus);
			updateCurBalStmt.setInt(2, userid);
			
			rowsAffected = updateCurBalStmt.executeUpdate();
			
			if(rowsAffected != 1){
				dbErrorRollBackTx(dbConn);
				throw new ChatDbFailure(ChatDbFailure.INVALID_CREDENTIAL);
			}
			dbConn.commit(); /* Everything went OK */
			dbConn.close();
		//	System.out.println("Status updated to " +newStatus);
		} catch (SQLException ex) {
			dbErrorRollBackTx(dbConn);
		}
		
	}
	
	/**
	 * Updating Users with status
	 * @param status - online/offline
	 * @throws SQLException  When unable to connect to DB or failed Query
	 */
	public static void changeUserStatus(String name, String newStatus)throws ChatDbFailure,SQLException {
		Connection dbConn;
		int rowsAffected;
		String queryStr = "UPDATE user SET status = ? where name = ?;";
		
		dbConn = ChatAppDataSource.getConnection();
		
		// Turn off auto-commit so we can use transactions
        dbConn.setAutoCommit(false);

		// Update the balance 
		try (PreparedStatement updateCurBalStmt = dbConn.prepareStatement(queryStr)) {
			updateCurBalStmt.setString(1, newStatus);
			updateCurBalStmt.setString(2, name);
			
			rowsAffected = updateCurBalStmt.executeUpdate();
			
			if(rowsAffected != 1){
				dbErrorRollBackTx(dbConn);
				throw new ChatDbFailure(ChatDbFailure.INVALID_CREDENTIAL);
			}
			dbConn.commit(); /* Everything went OK */
			dbConn.close();
		//	System.out.println("Status updated to " +newStatus);
		} catch (SQLException ex) {
			dbErrorRollBackTx(dbConn);
		}
		
	}
	
	/**
	 * Updating PASSWORD
	 * @param status - online/offline
	 * @throws SQLException  When unable to connect to DB or failed Query
	 */
	public static void changeUserPassword(String userName, String password)throws ChatDbFailure,SQLException {
		Connection dbConn;
		int rowsAffected;
		String queryStr = "UPDATE rb_2.rb_member SET pass = ?  where name = ?;";
		
		dbConn = ChatAppDataSource.getConnection();
		
		// Turn off auto-commit so we can use transactions
        dbConn.setAutoCommit(false);

		// Update the balance 
		try (PreparedStatement updateCurBalStmt = dbConn.prepareStatement(queryStr)) {
			updateCurBalStmt.setString(1, password);
			updateCurBalStmt.setString(2, userName);
			
			rowsAffected = updateCurBalStmt.executeUpdate();
			
			if(rowsAffected != 1){
				dbErrorRollBackTx(dbConn);
				throw new ChatDbFailure(ChatDbFailure.BAD_USER);
				
			}	
		
			dbConn.commit(); /* Everything went OK */
			System.out.println("Password Updated Scuessfull !! ");
			
		} catch (SQLException ex) {
			dbErrorRollBackTx(dbConn);
		}
		
	}
	

	
	/**
	 * Selects Users with name field
	 * @param username - name
	 * @throws SQLException  When unable to connect to DB or failed Query
	 * @return ListOf User with Name as @param
	 */
	public static List<User> findAllUserWithName(String username) throws SQLException
	{
		Connection dbConn;
		String queryStr = "SELECT userid, name " + "FROM user "
				+ "WHERE name = '" + username + "'";
		
		dbConn = ChatAppDataSource.getConnection();
		Statement queryStmt = dbConn.createStatement();
		ResultSet results;
		
		List<User> userWithName = new ArrayList<User>();
		int userid;
		String name;
		
		results = queryStmt.executeQuery(queryStr);
		while (results.next()) { // process results
			
			User aUser = new User();
			
			userid = results.getInt("userid");
			name = results.getString("name");
			aUser.setId(userid);
			aUser.setName(name);
			userWithName.add(aUser);
			
		}
		
		// Free resources
		results.close();
		queryStmt.close();
		dbConn.close();
		return userWithName;
	}
	
	/**
	 * Selects Users with ID field
	 * @param userid - ID
	 * @throws SQLException  When unable to connect to DB or failed Query
	 * @return ListOf User with Name as @param
	 */
	public static User findUserWithId(int searchUserId) throws SQLException{
		
		Connection dbConn;
		String queryStr = "SELECT userid, name " + "FROM user "
				+ "WHERE userid = '" + searchUserId + "'";
		
		dbConn = ChatAppDataSource.getConnection();
		Statement queryStmt = dbConn.createStatement();
		ResultSet results;
		
		User userWithId= new User();
		int userid;
		String name;
		
		results = queryStmt.executeQuery(queryStr);
		while (results.next()) { // process results
			
			userid = results.getInt("userid");
			name = results.getString("name");
			userWithId.setId(userid);
			userWithId.setName(name);			
		}
		
		// Free resources
		results.close();
		queryStmt.close();
		dbConn.close();
		return userWithId;
	}

	/**
	 * Insert into messege_receipt Table 
	 * @param status - online/offline
	 * @throws SQLException  When unable to connect to DB or failed Query
	 */


	public static void deleteUser(String name) throws SQLException, ChatDbFailure{
		Connection dbConn;
		int rowsAffected;
		dbConn = ChatAppDataSource.getConnection();
		
		// Turn off auto-commit of db changes as they occur
		dbConn.setAutoCommit(false);
		
		String deleteStmt = "DELETE FROM `manisha_chat_project`.`user` WHERE `name`= ? ;";
				
		PreparedStatement queryStmt ;
		queryStmt = dbConn.prepareStatement(deleteStmt);
		queryStmt.setString(1, name); 
			
		try {
			rowsAffected = queryStmt.executeUpdate();
			
			if(rowsAffected != 1){
				throw new ChatDbFailure(ChatDbFailure.INVALID_CREDENTIAL);
			}
			dbConn.commit(); // make changes permanent
			dbConn.close();
			System.out.println("User Deleted Sucessfully !");
		} catch (SQLException ex) {
			dbErrorRollBackTx(dbConn); // call this function to give error and ROLLBACK
		}
	}
	
	public static void dbErrorRollBackTx(Connection dbConn) {
		try {
			System.out.println("DB access error – rollback changes");
			dbConn.rollback();
		} catch (SQLException ex) {
			System.out.println("Unable to rollback changes");
			ex.printStackTrace();
		}
	}
}

