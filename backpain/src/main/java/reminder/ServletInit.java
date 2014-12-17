package reminder;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import net.calba.backpain.model.ClientListing;
import net.calba.backpain.service.impl.AdminServiceImpl;
import net.calba.backpain.controller.AdminController;
import net.calba.backpain.dao.mybatis.CalbaMapper;


/**
 * Servlet implementation class ServletInit
 */
public class ServletInit extends HttpServlet {
	
	@Autowired
	CalbaMapper calbaMapper;
	
	@Autowired
	AdminController adminController;
	

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	 public void init() throws ServletException
	    {
		// ReminderBeep remind= new ReminderBeep(4);
		  
		 
//		 ApplicationContext ctx=new ClassPathXmlApplicationContext("classpath:src/main/resources/config/spring-config/spring-datalayer-dao.xml");
//		 AdminServiceImpl performer=(AdminServiceImpl)ctx.getBean("calbaMapper");
		 
		 AdminController aController= new AdminController();
		 
         

					

	    }

		 
	 
       
   

}
