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
import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*;  
@WebServlet( urlPatterns = "/client/contact")
public class ClientContact extends HttpServlet {
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String code =req.getParameter("msg");
			if(code !=null && code.equals("100")) {
				req.setAttribute("msg", "MESSAGE SENT SUCCESSFULLY");
			}
			
			
			UserDao dao = new UserDaoImpl();
			User user = dao.getId(1);
			
			req.setAttribute("user", user);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/views/client/contact.jsp");
			dispatcher.forward(req, resp);
		}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				String name = req.getParameter("name");
				String email = req.getParameter("email");
				String subject = req.getParameter("subject");
				String msg = req.getParameter("message");
				
				Properties props = new Properties();    
		          props.put("mail.smtp.host", "smtp.gmail.com");    
		          props.put("mail.smtp.socketFactory.port", "465");    
		          props.put("mail.smtp.socketFactory.class",    
		                    "javax.net.ssl.SSLSocketFactory");    
		          props.put("mail.smtp.auth", "true");    
		          props.put("mail.smtp.port", "465");    
		          //get Session   
		          Session session = Session.getDefaultInstance(props,    
		           new javax.mail.Authenticator() {    
		           protected PasswordAuthentication getPasswordAuthentication() {    
		           return new PasswordAuthentication("thanhthieen98@gmail.com","ykwkodoynfepmunk");  
		           }    
		          });    
		          //compose message    
		          try {    
		           MimeMessage message = new MimeMessage(session);
		           message.setFrom(new InternetAddress(email));
		           message.addRecipient(Message.RecipientType.TO,new InternetAddress("thanhthieen98@gmail.com"));    
		           message.setSubject(subject);    
		           message.setText(msg);    
		           //send message  
		           Transport.send(message);    
		           System.out.println("message sent successfully");    
		          } catch (MessagingException e) {throw new RuntimeException(e);
		          	
		          }    
		            resp.sendRedirect(req.getContextPath() +"/client/contact?msg=100"); 
		    }  
}
