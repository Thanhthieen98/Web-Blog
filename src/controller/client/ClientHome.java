package controller.client;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CateDao;
import dao.NewDao;
import dao.VoteDao;
import daoImpl.CateDaoImpl;
import daoImpl.NewDaoImpl;
import daoImpl.VoteDaoImpl;
import model.Category;
import model.New;
import model.Vote;

@WebServlet (urlPatterns = "/client/home")
public class ClientHome extends HttpServlet {
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				String offset = req.getParameter("offset");
				int i;
				if(offset==null) {
					i=0;
				}else {
					i=Integer.parseInt(offset);
				}
				NewDao newDao = new NewDaoImpl();
				List<New> news1 = newDao.limit(i);
				req.setAttribute("news1", news1);
				
				List<New> news2 = newDao.search("");
				req.setAttribute("news2", news2);
				
				CateDao cateDao = new CateDaoImpl();
				List<Category> categories = cateDao.search("");
				req.setAttribute("categories", categories);
				
				
				VoteDao voteDao = new VoteDaoImpl();
				List<Vote> votes = voteDao.vote();
				req.setAttribute("votes", votes);
				
				System.out.println(votes.size());
				System.out.println(categories.size());
				
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/views/client/home.jsp");
				dispatcher.forward(req, resp);
			
		}
		
}
