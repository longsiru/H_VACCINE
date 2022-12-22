package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.VaccineDAO;
/**
 * Servlet implementation class VaccineController
 */
@WebServlet("/")
public class VaccineController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public VaccineController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doPor(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPor(request, response);
	}
	
	protected void doPor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String context = request.getContextPath();
		String command = request.getServletPath();
		String site = null;
		
		VaccineDAO vaccine = new VaccineDAO();
		
		switch(command){
		case "/home":
			site= "index.jsp";
			break;
		case "/reserv":
			site= "reserv.jsp";
			break;
		case "/insert":
			site = vaccine.insert(request, response);
			break;
		}
		getServletContext().getRequestDispatcher("/" + site).forward(request, response);
	}
}