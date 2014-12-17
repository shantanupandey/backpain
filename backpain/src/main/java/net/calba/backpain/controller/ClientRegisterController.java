package net.calba.backpain.controller;

import java.util.Date;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import net.calba.backpain.CalbaAppConstant;
import net.calba.backpain.Util;
import net.calba.backpain.exception.CalbaAppServiceException;
import net.calba.backpain.form.ClientRegisterForm;
import net.calba.backpain.form.FormUtil;
import net.calba.backpain.form.LoginForm;
import net.calba.backpain.controller.LoginController;
import net.calba.backpain.model.CategoryList;
import net.calba.backpain.model.ClientDetail;
import net.calba.backpain.model.ClientListing;
import net.calba.backpain.model.Project;
import net.calba.backpain.service.AdminService;
import net.calba.backpain.service.CalbaService;
import net.calba.backpain.service.ClientService;

import org.apache.log4j.Logger;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import reminder.MailReminder;

import com.paypal.core.rest.PayPalRESTException;
import com.paypal.core.rest.PayPalResource;

@Controller
//@SessionAttributes(CalbaAppConstant.LOGGED_CLIENT)
public class ClientRegisterController {
	
	private static final Logger LOGGER = Logger
			.getLogger(ClientRegisterController.class);

	@Resource
	private ClientService clientService;
	
	@Resource
	private CalbaService calbaService;
	
	@Resource
	private AdminService adminService; 
	
	public static LinkedHashMap<String, String> map ;
	 @RequestMapping(method=RequestMethod.GET, value="/register")
	 public String register(ModelMap model){
		ClientRegisterForm form = new ClientRegisterForm();
		System.out.println("hello here");
		CategoryList cate=new CategoryList();
		form.setProjectId(CalbaAppConstant.DIRECT_USER_PROJECT_ID);
		List<CategoryList> category=clientService.getCategoryList();
		List cat=new ArrayList();
		for(int i=0;i<category.size();i++){
			Map m = (Map) category.get(i);
			System.out.println("category list ==" + m.get("categoryname"));
			cate.setStatus(new String []{ "false"});
			cat.add(m.get("categoryname").toString());
		}
		model.addAttribute("category", category);
		model.addAttribute("cat", cat);
		model.addAttribute("form", form);
		
		return "register";
	 }
	 
	 
	 @RequestMapping(method=RequestMethod.GET, value="/{projectId}/{name}/trial")
	 public String trial(@PathVariable Integer projectId,
			 @PathVariable String name,  ModelMap model){
		ClientRegisterForm form = new ClientRegisterForm();
		form.setProjectId(projectId);
		form.setTrial(true);
		Project project = calbaService.getProject(new Long(projectId));
		model.addAttribute("project", project);
		model.addAttribute("form", form);
		
		return "trial";
	 }
	 
	 @RequestMapping(method=RequestMethod.POST, value="/trialRegister")
	 public String trialRegister(@RequestParam Integer projectId,  ModelMap model){
		ClientRegisterForm form = new ClientRegisterForm();
		form.setProjectId(projectId);
		form.setTrial(true);
		model.addAttribute("form", form);
		
		return "register";
	 }
	 
	 @RequestMapping(method = RequestMethod.POST, value = "/register")
		public String handleRequest(@ModelAttribute("form") @Valid ClientRegisterForm form,
				BindingResult result, ModelMap model) {
		 
		 try {
			 CategoryList cate=new CategoryList();
			 	if(Util.formatDate(form.getDateOfBirth()) == null) {
			 		result.reject("dateOfBirth", "Enter Date of birth in format (dd/MM/yyyy).");
				}				
				
				if(!result.hasErrors()) {
					ClientDetail clientDetail = FormUtil.createClientDetail(form);
					clientService.addClientDetail(clientDetail);
					model.addAttribute("message",  "You have been registered successfully please check your email");
					MailReminder mail = new MailReminder();
					mail.sendMessage(
							form.getConfirmEmail(),
							"Registered successfully","\n\n<html><br><br>You have successfully enrolled for an assessment of your low back pain.   Your User Name and Password are:<br><br><b>"+
							"Username :"+form.getUserId()+
							"<br>Password :"+ form.getConfirmPassward()+
									 "<br><br><u>Keep these carefully</u></b>, as they enable you to log into your account in <a href='www.calba.net'>www.calba.net</a> and see the status of your low back pain assessment.   If you get interrupted, while entering data, you will be able to resume by going to this account. </html>");
				}	
				List<CategoryList> category=clientService.getCategoryList();
				List cat=new ArrayList();
				System.out.println("category list ==" + category.toString());
				for(int i=0;i<category.size();i++){
					Map m = (Map) category.get(i);
					cate.setStatus(new String []{ m.get("categoryname").toString()});
					cat.add(m.get("categoryname").toString());
				}
				model.addAttribute("category", category);
				model.addAttribute("cat", cat);
						
			} catch (CalbaAppServiceException e) {					
				result.reject("error", e.getMessage());	
				model.addAttribute("error", e.getMessage());
			}  catch (Throwable e) {					
				result.reject("error", e.getMessage());	
				model.addAttribute("error", e.getMessage());
			}
			
			if(result.hasErrors()) {
				model.addAttribute("form",  form);		
				return "register";		
			} else {
				LoginForm loginform=new LoginForm();
				loginform.setUserId(form.getUserId());
				loginform.setPassword(form.getNewPassward());
				model.addAttribute("loginForm", new LoginForm());
				model.addAttribute("loginForm", loginform);
				return "loginpage" ;
			}
		
		
		
		
		 
		
	 }
	
	 
	/* @RequestMapping(method = RequestMethod.POST, value = "/register")
		public String handleRequest(@ModelAttribute("form") @Valid ClientRegisterForm form,
				BindingResult result, ModelMap model) {
		 
		 try {
			 CategoryList cate=new CategoryList();
			 	if(Util.formatDate(form.getDateOfBirth()) == null) {
			 		result.reject("dateOfBirth", "Enter Date of birth in format (dd/MM/yyyy).");
				}				
				
				if(!result.hasErrors()) {

//					ClientDetail clientDetail = FormUtil.createClientDetail(form);
//					clientService.addClientDetail(clientDetail);
//					model.addAttribute("message",  "You have been registered successfully please check your mail");
				}	
//				List<CategoryList> category=clientService.getCategoryList();
//				List cat=new ArrayList();
//				System.out.println("category list ==" + category.toString());
//				for(int i=0;i<category.size();i++){
//					Map m = (Map) category.get(i);
//					cate.setStatus(new String []{ m.get("categoryname").toString()});
//					cat.add(m.get("categoryname").toString());
//				}
//				model.addAttribute("category", category);
//				model.addAttribute("cat", cat);	
	 
			} catch (Throwable e) {					
				result.reject("error", e.getMessage());	
				model.addAttribute("error", e.getMessage());
			}
			
			if(result.hasErrors()) {
				model.addAttribute("form",  form);		
				return "register";		
			} else {
				
//				model.addAttribute("loginForm", new LoginForm());
			
//				return "home" ;
//				added by neha
				map = new LinkedHashMap<String, String>();
				 map.put("clientId","");
				 map.put("userId", form.getUserId().toString());
				 map.put("projectId",form.getProjectId().toString());
				 map.put("sex",form.getSex().toString());
				 map.put("mobile",form.getMobile().toString());
				 map.put("foreName",form.getForeName().toString());
				 map.put("surName",form.getSurName().toString());
				 map.put("email",form.getEmail().toString());
				 map.put("confirmEmail",form.getConfirmEmail().toString());
				 map.put("line1",form.getLine1().toString());
				 map.put("line2",form.getLine2().toString());
				 map.put("line3",form.getLine3().toString());
				 map.put("city",form.getCity().toString());
				 map.put("country",form.getCountry().toString());
				 map.put("postcode",form.getPostcode().toString());
				 map.put("dateOfBirth",form.getDateOfBirth().toString());
				 map.put("newPassward",form.getNewPassward().toString());
				 map.put("confirmPassward",form.getConfirmPassward().toString());
				 map.put("telephone",form.getTelephone().toString());
				java.io.InputStream is = (java.io.InputStream) ClientRegisterController.class
				        .getResourceAsStream("/sdk_config.properties");
				try {
				      PayPalResource.initConfig(is);
				    } catch (PayPalRESTException e) {
				    	System.out.println("PayPalRESTException==" + e);

				    }	 	
					Date date = new Date();
					DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, new Locale("GMT+1"));						
					String formattedDate = dateFormat.format(date);						
					model.addAttribute("serverTime", formattedDate );
					model.addAttribute("form",  form);		
//					ends here
				return "payment";
			}
		
		
		
		
		 
		
	 }*/
	 @RequestMapping(method=RequestMethod.GET, value="/getPayment")
	 public String getPayment(ModelMap model){
		 System.out.println("retrurn payment page");
		
		return "getPayment";
	 }
	 @RequestMapping(method = RequestMethod.GET, value = "/payment")
		public String payment(ModelMap model,HttpServletRequest req,HttpServletResponse res) {
		 
		// LOGGER.info("Welcome home! The client locale is {}.");
//			
//			Date date = new Date();
//			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//			
//			String formattedDate = dateFormat.format(date);
//			
//			model.addAttribute("serverTime", formattedDate );
		
			ClientRegisterForm form=new ClientRegisterForm();
			System.out.println("dob=="+req.getParameter("dateOfBirth"));
			
			
			form.setCity(map.get("city"));
			form.setUserId(map.get("userId"));
			form.setTelephone(map.get("telephone"));
			form.setSex(map.get("sex"));
			form.setPostcode(map.get("postcode"));
			form.setForeName(map.get("foreName"));
			form.setSurName(map.get("surName"));
			form.setConfirmEmail(map.get("confirmEmail"));
			form.setEmail(map.get("email"));
			form.setNewPassward(map.get("newPassward"));
			form.setConfirmPassward(map.get("confirmPassward"));
			form.setCountry(map.get("country"));
			form.setMobile(map.get("mobile"));
			form.setDateOfBirth(map.get("dateOfBirth"));
			form.setProjectId(1);
			form.setLine1(map.get("line1"));
			form.setLine2(map.get("line2"));
			form.setLine3(map.get("line3"));
			
		
			ClientDetail clientDetail = FormUtil.createClientDetail(form);
			try {
				clientService.addClientDetail(clientDetail);
			} catch (CalbaAppServiceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("message",  "You have been registered successfully please check your mail");
			LoginForm loginform=new LoginForm();
			loginform.setUserId(form.getUserId());
			loginform.setPassword(form.getNewPassward());
			model.addAttribute("loginForm", loginform);
			return "loginpage" ;
		}
	 
		
		@RequestMapping(method = RequestMethod.GET,value = "/cancel")
		public String cancel(Locale locale, Model model) {
			
			System.out.println("hello..");
			
			return "paypalResponseCancel";
		}
		public LinkedHashMap<String, String> convert(String str) {
	        String[] tokens = str.split(",");
	        LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
	        for(int i=0;i<tokens.length;i++)
	        {
	            String[] strings = tokens[i].split("=");
	            if(strings.length==2)
	             map.put(strings[0], strings[1].replaceAll("%2C", ","));
	           
	        }
	System.out.println("map value=="+map.toString());
	        return map;
	    }
}
