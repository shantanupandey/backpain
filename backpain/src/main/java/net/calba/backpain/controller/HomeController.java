package net.calba.backpain.controller;

import javax.servlet.http.HttpServletRequest;

import net.calba.backpain.CalbaAppConstant;
import net.calba.backpain.form.LoginForm;
import net.calba.backpain.model.Client;
import net.calba.backpain.service.AdminService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import reminder.ReminderBeep;

@Controller
public class HomeController {
	
	@Autowired
	private AdminService adminService;
	
	
	private static final Logger LOGGER = Logger
			.getLogger(HomeController.class);
	
	@RequestMapping(method=RequestMethod.GET, value="/home")
	 public String handleRequest(ModelMap model){
		model.addAttribute("loginForm", new LoginForm());
		 
         ReminderBeep remind= new ReminderBeep(4);
         remind.remindVal(adminService);


		
		return "home";
	 }
	
	

	@RequestMapping(method = RequestMethod.GET, value = "/logout")
	public String handleRequest(HttpServletRequest request, ModelMap model) {
		request.getSession().removeAttribute(CalbaAppConstant.LOGGED_CLIENT);
		Client client = (Client) request.getSession().getAttribute(
				CalbaAppConstant.LOGGED_CLIENT);		
		LOGGER.debug("logout Client : " + client);
		request.getSession().invalidate();
		model.addAttribute("loginForm", new LoginForm());
		return "home";
	}

}
