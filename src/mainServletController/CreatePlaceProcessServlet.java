package mainServletController;

import model.User;
import services.PlaceService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		System.out.println("Date "+ user.getDate());
		System.out.println("Numpassenger "+ user.getNumber());

		if ( user.getFrom() == null || user.getToo() == null || user.getTime() == null || user.getDate() == null || user.getNumber() == null) {
			System.out.println("There is an error returning back!");
			/* The form contained invalid data, transfer control back to original form */
			
			request.setAttribute("user", user);
/*
			if(user.getName() == null){
				request.setAttribute("errorInNameMsg", "ข้อผิดพลาดเกี่ยวกับชื่อ !");}

			if(user.getLname() == null){
				request.setAttribute("errorInLNameMsg", "ข้อผิดพลาดเกี่ยวกับนามสกุล !");}
*/			if(user.getFrom() == null){
				request.setAttribute("errorInFrom", "กรุณาพิมพ์ว่าคุณเริ่มอยู่ที่ไหน !");}
			if(user.getToo() == null){
				request.setAttribute("errorInToo", "กรุณาบอกว่าคุณจะไปที่ใด !");}
			if(user.getTime() == null){
				request.setAttribute("errorInTime", "กรุณาใส่เวลาที่จะไป !");}
			if(user.getDate() == null){
				request.setAttribute("errorInDate", "กรุณาใส่วันที่จะไป !");}
			if(user.getNumber() == null){
				request.setAttribute("errorInNumber", "กรุณาใส่จำนวนของผู้โดยสาร !");}
			dispatch = context.getRequestDispatcher("/driver.jsp");
			dispatch.forward(request, response);
			return;
		} 
		
		System.out.println("Trying to create user");
		PlaceService.createUser(user);
		System.out.println("User Created Sccuess");
		
		dispatch = context.getRequestDispatcher("/createPlaceSucess.jsp");
		dispatch.forward(request, response);
		
	}

}
