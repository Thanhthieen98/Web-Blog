package controller.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NewDao;
import daoImpl.NewDaoImpl;
import model.New;

@WebServlet (urlPatterns = "/client/search")
public class ClientSearch extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String keyword = req.getParameter("keyword");
		 NewDao newDao = new NewDaoImpl();
		 List<New> news = newDao.search(keyword);
		 req.setAttribute("news", news);
		 
		 RequestDispatcher dispatcher = req.getRequestDispatcher("/views/client/search.jsp");
		 dispatcher.forward(req, resp);
	}
}
