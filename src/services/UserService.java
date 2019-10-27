package services;

import db.ChatDbOperations;
import exceptions.ChatDbFailure;
import model.User;

import java.sql.SQLException;

public class UserService {

	private static User newUser;
	

	public static void createUser(User aNewUser)
	{
		newUser = aNewUser;
		
		//Insert a new row in the a table:: 
		System.out.println("Adding New User :: " + newUser);

		try {
			ChatDbOperations.insertUser(newUser);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void updateUser(User aNewUser)
	{
		newUser = aNewUser;

		//Insert a new row in the a table::
		System.out.println("Update User :: " + newUser);

		try {
			ChatDbOperations.changeUserData(newUser);
		} catch (SQLException | ChatDbFailure e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
