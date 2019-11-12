package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CateDao;
import dao.NewDao;
import daoImpl.CateDaoImpl;
import daoImpl.NewDaoImpl;
import model.Category;
import model.New;

@WebServlet (urlPatterns = "/admin/category")
public class AdminCategory extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CateDao cateDao = new CateDaoImpl();
		List<Category> categories = cateDao.search("");
		
		req.setAttribute("categories", categories);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/listcategory.jsp");
		dispatcher.forward(req, resp);
	}
	
	
}
