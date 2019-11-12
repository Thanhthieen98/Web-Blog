package controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItem;
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

@WebServlet (urlPatterns = "/admin/addpost")
public class AdminAddpost extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String err = req.getParameter("err");
		
		CateDao dao = new CateDaoImpl();
		List<Category> cate = dao.search("");
		
		req.setAttribute("categories", cate);
		
		UserDao userDao = new UserDaoImpl();
		User user = userDao.getId(1);
		
		req.setAttribute("user", user);
		
		if(err!= null && err.equals("100")) {
			req.setAttribute("msg", "Tên tiêu đề đã bị trùng");
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/creatpost.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		 NewDao dao = new NewDaoImpl();
//		 String name = req.getParameter("name");
//		 String description = req.getParameter("description");
//		 String image = req.getParameter("image");
//		 String date = req.getParameter("date");
//		 String categoryid = req.getParameter("categoryid");
//		 String userid = req.getParameter("userid");
//		 
//		 New new1 = dao.getNewName(name);
//	 
//		 if( new1!=null ) {
//			 resp.sendRedirect("/webblog/admin/addpost?err=100");
//		 }else {
//			 New new2 = new New();
//				new2.setName(name);
//				new2.setDescription(description);
//			new2.setImage(image);
//				new2.setDate(date);
//				CateDao cateDao = new CateDaoImpl();
//				Category category1 = cateDao.getId(Integer.parseInt(categoryid));
//				new2.setCategory(category1);
//				UserDao userDao = new UserDaoImpl();
//				User user1 = userDao.getId(Integer.parseInt(userid));
//				new2.setUser(user1);
//			 dao.addNew(new2);
//			 
//			 resp.sendRedirect("/webblog/admin/index");
//		 }
		
		DiskFileItemFactory  factory =  new DiskFileItemFactory();
		factory.setRepository(new File("D:\\files"));
		
		ServletFileUpload fileUpload = new ServletFileUpload(factory);
		fileUpload.setHeaderEncoding("UTF-8");
		
		try {
			List<FileItem> fileItems = fileUpload.parseRequest(req);
			New new1 = new New();
			for (FileItem fileItem : fileItems) {
				System.out.println("1");
				if(fileItem.getFieldName().equals("name")) {
					String name = fileItem.getString("UTF-8");
					New new2 = dao.getNewName(name);
					if(new2 !=null ) {
						resp.sendRedirect(req.getContextPath() + "/admin/addpost?err=100");
						break;
					}
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
			
			dao.addNew(new1);
			
			resp.sendRedirect(req.getContextPath() +"/admin/index");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Loi" + e);
		}
	
	}
}
