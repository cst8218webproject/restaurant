package project.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AuthenticationFilter
 */
@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AuthenticationFilter() {
        
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletResponse res = (HttpServletResponse) response;
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(false);
		String uri = req.getRequestURI();

		if(session.getAttribute("username") == null && !(uri.endsWith("index.jsp")|| uri.endsWith("signin.jsp") || uri.endsWith("reg.jsp")||uri.endsWith("login"))){
			res.sendRedirect("index.jsp");
		}else{
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
