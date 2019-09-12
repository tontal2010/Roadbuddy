package mainServletController;

import model.User;
import services.UserService;
import model.LineNotify;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/createUserProcess")
public class CreateUserProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateUserProcessServlet() {
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
		System.out.println("Sex is "+ user.getSex());
		System.out.println("Phone number is "+ user.getPnum());
		System.out.println("Emer Phone number is "+ user.getEmerpnum());
		System.out.println("Email is "+ user.getEmail());

		if (!user.getPass().equals(user.getPass2()) || user.getName() == null || user.getPass() == null || user.getLname() == null || user.getSex() == null || user.getPnum() == null || user.getEmerpnum() == null || user.getEmail() == null) {
			System.out.println("There is an error returning back!");
			/* The form contained invalid data, transfer control back to original form */
			
			request.setAttribute("user", user);
			if(!user.getPass().equals(user.getPass2())){
				request.setAttribute("errorInPass2Msg","รหัสทั้งสองไม่ตรงกัน !");
			}
			if(user.getName() == null){
				request.setAttribute("errorInNameMsg", "ชื่อไม่สามารถว่างได้ !");}
			if(user.getPass() == null){
				request.setAttribute("errorInPassMsg", "รหัสต้องไม่ว่างเปล่า !");}
			if(user.getLname() == null){
				request.setAttribute("errorInLNameMsg", "นามสกุลต้องไม่ว่างเปล่า !");}
			if(user.getSex() == null){
				request.setAttribute("errorInSex", "กรุณาเลือกเพศของคุณ !");}
			if(user.getPnum() == null){
				request.setAttribute("errorInPnum", "กรุณาใส่่หมายเลขโทรศัพท์!");}
			if(user.getEmerpnum() == null){
				request.setAttribute("errorInEmernum", "กรุณาใส่หมายเลขติดต่อฉุกเฉิน !");}
			if(user.getEmail() == null){
				request.setAttribute("errorInEmail", "กรุณาใส่ Email !");}
			dispatch = context.getRequestDispatcher("/register2.jsp");
			dispatch.forward(request, response);
			return;
		} 
		
		System.out.println("Trying to create user");
		UserService.createUser(user);
		System.out.println("User Created Success");
		HttpSession session = request.getSession();
		LineNotify lineNotify = new LineNotify ();
		lineNotify.callEvent("KgHCReBvyITkPFGwWqCF2GXV0gjwnqnl3RVFIFNkP0I","มีการสมัครสมาชิกใหม่/nชื่อ : "+user.getName()+" "+user.getLname()+"\nEmail : "+user.getEmail());
		session.setAttribute("createuser","yes");
		dispatch = context.getRequestDispatcher("/createUserSucess.jsp");
		dispatch.forward(request, response);
		
	}

}
