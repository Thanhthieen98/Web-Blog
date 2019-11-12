package controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.CateDao;
import dao.NewDao;
import dao.UserDao;
import daoImpl.CateDaoImpl;
import daoImpl.NewDaoImpl;
import daoImpl.UserDaoImpl;
import model.Category;
import model.New;
import model.User;

@WebServlet (urlPatterns = "/admin/uppost")
public class AdminUpPost extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String id = req.getParameter("id");
			
			System.out.println(id);
			NewDao dao = new NewDaoImpl();
			New new1 = dao.getId(Integer.parseInt(id));
			new1.getDescription().replaceAll("<br>", "\\r?\\n");
			req.setAttribute("n", new1);
			
			CateDao cateDao = new CateDaoImpl();
			List<Category> categories = cateDao.search("");
			
			req.setAttribute("categories", categories);
			
			UserDao userDao = new UserDaoImpl();
			User user = userDao.getId(1);
			req.setAttribute("user", user);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/upost.jsp");
			dispatcher.forward(req, resp);
		}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setCharacterEncoding("UTF-8");
//			String id = req.getParameter("id");
//			String name= req.getParameter("name");
//			String description = req.getParameter("description");
//			String image = req.getParameter("image");
//			String date = req.getParameter("date");
//			String categoryid = req.getParameter("categoryid");
//			String userid = req.getParameter("userid");
//			
//			New new1 = new New();
//			new1.setId(Integer.parseInt(id));
//			new1.setName(name);
//			new1.setDescription(description);
//			new1.setImage(image);
//			new1.setDate(date);
//			CateDao cateDao = new CateDaoImpl();
//			Category category1 = cateDao.getId(Integer.parseInt(categoryid));
//			new1.setCategory(category1);
//			UserDao userDao = new UserDaoImpl();
//			User user1 = userDao.getId(Integer.parseInt(userid));
//			new1.setUser(user1);	
//			dao.updateNew(new1);
//			resp.sendRedirect("/webblog/admin/index");
			NewDao dao = new NewDaoImpl();
			DiskFileItemFactory  factory =  new DiskFileItemFactory();
			factory.setRepository(new File("D:\\files"));
			
			ServletFileUpload fileUpload = new ServletFileUpload(factory);
			fileUpload.setHeaderEncoding("UTF-8");
			try {
				List<FileItem> fileItems = fileUpload.parseRequest(req);
				New new1 = new New();
				for (FileItem fileItem : fileItems) {
					if(fileItem.getFieldName().equals("id")) {
						String id = fileItem.getString();
						new1.setId(Integer.parseInt(id));
						System.out.println(id);
					}
					System.out.println("1");
					if(fileItem.getFieldName().equals("name")) {
						String name = fileItem.getString("UTF-8");
						new1.setName(name);
						System.out.println(name);
					}
					System.out.println("2");
					if(fileItem.getFieldName().equals("description")) {
						String description = fileItem.getString("UTF-8");
						new1.setDescription(description);
						System.out.println(description);
					}
					System.out.println("3");
					if (fileItem.getFieldName().equals("date")) {
						String date = fileItem.getString();
						new1.setDate(date);
						System.out.println("date");
					}
					System.out.println("4");
					if(fileItem.getFieldName().equals("categoryid")) {
						String categoryid = fileItem.getString();
						
						Category category = new Category();
						category.setId( Integer.parseInt(categoryid));
						
						new1.setCategory(category);
					}
					System.out.println("5");
					if(fileItem.getFieldName().equals("image")) {
						if ( fileItem.getSize() > 0){
							final String UPLOAD_FOLDER ="D:\\files";
							
							String name = fileItem.getName();
							int index = name.lastIndexOf(".");
							String ext = name.substring(index);
							
							String image = System.currentTimeMillis() + ext;
							File file = new File(UPLOAD_FOLDER + File.separator + image);
							
							fileItem.write(file);
							
							new1.setImage(image);
						}
					}
					System.out.println("6");
					if(fileItem.getFieldName().equals("userid")) {
						String userid = fileItem.getString();
						User user = new User();
						user.setId(Integer.parseInt(userid));
						
						new1.setUser(user);
					}
				}
				
				dao.updateNew(new1);			
				resp.sendRedirect(req.getContextPath() +"/admin/index");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("Loi" + e);
			}

		}
}
