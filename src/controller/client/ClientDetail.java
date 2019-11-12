package controller.client;

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
import dao.VoteDao;
import daoImpl.CateDaoImpl;
import daoImpl.NewDaoImpl;
import daoImpl.VoteDaoImpl;
import model.Category;
import model.New;
import model.Vote;

@WebServlet(urlPatterns = "/client/post")
public class ClientDetail extends HttpServlet {
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String id = req.getParameter("id");
			
			NewDao dao = new NewDaoImpl();
			New new1 = dao.getNewId(Integer.parseInt(id));
			
			req.setAttribute("n", new1);
			
			CateDao cateDao = new CateDaoImpl();
			List<Category> categories = cateDao.search("");
			req.setAttribute("categories", categories);
			
			VoteDao voteDao = new VoteDaoImpl();
			Vote vote = voteDao.search(Integer.parseInt(id));
			req.setAttribute("vote", vote);
			System.out.println(id);
			
			List<Vote> votes = voteDao.vote();
			req.setAttribute("votes", votes);
				
			RequestDispatcher dispatcher = req.getRequestDispatcher("/views/client/detail.jsp");
			dispatcher.forward(req, resp);
		} 
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String id = req.getParameter("id");
			String vote = req.getParameter("rating");
			System.out.println(id);
			System.out.println(vote);
			VoteDao voteDao = new VoteDaoImpl();
			Vote vote2 = voteDao.search(Integer.parseInt(id));
			Vote vote3 = new Vote();
			if( vote2 !=null){
				int i = vote2.getVote()+Integer.parseInt(vote);
				vote3.setId(Integer.parseInt(id));
				vote3.setVote(i);
				System.out.println(i);		
				voteDao.upvote(vote3);
			}else {
				vote3.setId(Integer.parseInt(id));
				vote3.setVote(Integer.parseInt(vote));
				NewDao dao = new NewDaoImpl();
				New new1 = dao.getId(Integer.parseInt(id));
				vote3.setPost(new1);
				voteDao.add(vote3);
			}
			
			resp.sendRedirect("/webblog/client/post?id="+id);
		}
}
