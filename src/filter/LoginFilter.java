package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

@WebFilter (urlPatterns = "/admin/*")
public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			
			
			HttpSession session = req.getSession();
			System.out.println("sesionid:" +session.getId());
			
			Object object = session.getAttribute("loginUser");
			
			if(object !=null) {
				User user = (User) object;
				
				chain.doFilter(request, response);
			}else {
				resp.sendRedirect("/webblog/login-admin");
				return;
			}
			
	}

}
