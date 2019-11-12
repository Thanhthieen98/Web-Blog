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

@WebServlet(urlPatterns = "/admin/addcate")
public class AdminAddCate extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String err = req.getParameter("err");
		
		if(err!= null && err.equals("100")) {
			req.setAttribute("msg", "Tên tiêu đề đã bị trùng");
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/creatcate.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
			String name = req.getParameter("name");

		 
		 CateDao cateDao = new CateDaoImpl();
		 Category category = cateDao.getByName(name);
		 System.out.println(name);
		 
		 if( category!=null ) {
			 resp.sendRedirect("/webblog/admin/addcate?err=100");
		 }else {
			 Category category2 = new Category();
			 category2.setName(name);
			 cateDao.add(category2);
			 
			 resp.sendRedirect("/webblog/admin/category");
		 }
	}
}
