package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CateDao;
import daoImpl.CateDaoImpl;
import model.Category;

@WebServlet (urlPatterns = "/admin/upcate")
public class AdminUpCate extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		CateDao dao = new CateDaoImpl();
		Category cate = dao.getId(Integer.parseInt(id));
		
		req.setAttribute("category", cate);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/upcate.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String name= req.getParameter("name");
		
		CateDao cateDao = new CateDaoImpl();
		Category category = new Category();
		
		category.setId(Integer.parseInt(id));
		category.setName(name);
		
		cateDao.sua(category);
		resp.sendRedirect("/webblog/admin/category");
	}
}
