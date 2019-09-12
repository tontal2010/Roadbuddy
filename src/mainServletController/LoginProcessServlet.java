package mainServletController;

import db.ChatDbOperations;
import exceptions.ChatDbFailure;
import model.LineNotify;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/loginprocess")
public class LoginProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginProcessServlet() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext context = request.getServletContext();
		HttpSession session = request.getSession(true);
//		if(session != null){
//			session.invalidate();
//		}
//		session = request.getSession(true);
		RequestDispatcher dispatch =null;
		User loginUser=null;
		
		User user = new User(request);
		String tName = user.getEmail();
		String tPass = user.getPass();
		
		////////////// If one of the username/password field is empty//////////

		if (tName == null || tPass == null) {
			System.out.println("There is an error returning back!");
			/* The form contained invalid data, transfer colontrol back to original form */
			
			request.setAttribute("user", user);
			if(tName == null){
				request.setAttribute("errorInNameMsg", "กรุณาใส่ Username !");}
			if(tPass == null){
				request.setAttribute("errorInPassMsg", "กรุณาใส่รหัสผ่าน !");}
			dispatch = context.getRequestDispatcher("/login2.jsp");
		} 
		///////Otherwise try to login//////
		else{
		
			try {
				loginUser = ChatDbOperations.loginToAccount(tName,tPass);
			} catch (ChatDbFailure | SQLException e) {
				e.printStackTrace();
			}
			//////If Database do not have any match found then login user/Password incorrect////
			if(loginUser==null){
				request.setAttribute("loginFailMsg", "User not found or invalid username and password !");
				dispatch = context.getRequestDispatcher("/login2.jsp");
			 }
			else{ //////////Else success!! //////
				session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("login", "yes");
				LineNotify lineNotify = new LineNotify ();
				lineNotify.callEvent("KgHCReBvyITkPFGwWqCF2GXV0gjwnqnl3RVFIFNkP0I","[ "+loginUser+" ]"+" เข้าสู่ระบบ");
				System.out.println("usr"+ loginUser);
				dispatch = context.getRequestDispatcher("/home.jsp");
			}
		}
		
		
		dispatch.forward(request, response);
	}

	
}
