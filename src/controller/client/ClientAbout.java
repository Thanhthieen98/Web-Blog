package controller.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import daoImpl.UserDaoImpl;
import model.User;

@WebServlet (urlPatterns = "/client/about")
public class ClientAbout extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
				UserDao dao = new UserDaoImpl();
				User user = dao.getId(1);
				
				req.setAttribute("user", user);
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/views/client/about.jsp");
				dispatcher.forward(req, resp);
	}
}
