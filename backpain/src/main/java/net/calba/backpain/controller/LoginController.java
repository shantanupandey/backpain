package net.calba.backpain.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import net.calba.backpain.CalbaAppConstant;
import net.calba.backpain.dao.mybatis.ClientFormMapper;
import net.calba.backpain.exception.CalbaAppServiceException;
import net.calba.backpain.form.ClientRegisterForm;
import net.calba.backpain.form.LoginForm;
import net.calba.backpain.form.PasswordRecoveryForm;
import net.calba.backpain.model.CategoryList;
import net.calba.backpain.model.Client;
import net.calba.backpain.model.ClientForm;
import net.calba.backpain.model.ClientListing;
import net.calba.backpain.model.FormQuestionClient;
import net.calba.backpain.model.HNPTable;
import net.calba.backpain.service.ClientService;
import net.calba.backpain.service.FormService;
import net.calba.backpain.service.AdminService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes(CalbaAppConstant.LOGGED_CLIENT)
public class LoginController {

	private static final Logger LOGGER = Logger
			.getLogger(LoginController.class);

	@Resource
	ClientService clientService;
	@Autowired
	private ClientFormMapper clientFormMapper;
	@Resource
	private FormService formService;
	@Resource
	private AdminService adminService;
	
	@RequestMapping(method = RequestMethod.POST, value = "/login")
	public String handleRequest(
			@ModelAttribute("loginForm") @Valid LoginForm loginForm,
			BindingResult result, ModelMap model) {
		Client client  = null;
		try {
			
			if (!result.hasErrors()) {
				client = clientService.authenticate(
						loginForm.getUserId(), loginForm.getPassword());
				model.addAttribute(CalbaAppConstant.LOGGED_CLIENT, client);		
				LOGGER.debug("login client : " + client);
			}
		} catch (CalbaAppServiceException e) {
			LOGGER.error("error : ", e);
			result.reject("error", e.getMessage());
			model.addAttribute("error", e.getMessage());
		}

		if (result.hasErrors()) {
			model.addAttribute("loginForm", loginForm);
			
			return "home";
		} else 	if(client.getRoleId() == CalbaAppConstant.ADMIN_ROLD_ID) {
			return  "redirect:/admin/userListing.html" ;
		} else {
			
			//for showing completed forms functionality
			List<ClientForm> formStatus= formService.getFormStatus(client.getClientId(), CalbaAppConstant.ABOUT_YOU_FORM_ID);
//			try{
//		
//				if(client.getSex().equals("")){	
					if(formStatus.size() != 0){
					model.addAttribute("formStatusAboutYou",formStatus.get(0).getState());
				}
//				}else{
//					System.out.println("in else");
//					model.addAttribute("formStatusAboutYou","Completed");
//				
//			}
//			}
//			catch(Exception e)
//			{System.out.println("in catch");
//				model.addAttribute("formStatusAboutYou","Completed");
//		
//			}
					

			List<ClientForm> formStatus1= formService.getFormStatus(client.getClientId(), CalbaAppConstant.MED_HIST_FORM_ID);
			if(formStatus1.size() != 0){
				System.out.println("in formStatusMedicalHistory="+formStatus1.get(0).getState());
			model.addAttribute("formStatusMedicalHistory",formStatus1.get(0).getState());
			}
			
			List<ClientForm> formStatus2= formService.getFormStatus(client.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
			if(formStatus2.size() != 0){
			model.addAttribute("formStatusbackPain",formStatus2.get(0).getState());
			}
			
			List<ClientForm> formStatus3= formService.getFormStatus(client.getClientId(), CalbaAppConstant.BACK_PAIN2_FORM_ID);
			if(formStatus3.size() != 0){
			model.addAttribute("formStatusbackPain2",formStatus3.get(0).getState());
			}
			
			List<ClientForm> formStatus4= formService.getFormStatus(client.getClientId(), CalbaAppConstant.SELF_EXAM_FORM_ID);
			if(formStatus4.size() != 0){
			model.addAttribute("formStatusSelfExam",formStatus4.get(0).getState());
			}
			List<ClientForm> formStatus5= formService.getFormStatus(client.getClientId(), CalbaAppConstant.DISABILITY_FORM_ID);
			//List<ClientListing> statusupdate=adminService.getUpdateStatus(client.getClientId());
			if(formStatus5.size() != 0){
				if(client.getDisabilityFormUpdate()==1){
					System.out.println("here come=="+client.getDisabilityFormUpdate());
					ClientForm clientForm=new ClientForm();
					clientForm.setClientId(client.getClientId());
					clientForm.setFormId(CalbaAppConstant.DISABILITY_FORM_ID);
					clientForm.setState(CalbaAppConstant.STATE_COMPLETED);
					formService.updateClientForm(client.getClientId(),
							CalbaAppConstant.DISABILITY_FORM_ID);
					model.addAttribute("formStatusDisability",CalbaAppConstant.STATE_COMPLETED);
					model.addAttribute("status", client.getDisabilityFormUpdate());
				}
				else{				
					model.addAttribute("formStatusDisability",formStatus5.get(0).getState());
					model.addAttribute("status",null);
				}
			}
			//System.out.println("formStatusDisability="+formStatus5.get(0).getState());
			//added for resolving error
			ClientForm clientForm = formService.getClientForm(client.getClientId(),
					CalbaAppConstant.MED_HIST_FORM_ID);
			ClientForm clientForm1 = formService.getClientForm(client.getClientId(),
					CalbaAppConstant.BACK_PAIN_FORM_ID);
			ClientForm clientForm2 = formService.getClientForm(client.getClientId(),
					CalbaAppConstant.BACK_PAIN2_FORM_ID);
			ClientForm clientForm3 = formService.getClientForm(client.getClientId(),
					CalbaAppConstant.SELF_EXAM_FORM_ID);
			ClientForm clientForm4 = formService.getClientForm(client.getClientId(),
					CalbaAppConstant.WEEKLY_UPDATE_FORM_ID);
			ClientForm clientForm5 = formService.getClientForm(client.getClientId(),
					CalbaAppConstant.DISABILITY_FORM_ID);
			List<FormQuestionClient> formQuesClient = formService
					.getFormQuestionClient(clientForm4.getClientFormId());
			//End for showing completed forms functionality
			ClientListing result1 = adminService.getUserSetFlag(client.getClientId());
			
		    System.out.println("value of assesment system.."+result1.getAssessmentformflag());
		    System.out.println("value of ,messahe...."+result1.getCareComment());

					System.out.println("setFlag=="+client.getDisabilityFormUpdate());
					model.addAttribute("setFormVal", result1.getSetForm());
					model.addAttribute("setFlag", result1.getFormSetFlag());
					model.addAttribute("AssesmentFlag", result1.getAssessmentformflag());
					model.addAttribute("careComment", result1.getCareComment());
					
					model.addAttribute("loginVal", "login");
					/*End monitor testing*/
					List<ClientListing> result2 = adminService.getUserListing();
					List<HNPTable> flagsValue = null;

					int questionId = client.getClientId();
					Integer qID = (Integer) questionId;
					int flag = 0;
					int setForm = 0;
					for (int i = 0; i < result2.size(); i++) {

						if (qID.equals(result2.get(i).getClientId())) {
							model.addAttribute("setFlagWeekly", result2.get(i).getFormSetFlag());

						}}
					/*End monitor testing*/
				
			return "welcome";
		}
	}
		

	

	@RequestMapping(method = RequestMethod.GET, value = "/login")
	public String handleRequest(HttpServletRequest request, ModelMap model) {
		Client client = (Client) request.getSession().getAttribute(
				CalbaAppConstant.LOGGED_CLIENT);
		if (client == null) {
			model.addAttribute("loginForm", new LoginForm());
			
			return "home";
		} else if(client.getRoleId() == CalbaAppConstant.ADMIN_ROLD_ID) {
			    
				return  "redirect:/admin/userListing.html" ;
		} else {
			
				return "welcome";			
		}

	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/passwordRecovery")
	public String passwordRecovery(ModelMap model) {
		
		model.addAttribute("form", new PasswordRecoveryForm());
		return "passwordRecovery";
		

	}
	

	@RequestMapping(method = RequestMethod.POST, value = "/passwordRecovery")
	public String passwordRecovery(
			@ModelAttribute("form") @Valid PasswordRecoveryForm form,
			BindingResult result, ModelMap model) {
		
		try {
			
			if (!result.hasErrors()) {
				clientService.passwordRecovery(form.getEmail());
				model.addAttribute("message", "New password sent to email");
			}
			
		} catch (CalbaAppServiceException e) {
			LOGGER.error("error : ", e);
			result.reject("error", e.getMessage());
			model.addAttribute("error", e.getMessage());
		}

		if (result.hasErrors()) {
			model.addAttribute("form", form);
			return "passwordRecovery";			
		} else {
			return "redirect:/home.html" ;
		}
		
		
		
		

	}
	
	
	 @RequestMapping(method=RequestMethod.GET, value="/register1")
	 public String register1(ModelMap model){
		
		System.out.println("hello here hehehheheheheehhe");
		
		
		return "getPayment";
	 }
	 
	 

}
