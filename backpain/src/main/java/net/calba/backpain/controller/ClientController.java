package net.calba.backpain.controller;

import static net.calba.backpain.CalbaAppConstant.REPORT_HNP_PHASES;
import static net.calba.backpain.CalbaAppConstant.REPORT_NON_RADICULAR;
import static net.calba.backpain.CalbaAppConstant.REPORT_PAIN_ANALYSIS;
import static net.calba.backpain.CalbaAppConstant.REPORT_TOT_RADICULAR;

import java.util.*;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import net.calba.backpain.CalbaAppConstant;
import net.calba.backpain.Util;
import net.calba.backpain.dao.mybatis.ClientFormMapper;
import net.calba.backpain.exception.CalbaAppServiceException;
import net.calba.backpain.form.AboutYouForm;
import net.calba.backpain.form.BackPain2Form;
import net.calba.backpain.form.BackPainForm;
import net.calba.backpain.form.FormUtil;
import net.calba.backpain.form.MedicalHistoryForm;
import net.calba.backpain.form.MyAccountForm;
import net.calba.backpain.form.SelfExaminationForm;
import net.calba.backpain.form.WeeklyUpdateForm;
import net.calba.backpain.model.Client;
import net.calba.backpain.model.ClientDetail;
import net.calba.backpain.model.ClientForm;
import net.calba.backpain.model.ClientListing;
import net.calba.backpain.model.FormQuestionClient;
import net.calba.backpain.model.HNPTable;
import net.calba.backpain.model.HeightUnits;
import net.calba.backpain.model.MoniterListing;
import net.calba.backpain.model.MoniterSystem;
import net.calba.backpain.model.MonitoringFormsEdit;
import net.calba.backpain.model.QuestionAnswer;
import net.calba.backpain.model.Report;
import net.calba.backpain.model.SelfExamine;
import net.calba.backpain.model.SendMessage;
import net.calba.backpain.model.WeightUnits;
import net.calba.backpain.service.AdminService;
import net.calba.backpain.service.CalbaService;
import net.calba.backpain.service.ClientService;
import net.calba.backpain.service.FormService;

import org.apache.commons.mail.EmailException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import reminder.MailReminder;
import reminder.ReminderBeep;

@Controller
@SessionAttributes(CalbaAppConstant.LOGGED_CLIENT)
public class ClientController {

	private static final Logger LOGGER = Logger
			.getLogger(ClientController.class);

	@Resource
	private ClientService clientService;
	@Autowired
	private ClientFormMapper clientFormMapper;
	@Resource
	private AdminService adminService;

	@Resource
	private FormService formService;

	@Resource
	private CalbaService calbaService;

	private List<HeightUnits> heightUnits;

	private List<WeightUnits> weightUnits;
	String disabililityState="";
	@PostConstruct
	public final void init() {
		heightUnits = calbaService.getHeightUnits();
		weightUnits = calbaService.getWeightUnits();
	}

	@RequestMapping(method = RequestMethod.GET, value = "/welcome")
	public String welcome(@ModelAttribute("loggedClient") Client client,
			ModelMap model) {
		LOGGER.debug("welcome : " + client);
		
		System.out.println("hi in welcome/////"+client.getCareComment());

		// for showing completed forms functionality
		List<ClientForm> formStatus = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.ABOUT_YOU_FORM_ID);
		if (formStatus.size() != 0) {
			model.addAttribute("formStatusAboutYou", formStatus.get(0)
					.getState());
		}

		List<ClientForm> formStatus1 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.MED_HIST_FORM_ID);
		if (formStatus1.size() != 0) {
			model.addAttribute("formStatusMedicalHistory", formStatus1.get(0)
					.getState());
		}

		List<ClientForm> formStatus2 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
		if (formStatus2.size() != 0) {
			model.addAttribute("formStatusbackPain", formStatus2.get(0)
					.getState());
		}

		List<ClientForm> formStatus3 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN2_FORM_ID);
		if (formStatus3.size() != 0) {
			model.addAttribute("formStatusbackPain2", formStatus3.get(0)
					.getState());
		}

		List<ClientForm> formStatus4 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.SELF_EXAM_FORM_ID);
		if (formStatus4.size() != 0) {
			model.addAttribute("formStatusSelfExam", formStatus4.get(0)
					.getState());
		}
		List<ClientForm> formStatus5= formService.getFormStatus(client.getClientId(), CalbaAppConstant.DISABILITY_FORM_ID);
		if(formStatus5.size() != 0){
			if(client.getDisabilityFormUpdate()==1){
				System.out.println("here come=="+client.getDisabilityFormUpdate());
				ClientForm clientForm=new ClientForm();
				clientForm.setClientId(client.getClientId());
				clientForm.setFormId(CalbaAppConstant.DISABILITY_FORM_ID);
				clientForm.setState(CalbaAppConstant.STATE_COMPLETED);
				clientFormMapper.insert(clientForm);
				model.addAttribute("formStatusDisability",CalbaAppConstant.STATE_COMPLETED);
				model.addAttribute("status", client.getDisabilityFormUpdate());
			}
			else{				
				model.addAttribute("formStatusDisability",formStatus5.get(0).getState());
				model.addAttribute("status", null);
			}
		}
	
		ClientListing result1 = adminService.getUserSetFlag(client.getClientId());
		model.addAttribute("AssesmentFlag", result1.getAssessmentformflag());
		model.addAttribute("loginVal", "login");
		// End for showing completed forms functionality
		
		ClientListing resultVal = adminService.getUserSetFlag(client.getClientId());
		model.addAttribute("setFlag", resultVal.getFormSetFlag());
		
		setMonitorValue(client, model);
		
		return "welcome";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/aboutYou")
	public String aboutYou(@ModelAttribute("loggedClient") Client client,
			ModelMap model) {

		ClientDetail clientDetail = clientService.getClientDetail(client);
		ClientForm clientForm = formService.getClientForm(client.getClientId(),
				CalbaAppConstant.ABOUT_YOU_FORM_ID);

		List<FormQuestionClient> formQuesClient = formService
				.getFormQuestionClient(clientForm.getClientFormId());

		AboutYouForm form = FormUtil.getAboutYouForm(clientDetail,
				formQuesClient, clientForm.getClientFormId());

		// for showing completed forms functionality
		List<ClientForm> formStatus = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.ABOUT_YOU_FORM_ID);
		try{
			
			if(client.getSex().equals("")){	
				if(formStatus.size() != 0){
				model.addAttribute("formStatusAboutYou",formStatus.get(0).getState());
			}
			}else{
				System.out.println("in else");
				model.addAttribute(
						"message","You have already provided the data for this form, during enrolment. Please check this data (below) and make any necessary changes.  Then click the Update button at the bottom of the page to confirm that it is all correct.");
				model.addAttribute("formStatusAboutYou",formStatus.get(0).getState());
			
		}
		}
		catch(Exception e)
		{System.out.println("in catch");
		model.addAttribute(
				"message","You have already provided the data for this form, during enrolment. Please check this data (below) and make any necessary changes.  Then click the Update button at the bottom of the page to confirm that it is all correct.");
		model.addAttribute("formStatusAboutYou",formStatus.get(0).getState());
	
		}
//			if(formStatus.get(0).getState().equals("Completed")){//added by neha
//				model.addAttribute(
//						"message","You have already provided the data for this form, during enrolment. Please check this data (below) and make any necessary changes.  Then click the Update button at the bottom of the page to confirm that it is all correct.");
//			}//ends here
//		}

		List<ClientForm> formStatus1 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.MED_HIST_FORM_ID);
		if (formStatus1.size() != 0) {
			model.addAttribute("formStatusMedicalHistory", formStatus1.get(0)
					.getState());
		}

		List<ClientForm> formStatus2 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
		if (formStatus2.size() != 0) {
			model.addAttribute("formStatusbackPain", formStatus2.get(0)
					.getState());
		}

		List<ClientForm> formStatus3 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN2_FORM_ID);
		if (formStatus3.size() != 0) {
			model.addAttribute("formStatusbackPain2", formStatus3.get(0)
					.getState());
		}

		List<ClientForm> formStatus4 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.SELF_EXAM_FORM_ID);
		if (formStatus4.size() != 0) {
			model.addAttribute("formStatusSelfExam", formStatus4.get(0)
					.getState());
		}
		List<ClientForm> formStatus5= formService.getFormStatus(client.getClientId(), CalbaAppConstant.DISABILITY_FORM_ID);
		if(formStatus5.size() != 0){
			if(client.getDisabilityFormUpdate()==1){
			System.out.println("here come=="+client.getDisabilityFormUpdate());
			ClientForm clientForm1=new ClientForm();
			clientForm1.setClientId(client.getClientId());
			clientForm1.setFormId(CalbaAppConstant.DISABILITY_FORM_ID);
			clientForm1.setState(CalbaAppConstant.STATE_COMPLETED);
			clientFormMapper.insert(clientForm1);
			model.addAttribute("formStatusDisability",CalbaAppConstant.STATE_COMPLETED);
			model.addAttribute("status", client.getDisabilityFormUpdate());
			disabililityState=CalbaAppConstant.STATE_COMPLETED;
		}
		else{				
			model.addAttribute("formStatusDisability",formStatus5.get(0).getState());
			model.addAttribute("status", null);
			disabililityState=formStatus5.get(0).getState();
		}
		}
		// End for showing completed forms functionality

		model.addAttribute("form", form);
		ClientListing result1 = adminService.getUserSetFlag(client.getClientId());
		model.addAttribute("AssesmentFlag", result1.getAssessmentformflag());
		
		ClientListing resultVal = adminService.getUserSetFlag(client.getClientId());
		model.addAttribute("setFlag", resultVal.getFormSetFlag());
		
		setMonitorValue(client, model);
		
		return "aboutYou";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/aboutYou")
	public String aboutYou(@ModelAttribute("loggedClient") Client client,
			@ModelAttribute("form") @Valid AboutYouForm form,
			BindingResult result, ModelMap model) throws EmailException,
			MessagingException {
		String returnPage="aboutYou";

		if (Util.formatDate(form.getDateOfBirth()) == null) {
			result.reject("dateOfBirth",
					"“[DD/MM/YYY]");
		}

		if (result.hasErrors()) {

			model.addAttribute("error", "Please provide required data.");

		} else {

			ClientForm clientForm = formService.updateClientForm(
					client.getClientId(), CalbaAppConstant.ABOUT_YOU_FORM_ID);
			
			formService.addClientState(client.getClientId(),
					CalbaAppConstant.ABOUT_YOU_FORM_ID, client);
client.setMobile(form.getMobile());
			ClientDetail clientDetail = clientService.getClientDetail(client);
			clientDetail.setMobile(form.getMobile());
			FormUtil.updateClientDetail(clientDetail, form);
			List<FormQuestionClient> formQuesClient = FormUtil
					.getFormQuestionClients(form);
			clientService.updateClientDetail(clientDetail);
			formService.addFormQuestionClient(formQuesClient,
					form.getClientFormId());
			model.addAttribute(
					"message",
					"About You has been updated successfully.To continue entering your data, please click on the next form in the panel to your left.");

			AboutYouForm form1 = FormUtil.getAboutYouForm(clientDetail,
					formQuesClient, clientForm.getClientFormId());

			model.addAttribute("form", form1);

			if (form.getSendMessage() != null
					&& !form.getSendMessage().isEmpty()) {
				if (form.getSendMessage().equals("Yes")) {
					MailReminder mail = new MailReminder();
					mail.sendMessage("monro.robin11@gmail.com",
							"Changes By User " + client.getUserId() + "",
							"Hi user " + client.getUserId()
									+ " changed About You form");
				}
			}
		}

		
		if (result.hasErrors()) {
			ClientDetail clientDetail = clientService.getClientDetail(client);
			List<FormQuestionClient> formQuesClient = FormUtil
					.getFormQuestionClients(form);
			AboutYouForm form1 = FormUtil.getAboutYouForm(clientDetail,
					formQuesClient, 2);
			model.addAttribute("form", form);
		}
		String state="";
		// for showing completed forms functionality
		List<ClientForm> formStatus = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.ABOUT_YOU_FORM_ID);
//		if (formStatus.size() != 0) {
//			model.addAttribute("formStatusAboutYou", formStatus.get(0)
//					.getState());
//		}
//		try{
//			
//			if(client.getSex().equals("")){	
				if(formStatus.size() != 0){
					state=formStatus.get(0).getState();
				model.addAttribute("formStatusAboutYou",formStatus.get(0).getState());
			}
//			}else{
//				System.out.println("in else");
//				state="Completed";
//				model.addAttribute("formStatusAboutYou","Completed");
//			
//			
//		}
//		}
//		catch(Exception e)
//		{System.out.println("in catch");
//		state=formStatus.get(0).getState();
//			model.addAttribute("formStatusAboutYou",formStatus.get(0).getState());
//	
//		}
		List<ClientForm> formStatus1 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.MED_HIST_FORM_ID);
		if (formStatus1.size() != 0) {
			model.addAttribute("formStatusMedicalHistory", formStatus1.get(0)
					.getState());
		}

		List<ClientForm> formStatus2 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
		if (formStatus2.size() != 0) {
			model.addAttribute("formStatusbackPain", formStatus2.get(0)
					.getState());
		}

		List<ClientForm> formStatus3 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN2_FORM_ID);
		if (formStatus3.size() != 0) {
			model.addAttribute("formStatusbackPain2", formStatus3.get(0)
					.getState());
		}

		List<ClientForm> formStatus4 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.SELF_EXAM_FORM_ID);
		if (formStatus4.size() != 0) {
			model.addAttribute("formStatusSelfExam", formStatus4.get(0)
					.getState());
		}
	
		List<ClientForm> formStatus5= formService.getFormStatus(client.getClientId(), CalbaAppConstant.DISABILITY_FORM_ID);
		if(formStatus5.size() != 0){if(client.getDisabilityFormUpdate()==1){
			System.out.println("here come=="+client.getDisabilityFormUpdate());
			ClientForm clientForm1=new ClientForm();
			clientForm1.setClientId(client.getClientId());
			clientForm1.setFormId(CalbaAppConstant.DISABILITY_FORM_ID);
			clientForm1.setState(CalbaAppConstant.STATE_COMPLETED);
			formService.updateClientForm(client.getClientId(),
					CalbaAppConstant.DISABILITY_FORM_ID);
			model.addAttribute("formStatusDisability",CalbaAppConstant.STATE_COMPLETED);
			model.addAttribute("status", client.getDisabilityFormUpdate());
			disabililityState=CalbaAppConstant.STATE_COMPLETED;
		}
		else{				
			model.addAttribute("formStatusDisability",formStatus5.get(0).getState());
			model.addAttribute("status", null);
			disabililityState=formStatus5.get(0).getState();
		}
		}
		int count=0;
		try{
		if( state.equals("Completed")){
			count++;
		}if( formStatus1.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus2.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus3.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus4.get(0)
				.getState().equals("Completed")){
			count++;
		
		}
		}catch(Exception e){
			
		}
		
		if (!result.hasErrors()) {
		if ( state.equals("Completed") && formStatus1.get(0).getState().equals("Completed")
				&& formStatus2.get(0).getState().equals("Completed") && 
				formStatus3.get(0).getState().equals("Completed")
				&& formStatus4.get(0).getState().equals("Completed") && disabililityState.equals("Completed")) {
			client.setClientStateId(4);
			model.addAttribute(
					"message",
					"You have successfully completed all the forms.  See message in left hand panel for further instructions");
			MailReminder mail = new MailReminder();
			ClientListing clientListing = adminService.getClientListingById(client.getClientId());
			List<ClientListing> clientEmail = adminService.getUserEmail(client.getClientId().toString());
			System.out.println("clientEmail==="+clientEmail.get(0));
			Map m = (Map) clientEmail.get(0);
			Set s=m.entrySet();
			String email="";
			
			returnPage="welcome";
			model.addAttribute("AssesmentFlag", 0);
			model.addAttribute("loginVal", "login");


			Iterator i=s.iterator();
					while(i.hasNext()){
					    Map.Entry mp= (Map.Entry) i.next();
					    email=mp.getValue().toString();
//					    System.out.println(""+mp.getKey()+""+ mp.getValue());
					}
			mail.sendMessage(
					"monro.robin11@gmail.com",
					clientListing.getUserId(),"\n\n<html><br><br><b>"+ clientListing.getForeName()
							+ " "+ clientListing.getSurName()
							+ "</b> has just completed the forms and is awaiting the assessment report</center></html>");
			mail.sendMessage(email,
					clientListing.getUserId(),"\n\n<html><br><br><p> This is to confirm that you have successfully completed the forms for the assessment of your low back pain and you will receive a report on the results, along with advice, within two working days.</p></html>");
		}
		else{
//			model.addAttribute(
//					"message",
//					"Only "+(count)+" of the forms have been completed. For further instructions see left hand panel.");
			model.addAttribute(
					"message",
					"You have successfully completed this form.   To continue, please click on the next uncompleted form in the left hand panel.   If you have to exit before completion of all the forms, you can resume where you left off by logging on again with your User Name and Password.");


		}}
		// End for showing completed forms functionality
		
		setMonitorValue(client, model);

		return returnPage;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/medicalHistory")
	public String medicalHistory(@ModelAttribute("loggedClient") Client client,
			ModelMap model) {
		LOGGER.debug("medicalHistory : " + client);
		ClientForm clientForm = formService.getClientForm(client.getClientId(),
				CalbaAppConstant.MED_HIST_FORM_ID);

		List<FormQuestionClient> formQuesClient = formService
				.getFormQuestionClient(clientForm.getClientFormId());

		
		
		MedicalHistoryForm form = new MedicalHistoryForm(
				clientForm.getClientFormId());
		
		
		try{
		form.setQuestion1(formQuesClient.get(0).getValue());
		System.out.println("=1="+form.getQuestion1());
		}catch(Exception e){
			System.out.println("exception=="+e);
		}
		
		form.setClientId(client.getClientId());
		FormUtil.setBaseForm(formQuesClient, form);
		form.setClientId(client.getClientId());

		// for showing completed forms functionality
		List<ClientForm> formStatus = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.ABOUT_YOU_FORM_ID);
		if (formStatus.size() != 0) {
			model.addAttribute("formStatusAboutYou", formStatus.get(0)
					.getState());
		}

		List<ClientForm> formStatus1 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.MED_HIST_FORM_ID);
		if (formStatus1.size() != 0) {
			model.addAttribute("formStatusMedicalHistory", formStatus1.get(0)
					.getState());
		}

		List<ClientForm> formStatus2 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
		if (formStatus2.size() != 0) {
			model.addAttribute("formStatusbackPain", formStatus2.get(0)
					.getState());
		}

		List<ClientForm> formStatus3 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN2_FORM_ID);
		if (formStatus3.size() != 0) {
			model.addAttribute("formStatusbackPain2", formStatus3.get(0)
					.getState());
		}

		List<ClientForm> formStatus4 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.SELF_EXAM_FORM_ID);
		if (formStatus4.size() != 0) {
			model.addAttribute("formStatusSelfExam", formStatus4.get(0)
					.getState());
		}
		List<ClientForm> formStatus5= formService.getFormStatus(client.getClientId(), CalbaAppConstant.DISABILITY_FORM_ID);
		if(formStatus5.size() != 0){ 
			if(client.getDisabilityFormUpdate()==1){
			System.out.println("here come=="+client.getDisabilityFormUpdate());
			ClientForm clientForm1=new ClientForm();
			clientForm1.setClientId(client.getClientId());
			clientForm1.setFormId(CalbaAppConstant.DISABILITY_FORM_ID);
			clientForm1.setState(CalbaAppConstant.STATE_COMPLETED);
			formService.updateClientForm(client.getClientId(),
					CalbaAppConstant.DISABILITY_FORM_ID);
			model.addAttribute("formStatusDisability",CalbaAppConstant.STATE_COMPLETED);
			model.addAttribute("status", client.getDisabilityFormUpdate());
			disabililityState=CalbaAppConstant.STATE_COMPLETED;
		}
		else{				
			model.addAttribute("formStatusDisability",formStatus5.get(0).getState());
			model.addAttribute("status", null);
			disabililityState=formStatus5.get(0).getState();
		}
		}
		// End for showing completed forms functionality
		for(int i=0;i<formQuesClient.size();i++){
			System.out.println("check id"+formQuesClient.get(i).getQuestionId());
			System.out.println("check value"+formQuesClient.get(0).getValue());
			System.out.println("=======");

		}
		
		if(formQuesClient.size()>0){
			form.setQuestion1(formQuesClient.get(0).getValue());	
		}
		
		
		model.addAttribute("form", form);
		ClientListing result1 = adminService.getUserSetFlag(client.getClientId());
		model.addAttribute("AssesmentFlag", result1.getAssessmentformflag());
		ClientListing resultVal = adminService.getUserSetFlag(client.getClientId());
		model.addAttribute("setFlag", resultVal.getFormSetFlag());
		setMonitorValue(client, model);
		return "medicalHistory";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/medicalHistory")
	public String medicalHistorySumbit(
			@ModelAttribute("loggedClient") Client client,
			@ModelAttribute("form") @Valid MedicalHistoryForm form,
			BindingResult result, ModelMap model) throws EmailException,
			MessagingException {

		String returnPage="medicalHistory";
		
		if (result.hasErrors()) {
			model.addAttribute("error", "Please provide required data.");
		} else {
			ClientForm clientForm = formService.updateClientForm(
					client.getClientId(), CalbaAppConstant.MED_HIST_FORM_ID);
			List<FormQuestionClient> formQuesClient = FormUtil
					.getFormQuestionClients(form);

			formService.addClientState(client.getClientId(),
					CalbaAppConstant.MED_HIST_FORM_ID, client);
			formService.addFormQuestionClient(formQuesClient,
					form.getClientFormId());
			formService.addFormQuestionClient(clientForm,
					MedicalHistoryForm.QUESTION_10, form.getQuestion10());
			formService.addFormQuestionClient(clientForm,
					MedicalHistoryForm.QUESTION_12, form.getQuestion12());
			formService.addFormQuestionClient(clientForm,
					MedicalHistoryForm.QUESTION_13, form.getQuestion13());
			formService.addFormQuestionClient(clientForm,
					MedicalHistoryForm.QUESTION_110, form.getQuestion110());
			formService.addFormQuestionClient(clientForm,
					MedicalHistoryForm.QUESTION_112, form.getQuestion112());
			formService.addFormQuestionClient(clientForm,
					MedicalHistoryForm.QUESTION_114, form.getQuestion112());
			formService.addFormQuestionClient(clientForm,
					MedicalHistoryForm.QUESTION_116, form.getQuestion116());
			formService.addFormQuestionClient(clientForm,
					MedicalHistoryForm.QUESTION_118, form.getQuestion118());

			QuestionAnswer records = new QuestionAnswer();
			String scoreValue = "";

			for (int i = 0; i < formQuesClient.size(); i++) {
				if (formQuesClient.get(i).getQuestionId() == 14) {

					String val = formQuesClient.get(i).getValue();

					if (!val.equals("")) {

						if (val.equals("No") || val == "No") {
							scoreValue = "497";
						} else if (val.equals("Bladder Only")
								|| val == "Bladder Only") {
							scoreValue = "498";
						} else if (val.equals("Bowel Only")
								|| val == "Bowel Only") {
							scoreValue = "499";
						} else if (val.equals("Bladder & Bowel")
								|| val == "Bladder & Bowel") {
							scoreValue = "500";
						}
					}

					records.setQuestionId(formQuesClient.get(i).getQuestionId());
					records.setUserId(form.getClientId());
					records.setQuestionOptionId(scoreValue);

					records.setAnswerText(formQuesClient.get(i).getValue());
					records.setScore(adminService.getQuestionById(
							Integer.parseInt(scoreValue)).getMaxScore());
					adminService.insertQuestionAnswer(records,
							form.getClientId());

				}
			}

			model.addAttribute(
					"message",
					"Medical history has been updated successfully.To continue entering your data, please click on the next form in the panel to your left.");
			if (form.getSendMessage() != null
					&& !form.getSendMessage().isEmpty()) {
				if (form.getSendMessage().equals("Yes")) {
					MailReminder mail = new MailReminder();
					mail.sendMessage("monro.robin11@gmail.com",
							"Changes By User " + client.getUserId() + "",
							"Hi user " + client.getUserId()
									+ " has changed Medical history form");
				}
			}
		}
		String state="";
		model.addAttribute("form", form);

		// for showing completed forms functionality
		List<ClientForm> formStatus = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.ABOUT_YOU_FORM_ID);
//		if (formStatus.size() != 0) {
//			model.addAttribute("formStatusAboutYou", formStatus.get(0)
//					.getState());
//		}
		
//try{
//			
//			if(client.getSex().equals("")){	
				if(formStatus.size() != 0){
					state=formStatus.get(0).getState();
				model.addAttribute("formStatusAboutYou",formStatus.get(0).getState());
			}
//			}else{
//				System.out.println("in else");
//				state="Completed";
//				model.addAttribute("formStatusAboutYou","Completed");
//			
//			
//		}
//		}
//		catch(Exception e)
//		{System.out.println("in catch");
//		state=formStatus.get(0).getState();
//			model.addAttribute("formStatusAboutYou",formStatus.get(0).getState());
//	
//		}

		List<ClientForm> formStatus1 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.MED_HIST_FORM_ID);
		if (formStatus1.size() != 0) {
			model.addAttribute("formStatusMedicalHistory", formStatus1.get(0)
					.getState());
		}

		List<ClientForm> formStatus2 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
		if (formStatus2.size() != 0) {
			model.addAttribute("formStatusbackPain", formStatus2.get(0)
					.getState());
		}

		List<ClientForm> formStatus3 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN2_FORM_ID);
		if (formStatus3.size() != 0) {
			model.addAttribute("formStatusbackPain2", formStatus3.get(0)
					.getState());
		}

		List<ClientForm> formStatus4 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.SELF_EXAM_FORM_ID);
		if (formStatus4.size() != 0) {
			model.addAttribute("formStatusSelfExam", formStatus4.get(0)
					.getState());
		}
		List<ClientForm> formStatus5= formService.getFormStatus(client.getClientId(), CalbaAppConstant.DISABILITY_FORM_ID);
		if(formStatus5.size() != 0){
			if(client.getDisabilityFormUpdate()==1){
				System.out.println("here come=="+client.getDisabilityFormUpdate());
				ClientForm clientForm1=new ClientForm();
				clientForm1.setClientId(client.getClientId());
				clientForm1.setFormId(CalbaAppConstant.DISABILITY_FORM_ID);
				clientForm1.setState(CalbaAppConstant.STATE_COMPLETED);
				formService.updateClientForm(client.getClientId(),
						CalbaAppConstant.DISABILITY_FORM_ID);
				model.addAttribute("formStatusDisability",CalbaAppConstant.STATE_COMPLETED);
				model.addAttribute("status", client.getDisabilityFormUpdate());
				disabililityState=CalbaAppConstant.STATE_COMPLETED;
			}
			else{				
				model.addAttribute("formStatusDisability",formStatus5.get(0).getState());
				model.addAttribute("status", null);
				disabililityState=formStatus5.get(0).getState();
			}
		}
		// End for showing completed forms functionality
		int count=0;
		try{
		if( state.equals("Completed")){
			count++;
		}if( formStatus1.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus2.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus3.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus4.get(0)
				.getState().equals("Completed")){
			count++;
		
		}}
		catch(Exception e){
			
		}
		if (!result.hasErrors()) {
		if ( state.equals("Completed") && formStatus1.get(0).getState().equals("Completed")
				&& formStatus2.get(0).getState().equals("Completed") && formStatus3.get(0).getState().equals("Completed")
				&& formStatus4.get(0).getState().equals("Completed") && disabililityState.equals("Completed")) {
			client.setClientStateId(4);
			model.addAttribute(
					"message",
					"You have successfully completed all the forms.  See message in left hand panel for further instructions");
			MailReminder mail = new MailReminder();
			ClientListing clientListing = adminService.getClientListingById(client.getClientId());
			List<ClientListing> clientEmail = adminService.getUserEmail(client.getClientId().toString());
			Map m = (Map) clientEmail.get(0);
			Set s=m.entrySet();
			String email="";
			
			returnPage="welcome";
			model.addAttribute("AssesmentFlag", 0);
			model.addAttribute("loginVal", "login");

			
			Iterator i=s.iterator();
					while(i.hasNext()){
					    Map.Entry mp= (Map.Entry) i.next();
					    email=mp.getValue().toString();
//					    System.out.println(""+mp.getKey()+""+ mp.getValue());
					}
			mail.sendMessage(
					"monro.robin11@gmail.com",
					clientListing.getUserId(),"\n\n<html><br><br><b>"+ clientListing.getForeName()
							+ " "+ clientListing.getSurName()
							+ "</b> has just completed the forms and is awaiting the assessment report</center></html>");
			mail.sendMessage(email,
					clientListing.getUserId(),"\n\n<html><br><br><p> This is to confirm that you have successfully completed the forms for the assessment of your low back pain and you will receive a report on the results, along with advice, within two working days.</p></html>");
		}
		else{
//			model.addAttribute(
//					"message",
//					"Only "+(count)+" of the forms have been completed. For further instructions see left hand panel.");
			model.addAttribute(
					"message",
					"You have successfully completed this form.   To continue, please click on the next uncompleted form in the left hand panel.   If you have to exit before completion of all the forms, you can resume where you left off by logging on again with your User Name and Password.");

		}}

		setMonitorValue(client, model);		
		return returnPage;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/backPain")
	public String backPain(@ModelAttribute("loggedClient") Client client,
			ModelMap model) {
		ClientForm clientForm = formService.getClientForm(client.getClientId(),
				CalbaAppConstant.BACK_PAIN_FORM_ID);
		List<FormQuestionClient> formQuesClient = formService
				.getFormQuestionClient(clientForm.getClientFormId());
		BackPainForm form = new BackPainForm(clientForm.getClientFormId());
		form.setClientId(client.getClientId());
		FormUtil.setBaseForm(formQuesClient, form);

		// for showing completed forms functionality
		List<ClientForm> formStatus = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.ABOUT_YOU_FORM_ID);
		if (formStatus.size() != 0) {
			model.addAttribute("formStatusAboutYou", formStatus.get(0)
					.getState());
		}

		List<ClientForm> formStatus1 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.MED_HIST_FORM_ID);
		if (formStatus1.size() != 0) {
			model.addAttribute("formStatusMedicalHistory", formStatus1.get(0)
					.getState());
		}

		List<ClientForm> formStatus2 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
		if (formStatus2.size() != 0) {
			model.addAttribute("formStatusbackPain", formStatus2.get(0)
					.getState());
		}

		List<ClientForm> formStatus3 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN2_FORM_ID);
		if (formStatus3.size() != 0) {
			model.addAttribute("formStatusbackPain2", formStatus3.get(0)
					.getState());
		}

		List<ClientForm> formStatus4 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.SELF_EXAM_FORM_ID);
		if (formStatus4.size() != 0) {
			model.addAttribute("formStatusSelfExam", formStatus4.get(0)
					.getState());
		}
		List<ClientForm> formStatus5= formService.getFormStatus(client.getClientId(), CalbaAppConstant.DISABILITY_FORM_ID);
		if(formStatus5.size() != 0){
			if(client.getDisabilityFormUpdate()==1){
				System.out.println("here come=="+client.getDisabilityFormUpdate());
				ClientForm clientForm1=new ClientForm();
				clientForm1.setClientId(client.getClientId());
				clientForm1.setFormId(CalbaAppConstant.DISABILITY_FORM_ID);
				clientForm1.setState(CalbaAppConstant.STATE_COMPLETED);
				formService.updateClientForm(client.getClientId(),
						CalbaAppConstant.DISABILITY_FORM_ID);
				model.addAttribute("formStatusDisability",CalbaAppConstant.STATE_COMPLETED);
				model.addAttribute("status", client.getDisabilityFormUpdate());
				disabililityState=CalbaAppConstant.STATE_COMPLETED;
			}
			else{				
				model.addAttribute("formStatusDisability",formStatus5.get(0).getState());
				model.addAttribute("status", null);
				disabililityState=formStatus5.get(0).getState();
			}
		}
		// End for showing completed forms functionality

		model.addAttribute("form", form);
		ClientListing result1 = adminService.getUserSetFlag(client.getClientId());
		model.addAttribute("AssesmentFlag", result1.getAssessmentformflag());
		ClientListing resultVal = adminService.getUserSetFlag(client.getClientId());
		model.addAttribute("setFlag", resultVal.getFormSetFlag());
		setMonitorValue(client, model);
		
		return "backPain";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/backPain")
	public String backPain(@ModelAttribute("loggedClient") Client client,
			@ModelAttribute("form") @Valid BackPainForm form,
			BindingResult result, ModelMap model) throws EmailException,
			MessagingException {
		
		String returnPage="backPain";
		

		if (result.hasErrors()) {
			model.addAttribute("error", "Please provide required data.");
		} else {
			ClientForm clientForm = formService.updateClientForm(
					form.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
			List<FormQuestionClient> formQuesClient = FormUtil
					.getFormQuestionClients(form);

			formService.addClientState(client.getClientId(),
					CalbaAppConstant.BACK_PAIN_FORM_ID, client);

			Iterator<FormQuestionClient> iterator = formQuesClient.iterator();

			formService.addFormQuestionClient(formQuesClient,
					form.getClientFormId());

			QuestionAnswer records = new QuestionAnswer();
			/* Reports Data */
			String scoreValue = "";

			for (int i = 0; i < formQuesClient.size(); i++) {

				if (formQuesClient.get(i).getQuestionId() == 261
						|| formQuesClient.get(i).getQuestionId() == 262) {

					String val = formQuesClient.get(i).getValue();

					if (!val.equals("0")) {

						if (val.equals("No Pain") || val == "No Pain") {
							scoreValue = "355";
						} else if (val.equals("Diffuse Pain")
								|| val == "Diffuse Pain") {
							scoreValue = "356";
						} else if (val.equals("Sharp, localised pain")
								|| val == "Sharp, localised pain") {
							scoreValue = "357";
						} else if (val
								.equals("Shooting pain along clearly-defined track")
								|| val == "Shooting pain along clearly-defined track") {
							scoreValue = "358";
						} else if (val.equals("Burning pain")
								|| val == "Burning pain") {
							scoreValue = "359";
						} else if (val.equals("Other") || val == "Other") {
							scoreValue = "360";
						} else if (val.equals("Cannot remember")
								|| val == "Cannot remember") {
							scoreValue = "361";
						}
						records.setQuestionId(formQuesClient.get(i)
								.getQuestionId());
						records.setUserId(form.getClientId());
						records.setQuestionOptionId(scoreValue);

						records.setAnswerText(formQuesClient.get(i).getValue());
						records.setScore(adminService.getQuestionById(
								Integer.parseInt(scoreValue)).getMaxScore());
						adminService.insertQuestionAnswer(records,
								form.getClientId());

						val = "";
					} else {
						records.setQuestionId(formQuesClient.get(i)
								.getQuestionId());
						records.setUserId(form.getClientId());
						records.setQuestionOptionId(scoreValue);

						records.setAnswerText(formQuesClient.get(i).getValue());
						records.setScore(null);
						adminService.insertQuestionAnswer(records,
								form.getClientId());

					}

				}

				if (formQuesClient.get(i).getQuestionId() == 266
						|| formQuesClient.get(i).getQuestionId() == 270) {

					String val = formQuesClient.get(i).getValue();

					if (!val.equals("0")) {

						if (val.equals("No Pain") || val == "No Pain") {
							scoreValue = "362";
						} else if (val.equals("Diffuse Pain")
								|| val == "Diffuse Pain") {
							scoreValue = "363";
						} else if (val.equals("Sharp, localised pain")
								|| val == "Sharp, localised pain") {
							scoreValue = "364";
						} else if (val
								.equals("Shooting pain along clearly-defined track")
								|| val == "Shooting pain along clearly-defined track") {
							scoreValue = "365";
						} else if (val.equals("Burning pain")
								|| val == "Burning pain") {
							scoreValue = "366";
						} else if (val.equals("Other") || val == "Other") {
							scoreValue = "367";
						} else if (val.equals("Cannot remember")
								|| val == "Cannot remember") {
							scoreValue = "368";
						}
						records.setQuestionId(formQuesClient.get(i)
								.getQuestionId());
						records.setUserId(form.getClientId());
						records.setQuestionOptionId(scoreValue);

						records.setAnswerText(formQuesClient.get(i).getValue());
						records.setScore(adminService.getQuestionById(
								Integer.parseInt(scoreValue)).getMaxScore());
						adminService.insertQuestionAnswer(records,
								form.getClientId());

						val = "";
					} else {
						records.setQuestionId(formQuesClient.get(i)
								.getQuestionId());
						records.setUserId(form.getClientId());
						records.setQuestionOptionId(scoreValue);

						records.setAnswerText(formQuesClient.get(i).getValue());
						records.setScore(null);
						adminService.insertQuestionAnswer(records,
								form.getClientId());

					}

				}
				if (formQuesClient.get(i).getQuestionId() == 267
						|| formQuesClient.get(i).getQuestionId() == 271) {

					String val = formQuesClient.get(i).getValue();

					if (!val.equals("0")) {

						if (val.equals("No Pain") || val == "No Pain") {
							scoreValue = "369";
						} else if (val.equals("Diffuse Pain")
								|| val == "Diffuse Pain") {
							scoreValue = "370";
						} else if (val.equals("Sharp, localised pain")
								|| val == "Sharp, localised pain") {
							scoreValue = "371";
						} else if (val
								.equals("Shooting pain along clearly-defined track")
								|| val == "Shooting pain along clearly-defined track") {
							scoreValue = "372";
						} else if (val.equals("Burning pain")
								|| val == "Burning pain") {
							scoreValue = "373";
						} else if (val.equals("Other") || val == "Other") {
							scoreValue = "374";
						} else if (val.equals("Cannot remember")
								|| val == "Cannot remember") {
							scoreValue = "375";
						}
						records.setQuestionId(formQuesClient.get(i)
								.getQuestionId());
						records.setUserId(form.getClientId());
						records.setQuestionOptionId(scoreValue);

						records.setAnswerText(formQuesClient.get(i).getValue());
						records.setScore(adminService.getQuestionById(
								Integer.parseInt(scoreValue)).getMaxScore());
						adminService.insertQuestionAnswer(records,
								form.getClientId());

						val = "";
					} else {
						records.setQuestionId(formQuesClient.get(i)
								.getQuestionId());
						records.setUserId(form.getClientId());
						records.setQuestionOptionId(scoreValue);

						records.setAnswerText(formQuesClient.get(i).getValue());
						records.setScore(null);
						adminService.insertQuestionAnswer(records,
								form.getClientId());

					}
				}

				if (formQuesClient.get(i).getQuestionId() == 268
						|| formQuesClient.get(i).getQuestionId() == 272) {

					String val = formQuesClient.get(i).getValue();

					if (!val.equals("0")) {

						if (val.equals("No Pain") || val == "No Pain") {
							scoreValue = "376";
						} else if (val.equals("Diffuse Pain")
								|| val == "Diffuse Pain") {
							scoreValue = "377";
						} else if (val.equals("Sharp, localised pain")
								|| val == "Sharp, localised pain") {
							scoreValue = "378";
						} else if (val
								.equals("Shooting pain along clearly-defined track")
								|| val == "Shooting pain along clearly-defined track") {
							scoreValue = "379";
						} else if (val.equals("Burning pain")
								|| val == "Burning pain") {
							scoreValue = "380";
						} else if (val.equals("Other") || val == "Other") {
							scoreValue = "381";
						} else if (val.equals("Cannot remember")
								|| val == "Cannot remember") {
							scoreValue = "382";
						}
						records.setQuestionId(formQuesClient.get(i)
								.getQuestionId());
						records.setUserId(form.getClientId());
						records.setQuestionOptionId(scoreValue);

						records.setAnswerText(formQuesClient.get(i).getValue());
						records.setScore(adminService.getQuestionById(
								Integer.parseInt(scoreValue)).getMaxScore());
						adminService.insertQuestionAnswer(records,
								form.getClientId());

						val = "";
					} else {
						records.setQuestionId(formQuesClient.get(i)
								.getQuestionId());
						records.setUserId(form.getClientId());
						records.setQuestionOptionId(scoreValue);

						records.setAnswerText(formQuesClient.get(i).getValue());
						records.setScore(null);
						adminService.insertQuestionAnswer(records,
								form.getClientId());

					}
				}

				if (formQuesClient.get(i).getQuestionId() == 263
						|| formQuesClient.get(i).getQuestionId() == 264) {

					String val = formQuesClient.get(i).getValue();

					if (!val.equals("0")) {

						if (val.equals("No Pain") || val == "No Pain") {
							scoreValue = "383";
						} else if (val.equals("Diffuse Pain")
								|| val == "Diffuse Pain") {
							scoreValue = "384";
						} else if (val.equals("Sharp, localised pain")
								|| val == "Sharp, localised pain") {
							scoreValue = "385";
						} else if (val
								.equals("Shooting pain along clearly-defined track")
								|| val == "Shooting pain along clearly-defined track") {
							scoreValue = "386";
						} else if (val.equals("Burning pain")
								|| val == "Burning pain") {
							scoreValue = "387";
						} else if (val.equals("Other") || val == "Other") {
							scoreValue = "388";
						} else if (val.equals("Cannot remember")
								|| val == "Cannot remember") {
							scoreValue = "389";
						}
						records.setQuestionId(formQuesClient.get(i)
								.getQuestionId());
						records.setUserId(form.getClientId());
						records.setQuestionOptionId(scoreValue);

						records.setAnswerText(formQuesClient.get(i).getValue());
						records.setScore(adminService.getQuestionById(
								Integer.parseInt(scoreValue)).getMaxScore());
						adminService.insertQuestionAnswer(records,
								form.getClientId());

						val = "";
					} else {
						records.setQuestionId(formQuesClient.get(i)
								.getQuestionId());
						records.setUserId(form.getClientId());
						records.setQuestionOptionId(scoreValue);

						records.setAnswerText(formQuesClient.get(i).getValue());
						records.setScore(null);
						adminService.insertQuestionAnswer(records,
								form.getClientId());

					}
				}

				if (formQuesClient.get(i).getQuestionId() == 265
						|| formQuesClient.get(i).getQuestionId() == 269) {

					String val = formQuesClient.get(i).getValue();

					if (!val.equals("0")) {

						if (val.equals("No Pain") || val == "No Pain") {
							scoreValue = "390";
						} else if (val.equals("Diffuse Pain")
								|| val == "Diffuse Pain") {
							scoreValue = "391";
						} else if (val.equals("Sharp, localised pain")
								|| val == "Sharp, localised pain") {
							scoreValue = "392";
						} else if (val
								.equals("Shooting pain along clearly-defined track")
								|| val == "Shooting pain along clearly-defined track") {
							scoreValue = "393";
						} else if (val.equals("Burning pain")
								|| val == "Burning pain") {
							scoreValue = "394";
						} else if (val.equals("Other") || val == "Other") {
							scoreValue = "395";
						} else if (val.equals("Cannot remember")
								|| val == "Cannot remember") {
							scoreValue = "396";
						}
						records.setQuestionId(formQuesClient.get(i)
								.getQuestionId());
						records.setUserId(form.getClientId());
						records.setQuestionOptionId(scoreValue);
						records.setAnswerText(formQuesClient.get(i).getValue());
						records.setScore(adminService.getQuestionById(
								Integer.parseInt(scoreValue)).getMaxScore());
						adminService.insertQuestionAnswer(records,
								form.getClientId());

						val = "";
					} else {
						records.setQuestionId(formQuesClient.get(i)
								.getQuestionId());
						records.setUserId(form.getClientId());
						records.setQuestionOptionId(scoreValue);

						records.setAnswerText(formQuesClient.get(i).getValue());
						records.setScore(null);
						adminService.insertQuestionAnswer(records,
								form.getClientId());

					}
				}

				if (formQuesClient.get(i).getQuestionId() == 206
						|| formQuesClient.get(i).getQuestionId() == 207
						|| formQuesClient.get(i).getQuestionId() == 18
						|| formQuesClient.get(i).getQuestionId() == 191
						|| formQuesClient.get(i).getQuestionId() == 194
						|| formQuesClient.get(i).getQuestionId() == 195
						|| formQuesClient.get(i).getQuestionId() == 196
						|| formQuesClient.get(i).getQuestionId() == 199
						|| formQuesClient.get(i).getQuestionId() == 202
						|| formQuesClient.get(i).getQuestionId() == 203
						|| formQuesClient.get(i).getQuestionId() == 204
						|| formQuesClient.get(i).getQuestionId() == 209
						|| formQuesClient.get(i).getQuestionId() == 214
						|| formQuesClient.get(i).getQuestionId() == 210
						|| formQuesClient.get(i).getQuestionId() == 215
						|| formQuesClient.get(i).getQuestionId() == 211
						|| formQuesClient.get(i).getQuestionId() == 216
						|| formQuesClient.get(i).getQuestionId() == 212
						|| formQuesClient.get(i).getQuestionId() == 217
						|| formQuesClient.get(i).getQuestionId() == 438) {

					String val1 = formQuesClient.get(i).getValue();

					records.setQuestionId(formQuesClient.get(i).getQuestionId());
					records.setUserId(form.getClientId());
					records.setAnswerText(formQuesClient.get(i).getValue());
					records.setQuestionOptionId(formQuesClient.get(i)
							.getValue());
					records.setScore(adminService.getQuestionById(
							Integer.parseInt(formQuesClient.get(i).getValue()))
							.getMaxScore());
					adminService.insertQuestionAnswer(records,
							form.getClientId());
				}
			}

			/* End Reports data */

			formService.addFormQuestionClient(clientForm,
					BackPainForm.QUESTION_19, form.getQuestion19());
			formService.addFormQuestionClient(clientForm,
					BackPainForm.QUESTION_123, form.getQuestion123());
			formService.addFormQuestionClient(clientForm,
					BackPainForm.QUESTION_124, form.getQuestion124());

			model.addAttribute(
					"message",
					"About Back Pain(1) has been updated successfully.To continue entering your data, please click on the next form in the panel to your left.");

			if (form.getSendMessage() != null
					&& !form.getSendMessage().isEmpty()) {
				if (form.getSendMessage().equals("Yes")) {
					MailReminder mail = new MailReminder();
					mail.sendMessage("monro.robin11@gmail.com",
							"Changes By User " + client.getUserId() + "",
							"Hi user " + client.getUserId()
									+ " has changed Back pain form");
				}
			}
		}

		model.addAttribute("form", form);

		// for showing completed forms functionality
		List<ClientForm> formStatus = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.ABOUT_YOU_FORM_ID);
//		if (formStatus.size() != 0) {
//			model.addAttribute("formStatusAboutYou", formStatus.get(0)
//					.getState());
//		}
		String state="";
//try{
//			
//			if(client.getSex().equals("")){	
				if(formStatus.size() != 0){
					state=formStatus.get(0).getState();
				model.addAttribute("formStatusAboutYou",formStatus.get(0).getState());
			}
//			}else{
//				System.out.println("in else");
//				state="Completed";
//				model.addAttribute("formStatusAboutYou","Completed");
//			
//			
//		}
//		}
//		catch(Exception e)
//		{System.out.println("in catch");
//		state=formStatus.get(0).getState();
//			model.addAttribute("formStatusAboutYou",formStatus.get(0).getState());
//	
//		}

		List<ClientForm> formStatus1 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.MED_HIST_FORM_ID);
		if (formStatus1.size() != 0) {
			model.addAttribute("formStatusMedicalHistory", formStatus1.get(0)
					.getState());
		}

		List<ClientForm> formStatus2 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
		if (formStatus2.size() != 0) {
			model.addAttribute("formStatusbackPain", formStatus2.get(0)
					.getState());
		}

		List<ClientForm> formStatus3 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN2_FORM_ID);
		if (formStatus3.size() != 0) {
			model.addAttribute("formStatusbackPain2", formStatus3.get(0)
					.getState());
		}

		List<ClientForm> formStatus4 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.SELF_EXAM_FORM_ID);
		if (formStatus4.size() != 0) {
			model.addAttribute("formStatusSelfExam", formStatus4.get(0)
					.getState());
		}
		List<ClientForm> formStatus5= formService.getFormStatus(client.getClientId(), CalbaAppConstant.DISABILITY_FORM_ID);
		if(formStatus5.size() != 0){
			if(client.getDisabilityFormUpdate()==1){
				System.out.println("here come=="+client.getDisabilityFormUpdate());
				ClientForm clientForm1=new ClientForm();
				clientForm1.setClientId(client.getClientId());
				clientForm1.setFormId(CalbaAppConstant.DISABILITY_FORM_ID);
				clientForm1.setState(CalbaAppConstant.STATE_COMPLETED);
				formService.updateClientForm(client.getClientId(),
						CalbaAppConstant.DISABILITY_FORM_ID);
				model.addAttribute("formStatusDisability",CalbaAppConstant.STATE_COMPLETED);
				model.addAttribute("status", client.getDisabilityFormUpdate());
				disabililityState=CalbaAppConstant.STATE_COMPLETED;
			}
			else{				
				model.addAttribute("formStatusDisability",formStatus5.get(0).getState());
				model.addAttribute("status",null);
				disabililityState=formStatus5.get(0).getState();
			}
		}
		int count=0;
		try{
		if( state.equals("Completed")){
			count++;
		}if( formStatus1.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus2.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus3.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus4.get(0)
				.getState().equals("Completed")){
			count++;
		
		}
		}catch(Exception e){
			
		}
		if (!result.hasErrors()) {
		if ( state.equals("Completed") && formStatus1.get(0).getState().equals("Completed")
				&& formStatus2.get(0).getState().equals("Completed") && formStatus3.get(0).getState().equals("Completed")
				&& formStatus4.get(0).getState().equals("Completed") && disabililityState.equals("Completed")) {
			client.setClientStateId(4);
			model.addAttribute(
					"message",
					"You have successfully completed all the forms.  See message in left hand panel for further instructions");
			MailReminder mail = new MailReminder();
			ClientListing clientListing = adminService.getClientListingById(client.getClientId());
			List<ClientListing> clientEmail = adminService.getUserEmail(client.getClientId().toString());
			Map m = (Map) clientEmail.get(0);
			Set s=m.entrySet();
			String email="";
			
			returnPage="welcome";
			model.addAttribute("AssesmentFlag", 0);
			model.addAttribute("loginVal", "login");

			
			Iterator i=s.iterator();
					while(i.hasNext()){
					    Map.Entry mp= (Map.Entry) i.next();
					    email=mp.getValue().toString();
//					    System.out.println(""+mp.getKey()+""+ mp.getValue());
					}
			mail.sendMessage(
					"monro.robin11@gmail.com",
					clientListing.getUserId(),"\n\n<html><br><br><b>"+ clientListing.getForeName()
							+ " "+ clientListing.getSurName()
							+ "</b> has just completed the forms and is awaiting the assessment report</center></html>");
			mail.sendMessage(email,
					clientListing.getUserId(),"\n\n<html><br><br><p> This is to confirm that you have successfully completed the forms for the assessment of your low back pain and you will receive a report on the results, along with advice, within two working days.</p></html>");
		}
		else{
//			model.addAttribute(
//					"message",
//					"Only "+(count)+" of the forms have been completed. For further instructions see left hand panel.");
			model.addAttribute(
					"message",
					"You have successfully completed this form.   To continue, please click on the next uncompleted form in the left hand panel.   If you have to exit before completion of all the forms, you can resume where you left off by logging on again with your User Name and Password.");

		}}
		// End for showing completed forms functionality
		setMonitorValue(client, model);
		return returnPage;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/backPain2")
	public String backPain2(@ModelAttribute("loggedClient") Client client,
			ModelMap model) {

		ClientForm clientForm = formService.getClientForm(client.getClientId(),
				CalbaAppConstant.BACK_PAIN2_FORM_ID);
		List<FormQuestionClient> formQuesClient = formService
				.getFormQuestionClient(clientForm.getClientFormId());
		BackPain2Form form = new BackPain2Form(clientForm.getClientFormId());
		FormUtil.setBaseForm(formQuesClient, form);
		form.setClientId(client.getClientId());

		// for showing completed forms functionality
		List<ClientForm> formStatus = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.ABOUT_YOU_FORM_ID);
		if (formStatus.size() != 0) {
			model.addAttribute("formStatusAboutYou", formStatus.get(0)
					.getState());
		}

		List<ClientForm> formStatus1 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.MED_HIST_FORM_ID);
		if (formStatus1.size() != 0) {
			model.addAttribute("formStatusMedicalHistory", formStatus1.get(0)
					.getState());
		}

		List<ClientForm> formStatus2 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
		if (formStatus2.size() != 0) {
			model.addAttribute("formStatusbackPain", formStatus2.get(0)
					.getState());
		}

		List<ClientForm> formStatus3 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN2_FORM_ID);
		if (formStatus3.size() != 0) {
			model.addAttribute("formStatusbackPain2", formStatus3.get(0)
					.getState());
		}

		List<ClientForm> formStatus4 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.SELF_EXAM_FORM_ID);
		if (formStatus4.size() != 0) {
			model.addAttribute("formStatusSelfExam", formStatus4.get(0)
					.getState());
		}
		List<ClientForm> formStatus5= formService.getFormStatus(client.getClientId(), CalbaAppConstant.DISABILITY_FORM_ID);
		if(formStatus5.size() != 0){
			if(client.getDisabilityFormUpdate()==1){
				System.out.println("here come=="+client.getDisabilityFormUpdate());
				ClientForm clientForm1=new ClientForm();
				clientForm1.setClientId(client.getClientId());
				clientForm1.setFormId(CalbaAppConstant.DISABILITY_FORM_ID);
				clientForm1.setState(CalbaAppConstant.STATE_COMPLETED);
				formService.updateClientForm(client.getClientId(),
						CalbaAppConstant.DISABILITY_FORM_ID);
				model.addAttribute("formStatusDisability",CalbaAppConstant.STATE_COMPLETED);
				model.addAttribute("status", client.getDisabilityFormUpdate());
				disabililityState=CalbaAppConstant.STATE_COMPLETED;
			}
			else{				
				model.addAttribute("formStatusDisability",formStatus5.get(0).getState());
				model.addAttribute("status", null);
				disabililityState=formStatus5.get(0).getState();
			}
		}
		// End for showing completed forms functionality

		model.addAttribute("form", form);
		ClientListing result1 = adminService.getUserSetFlag(client.getClientId());
		model.addAttribute("AssesmentFlag", result1.getAssessmentformflag());

		ClientListing resultVal = adminService.getUserSetFlag(client.getClientId());
		model.addAttribute("setFlag", resultVal.getFormSetFlag());
		setMonitorValue(client, model);
		
		return "backPain2";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/backPain2")
	public String backPain2(@ModelAttribute("loggedClient") Client client,
			@ModelAttribute("form") @Valid BackPain2Form form,
			BindingResult result, ModelMap model) throws EmailException,
			MessagingException {
		String returnPage="backPain2";

		if (result.hasErrors()) {
			model.addAttribute("error", "Please provide required data.");
		} else {
			ClientForm clientForm = formService.updateClientForm(
					form.getClientId(), CalbaAppConstant.BACK_PAIN2_FORM_ID);

			formService.addClientState(client.getClientId(),
					CalbaAppConstant.BACK_PAIN2_FORM_ID, client);
			List<FormQuestionClient> formQuesClient = FormUtil
					.getFormQuestionClients(form);
			formService.addFormQuestionClient(clientForm,
					BackPain2Form.QUESTION_52, form.getQuestion52());
			formService.addFormQuestionClient(formQuesClient,
					form.getClientFormId());

			QuestionAnswer records = new QuestionAnswer();
			/* Non- Specification report data */

			for (int i = 0; i < formQuesClient.size(); i++) {

				if (formQuesClient.get(i).getQuestionId() == 25
						|| formQuesClient.get(i).getQuestionId() == 27
						|| formQuesClient.get(i).getQuestionId() == 50
						|| formQuesClient.get(i).getQuestionId() == 53
						|| formQuesClient.get(i).getQuestionId() == 56
						|| formQuesClient.get(i).getQuestionId() == 60
						|| formQuesClient.get(i).getQuestionId() == 57
						|| formQuesClient.get(i).getQuestionId() == 58
						|| formQuesClient.get(i).getQuestionId() == 417) {

					if (formQuesClient.get(i).getQuestionId() == 25) {

					}

					records.setQuestionId(formQuesClient.get(i).getQuestionId());
					records.setUserId(form.getClientId());
					records.setAnswerText(formQuesClient.get(i).getValue());
					records.setQuestionOptionId(formQuesClient.get(i)
							.getValue());
					records.setScore(adminService.getQuestionById(
							Integer.parseInt(formQuesClient.get(i).getValue()))
							.getMaxScore());
					adminService.insertQuestionAnswer(records,
							form.getClientId());
				}

				if (formQuesClient.get(i).getQuestionId() == 505) {

					records.setQuestionId(formQuesClient.get(i).getQuestionId());
					records.setUserId(form.getClientId());
					records.setAnswerText(formQuesClient.get(i).getValue());
					records.setQuestionOptionId(formQuesClient.get(i)
							.getValue());
					records.setScore(adminService.getQuestionById(
							Integer.parseInt(formQuesClient.get(i).getValue()))
							.getMaxScore());
					adminService.insertQuestionAnswer(records,
							form.getClientId());

				}
			}

			/* End Non- Specification report data */

			model.addAttribute(
					"message",
					"About Back Pain(2) has been updated successfully.To continue entering your data, please click on the next form in the panel to your left.");
			if (form.getSendMessage() != null
					&& !form.getSendMessage().isEmpty()) {
				if (form.getSendMessage().equals("Yes")) {
					MailReminder mail = new MailReminder();
					mail.sendMessage("monro.robin11@gmail.com",
							"Changes By User " + client.getUserId() + "",
							"Hi user " + client.getUserId()
									+ " changed Back pain2 form");
				}
			}
		}
		model.addAttribute("form", form);

		// for showing completed forms functionality
		List<ClientForm> formStatus = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.ABOUT_YOU_FORM_ID);
//		if (formStatus.size() != 0) {
//			model.addAttribute("formStatusAboutYou", formStatus.get(0)
//					.getState());
//		}
		String state="";
//		try{
//					
//					if(client.getSex().equals("")){	
						if(formStatus.size() != 0){
							state=formStatus.get(0).getState();
						model.addAttribute("formStatusAboutYou",formStatus.get(0).getState());
					}
//					}else{
//						System.out.println("in else");
//						state="Completed";
//						model.addAttribute("formStatusAboutYou","Completed");
//					
//					
//				}
//				}
//				catch(Exception e)
//				{System.out.println("in catch");
//				state=formStatus.get(0).getState();
//					model.addAttribute("formStatusAboutYou",formStatus.get(0).getState());
//			
//				}

		List<ClientForm> formStatus1 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.MED_HIST_FORM_ID);
		if (formStatus1.size() != 0) {
			model.addAttribute("formStatusMedicalHistory", formStatus1.get(0)
					.getState());
		}

		List<ClientForm> formStatus2 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
		if (formStatus2.size() != 0) {
			model.addAttribute("formStatusbackPain", formStatus2.get(0)
					.getState());
		}

		List<ClientForm> formStatus3 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN2_FORM_ID);
		if (formStatus3.size() != 0) {
			model.addAttribute("formStatusbackPain2", formStatus3.get(0)
					.getState());
		}

		List<ClientForm> formStatus4 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.SELF_EXAM_FORM_ID);
		if (formStatus4.size() != 0) {
			model.addAttribute("formStatusSelfExam", formStatus4.get(0)
					.getState());
		}
		List<ClientForm> formStatus5= formService.getFormStatus(client.getClientId(), CalbaAppConstant.DISABILITY_FORM_ID);
		if(formStatus5.size() != 0){
			if(client.getDisabilityFormUpdate()==1){
				System.out.println("here come=="+client.getDisabilityFormUpdate());
				ClientForm clientForm1=new ClientForm();
				clientForm1.setClientId(client.getClientId());
				clientForm1.setFormId(CalbaAppConstant.DISABILITY_FORM_ID);
				clientForm1.setState(CalbaAppConstant.STATE_COMPLETED);
				formService.updateClientForm(client.getClientId(),
						CalbaAppConstant.DISABILITY_FORM_ID);
				model.addAttribute("formStatusDisability",CalbaAppConstant.STATE_COMPLETED);
				model.addAttribute("status", client.getDisabilityFormUpdate());
				disabililityState=CalbaAppConstant.STATE_COMPLETED;
			}
			else{				
				model.addAttribute("formStatusDisability",formStatus5.get(0).getState());
				model.addAttribute("status",null);
				disabililityState=formStatus5.get(0).getState();
			}
		}
		int count=0;
		try{
		if( state.equals("Completed")){
			count++;
		}if( formStatus1.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus2.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus3.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus4.get(0)
				.getState().equals("Completed")){
			count++;
		
		}
		}catch(Exception e){
			
		}
		if (!result.hasErrors()) {
		if ( state.equals("Completed") && formStatus1.get(0).getState().equals("Completed")
				&& formStatus2.get(0).getState().equals("Completed") && formStatus3.get(0).getState().equals("Completed")
				&& formStatus4.get(0).getState().equals("Completed") && disabililityState.equals("Completed")) {
			client.setClientStateId(4);
			model.addAttribute(
					"message",
					"You have successfully completed all the forms.  See message in left hand panel for further instructions");
			MailReminder mail = new MailReminder();
			ClientListing clientListing = adminService.getClientListingById(client.getClientId());
			List<ClientListing> clientEmail = adminService.getUserEmail(client.getClientId().toString());
			Map m = (Map) clientEmail.get(0);
			Set s=m.entrySet();
			String email="";
			
			returnPage="welcome";
			model.addAttribute("AssesmentFlag", 0);
			model.addAttribute("loginVal", "login");

			
			Iterator i=s.iterator();
					while(i.hasNext()){
					    Map.Entry mp= (Map.Entry) i.next();
					    email=mp.getValue().toString();
//					    System.out.println(""+mp.getKey()+""+ mp.getValue());
					}
			mail.sendMessage(
					"monro.robin11@gmail.com",
					clientListing.getUserId(),"\n\n<html><br><br><b>"+ clientListing.getForeName()
							+ " "+ clientListing.getSurName()
							+ "</b> has just completed the forms and is awaiting the assessment report</center></html>");
			mail.sendMessage(email,
					clientListing.getUserId(),"\n\n<html><br><br><p> This is to confirm that you have successfully completed the forms for the assessment of your low back pain and you will receive a report on the results, along with advice, within two working days.</p></html>");
		}
		else{
//			model.addAttribute(
//					"message",
//					"Only "+(count)+" of the forms have been completed. For further instructions see left hand panel.");
			model.addAttribute(
					"message",
					"You have successfully completed this form.   To continue, please click on the next uncompleted form in the left hand panel.   If you have to exit before completion of all the forms, you can resume where you left off by logging on again with your User Name and Password.");

		}}
		// End for showing completed forms functionality
		setMonitorValue(client, model);
		return returnPage;
						
	}

	@RequestMapping(method = RequestMethod.GET, value = "/selfExam")
	public String selfExamination(
			@ModelAttribute("loggedClient") Client client, ModelMap model) {
		ClientForm clientForm = formService.getClientForm(client.getClientId(),
				CalbaAppConstant.SELF_EXAM_FORM_ID);
		List<FormQuestionClient> formQuesClient = formService
				.getFormQuestionClient(clientForm.getClientFormId());
		SelfExaminationForm form = new SelfExaminationForm(
				clientForm.getClientFormId());
		FormUtil.setBaseForm(formQuesClient, form);
		form.setClientId(client.getClientId());

		// for showing completed forms functionality
		List<ClientForm> formStatus = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.ABOUT_YOU_FORM_ID);
		if (formStatus.size() != 0) {
			model.addAttribute("formStatusAboutYou", formStatus.get(0)
					.getState());
		}

		List<ClientForm> formStatus1 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.MED_HIST_FORM_ID);
		if (formStatus1.size() != 0) {
			model.addAttribute("formStatusMedicalHistory", formStatus1.get(0)
					.getState());
		}

		List<ClientForm> formStatus2 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
		if (formStatus2.size() != 0) {
			model.addAttribute("formStatusbackPain", formStatus2.get(0)
					.getState());
		}

		List<ClientForm> formStatus3 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN2_FORM_ID);
		if (formStatus3.size() != 0) {
			model.addAttribute("formStatusbackPain2", formStatus3.get(0)
					.getState());
		}

		List<ClientForm> formStatus4 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.SELF_EXAM_FORM_ID);
		if (formStatus4.size() != 0) {
			model.addAttribute("formStatusSelfExam", formStatus4.get(0)
					.getState());
		}
		List<ClientForm> formStatus5= formService.getFormStatus(client.getClientId(), CalbaAppConstant.DISABILITY_FORM_ID);
		if(formStatus5.size() != 0){
			if(client.getDisabilityFormUpdate()==1){
				System.out.println("here come=="+client.getDisabilityFormUpdate());
				ClientForm clientForm1=new ClientForm();
				clientForm1.setClientId(client.getClientId());
				clientForm1.setFormId(CalbaAppConstant.DISABILITY_FORM_ID);
				clientForm1.setState(CalbaAppConstant.STATE_COMPLETED);
				formService.updateClientForm(client.getClientId(),
						CalbaAppConstant.DISABILITY_FORM_ID);
				model.addAttribute("formStatusDisability",CalbaAppConstant.STATE_COMPLETED);
				model.addAttribute("status", client.getDisabilityFormUpdate());
				disabililityState=CalbaAppConstant.STATE_COMPLETED;
			}
			else{				
				model.addAttribute("formStatusDisability",formStatus5.get(0).getState());
				model.addAttribute("status", null);
				disabililityState=formStatus5.get(0).getState();
			}
		}
		// End for showing completed forms functionality

		model.addAttribute("form", form);
		ClientListing result1 = adminService.getUserSetFlag(client.getClientId());
		model.addAttribute("AssesmentFlag", result1.getAssessmentformflag());
		ClientListing resultVal = adminService.getUserSetFlag(client.getClientId());
		model.addAttribute("setFlag", resultVal.getFormSetFlag());
		setMonitorValue(client, model);
		
		return "selfExam";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/selfExam")
	public String selfExamination(
			@ModelAttribute("loggedClient") Client client,
			@ModelAttribute("form") @Valid SelfExaminationForm form,
			BindingResult result, ModelMap model) throws EmailException,
			MessagingException {
		
		String returnPage="selfExam";

		if (result.hasErrors()) {
			model.addAttribute("error", "Please provide required data.");
		} else {
			ClientForm clientForm = formService.updateClientForm(
					form.getClientId(), CalbaAppConstant.SELF_EXAM_FORM_ID);

			List<FormQuestionClient> formQuesClient = FormUtil
					.getFormQuestionClients(form);
			formService.addClientState(client.getClientId(),
					CalbaAppConstant.SELF_EXAM_FORM_ID, client);

			QuestionAnswer records = new QuestionAnswer();
			/* Reports Data */
			String scoreValue = "";

			for (int i = 0; i < formQuesClient.size(); i++) {

				if (formQuesClient.get(i).getQuestionId() == 23
						|| formQuesClient.get(i).getQuestionId() == 71
						|| formQuesClient.get(i).getQuestionId() == 72
						|| formQuesClient.get(i).getQuestionId() == 68
						|| formQuesClient.get(i).getQuestionId() == 67
						|| formQuesClient.get(i).getQuestionId() == 434
						|| formQuesClient.get(i).getQuestionId() == 435) {

					records.setQuestionId(formQuesClient.get(i).getQuestionId());
					records.setUserId(form.getClientId());
					records.setAnswerText(formQuesClient.get(i).getValue());
					records.setQuestionOptionId(formQuesClient.get(i)
							.getValue());
					records.setScore(adminService.getQuestionById(
							Integer.parseInt(formQuesClient.get(i).getValue()))
							.getMaxScore());
					adminService.insertQuestionAnswer(records,
							form.getClientId());
				}

			}

			formService.addFormQuestionClient(formQuesClient,
					form.getClientFormId());
			model.addAttribute(
					"message",
					"Self Examination has been updated successfully.To continue entering your data, please click on the next form in the panel to your left.");
			if (form.getSendMessage() != null
					&& !form.getSendMessage().isEmpty()) {
				if (form.getSendMessage().equals("Yes")) {
					MailReminder mail = new MailReminder();
					mail.sendMessage("monro.robin11@gmail.com",
							"Changes By User " + client.getUserId() + "",
							"Hi user " + client.getUserId()
									+ " has changed Self Exam form");
				}
			}
		}

		model.addAttribute("form", form);

		// for showing completed forms functionality
		List<ClientForm> formStatus = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.ABOUT_YOU_FORM_ID);
//		if (formStatus.size() != 0) {
//			model.addAttribute("formStatusAboutYou", formStatus.get(0)
//					.getState());
//		}
		String state="";
//		try{
//					
//					if(client.getSex().equals("")){	
						if(formStatus.size() != 0){
							state=formStatus.get(0).getState();
						model.addAttribute("formStatusAboutYou",formStatus.get(0).getState());
					}
//					}else{
//						System.out.println("in else");
//						state="Completed";
//						model.addAttribute("formStatusAboutYou","Completed");
//					
//					
//				}
//				}
//				catch(Exception e)
//				{System.out.println("in catch");
//				state=formStatus.get(0).getState();
//					model.addAttribute("formStatusAboutYou",formStatus.get(0).getState());
//			
//				}

		List<ClientForm> formStatus1 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.MED_HIST_FORM_ID);
		if (formStatus1.size() != 0) {
			model.addAttribute("formStatusMedicalHistory", formStatus1.get(0)
					.getState());
		}

		List<ClientForm> formStatus2 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
		if (formStatus2.size() != 0) {
			model.addAttribute("formStatusbackPain", formStatus2.get(0)
					.getState());
		}

		List<ClientForm> formStatus3 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN2_FORM_ID);
		if (formStatus3.size() != 0) {
			model.addAttribute("formStatusbackPain2", formStatus3.get(0)
					.getState());
		}

		List<ClientForm> formStatus4 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.SELF_EXAM_FORM_ID);
		if (formStatus4.size() != 0) {
			model.addAttribute("formStatusSelfExam", formStatus4.get(0)
					.getState());
		}
		List<ClientForm> formStatus5= formService.getFormStatus(client.getClientId(), CalbaAppConstant.DISABILITY_FORM_ID);
		if(formStatus5.size() != 0){
			if(client.getDisabilityFormUpdate()==1){
				System.out.println("here come=="+client.getDisabilityFormUpdate());
				ClientForm clientForm1=new ClientForm();
				clientForm1.setClientId(client.getClientId());
				clientForm1.setFormId(CalbaAppConstant.DISABILITY_FORM_ID);
				clientForm1.setState(CalbaAppConstant.STATE_COMPLETED);
				formService.updateClientForm(client.getClientId(),
						CalbaAppConstant.DISABILITY_FORM_ID);
				model.addAttribute("formStatusDisability",CalbaAppConstant.STATE_COMPLETED);
				model.addAttribute("status", client.getDisabilityFormUpdate());
				disabililityState=CalbaAppConstant.STATE_COMPLETED;
			}
			else{				
				model.addAttribute("formStatusDisability",formStatus5.get(0).getState());
				model.addAttribute("status", null);
				disabililityState=formStatus5.get(0).getState();
			}
		}

		int count=0;
		try{
		if( state.equals("Completed")){
			count++;
		}if( formStatus1.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus2.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus3.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus4.get(0)
				.getState().equals("Completed")){
			count++;
			
		}
		}catch(Exception e){
			
		}
		if (!result.hasErrors()) {
		if ( state.equals("Completed") && formStatus1.get(0).getState().equals("Completed")
				&& formStatus2.get(0).getState().equals("Completed") && formStatus3.get(0).getState().equals("Completed")
				&& formStatus4.get(0).getState().equals("Completed") && disabililityState.equals("Completed")) {
			client.setClientStateId(4);
			model.addAttribute(
					"message",
					"You have successfully completed all the forms.  See message in left hand panel for further instructions");
			MailReminder mail = new MailReminder();
			ClientListing clientListing = adminService.getClientListingById(client.getClientId());
			List<ClientListing> clientEmail = adminService.getUserEmail(client.getClientId().toString());
			Map m = (Map) clientEmail.get(0);
			Set s=m.entrySet();
			String email="";
			
			returnPage="welcome";
			model.addAttribute("AssesmentFlag", 0);
			model.addAttribute("loginVal", "login");

			
			Iterator i=s.iterator();
					while(i.hasNext()){
					    Map.Entry mp= (Map.Entry) i.next();
					    email=mp.getValue().toString();
//					    System.out.println(""+mp.getKey()+""+ mp.getValue());
					}
			mail.sendMessage(
					"monro.robin11@gmail.com",
					clientListing.getUserId(),"\n\n<html><br><br><b>"+ clientListing.getForeName()
							+ " "+ clientListing.getSurName()
							+ "</b> has just completed the forms and is awaiting the assessment report</center></html>");
			mail.sendMessage(email,
					clientListing.getUserId(),"\n\n<html><br><br><p> This is to confirm that you have successfully completed the forms for the assessment of your low back pain and you will receive a report on the results, along with advice, within two working days.</p></html>");
		}
		else{
//			model.addAttribute(
//					"message",
//					"Only "+(count)+" of the forms have been completed. For further instructions see left hand panel.");
			model.addAttribute(
					"message",
					"You have successfully completed this form.   To continue, please click on the next uncompleted form in the left hand panel.   If you have to exit before completion of all the forms, you can resume where you left off by logging on again with your User Name and Password.");

		}}
		// End for showing completed forms functionality
		setMonitorValue(client, model);
		
		return returnPage;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/weeklyUpdate")
	public String weeklyUpdate(@ModelAttribute("loggedClient") Client client,
			ModelMap model) {

		ClientForm clientForm = formService.getClientForm(client.getClientId(),
				CalbaAppConstant.WEEKLY_UPDATE_FORM_ID);
		List<FormQuestionClient> formQuesClient = formService
				.getFormQuestionClient(clientForm.getClientFormId());

		List<ClientListing> result = adminService.getUserListing();
		List<HNPTable> flagsValue = null;

		int questionId = client.getClientId();
		Integer qID = (Integer) questionId;
		int flag = 0;
		int setForm = 0;
		for (int i = 0; i < result.size(); i++) {

			if (qID.equals(result.get(i).getClientId())) {

				model.addAttribute("setFormVal", result.get(i).getSetForm());
				model.addAttribute("setFlagWeekly", result.get(i).getFormSetFlag());
				flag = result.get(i).getFormSetFlag();
				setForm = result.get(i).getSetForm();
				flagsValue = adminService.getFlagValue(setForm, questionId);
				model.addAttribute("flagsValue", flagsValue);

			}

		}

		WeeklyUpdateForm form = new WeeklyUpdateForm(
				clientForm.getClientFormId());

		if (flag == 0) {

		} else if (flag == 1) {
			FormUtil.setBaseForm(formQuesClient, form);
		}

		form.setClientId(client.getClientId());
		model.addAttribute("form", form);
		model.addAttribute("form1", form);
		ClientListing resultVal = adminService.getUserSetFlag(client.getClientId());
		model.addAttribute("AssesmentFlag", resultVal.getAssessmentformflag());
		model.addAttribute("setFlag", resultVal.getFormSetFlag());

		return "weeklyUpdate";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/weeklyUpdate")
	public String weeklyUpdate(@ModelAttribute("loggedClient") Client client,
			@ModelAttribute("form") @Valid WeeklyUpdateForm form,
			BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			model.addAttribute("error", "Please provide required data.");
		} else {
			ClientForm clientForm = formService.updateClientForm(
					client.getClientId(),
					CalbaAppConstant.WEEKLY_UPDATE_FORM_ID);
			List<FormQuestionClient> formQuesClient = FormUtil
					.getFormQuestionClients(form);
			String formSetId = form.getSetFlag();

			for (int i = 0; i < formQuesClient.size(); i++) {

			}

			formService.addMoniterSystem(formQuesClient, client.getClientId(),
					formSetId);
			adminService
					.updateClientSetFlag(client.getClientId().toString(), 1);
			formService.addFormQuestionClient(formQuesClient,
					form.getClientFormId());
			formService.addFormQuestionClient(clientForm,
					WeeklyUpdateForm.QUESTION_439, form.getQuestion439());
			formService.addFormQuestionClient(clientForm,
					WeeklyUpdateForm.QUESTION_440, form.getQuestion440());
			formService.addFormQuestionClient(clientForm,
					WeeklyUpdateForm.QUESTION_441, form.getQuestion441());

			formService.addFormQuestionClient(clientForm,
					WeeklyUpdateForm.QUESTION_449, form.getQuestion449());
			formService.addFormQuestionClient(clientForm,
					WeeklyUpdateForm.QUESTION_450, form.getQuestion450());
			formService.addFormQuestionClient(clientForm,
					WeeklyUpdateForm.QUESTION_451, form.getQuestion451());

			formService.addFormQuestionClient(clientForm,
					WeeklyUpdateForm.QUESTION_458, form.getQuestion458());
			formService.addFormQuestionClient(clientForm,
					WeeklyUpdateForm.QUESTION_459, form.getQuestion459());
			formService.addFormQuestionClient(clientForm,
					WeeklyUpdateForm.QUESTION_460, form.getQuestion460());
			model.addAttribute("message",
					"Weekly Update has been updated successfully.");
		}

		List<ClientListing> result1 = adminService.getUserListing();
		List<HNPTable> flagsValue = null;

		int questionId = client.getClientId();
		Integer qID = (Integer) questionId;
		int flag = 0;
		int setForm = 0;
		for (int i = 0; i < result1.size(); i++) {

			if (qID.equals(result1.get(i).getClientId())) {

				model.addAttribute("setFormVal", result1.get(i).getSetForm());
				model.addAttribute("setFlagWeekly", result1.get(i).getFormSetFlag());
				flag = result1.get(i).getFormSetFlag();
				setForm = result1.get(i).getSetForm();
				flagsValue = adminService.getFlagValue(setForm, questionId);
				model.addAttribute("flagsValue", flagsValue);
			}

		}
		

		ClientListing resultVal = adminService.getUserSetFlag(client.getClientId());
		model.addAttribute("AssesmentFlag", resultVal.getAssessmentformflag());
		model.addAttribute("setFlag", resultVal.getFormSetFlag());

		model.addAttribute("form", form);

		return "weeklyUpdate";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/myAccount")
	public String myAccount(@ModelAttribute("loggedClient") Client client,
			ModelMap model) {
		MyAccountForm form = new MyAccountForm();
		model.addAttribute("form", form);
		return "myAccount";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/myAccount")
	public String myAccount(@ModelAttribute("loggedClient") Client client,
			@ModelAttribute("form") @Valid MyAccountForm form,
			BindingResult result, ModelMap model) {

		try {

			if (!result.hasErrors()
					&& !form.getNewPassward().equals(form.getConfirmPassward())) {
				result.reject("confirmPassward", "Confirm passward mismatch");
			}

			if (!result.hasErrors()) {
				client = clientService.updateClientPassword(form.getPassword(),
						form.getNewPassward(), client.getClientId());
				model.addAttribute(CalbaAppConstant.LOGGED_CLIENT, client);
			}

		} catch (CalbaAppServiceException e) {
			result.reject("error", e.getMessage());
		}

		if (result.hasErrors()) {
			model.addAttribute("form", form);
			return "myAccount";
		} else {
			return "welcome";
		}

	}

	@RequestMapping(method = RequestMethod.GET, value = "/finalReport")
	public String finalReport(@ModelAttribute("loggedClient") Client client,
			ModelMap model) {

		adminService.updateNullValue();

		int clientId = client.getClientId();
		Report report = adminService
				.getReportQuestionListing(REPORT_HNP_PHASES);

		Report report1 = adminService
				.getReportQuestionListing(REPORT_NON_RADICULAR);

		// All rad values
		Report report2 = adminService
				.getReportQuestionListing(REPORT_TOT_RADICULAR);
		Report report3 = adminService
				.getReportQuestionListing(REPORT_PAIN_ANALYSIS);

		Map<String, Integer> clientScore1 = adminService.getClientReportScore(
				clientId, REPORT_TOT_RADICULAR);
		Map<String, Integer> scoreText1 = adminService.getClientScoreAnswer(
				clientId, REPORT_TOT_RADICULAR);

		// Data for dermotome tables
		Map<String, Integer> clientScore2 = adminService.getClientReportScore(
				clientId, REPORT_PAIN_ANALYSIS);
		Map<String, Integer> scoreText2 = adminService.getClientScoreAnswer(
				clientId, REPORT_PAIN_ANALYSIS);
		// End data for dermotome tables

		model.addAttribute("report2", report2);
		model.addAttribute("clientScore1", clientScore1);
		model.addAttribute("clientAnswer1", scoreText1);

		model.addAttribute("report3", report3);
		model.addAttribute("clientScore2", clientScore2);
		model.addAttribute("clientAnswer2", scoreText2);
		// End all rad values

		model.addAttribute("report", report);
		model.addAttribute("report1", report1);

		ClientListing client1 = adminService.getClientListingById(clientId);

		List<HNPTable> myList = new ArrayList();

		myList = adminService.getHnpTableData();

		// Non rad score
		Map<String, Integer> clientScore = adminService.getClientReportScore(
				clientId, REPORT_NON_RADICULAR);
		Map<String, Integer> scoreText = adminService.getClientScoreAnswer(
				clientId, REPORT_NON_RADICULAR);

		model.addAttribute("clientScore", clientScore);
		model.addAttribute("clientAnswer", scoreText);
		// End non rad score

		model.addAttribute("client", client1);
		model.addAttribute("hnpPhaseValue", myList);

		// Code for the question listing of backpain
		ClientForm clientForm = formService.getClientForm(
				client1.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
		List<FormQuestionClient> formQuesClient = formService
				.getFormQuestionClient(clientForm.getClientFormId());
		BackPainForm form = new BackPainForm(clientForm.getClientFormId());
		FormUtil.setBaseForm(formQuesClient, form);
		model.addAttribute("formHnp", form);

		String satusOfPain = form.getQuestion32().toString();
		String lastTimePain = form.getQuestion39().toString();
		String firstTimePain = form.getQuestion40().toString();

		String firstColumn = form.getQuestion293().toString();
		String secondColumn = "";
		if (satusOfPain.equals("Yes I had")) {
			if (lastTimePain.equals("10-12 months ago")
					|| lastTimePain.equals("7-9 months ago")
					|| lastTimePain.equals("3-6 months ago")
					|| lastTimePain.equals("7-8 weeks ago")
					|| lastTimePain.equals("5-6 weeks ago")
					|| lastTimePain.equals("3-4 weeks ago")) {
				secondColumn = "In the past year";
			} else if (lastTimePain.equals("1-2 years ago")
					|| lastTimePain.equals("3-5 years ago")) {
				secondColumn = lastTimePain;
			} else if (lastTimePain.equals("More than 5 years ago")) {
				secondColumn = "More than 5 years ago";
			}

		} else if (satusOfPain.equals("Yes I have")) {

			if (firstTimePain.equals("Past year")) {
				secondColumn = "In the past year";
			} else if (firstTimePain.equals("1-2 years ago")
					|| firstTimePain.equals("3-5 years ago")) {
				secondColumn = firstTimePain;
			}

			else if (firstTimePain.equals("More than 5 years ago")) {
				secondColumn = "More than 5 years ago";
			}
		}

		String thirdColumn = "";
		String tcolumn = "";
		int valueThighBack = 0;
		int valueSinCalf = 0;
		int valueFoot = 0;

		String satusOfSitePain = form.getQuestion291().toString();
		String lastTimeSitePain = form.getQuestion292().toString();
		String firstTimeSitePain = form.getQuestion293().toString();
		String thighbackfirst = form.getQuestion294().toString();
		String thighbacksecond = form.getQuestion297().toString();
		String sinCalffirst = form.getQuestion295().toString();
		String sinCalfsecond = form.getQuestion298().toString();
		String footfirst = form.getQuestion296().toString();
		String footsecond = form.getQuestion299().toString();

		String thighbackfirstPast = form.getQuestion309().toString();
		String sinCalffirstPast = form.getQuestion310().toString();
		String foorfirstPast = form.getQuestion311().toString();

		// back of your thigh
		if (satusOfSitePain.equals("Yes I have")) {
			if (thighbackfirst.equals("Past 2 weeks")) {
				valueThighBack = 1;
			} else if (thighbackfirst.equals("3-4 weeks ago")) {
				valueThighBack = 2;
			} else if (thighbackfirst.equals("5-6 weeks ago")) {
				valueThighBack = 3;
			} else if (thighbackfirst.equals("7-8 weeks ago")) {
				valueThighBack = 4;
			} else if (thighbackfirst.equals("3-6 months ago")) {
				valueThighBack = 5;
			} else if (thighbackfirst.equals("10-12 months ago")) {
				valueThighBack = 6;
			} else if (thighbackfirst.equals("1-2 years ago")) {
				valueThighBack = 7;
			} else if (thighbackfirst.equals("3-5 years ago")) {
				valueThighBack = 8;
			} else if (thighbackfirst.equals("More than 5 years ago")) {
				valueThighBack = 9;
			} else if (thighbackfirst.equals("Cannot remember")) {
				valueThighBack = 0;
			}

			if (thighbacksecond.equals("Past year")) {
				valueThighBack = valueThighBack + 1;

			} else if (thighbacksecond.equals("1-2 years ago")) {
				valueThighBack = valueThighBack + 2;
			} else if (thighbacksecond.equals("3-5 years ago")) {
				valueThighBack = valueThighBack + 3;
			} else if (thighbacksecond.equals("More than 5 years ago")) {
				valueThighBack = valueThighBack + 4;
			} else if (thighbacksecond.equals("Cannot remember")) {
				valueThighBack = valueThighBack + 0;
			}

		} else if (satusOfSitePain.equals("Yes I had")) {

			if (thighbackfirstPast.equals("Past 2 weeks")) {
				valueThighBack = 9;
			} else if (thighbackfirstPast.equals("3-4 weeks ago")) {
				valueThighBack = 8;
			} else if (thighbackfirstPast.equals("5-6 weeks ago")) {
				valueThighBack = 7;
			} else if (thighbackfirstPast.equals("7-8 weeks ago")) {
				valueThighBack = 6;
			} else if (thighbackfirstPast.equals("3-6 months ago")) {
				valueThighBack = 5;
			} else if (thighbackfirstPast.equals("10-12 months ago")) {
				valueThighBack = 4;
			} else if (thighbackfirstPast.equals("1-2 years ago")) {
				valueThighBack = 3;
			} else if (thighbackfirstPast.equals("3-5 years ago")) {
				valueThighBack = 2;
			} else if (thighbackfirstPast.equals("More than 5 years ago")) {
				valueThighBack = 1;
			} else if (thighbackfirstPast.equals("Cannot remember")) {
				valueThighBack = 0;
			}

			if (thighbacksecond.equals("Past year")) {
				valueThighBack = valueThighBack + 1;

			} else if (thighbacksecond.equals("1-2 years ago")) {
				valueThighBack = valueThighBack + 2;
			} else if (thighbacksecond.equals("3-5 years ago")) {
				valueThighBack = valueThighBack + 3;
			} else if (thighbacksecond.equals("More than 5 years ago")) {
				valueThighBack = valueThighBack + 4;
			} else if (thighbacksecond.equals("Cannot remember")) {
				valueThighBack = valueThighBack + 0;
			}

		}

		// sin calf question comparison
		if (lastTimeSitePain.equals("Yes I have")) {

			if (sinCalffirst.equals("Past 2 weeks")) {
				valueSinCalf = 1;
			} else if (sinCalffirst.equals("3-4 weeks ago")) {
				valueSinCalf = 2;
			} else if (sinCalffirst.equals("5-6 weeks ago")) {
				valueSinCalf = 3;
			} else if (sinCalffirst.equals("7-8 weeks ago")) {
				valueSinCalf = 4;
			} else if (sinCalffirst.equals("3-6 months ago")) {
				valueSinCalf = 5;
			} else if (sinCalffirst.equals("10-12 months ago")) {
				valueSinCalf = 6;
			} else if (sinCalffirst.equals("1-2 years ago")) {
				valueSinCalf = 7;
			} else if (sinCalffirst.equals("3-5 years ago")) {
				valueSinCalf = 8;
			} else if (sinCalffirst.equals("More than 5 years ago")) {
				valueSinCalf = 9;
			} else if (sinCalffirst.equals("Cannot remember")) {
				valueSinCalf = 0;
			}

			if (sinCalfsecond.equals("Past year")) {
				valueSinCalf = valueSinCalf + 1;

			} else if (sinCalfsecond.equals("1-2 years ago")) {
				valueSinCalf = valueSinCalf + 2;
			} else if (sinCalfsecond.equals("3-5 years ago")) {
				valueSinCalf = valueSinCalf + 3;
			} else if (sinCalfsecond.equals("More than 5 years ago")) {
				valueSinCalf = valueSinCalf + 4;
			} else if (sinCalfsecond.equals("Cannot remember")) {
				valueSinCalf = valueSinCalf + 0;
			}

		} else if (lastTimeSitePain.equals("Yes I had")) {

			if (sinCalffirstPast.equals("Past 2 weeks")) {
				valueSinCalf = 9;
			} else if (sinCalffirstPast.equals("3-4 weeks ago")) {
				valueSinCalf = 8;
			} else if (sinCalffirstPast.equals("5-6 weeks ago")) {
				valueSinCalf = 7;
			} else if (sinCalffirstPast.equals("7-8 weeks ago")) {
				valueSinCalf = 6;
			} else if (sinCalffirstPast.equals("3-6 months ago")) {
				valueSinCalf = 5;
			} else if (sinCalffirstPast.equals("10-12 months ago")) {
				valueSinCalf = 4;
			} else if (sinCalffirstPast.equals("1-2 years ago")) {
				valueSinCalf = 3;
			} else if (sinCalffirstPast.equals("3-5 years ago")) {
				valueSinCalf = 2;
			} else if (sinCalffirstPast.equals("More than 5 years ago")) {
				valueSinCalf = 1;
			} else if (sinCalffirstPast.equals("Cannot remember")) {
				valueSinCalf = 0;
			}

			if (sinCalfsecond.equals("Past year")) {
				valueSinCalf = valueSinCalf + 1;

			} else if (sinCalfsecond.equals("1-2 years ago")) {
				valueSinCalf = valueSinCalf + 2;
			} else if (sinCalfsecond.equals("3-5 years ago")) {
				valueSinCalf = valueSinCalf + 3;
			} else if (sinCalfsecond.equals("More than 5 years ago")) {
				valueSinCalf = valueSinCalf + 4;
			} else if (sinCalfsecond.equals("Cannot remember")) {
				valueSinCalf = valueSinCalf + 0;
			}

		}

		// foot data
		if (firstTimeSitePain.equals("Yes I have")) {
			if (footfirst.equals("Past 2 weeks")) {
				valueFoot = 1;
			} else if (footfirst.equals("3-4 weeks ago")) {
				valueFoot = 2;
			} else if (footfirst.equals("5-6 weeks ago")) {
				valueFoot = 3;
			} else if (footfirst.equals("7-8 weeks ago")) {
				valueFoot = 4;
			} else if (footfirst.equals("3-6 months ago")) {
				valueFoot = 5;
			} else if (footfirst.equals("10-12 months ago")) {
				valueFoot = 6;
			} else if (footfirst.equals("1-2 years ago")) {
				valueFoot = 7;
			} else if (footfirst.equals("3-5 years ago")) {
				valueFoot = 8;
			} else if (footfirst.equals("More than 5 years ago")) {
				valueFoot = 9;
			} else if (footfirst.equals("Cannot remember")) {
				valueFoot = 0;
			}

			if (footsecond.equals("Past year")) {
				valueFoot = valueFoot + 1;

			} else if (footsecond.equals("1-2 years ago")) {
				valueFoot = valueFoot + 2;
			} else if (footsecond.equals("3-5 years ago")) {
				valueFoot = valueFoot + 3;
			} else if (footsecond.equals("More than 5 years ago")) {
				valueFoot = valueFoot + 4;
			} else if (footsecond.equals("Cannot remember")) {
				valueFoot = valueFoot + 0;
			}

		} else if (firstTimeSitePain.equals("Yes I had")) {

			if (foorfirstPast.equals("Past 2 weeks")) {
				valueFoot = 9;
			} else if (foorfirstPast.equals("3-4 weeks ago")) {
				valueFoot = 8;
			} else if (foorfirstPast.equals("5-6 weeks ago")) {
				valueFoot = 7;
			} else if (foorfirstPast.equals("7-8 weeks ago")) {
				valueFoot = 6;
			} else if (foorfirstPast.equals("3-6 months ago")) {
				valueFoot = 5;
			} else if (foorfirstPast.equals("10-12 months ago")) {
				valueFoot = 4;
			} else if (foorfirstPast.equals("1-2 years ago")) {
				valueFoot = 3;
			} else if (foorfirstPast.equals("3-5 years ago")) {
				valueFoot = 2;
			} else if (foorfirstPast.equals("More than 5 years ago")) {
				valueFoot = 1;
			} else if (foorfirstPast.equals("Cannot remember")) {
				valueFoot = 0;
			}

			if (footsecond.equals("Past year")) {
				valueFoot = valueFoot + 1;

			} else if (footsecond.equals("1-2 years ago")) {
				valueFoot = valueFoot + 2;
			} else if (footsecond.equals("3-5 years ago")) {
				valueFoot = valueFoot + 3;
			} else if (footsecond.equals("More than 5 years ago")) {
				valueFoot = valueFoot + 4;
			} else if (footsecond.equals("Cannot remember")) {
				valueFoot = valueFoot + 0;
			}

		}

		if (valueThighBack > valueSinCalf && valueThighBack > valueFoot) {
			if (satusOfSitePain.equals("Yes I have")) {
				thirdColumn = form.getQuestion294().toString();
				firstColumn = "Current";

			} else if (satusOfSitePain.equals("Yes I had")) {
				thirdColumn = form.getQuestion309().toString();
				tcolumn = form.getQuestion309().toString();
				String fcolumnValue = form.getQuestion297().toString();

				if (fcolumnValue.equals("Past year")) {
					firstColumn = "PAST YEAR";
				} else if (fcolumnValue.equals("1-2 years ago")) {
					firstColumn = "1-2 yr ago";
					thirdColumn = "";
				} else if (fcolumnValue.equals("3-5 years ago")) {
					firstColumn = "3-5 yr ago";
					thirdColumn = "";

				} else if (fcolumnValue.equals("More than 5 years ago")) {
					firstColumn = ">5 yr ago";
					thirdColumn = "";
				}

			}

		} else if (valueSinCalf > valueThighBack && valueSinCalf > valueFoot) {

			if (lastTimeSitePain.equals("Yes I have")) {
				thirdColumn = form.getQuestion295().toString();
				firstColumn = "Current";

			} else if (lastTimeSitePain.equals("Yes I had")) {
				thirdColumn = form.getQuestion310().toString();
				tcolumn = form.getQuestion310().toString();
				String fcolumnValue = form.getQuestion298().toString();
				if (fcolumnValue.equals("Past year")) {
					firstColumn = "PAST YEAR";
				} else if (fcolumnValue.equals("1-2 years ago")) {
					firstColumn = "1-2 yr ago";
					thirdColumn = "";

				} else if (fcolumnValue.equals("3-5 years ago")) {
					firstColumn = "3-5 yr ago";
					thirdColumn = "";

				} else if (fcolumnValue.equals("More than 5 years ago")) {
					firstColumn = ">5 yr ago";
					thirdColumn = "";

				}
			}

		} else if (valueFoot > valueThighBack && valueFoot > valueSinCalf) {

			if (firstTimeSitePain.equals("Yes I have")) {
				thirdColumn = form.getQuestion296().toString();
				firstColumn = "Current";
			} else if (firstTimeSitePain.equals("Yes I had")) {
				thirdColumn = form.getQuestion311().toString();
				tcolumn = form.getQuestion311().toString();
				String fcolumnValue = form.getQuestion299().toString();
				if (fcolumnValue.equals("Past year")) {
					firstColumn = "PAST YEAR";
				} else if (fcolumnValue.equals("1-2 years ago")) {
					firstColumn = "1-2 yr ago";
					thirdColumn = "";

				} else if (fcolumnValue.equals("3-5 years ago")) {
					firstColumn = "3-5 yr ago";
					thirdColumn = "";

				} else if (fcolumnValue.equals("More than 5 years ago")) {
					firstColumn = ">5 yr ago";
					thirdColumn = "";
				}
			}

		}

		List historyTable = new ArrayList();
		if (firstColumn.length() != 0 && secondColumn.length() != 0
				&& thirdColumn.length() != 0) {

			historyTable = adminService.getHnpHistoryData(firstColumn,
					secondColumn, thirdColumn);
			model.addAttribute("historyValueHnp", historyTable);
		} else if (thirdColumn.length() == 0) {

			historyTable = adminService.getHnpHistoryValue(firstColumn,
					secondColumn);
			model.addAttribute("historyValueHnp", historyTable);
		}
		

		ClientListing result1 = adminService.getUserSetFlag(client.getClientId());
		System.out.println("result1.getComment1()=="+client1.getComment1());
		model.addAttribute("careComment", result1.getCareComment());
		model.addAttribute("AssesmentFlag", result1.getAssessmentformflag());
		model.addAttribute("loginVal", "login");
		model.addAttribute("fname", result1.getForeName());
		model.addAttribute("lname", result1.getSurName());
		model.addAttribute("comment1", client1.getComment1());
		model.addAttribute("comment2", client1.getComment2());
		model.addAttribute("comment3", client1.getComment3());
		model.addAttribute("comment4", client1.getComment4());
		model.addAttribute("comment5", client1.getComment5());
		
		ClientListing resultVal = adminService.getUserSetFlag(client.getClientId());
		model.addAttribute("setFlag", resultVal.getFormSetFlag());
		setMonitorValue(client, model);
		
		return "finalReport";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/SendMessage")
	public String sendMessage(@ModelAttribute("loggedClient") Client client,
			ModelMap model) {

		ClientDetail clientDetail = clientService.getClientDetail(client);
		ClientForm clientForm = formService.getClientForm(client.getClientId(),
				CalbaAppConstant.ABOUT_YOU_FORM_ID);

		System.out.println("hello1");

		return "SendMessage";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/SendMessage")
	public String SendingMessage(@ModelAttribute("loggedClient") Client client,
			@ModelAttribute("form") @Valid SendMessage form,
			BindingResult result, ModelMap model) throws EmailException,
			MessagingException {

		String message = form.getMessageMail();
		MailReminder mail = new MailReminder();
		mail.sendMessage("shantanu.pandey@otssolutions.com", "Query of user "
				+ client.getUserId() + "", message);
		model.addAttribute("successMessage",
				"Your message has been sent successfully");
		return "SendMessage";

	}

	@RequestMapping(method = RequestMethod.GET, value = "/selfExamine")
	public String selfExamine(@ModelAttribute("loggedClient") Client client,
			ModelMap model) {
		ClientForm clientForm = formService.getClientForm(client.getClientId(),
				CalbaAppConstant.SELF_EXAM_FORM_ID);
		ClientDetail clientDetail = clientService.getClientDetail(client);
		List<HNPTable> questionList = new ArrayList();
		questionList = adminService.getSelfQuestionnaire();

		SelfExamine form = new SelfExamine();

		// Getting form data

		List<ClientListing> formAnswerClient = adminService
				.getSelfExamine(client.getClientId());
		// for showing completed forms functionality
				List<ClientForm> formStatus = formService.getFormStatus(
						client.getClientId(), CalbaAppConstant.ABOUT_YOU_FORM_ID);
				if (formStatus.size() != 0) {
					model.addAttribute("formStatusAboutYou", formStatus.get(0)
							.getState());
				}

				List<ClientForm> formStatus1 = formService.getFormStatus(
						client.getClientId(), CalbaAppConstant.MED_HIST_FORM_ID);
				if (formStatus1.size() != 0) {
					model.addAttribute("formStatusMedicalHistory", formStatus1.get(0)
							.getState());
				}

				List<ClientForm> formStatus2 = formService.getFormStatus(
						client.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
				if (formStatus2.size() != 0) {
					model.addAttribute("formStatusbackPain", formStatus2.get(0)
							.getState());
				}

				List<ClientForm> formStatus3 = formService.getFormStatus(
						client.getClientId(), CalbaAppConstant.BACK_PAIN2_FORM_ID);
				if (formStatus3.size() != 0) {
					model.addAttribute("formStatusbackPain2", formStatus3.get(0)
							.getState());
				}

				List<ClientForm> formStatus4 = formService.getFormStatus(
						client.getClientId(), CalbaAppConstant.SELF_EXAM_FORM_ID);
				if (formStatus4.size() != 0) {
					model.addAttribute("formStatusSelfExam", formStatus4.get(0)
							.getState());
				}
				List<ClientForm> formStatus5= formService.getFormStatus(client.getClientId(), CalbaAppConstant.DISABILITY_FORM_ID);
				if(formStatus5.size() != 0){
					if(client.getDisabilityFormUpdate()==1){
						System.out.println("here come=="+client.getDisabilityFormUpdate());
//						ClientForm clientForm1=new ClientForm();
//						clientForm1.setClientId(client.getClientId());
//						clientForm1.setFormId(CalbaAppConstant.DISABILITY_FORM_ID);
//						clientForm1.setState(CalbaAppConstant.STATE_COMPLETED);
//						clientFormMapper.insert(clientForm1);
						model.addAttribute("formStatusDisability",CalbaAppConstant.STATE_COMPLETED);
						model.addAttribute("status", client.getDisabilityFormUpdate());
						disabililityState=CalbaAppConstant.STATE_COMPLETED;
					}
					else{				
						model.addAttribute("formStatusDisability",formStatus5.get(0).getState());
						model.addAttribute("status", null);
						disabililityState=formStatus5.get(0).getState();
					}
				}
				// End for showing completed forms functionality
		System.out.println("formquestion client valuess.."
				+ formAnswerClient.size() + "form update==="
				+ client.getDisabilityFormUpdate());

		/*
		 * form.setClientId(client.getClientId());
		 * FormUtil.setBaseForm(formAnswerClient, form);
		 * form.setClientId(client.getClientId());
		 */

		if (formAnswerClient.size() == 0) {
			form.setQuestion1("0");
			form.setQuestion2("0");
			form.setQuestion3("0");
			form.setQuestion4("0");
			form.setQuestion5("0");
			form.setQuestion6("0");
			form.setQuestion7("0");
			form.setQuestion8("0");
			form.setQuestion9("0");
			form.setQuestion10("0");
			form.setQuestion11("0");
			form.setQuestion12("0");
			form.setQuestion13("0");
			form.setQuestion14("0");
			form.setQuestion15("0");
			form.setQuestion16("0");
			form.setQuestion17("0");
			form.setQuestion18("0");
			form.setQuestion19("0");
			form.setQuestion20("0");
			form.setQuestion21("0");
			form.setQuestion22("0");
			form.setQuestion23("0");
			form.setQuestion24("0");
			
			

		} if (client.getDisabilityFormUpdate() == 0) {
			form.setQuestion1("0");
			form.setQuestion2("0");
			form.setQuestion3("0");
			form.setQuestion4("0");
			form.setQuestion5("0");
			form.setQuestion6("0");
			form.setQuestion7("0");
			form.setQuestion8("0");
			form.setQuestion9("0");
			form.setQuestion10("0");
			form.setQuestion11("0");
			form.setQuestion12("0");
			form.setQuestion13("0");
			form.setQuestion14("0");
			form.setQuestion15("0");
			form.setQuestion16("0");
			form.setQuestion17("0");
			form.setQuestion18("0");
			form.setQuestion19("0");
			form.setQuestion20("0");
			form.setQuestion21("0");
			form.setQuestion22("0");
			form.setQuestion23("0");
			form.setQuestion24("0");

		}else {

			for (int i = 0; i < formAnswerClient.size(); i++) {
				Map m = (Map) formAnswerClient.get(i);
//				System.out.println("values inside the map questionid..."
//						+ m.get("questionid"));
//				System.out.println("values inside the map score..."
//						+ m.get("score"));
				if (i == 0) {
					form.setQuestion1(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion1(true);
					}
						else{
							form.setIsquestion1(false);
						}
				} else if (i == 1) {
					form.setQuestion2(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion2(true);
					}
						else{
							form.setIsquestion2(false);
						}
				} else if (i == 2) {
					form.setQuestion3(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion3(true);
					}
						else{
							form.setIsquestion3(false);
						}
				} else if (i == 3) {
					form.setQuestion4(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion4(true);
					}
						else{
							form.setIsquestion4(false);
						}
				} else if (i == 4) {
					form.setQuestion5(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion5(true);
					}
						else{
							form.setIsquestion5(false);
						}
				} else if (i == 5) {
					form.setQuestion6(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion6(true);
					}
						else{
							form.setIsquestion6(false);
						}
				} else if (i == 6) {
					form.setQuestion7(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion7(true);
					}
						else{
							form.setIsquestion7(false);
						}
				} else if (i == 7) {
					form.setQuestion8(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion8(true);
					}
						else{
							form.setIsquestion8(false);
						}
				} else if (i == 8) {
					form.setQuestion9(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion9(true);
					}
						else{
							form.setIsquestion9(false);
						}
				} else if (i == 9) {
					form.setQuestion10(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion10(true);
					}
						else{
							form.setIsquestion10(false);
						}
				} else if (i == 10) {
					form.setQuestion11(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion11(true);
					}
						else{
							form.setIsquestion11(false);
						}
				} else if (i == 11) {
					form.setQuestion12(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion12(true);
					}
						else{
							form.setIsquestion12(false);
						}
				} else if (i == 12) {
					form.setQuestion13(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion13(true);
					}
						else{
							form.setIsquestion13(false);
						}
				} else if (i == 13) {
					form.setQuestion14(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion14(true);
					}
						else{
							form.setIsquestion14(false);
						}
				} else if (i == 14) {
					form.setQuestion15(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion15(true);
					}
						else{
							form.setIsquestion15(false);
						}
				} else if (i == 15) {
					form.setQuestion16(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion16(true);
					}
						else{
							form.setIsquestion16(false);
						}
				} else if (i == 16) {
					form.setQuestion17(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion17(true);
					}
						else{
							form.setIsquestion17(false);
						}
				} else if (i == 17) {
					form.setQuestion18(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion18(true);
					}
						else{
							form.setIsquestion18(false);
						}
				} else if (i == 18) {
					form.setQuestion19(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion19(true);
					}
						else{
							form.setIsquestion19(false);
						}
				} else if (i == 19) {
					form.setQuestion20(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion20(true);
					}
						else{
							form.setIsquestion20(false);
						}
				} else if (i == 20) {
					form.setQuestion21(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion21(true);
					}
						else{
							form.setIsquestion21(false);
						}
				} else if (i == 21) {
					form.setQuestion22(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion22(true);
					}
						else{
							form.setIsquestion22(false);
						}
				} else if (i == 22) {
					form.setQuestion23(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion23(true);
					}
						else{
							form.setIsquestion23(false);
						}
				} else if (i == 23) {
					form.setQuestion24(m.get("score").toString());
					if(m.get("score").toString().equals("1")){
						form.setIsquestion24(true);
					}
						else{
							form.setIsquestion24(false);
						}
				}
			}

		}

		// End getting form data

		model.addAttribute("questionList", questionList);

		// model.addAttribute("form", formQuesClient);

		model.addAttribute("status1", client.getDisabilityFormUpdate());
		model.addAttribute("form", form);
		ClientListing result1 = adminService.getUserSetFlag(client.getClientId());
		model.addAttribute("AssesmentFlag", result1.getAssessmentformflag());
		
		System.out.println("form.." + form.getQuestion1() + "..end");
		System.out.println("hi3333.." + questionList + "..end");
		model.addAttribute("error");
		
		ClientListing resultVal = adminService.getUserSetFlag(client.getClientId());
		model.addAttribute("setFlag", resultVal.getFormSetFlag());
		setMonitorValue(client, model);

		
		return "selfExamine";

	}

	@RequestMapping(method = RequestMethod.POST, value = "/selfExamine")
	public String selfExamineForm(
			@ModelAttribute("loggedClient") Client client,
			@ModelAttribute("form") @Valid SelfExamine form,
			BindingResult result, ModelMap model) throws EmailException,
			MessagingException {
		String returnPage="selfExamine";
		
		if (result.hasErrors()) {
			model.addAttribute("error", "Please provide required data.");
		} else {
			ClientForm clientForm = formService.updateClientForm(
					client.getClientId(), CalbaAppConstant.DISABILITY_FORM_ID);
		
			formService.addClientState(client.getClientId(),
					CalbaAppConstant.DISABILITY_FORM_ID, client);
		}
		List<HNPTable> questionList = new ArrayList();
		questionList = adminService.getSelfQuestionnaire();
		int sizeList = questionList.size();
		adminService.insertSelfExamineAnswer(form, client.getClientId(),
				sizeList);
		adminService.setUpdateStatus(client.getClientId(),1);
		client.setDisabilityFormUpdate(1);
		model.addAttribute("questionList", questionList);
		model.addAttribute("form", form);
		System.out.println("score.." + form.isIsquestion1() + "..end");
		model.addAttribute("status1", client.getDisabilityFormUpdate());
		System.out.println("hiii enter......" + client.getClientId());
		// for showing completed forms functionality
		List<ClientForm> formStatus = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.ABOUT_YOU_FORM_ID);
//		if (formStatus.size() != 0) {
//			model.addAttribute("formStatusAboutYou", formStatus.get(0)
//					.getState());
//		}
		String state="";
//		try{
//					
//					if(client.getSex().equals("")){	
						if(formStatus.size() != 0){
							state=formStatus.get(0).getState();
						model.addAttribute("formStatusAboutYou",formStatus.get(0).getState());
					}
//					}else{
//						System.out.println("in else");
//						state="Completed";
//						model.addAttribute("formStatusAboutYou","Completed");
//					
//					
//				}
//				}
//				catch(Exception e)
//				{System.out.println("in catch");
//				state=formStatus.get(0).getState();
//					model.addAttribute("formStatusAboutYou",formStatus.get(0).getState());
//			
//				}

		List<ClientForm> formStatus1 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.MED_HIST_FORM_ID);
		if (formStatus1.size() != 0) {
			model.addAttribute("formStatusMedicalHistory", formStatus1.get(0)
					.getState());
		}

		List<ClientForm> formStatus2 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
		if (formStatus2.size() != 0) {
			model.addAttribute("formStatusbackPain", formStatus2.get(0)
					.getState());
		}

		List<ClientForm> formStatus3 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.BACK_PAIN2_FORM_ID);
		if (formStatus3.size() != 0) {
			model.addAttribute("formStatusbackPain2", formStatus3.get(0)
					.getState());
		}

		List<ClientForm> formStatus4 = formService.getFormStatus(
				client.getClientId(), CalbaAppConstant.SELF_EXAM_FORM_ID);
		if (formStatus4.size() != 0) {
			model.addAttribute("formStatusSelfExam", formStatus4.get(0)
					.getState());
		}
		List<ClientForm> formStatus5= formService.getFormStatus(client.getClientId(), CalbaAppConstant.DISABILITY_FORM_ID);
		if(formStatus5.size() != 0){
			if(client.getDisabilityFormUpdate()==1){
				System.out.println("here come=="+client.getDisabilityFormUpdate());
//				ClientForm clientForm1=new ClientForm();
//				clientForm1.setClientId(client.getClientId());
//				clientForm1.setFormId(CalbaAppConstant.DISABILITY_FORM_ID);
//				clientForm1.setState(CalbaAppConstant.STATE_COMPLETED);
//				clientFormMapper.insert(clientForm1);
				model.addAttribute("formStatusDisability",CalbaAppConstant.STATE_COMPLETED);
				model.addAttribute("status", client.getDisabilityFormUpdate());
				disabililityState=CalbaAppConstant.STATE_COMPLETED;
			}
			else{				
				model.addAttribute("formStatusDisability",formStatus5.get(0).getState());
				model.addAttribute("status", null);
				disabililityState=formStatus5.get(0).getState();
			}
		}

		int count=0;
		try{
		if( state.equals("Completed")){
			count++;
		}if( formStatus1.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus2.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus3.get(0)
				.getState().equals("Completed")){
			count++;
		}if( formStatus4.get(0)
				.getState().equals("Completed")){
			count++;
			
		}
		}catch(Exception e){
			
		}

		if ( state.equals("Completed") && formStatus1.get(0).getState().equals("Completed")
				&& formStatus2.get(0).getState().equals("Completed") && formStatus3.get(0).getState().equals("Completed")
				&& formStatus4.get(0).getState().equals("Completed") && disabililityState.equals("Completed")) {
			client.setClientStateId(4);
			model.addAttribute(
					"message",
					"You have successfully completed all the forms.  See message in left hand panel for further instructions");
			MailReminder mail = new MailReminder();
			ClientListing clientListing = adminService.getClientListingById(client.getClientId());
			List<ClientListing> clientEmail = adminService.getUserEmail(client.getClientId().toString());
			Map m = (Map) clientEmail.get(0);
			Set s=m.entrySet();
			String email="";
			
			returnPage="welcome";
			model.addAttribute("AssesmentFlag", 0);
			model.addAttribute("loginVal", "login");

			
			Iterator i=s.iterator();
					while(i.hasNext()){
					    Map.Entry mp= (Map.Entry) i.next();
					    email=mp.getValue().toString();
//					    System.out.println(""+mp.getKey()+""+ mp.getValue());
					}
			mail.sendMessage(
					"monro.robin11@gmail.com",
					clientListing.getUserId(),"\n\n<html><br><br><b>"+ clientListing.getForeName()
							+ " "+ clientListing.getSurName()
							+ "</b> has just completed the forms and is awaiting the assessment report</center></html>");
			mail.sendMessage(email,
					clientListing.getUserId(),"\n\n<html><br><br><p> This is to confirm that you have successfully completed the forms for the assessment of your low back pain and you will receive a report on the results, along with advice, within two working days.</p></html>");
		}
		else{
//			model.addAttribute(
//					"message",
//					"This form is now complete but you still need to finish one or more of the other forms (see left hand panel)");
			model.addAttribute(
					"message",
					"You have successfully completed all the forms.  See message in left hand panel for further instructions");

		}
		model.addAttribute("error","error");
		setMonitorValue(client, model);
		// End for showing completed forms functionality
		return returnPage;

	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/donation")
	public String donation(@ModelAttribute("loggedClient") Client client,
			ModelMap model) {

		return "donation";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/extensionReport")
	public String extensionReport(@ModelAttribute("loggedClient") Client client,
			ModelMap model) {

		ClientListing result1 = adminService.getUserSetFlag(client.getClientId());
		System.out.println("hi in AssesmentFlag/////"+result1.getEmailAddress());
		model.addAttribute("AssesmentFlag", result1.getAssessmentformflag());
		
		return "reportExtension";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/assignMonitoringForm")
	public String assignMonitoringForm(@ModelAttribute("loggedClient") Client client,
			ModelMap model) throws EmailException, MessagingException {
   
		ClientListing result1 = adminService.getUserSetFlag(client.getClientId());
		ClientListing clientListing = adminService.getClientListingById(client.getClientId());
		MailReminder mail = new MailReminder();
		mail.sendMessage(
				"monro.robin11@gmail.com",
				clientListing.getUserId(),"\n\n<html><br><br><b>"+ clientListing.getForeName()
						+ " "+ clientListing.getSurName()
						+ "</b>has just registered for Monitoring.  Please assign monitoring ASAP</center></html>");
		model.addAttribute("AssesmentFlag", result1.getAssessmentformflag());
		model.addAttribute("monitoringMessage","Yes");
		return "rightPannel";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/monitoringReport")
	public String monitoringReport(@ModelAttribute("loggedClient") Client clientVal,
			ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			
			int clientId= clientVal.getClientId();

			List<MoniterListing> listMoniter = adminService
					.getListMoniter(clientId);
			ClientListing client = adminService.getClientListingById(clientId);
			model.addAttribute("client", client);
			
			ClientListing result1 = adminService.getUserSetFlag(client.getClientId());
			model.addAttribute("setFlag", result1.getFormSetFlag());
			model.addAttribute("AssesmentFlag", result1.getAssessmentformflag());


			model.addAttribute("listMoniter", listMoniter);
			String sameDayData = "";
			int painColumn = 0;
			for (int i = 0; i < listMoniter.size(); i++) {
				Map<?, ?> m1 = (Map<?, ?>) listMoniter.get(0);
				Map<?, ?> m = (Map<?, ?>) listMoniter.get(i);

				if (sameDayData.equals("") || (sameDayData.length() == 0)) {
					sameDayData = m1.get("formsubmitdate").toString();
				}

				if (sameDayData.equals(m.get("formsubmitdate").toString())) {

					String questionid = m.get("questionid").toString();
					int setid = (Integer) m.get("setid");

					if (setid == 1) {
						if (m.get("questionid").toString().equals("466")) {

						} else if (m.get("questionid").toString().equals("467")) {

						} else if (m.get("questionid").toString().equals("468")) {

						}

					}

					else if (setid == 2) {

					}

					else if (setid == 3) {

					}

				}

				else {
					sameDayData = m.get("formsubmitdate").toString();

				}

			}
			setMonitorValue(clientVal, model);

			return "userMonitoringReport";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return "welcome";
		}
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/furtherProceed")
	public String furtherProceed(@ModelAttribute("loggedClient") Client client,
			ModelMap model) throws EmailException, MessagingException {
		
		ClientListing result1 = adminService.getUserSetFlag(client.getClientId());
	
		model.addAttribute("AssesmentFlag", result1.getAssessmentformflag());
		model.addAttribute("monitoringMessage","Yes");
		return "furtherProceed";
	}
	
	public void setMonitorValue(Client client,ModelMap model){
		
		List<ClientListing> result = adminService.getUserListing();
		List<HNPTable> flagsValue = null;

		int questionId = client.getClientId();
		Integer qID = (Integer) questionId;
		int flag = 0;
		int setForm = 0;
		for (int i = 0; i < result.size(); i++) {

			if (qID.equals(result.get(i).getClientId())) {

				model.addAttribute("setFormVal", result.get(i).getSetForm());
				model.addAttribute("setFlagWeekly", result.get(i).getFormSetFlag());
				flag = result.get(i).getFormSetFlag();
				setForm = result.get(i).getSetForm();
				flagsValue = adminService.getFlagValue(setForm, questionId);
				model.addAttribute("flagsValue", flagsValue);

			}

		}

		
	}


}
