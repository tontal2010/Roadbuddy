package mainServletController;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.ChatDbOperations;
import exceptions.ChatDbFailure;
import model.User;

@WebServlet("/profileprocess")
public class ProfileProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProfileProcessServlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {

	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Do get for Login");
		ServletContext context = request.getServletContext();

		String pageCtx;
		pageCtx = request.getContextPath();
		HttpSession session = request.getSession(false);
		RequestDispatcher dispatch =null;
		String email =  session.getAttribute("email").toString();
		User data = null;
		try {
			data = ChatDbOperations.findUserWithEmail(email);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("datastr",data);
		String datastr = session.getAttribute("datastr").toString();
		String name ="";
		String email2 = "";
		String lname = "";
		String pnum ="";
		String img ="";
		String imgfull="";
		String sex="";
		request.setCharacterEncoding( "UTF-8" );
		System.out.println(datastr);
		int numslash = 1;
		int leng = datastr.length();

		for(int a =0;a<leng;a++) {
			char s = datastr.charAt(a);

			if (s != '#') {

				if (numslash == 1) {
					name = name + s;
				}
				if (numslash == 2) {
					lname = lname + s;
				}
				if (numslash == 3) {
					email2 = email2 + s;
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
				}else if (numslash == 5) {
					System.out.println("string imgUpload = " + img);
					numslash = numslash + 1;
				}
				else if (numslash == 6) {
					System.out.println("string imgUploadFull = " + imgfull);
					numslash = numslash + 1;
				}
				else if (numslash == 7) {
					System.out.println("string Sex = " + sex);
					numslash = numslash + 1;
				}
			}
		}
		session =request.getSession();
		session.setAttribute("name",name);
		session.setAttribute("lname",lname);
		session.setAttribute("email",email2);
		session.setAttribute("pnum",pnum);
		session.setAttribute("imgfull",imgfull);
		session.setAttribute("sex",sex);

		dispatch = context.getRequestDispatcher("/profile2.jsp");
		dispatch.forward(request, response);
	}

}
