package mainServletController;

import model.LineNotify;
import model.User;
import services.UserService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/updateUserProcess")
public class UpdateUserProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateUserProcessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("Do Post");
		ServletContext context;
		context = getServletContext();
		
		User user = new User(request);
		RequestDispatcher dispatch;
		System.out.println("name is "+ user.getName());
		System.out.println("Lastname is "+ user.getLname());
		System.out.println("Bio is "+ user.getBio());
		System.out.println("Phone number is "+ user.getPnum());
		System.out.println("Emer Phone number is "+ user.getEmerpnum());
		System.out.println("Email is "+ user.getEmail());
		System.out.println("ID is "+ user.getId());

		if ( user.getBio() == null || user.getName() == null || user.getLname() == null ||user.getPnum() == null || user.getEmerpnum() == null || user.getEmail() == null) {
			System.out.println("There is an error returning back!");
			/* The form contained invalid data, transfer control back to original form */
			
			request.setAttribute("user", user);

			if(user.getName() == null){
				request.setAttribute("errorInNameMsg", "ชื่อไม่สามารถว่างได้ !");}
			if(user.getBio() == null){
				request.setAttribute("errorInBio", "Bio ไม่สามารถว่างได้ !");}

			if(user.getLname() == null){
				request.setAttribute("errorInLNameMsg", "นามสกุลต้องไม่ว่างเปล่า !");}

			if(user.getPnum() == null){
				request.setAttribute("errorInPnum", "กรุณาใส่่หมายเลขโทรศัพท์!");}
			if(user.getEmerpnum() == null){
				request.setAttribute("errorInEmernum", "กรุณาใส่หมายเลขติดต่อฉุกเฉิน !");}

			if(user.getEmail() == null){
				request.setAttribute("errorInEmail", "กรุณาใส่ Email !");}
			dispatch = context.getRequestDispatcher("/edit_profile.jsp");
			dispatch.forward(request, response);
			return;
		} 
		
		System.out.println("Trying to create user");
		UserService.updateUser(user);
		System.out.println("Update User Success");
		HttpSession session = request.getSession();
		session.setAttribute("updateuser","block");

		dispatch = context.getRequestDispatcher("/edit_profile.jsp");
		dispatch.forward(request, response);
	//	response.sendRedirect("/profileprocess");
		
	}

}
