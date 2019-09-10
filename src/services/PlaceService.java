package services;

import db.PlaceDbOperations;
import model.User;

import java.sql.SQLException;

public class PlaceService {

	private static User newUser;
	

	public static void createUser(User aNewUser)
	{
		newUser = aNewUser;
		
		//Insert a new row in the a table:: 
		System.out.println("Adding New User :: " + newUser);

		try {
			PlaceDbOperations.insertUser(newUser);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
