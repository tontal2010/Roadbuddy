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



		if (tName == null || tPass == null ) {
			System.out.println("There is an error returning back!");
			/* The form contained invalid data, transfer colontrol back to original form */
			
			request.setAttribute("user", user);


			if(tName == null){
				request.setAttribute("errorInNameMsg", "กรุณาใส่ Username !");}
			if(tPass == null){
				request.setAttribute("errorInPassMsg", "กรุณาใส่รหัสผ่าน !");}
			dispatch = context.getRequestDispatcher("/login2.jsp");

		}
		//Otherwise try to login//////
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

				String name = "";
				String email = "";
				String lname = "";
				String pnum = "";
				String img = "";
				String imgfull = "";
				String year = "";
				String sex = "";
				String month = "";
				String day = "";
				String id = "";
				try {

					request.setCharacterEncoding("UTF-8");
					String loginDetail = session.getAttribute("loginUser").toString();
					System.out.println(loginDetail);
					int numslash = 1;
					int leng = loginDetail.length();

					for (int a = 0; a < leng; a++) {
						char s = loginDetail.charAt(a);

						if (s != '#') {

							if (numslash == 1) {
								name = name + s;
							}
							if (numslash == 2) {
								lname = lname + s;
							}
							if (numslash == 3) {
								email = email + s;
							}
							if (numslash == 4) {
								pnum = pnum + s;
							}
							if (numslash == 5) {
								img = img + s;
							}
							if (numslash == 6) {
								imgfull = imgfull + s;
							}
							if (numslash == 7) {
								sex = sex + s;
							}
							if (numslash == 8) {
								year = year + s;
							}
							if (numslash == 9) {
								month = month + s;
							}
							if (numslash == 10) {
								day = day + s;
							}
							if (numslash == 11) {
								id = id + s;
							}
						} else {
							if (numslash == 1) {

								System.out.println("string name = " + name);
								numslash = numslash + 1;
							} else if (numslash == 2) {
								System.out.println("string lname = " + lname);

								numslash = numslash + 1;
							} else if (numslash == 3) {

								System.out.println("string email = " + email);
								numslash = numslash + 1;
							} else if (numslash == 4) {
								System.out.println("string pnum = " + pnum);
								numslash = numslash + 1;
							} else if (numslash == 5) {
								System.out.println("string imgUpload = " + img);
								numslash = numslash + 1;
							} else if (numslash == 6) {
								System.out.println("string imgUploadFull = " + imgfull);
								numslash = numslash + 1;
							} else if (numslash == 7) {
								System.out.println("string Sex = " + sex);
								numslash = numslash + 1;
							} else if (numslash == 8) {
								System.out.println("string Year = " + year);
								numslash = numslash + 1;
							} else if (numslash == 9) {
								System.out.println("string Month = " + month);
								numslash = numslash + 1;
							} else if (numslash == 10) {
								System.out.println("string Day = " + day);
								numslash = numslash + 1;
							}
							else if (numslash == 11) {
								System.out.println("string ID = " + id);
								numslash = numslash + 1;
							}
						}
					}
				}catch (NullPointerException e){
					e.printStackTrace();
					session.setAttribute("errorMessage", "Please relogin !");

				}
				lineNotify.callEvent("KgHCReBvyITkPFGwWqCF2GXV0gjwnqnl3RVFIFNkP0I","\n[ "+tName+" ]"+"\n["+name+" "+lname+"]\n" + "เข้าสู่ระบบ !");
				System.out.println("usr"+ loginUser);
				dispatch = context.getRequestDispatcher("/home.jsp");
			}
		}
		
		
		dispatch.forward(request, response);
	}

	
}
