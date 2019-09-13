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

@WebServlet("/logoutprocess")
public class LogoutProcessServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LogoutProcessServlet() {
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

       // User logoutuser =  (User) session.getAttribute("loginUser");
        RequestDispatcher dispatch =null;
        /*try {
            ChatDbOperations.logOutUser(logoutuser.getId());
        } catch (SQLException | ChatDbFailure e) {
            e.printStackTrace();
        }*/
        //System.out.println("LOGGING OUT ::getName "+logoutuser.getName());
        session.invalidate();

        //response.sendRedirect(pageCtx + "/logoutUserSucess.jsp");
        dispatch = context.getRequestDispatcher("/login2.jsp");
        dispatch.forward(request, response);
    }

}
