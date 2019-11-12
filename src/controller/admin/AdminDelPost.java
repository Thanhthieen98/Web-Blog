package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NewDao;
import daoImpl.NewDaoImpl;

@WebServlet(urlPatterns = "/admin/delpost")
public class AdminDelPost extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		System.out.println(id);
		NewDao Dao = new NewDaoImpl();
		Dao.delNew(Integer.parseInt(id));
		
		resp.sendRedirect("/webblog/admin/index");
		
	}
}
