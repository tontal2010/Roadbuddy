package mainServletController;

import model.User;
import services.PlaceService;

import javax.jws.soap.SOAPBinding;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/createPlaceProcess")
public class CreatePlaceProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CreatePlaceProcessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("1");

		System.out.println("Do Post");
		ServletContext context;
		context = getServletContext();
		User user = new User(request);




		RequestDispatcher dispatch;
		System.out.println("name is "+ user.getName());
		System.out.println("Lastname is "+ user.getLname());
		System.out.println("From "+ user.getFrom());
		System.out.println("To "+ user.getToo());
		System.out.println("Time "+ user.getTime());
		System.out.println("Minute "+ user.getMinute());
		System.out.println("Day "+ user.getDay());
		System.out.println("Month "+ user.getMonth());
		System.out.println("Year "+ user.getYear());
		System.out.println("Numpassenger "+ user.getNumber());

		if ( user.getFrom() == null ||user.getMonth() == null ||user.getYear() == null || user.getToo() == null || user.getTime() == null || user.getDay() == null || user.getNumber() == null) {
			System.out.println("There is an error returning back!");
			/* The form contained invalid data, transfer control back to original form */
			
			request.setAttribute("user", user);
/*
			if(user.getFrom() == null){
				request.setAttribute("errorInFrom", "กรุณาพิมพ์ว่าคุณเริ่มอยู่ที่ไหน !");}
			if(user.getToo() == null){
				request.setAttribute("errorInToo", "กรุณาบอกว่าคุณจะไปที่ใด !");}
			if(user.getTime() == null){
				request.setAttribute("errorInNotSelectT", "Please select !");}

			if(user.getDay() == null){
				request.setAttribute("errorInNotSelectD", "Please select !");}
			if(user.getYear() == null){
				request.setAttribute("errorInNotSelectY", "Please select !");}
			if(user.getMonth() == null){
				request.setAttribute("errorInNotSelectM", "Please select !");}
			if(user.getNumber() == null){
				request.setAttribute("errorInNumber", "กรุณาใส่จำนวนของผู้โดยสาร !");}*/
			request.setAttribute("errorInNotSelect", "กรุณากรอกข้อมุลให้ครบ !");
			dispatch = context.getRequestDispatcher("/home.jsp");
			dispatch.forward(request, response);
			return;
		} 
		
		System.out.println("Trying to create user");
		PlaceService.createUser(user);
		System.out.println("User Created Sccuess");
		HttpSession session = request.getSession();
		session.setAttribute("create", "yes");
		dispatch = context.getRequestDispatcher("/createPlaceSucess.jsp");
		dispatch.forward(request, response);
		
	}

}
