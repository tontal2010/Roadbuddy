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

		String insertStmt = "INSERT INTO `rb_2`.`rb_member`  (`name`, `pass`,`sex`,`pnum`,`emerpnum`,`email`,`lname`,`status`,`uploadimg`,`birthday`,`bio`)  " +
				"VALUES (? ,?,?,?,?,?,?,?,?,?,?);";


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
		queryStmt.setString(9,"0");
		queryStmt.setString(10,user.getBirthday());
		queryStmt.setString(11,"ยังไม่มีคำแนะนำตัว");
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

        String insertStmt = "INSERT INTO `rb_2`.`place`  (`ownerid`,`name`, `lname`,`from`,`too`,`date`,`month`,`year`,`time`,`minute`,`numberpass`,`platenum`,`numjoin`,`pnum`,`pic`)  " +
                "VALUES (?,? ,?,?,?,?,?,?,?,?,?,?,?,?,?);";


        PreparedStatement queryStmt ;
        queryStmt = dbConn.prepareStatement(insertStmt);
       // queryStmt.setString(1, user.getName());
       // queryStmt.setString(2,user.getLname());
		queryStmt.setInt(1, user.getId());
		queryStmt.setString(2, user.getName());
		queryStmt.setString(3,user.getLname());
        queryStmt.setString(4,user.getFrom());
		queryStmt.setString(5,user.getToo());
        queryStmt.setString(6,user.getDay());
        queryStmt.setString(7,user.getMonth());
        queryStmt.setString(8,user.getYear());
        queryStmt.setString(9,user.getTime());
		queryStmt.setString(10,user.getMinute());
		queryStmt.setString(11,user.getNumber());
        queryStmt.setString(12,"OOO33กน");
        queryStmt.setString(13,"O");
        queryStmt.setString(14,user.getPnum());
		queryStmt.setString(15,user.getImgfull());

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
		Connection dbConn ;
		dbConn = ChatAppDataSource.getConnection();
		int rowsAffected;
		String queryStr = "SELECT * " + "FROM rb_2.rb_member " + "WHERE email = ? and pass = ?";
		PreparedStatement sqlprep = dbConn.prepareStatement(queryStr);
		sqlprep.setString(1,userName);
		sqlprep.setString(2,password);

		//Statement queryStmt = dbConn.createStatement();
		//Statement queryStmt = dbConn.prepareStatement(sqlprep);
		ResultSet results;
		
		User loggedInUser= new User();
		int userid;
		
		//results = queryStmt.executeQuery(queryStr);
		results = sqlprep.executeQuery();
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
			String img = results.getString("uploadimg");
			String bd = results.getString("birthday");
			String imgfull = results.getString("img");
			String bio = results.getString("bio");

			loggedInUser.setBirthday(bd);System.out.println("Set "+ bd);
			loggedInUser.setEmerpnum(emerpnum);System.out.println("Set "+ emerpnum);
			loggedInUser.setImg(img);System.out.println("Set "+ img);
			loggedInUser.setName(name);System.out.println("Set "+ name);
			loggedInUser.setLname(lname);System.out.println("Set "+ lname);
			loggedInUser.setPnum(pnum);System.out.println("Set "+ pnum);
			loggedInUser.setEmail(userName);System.out.println("Set "+ userName);
			loggedInUser.setPass(password);System.out.println("Set "+ password);
			loggedInUser.setImgfull(imgfull);System.out.println("Set "+ imgfull);
			loggedInUser.setId(userid);System.out.println("Set "+ userid);
			loggedInUser.setBio(bio);System.out.println("Set "+ bio);





			changeUserStatus(userid, User.ONLINE);
			
			loggedInUser.setStatus(User.ONLINE);
			
			// Free resources
			results.close();
			sqlprep.close();
			//sqlprep.close();
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
	public static void changeUserData(User user)throws ChatDbFailure,SQLException {
		Connection dbConn;
		int rowsAffected;
		String queryStr = "UPDATE rb_2.rb_member SET name = ?,lname = ?,bio = ?,pnum = ?,emerpnum = ?,email = ? where userid = ?;";

		dbConn = ChatAppDataSource.getConnection();

		// Turn off auto-commit so we can use transactions
		dbConn.setAutoCommit(false);

		// Update the balance
		try (PreparedStatement updateCurBalStmt = dbConn.prepareStatement(queryStr)) {
			updateCurBalStmt.setString(1, user.getName());
			updateCurBalStmt.setString(2, user.getLname());
			updateCurBalStmt.setString(3, user.getBio());
			updateCurBalStmt.setString(4, user.getPnum());
			updateCurBalStmt.setString(5, user.getEmerpnum());
			updateCurBalStmt.setString(6, user.getEmail());
			updateCurBalStmt.setInt(7, user.getId());

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

	public static void changeUserStatus(String name, String newStatus)throws ChatDbFailure,SQLException {
		Connection dbConn;
		int rowsAffected;
		String queryStr = "UPDATE rb_2.rb_member SET status = ? where name = ?;";
		
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
	

	

	public static List<User> findAllUserWithName(String username) throws SQLException
	{
		Connection dbConn;
		String queryStr = "SELECT userid, name " + "FROM rb_2.rb_member "
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

	public static User findUserWithEmail(String searchUserId) throws SQLException{
		
		Connection dbConn;
		String queryStr = "SELECT * " + "FROM rb_2.rb_member "
				+ "WHERE email = '" + searchUserId + "'";
		
		dbConn = ChatAppDataSource.getConnection();
		Statement queryStmt = dbConn.createStatement();
		ResultSet results;
		
		User userWithId= new User();
		int userid;
		String name,lname,pnum,email,uploadimg,imgfull,sex,bd,bio,emerpnum;
		
		results = queryStmt.executeQuery(queryStr);
		while (results.next()) { // process results
			
			userid = results.getInt("userid");
			name = results.getString("name");
			lname = results.getString("lname");
			pnum = results.getString("pnum");
			email = results.getString("email");
			uploadimg = results.getString("uploadimg");
			imgfull = results.getString("img");
			sex = results.getString("sex");
			bd = results.getString("birthday");
			bio = results.getString("bio");
			emerpnum = results.getString("emerpnum");
			String year ="";
			String month ="";
			String day ="";
			int numslash = 1;
			int leng = bd.length();

			for(int a =0;a<leng;a++) {
				char s = bd.charAt(a);

				if (s != '-') {

					if (numslash == 1) {
						year = year + s;
					}
					if (numslash == 2) {
						month = month + s;
					}
					if (numslash == 3) {
						day = day + s;
					}

				} else {
					if (numslash == 1) {

						System.out.println("string year = " + year);
						numslash = numslash + 1;
					} else if (numslash == 2) {
						System.out.println("string month = " + month);

						numslash = numslash + 1;
					} else if (numslash == 3) {

						System.out.println("string day = " + day);
						numslash = numslash + 1;
					}
				}
			}
			userWithId.setByear(year);
			userWithId.setBmonth(month);
			userWithId.setBday(day);
			userWithId.setId(userid);
			userWithId.setName(name);
			userWithId.setLname(lname);
			userWithId.setPnum(pnum);
			userWithId.setEmail(email);
			userWithId.setImg(uploadimg);
			userWithId.setImg(uploadimg);
			userWithId.setImgfull(imgfull);
			userWithId.setSex(sex);
			userWithId.setBio(bio);
			userWithId.setEmerpnum(emerpnum);

		}
		
		// Free resources
		results.close();
		queryStmt.close();
		dbConn.close();
		return userWithId;
	}
	public static User findCarWithId(String searchUserId) throws SQLException{

		Connection dbConn;
		String queryStr = "SELECT * " + "FROM rb_2.place "
				+ "WHERE id = '" + searchUserId + "'";

		dbConn = ChatAppDataSource.getConnection();
		Statement queryStmt = dbConn.createStatement();
		ResultSet results;

		User userWithId= new User();
		int userid;
		String name,lname,pnum,email,uploadimg,imgfull,sex,bd;

		results = queryStmt.executeQuery(queryStr);
		while (results.next()) { // process results

			userid = results.getInt("id");
			name = results.getString("name");
			lname = results.getString("lname");
			pnum = results.getString("pnum");
			email = results.getString("email");
			uploadimg = results.getString("uploadimg");
			imgfull = results.getString("img");
			sex = results.getString("sex");
			bd = results.getString("birthday");
			String year ="";
			String month ="";
			String day ="";
			int numslash = 1;
			int leng = bd.length();

			for(int a =0;a<leng;a++) {
				char s = bd.charAt(a);

				if (s != '-') {

					if (numslash == 1) {
						year = year + s;
					}
					if (numslash == 2) {
						month = month + s;
					}
					if (numslash == 3) {
						day = day + s;
					}

				} else {
					if (numslash == 1) {

						System.out.println("string year = " + year);
						numslash = numslash + 1;
					} else if (numslash == 2) {
						System.out.println("string month = " + month);

						numslash = numslash + 1;
					} else if (numslash == 3) {

						System.out.println("string day = " + day);
						numslash = numslash + 1;
					}
				}
			}
			userWithId.setByear(year);
			userWithId.setBmonth(month);
			userWithId.setBday(day);
			userWithId.setId(userid);
			userWithId.setName(name);
			userWithId.setLname(lname);
			userWithId.setPnum(pnum);
			userWithId.setEmail(email);
			userWithId.setImg(uploadimg);
			userWithId.setImg(uploadimg);
			userWithId.setImgfull(imgfull);
			userWithId.setSex(sex);

		}

		// Free resources
		results.close();
		queryStmt.close();
		dbConn.close();
		return userWithId;
	}



	public static void deleteUser(String name) throws SQLException, ChatDbFailure{
		Connection dbConn;
		int rowsAffected;
		dbConn = ChatAppDataSource.getConnection();
		
		// Turn off auto-commit of db changes as they occur
		dbConn.setAutoCommit(false);
		
		String deleteStmt = "DELETE FROM `rb_2`.`rb_member` WHERE `name`= ? ;";
				
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
	public static void deleteplace(int name) throws SQLException, ChatDbFailure{
		Connection dbConn;
		int rowsAffected;
		dbConn = ChatAppDataSource.getConnection();

		// Turn off auto-commit of db changes as they occur
		dbConn.setAutoCommit(false);

		String deleteStmt = "DELETE FROM `rb_2`.`place` WHERE `id`= ? ;";

		PreparedStatement queryStmt ;
		queryStmt = dbConn.prepareStatement(deleteStmt);
		queryStmt.setInt(1, name);

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

