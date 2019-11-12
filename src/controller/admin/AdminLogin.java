package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.UserDao;
import daoImpl.UserDaoImpl;
import model.User;


@WebServlet(urlPatterns = "/login-admin")
public class AdminLogin extends HttpServlet  {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String code = req.getParameter("errCode");

		if (code != null && code.equals("100")) {
			req.setAttribute("msg", "Tài khoản hoặc mật khẩu sai");
		}
		RequestDispatcher dispathcer = req.getRequestDispatcher("/views/admin/login.jsp");
		dispathcer.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String pass = req.getParameter("password");
		System.out.println(username);
		System.out.println(pass);

		// tao session
		HttpSession session = req.getSession();
		System.out.println("session id : " + session.getId());

		UserDao userDao = new UserDaoImpl();
		User user = userDao.getByUsername(username);

		if (user != null && user.getPassword().equals(pass)) {
			System.out.println("Log in success");
			// luu doi tuong vao session
			session.setAttribute("loginUser", user);
			// chuyen huong : server tra ve cho client mot trang web(duong dan) khac
			// req.getContextPath(): ten root path(ten project)
			resp.sendRedirect(req.getContextPath() + "/admin/index"); // respond : server tra ve
		} else {
			System.out.println("Fail");
			resp.sendRedirect(req.getContextPath() + "/admin/login?errCode=100");
		};
	}
}
