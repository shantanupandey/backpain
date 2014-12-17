package net.calba.backpain.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.calba.backpain.CalbaAppConstant;
import net.calba.backpain.model.Client;
import net.calba.backpain.service.CalbaService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component("authenticationInterceptor")
public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

	/**
	 * LOGGER filed.
	 */
	private static final Logger LOGGER = Logger
			.getLogger(AuthenticationInterceptor.class);
	
	@Resource
	private CalbaService calbaService;
	
	public AuthenticationInterceptor() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		 String uri = request.getRequestURI();
		 uri = uri.toLowerCase();
		 LOGGER.debug("request uri :" + uri );
		 if (!uri.endsWith("login.html") && !uri.endsWith("logout.html")
				 && !uri.endsWith("home.html")
				 && !uri.endsWith("register.html") 
				 && !uri.endsWith("project.html") 
				 && !uri.endsWith("register1.html")
				 && !uri.endsWith("getPayment.html")
				 && !uri.endsWith("trialregister.html")
				 && !uri.endsWith("passwordrecovery.html")
				 && !uri.endsWith("payment.html")
				 && !uri.endsWith("trial.html")
				
			){
			 Client client = (Client)
					 request.getSession().getAttribute(CalbaAppConstant.LOGGED_CLIENT);
			 
			 if(client == null) {
				 response.sendRedirect(request.getContextPath() + "/home.html");
				 return false;
			 } else if (uri.contains("/admin/") && 
					 client.getRoleId() == CalbaAppConstant.CLIENT_ROLD_ID ) {				 
				 response.sendRedirect(request.getContextPath() + "/welcome.html");
				 return false;
			 }
			  
		 } else {
			 request.setAttribute("projects", calbaService.getActiveTrialProjects());
		 }
		
		return true;
	}

	

	
	
}
