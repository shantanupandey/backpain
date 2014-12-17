package net.calba.backpain.controller;

import java.io.IOException;
import java.io.Writer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import net.calba.backpain.CalbaAppConstant;
import static net.calba.backpain.CalbaAppConstant.*;
import net.calba.backpain.Util;
import net.calba.backpain.dao.mybatis.ClientFormMapper;
import net.calba.backpain.exception.CalbaAppServiceException;
import net.calba.backpain.form.AboutYouForm;
import net.calba.backpain.form.BackPain2Form;
import net.calba.backpain.form.BackPainForm;
import net.calba.backpain.form.ClientRegisterForm;
import net.calba.backpain.form.FormUtil;
import net.calba.backpain.form.LoginForm;
import net.calba.backpain.form.MedicalHistoryForm;
import net.calba.backpain.form.SelfExaminationForm;
import net.calba.backpain.model.CategoryList;
import net.calba.backpain.model.Client;
import net.calba.backpain.model.ClientDetail;
import net.calba.backpain.model.ClientForm;
import net.calba.backpain.model.ClientListing;
import net.calba.backpain.model.ClientListingResult;
import net.calba.backpain.model.DisabilityReportInfo;
import net.calba.backpain.model.FormQuestionClient;
import net.calba.backpain.model.HNPLOOKUP;
import net.calba.backpain.model.HNPTable;
import net.calba.backpain.model.HeightUnits;
import net.calba.backpain.model.HistoryFactor;
import net.calba.backpain.model.MoniterListing;
import net.calba.backpain.model.MonitoringFormsEdit;
import net.calba.backpain.model.Question;
import net.calba.backpain.model.QuestionAnswer;
import net.calba.backpain.model.QuestionAnswerExample;
import net.calba.backpain.model.QuestionGroup;
import net.calba.backpain.model.QuestionScore;
import net.calba.backpain.model.Report;
import net.calba.backpain.model.SearchCriteria;
import net.calba.backpain.model.SelfExamine;
import net.calba.backpain.model.WeightUnits;
import net.calba.backpain.service.AdminService;
import net.calba.backpain.service.CalbaService;
import net.calba.backpain.service.ClientService;
import net.calba.backpain.service.FormService;
import net.calba.backpain.model.QuestionAnswer;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import reminder.MailReminder;

@Controller
@RequestMapping("/admin")
@SessionAttributes(CalbaAppConstant.LOGGED_CLIENT)
public class AdminController {

	private static final Logger LOGGER = Logger
			.getLogger(AdminController.class);

	@Autowired
	private AdminService adminService;

	@Autowired
	private ClientService clientService;
	@Autowired
	private ClientFormMapper clientFormMapper;
	@Resource
	private FormService formService;

	@Resource
	private CalbaService calbaService;

	private List<HeightUnits> heightUnits;

	private List<WeightUnits> weightUnits;

	@PostConstruct
	public final void init() {
		heightUnits = calbaService.getHeightUnits();
		weightUnits = calbaService.getWeightUnits();
	}

	@RequestMapping(method = RequestMethod.GET, value = "/welcome")
	public String welcome(@ModelAttribute("loggedClient") Client client,
			ModelMap model) {
		LOGGER.debug("admin welcome : " + client);

		return "admin/adminWelcome";
	}

	/**
	 * Handle GET request of User Listing.
	 * 
	 * @param model
	 *            ModelMap
	 * @return String value of view
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/userListing")
	public String handleRequest(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {

		HttpSession session = request.getSession();

		SearchCriteria criteria = new SearchCriteria();
		model.addAttribute("criteria", criteria);
		model.addAttribute("searchCrieteriaVal",
				session.getAttribute("searchValue"));

		if (session.getAttribute("searchValue") != null) {
			criteria.setSortBy(Integer.parseInt(session.getAttribute(
					"searchValue").toString()));
		}
		try {
			ClientListingResult result = adminService
					.getClientListing(criteria);
			
			model.addAttribute("result", result);
//			System.out.println("result=="+result.toString());
			return "admin/userListing";
		} catch (Exception e) {

			LOGGER.error("error : ", e);
			return "admin/adminWelcome";
		}
	}

	/**
	 * 
	 * @param sortBy
	 *            Integer value
	 * @param pageId
	 * @param model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/userListing")
	public String handleRequest(@RequestParam Integer sortBy,@RequestParam String searchValue,
			@RequestParam Integer pageId, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();

		LOGGER.debug("SortBy value : " + sortBy + "  PageId : " + pageId);
//		SearchCriteria criteria = new SearchCriteria(sortBy, pageId);
		SearchCriteria criteria = new SearchCriteria(sortBy, pageId,searchValue);
		System.out.println("@RequestParam SearchValue " + criteria.getSearchValue());
		model.addAttribute("criteria", criteria);

		session.setAttribute("searchValue", criteria.getSortBy());
		model.addAttribute("searchCrieteriaVal",
				session.getAttribute("searchValue"));

		try {if(!searchValue.equals("")){
			ClientListingResult result = adminService
					.getClientListingByUsername(criteria);
			criteria.setSearchValue("");
			model.addAttribute("result", result);
		}
		else{ClientListingResult result = adminService
					.getClientListing(criteria);
			model.addAttribute("result", result);
		}
			return "admin/userListing";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return "admin/adminWelcome";
		}
	}

	// Added by shantanu
	/**
	 * Handle GET request of User Listing.
	 * 
	 * @param model
	 *            ModelMap
	 * @return String value of view
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/updateScore")
	public String updateScore(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws ParseException, IOException {

		return "admin/updateScore";

	}

	@RequestMapping(method = RequestMethod.GET, value = "/getUser")
	public String getUser(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws ParseException, IOException {
		HttpSession session = request.getSession();

		Writer out = response.getWriter();
		StringBuilder data = new StringBuilder();
		response.setHeader("Cache-Control", "no-cache");
		response.setContentType("text/html");

		// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String selectedData = request.getParameter("selectedDate");

		if (selectedData != null && !selectedData.isEmpty()) {

			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MMM-dd");
			Date varDate = dateFormat.parse(selectedData);
			dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date parsed = format.parse(dateFormat.format(varDate));
			java.sql.Date sql = new java.sql.Date(parsed.getTime());

			// Tue Feb 25 00:00:00

			List<ClientListing> result = adminService.getUserListing(sql);

			if (result.size() != 0) {
				data.append("<select id='user' name='user' style='width: 155px;height: 24px;'>");
				for (int i = 0; i < result.size(); i++) {
					data.append("<option value='" + result.get(i).getClientId()
							+ "'>" + result.get(i).getUserId() + "</option>");
				}
				data.append("</select><br><input type='submit' value='Dry Run' onClick='dryRun();'>");
			} else {
				data.append("<p><font color='red' size='3px'>No Result Found</font></p>");
			}

			out.write(data.toString());

		}
		return null;

	}

	@RequestMapping(method = RequestMethod.GET, value = "/updateReport")
	public String updateReport(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws ParseException, IOException {
		Writer out = response.getWriter();
		StringBuilder data = new StringBuilder();
		response.setHeader("Cache-Control", "no-cache");
		response.setContentType("text/html");

		String userId = request.getParameter("userId");

		adminService.updateReport(userId);

		data.append("<p>Updated Succesfully.</p>");

		out.write(data.toString());
		return null;

	}

	// End added by shantanu

	/**
	 * Handle GET request of Client report Listing.
	 * 
	 * @param model
	 *            ModelMap
	 * @return String value of view
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/recordReportList")
	public String handleRequest(@PathVariable Integer clientId, ModelMap model) {

		try {

			ClientListing client = adminService.getClientListingById(clientId);
			model.addAttribute("client", client);
			model.addAttribute("message", "");
			return "admin/recordReportList";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return handleRequest(model, null, null);
		}
	}

	/**
	 * Handle GET request of Client report List.
	 * 
	 * @param model
	 *            ModelMap
	 * @return String value of view
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/reportList")
	public String reportList(@PathVariable Integer clientId, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) {

		try {

			HttpSession session = request.getSession();
			ClientListing client = adminService.getClientListingById(clientId);
			model.addAttribute("client", client);
			return "admin/reportList";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return handleRequest(model, request, response);
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/aboutYou")
	public String aboutYou(@PathVariable Integer clientId, ModelMap model) {
		try {
			Client client = clientService.getClientById(clientId);
			ClientDetail clientDetail = clientService.getClientDetail(client);
			ClientForm clientForm = formService.getClientForm(
					client.getClientId(), CalbaAppConstant.ABOUT_YOU_FORM_ID);

			List<FormQuestionClient> formQuesClient = formService
					.getFormQuestionClient(clientForm.getClientFormId());

			AboutYouForm form = FormUtil.getAboutYouForm(clientDetail,
					formQuesClient, clientForm.getClientFormId());
			form.setClientId(clientId);
			form.setHeightUnits(heightUnits);
			form.setWeightUnits(weightUnits);
			model.addAttribute("form", form);
			clientListing(model, form.getClientId());
			return "aboutYou";
		} catch (CalbaAppServiceException e) {
			LOGGER.error("error : ", e);
			model.addAttribute("error", e.getMessage());
			return "admin/adminWelcome";
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/aboutYou")
	public String aboutYou(@ModelAttribute("form") @Valid AboutYouForm form,
			BindingResult result, ModelMap model) {

		if (Util.formatDate(form.getDateOfBirth()) == null) {
			result.reject("dateOfBirth",
					"Enter Date of birth in format (dd/MM/yyyy).");
		}

		if (result.hasErrors()) {
			model.addAttribute("error", "Please provide required data.");
			model.addAttribute("form", form);
			clientListing(model, form.getClientId());
			return "aboutYou";
		} else {
			Client client = new Client(form.getClientId());
			ClientForm clientForm = formService.getClientForm(
					client.getClientId(), CalbaAppConstant.ABOUT_YOU_FORM_ID);
			formService.addClientState(client.getClientId(),
					CalbaAppConstant.ABOUT_YOU_FORM_ID, client);
			ClientDetail clientDetail = clientService.getClientDetail(client);
			FormUtil.updateClientDetail(clientDetail, form);
			List<FormQuestionClient> formQuesClient = FormUtil
					.getFormQuestionClients(form);

			clientService.updateClientDetail(clientDetail);
			formService.addFormQuestionClient(formQuesClient,
					form.getClientFormId());
			model.addAttribute("message",
					"About You has been updated successfully.");
			return handleRequest(form.getClientId(), model);
		}

	}

	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/medicalHistory")
	public String medicalHistory(@PathVariable Integer clientId, ModelMap model) {
		try {

			Client client = clientService.getClientById(clientId);
			ClientForm clientForm = formService.getClientForm(
					client.getClientId(), CalbaAppConstant.MED_HIST_FORM_ID);

			List<FormQuestionClient> formQuesClient = formService
					.getFormQuestionClient(clientForm.getClientFormId());

			MedicalHistoryForm form = new MedicalHistoryForm(
					clientForm.getClientFormId());
			FormUtil.setBaseForm(formQuesClient, form);
			form.setClientId(clientId);
			clientListing(model, form.getClientId());
			model.addAttribute("form", form);
			return "medicalHistory";
		} catch (CalbaAppServiceException e) {
			LOGGER.error("error : ", e);
			model.addAttribute("error", e.getMessage());
			return "admin/adminWelcome";
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/medicalHistory")
	public String medicalHistorySumbit(
			@ModelAttribute("form") @Valid MedicalHistoryForm form,
			BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			model.addAttribute("error", "Please provide required data.");
			model.addAttribute("form", form);
			clientListing(model, form.getClientId());
			return "medicalHistory";
		} else {
			Client client = new Client(form.getClientId());
			formService.addClientState(client.getClientId(),
					CalbaAppConstant.MED_HIST_FORM_ID, client);
			ClientForm clientForm = formService.getClientForm(
					form.getClientId(), CalbaAppConstant.MED_HIST_FORM_ID);
			List<FormQuestionClient> formQuesClient = FormUtil
					.getFormQuestionClients(form);

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
			model.addAttribute("message",
					"Medical history has been updated successfully.");
			return handleRequest(form.getClientId(), model);
		}

	}

	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/backPain")
	public String backPain(@PathVariable Integer clientId, ModelMap model) {
		try {
			Client client = clientService.getClientById(clientId);
			ClientForm clientForm = formService.getClientForm(
					client.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);

			List<FormQuestionClient> formQuesClient = formService
					.getFormQuestionClient(clientForm.getClientFormId());

			BackPainForm form = new BackPainForm(clientForm.getClientFormId());

			FormUtil.setBaseForm(formQuesClient, form);

			form.setClientId(clientId);
			model.addAttribute("form", form);

			clientListing(model, form.getClientId());

			return "backPain";
		} catch (CalbaAppServiceException e) {
			LOGGER.error("error : ", e);
			model.addAttribute("error", e.getMessage());
			return "admin/adminWelcome";
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/backPain")
	public String backPain(@ModelAttribute("form") @Valid BackPainForm form,
			BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			
			

			model.addAttribute("error", "Please provide required data.");
			model.addAttribute("form", form);
			clientListing(model, form.getClientId());
			return "backPain";
		} else {

			ClientForm clientForm = formService.getClientForm(
					form.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
			List<FormQuestionClient> formQuesClient = FormUtil
					.getFormQuestionClients(form);

			Client client = new Client(form.getClientId());
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
					String val2 = formQuesClient.get(i).getQuestionId()
							.toString();

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
			model.addAttribute("message",
					"About Back Pain(1) has been updated successfully.");
			return handleRequest(form.getClientId(), model);
		}

	}

	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/backPain2")
	public String backPain2(@PathVariable Integer clientId, ModelMap model) {
		try {
			Client client = clientService.getClientById(clientId);
			ClientForm clientForm = formService.getClientForm(
					client.getClientId(), CalbaAppConstant.BACK_PAIN2_FORM_ID);
			List<FormQuestionClient> formQuesClient = formService
					.getFormQuestionClient(clientForm.getClientFormId());
			BackPain2Form form = new BackPain2Form(clientForm.getClientFormId());
			FormUtil.setBaseForm(formQuesClient, form);
			form.setClientId(clientId);
			model.addAttribute("form", form);
			clientListing(model, form.getClientId());
			return "backPain2";
		} catch (CalbaAppServiceException e) {
			LOGGER.error("error : ", e);
			model.addAttribute("error", e.getMessage());

			return "admin/adminWelcome";
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/backPain2")
	public String backPain2(@ModelAttribute("form") @Valid BackPain2Form form,
			BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			model.addAttribute("error", "Please provide required data.");
			model.addAttribute("form", form);
			clientListing(model, form.getClientId());
			return "backPain2";
		} else {
			ClientForm clientForm = formService.getClientForm(
					form.getClientId(), CalbaAppConstant.BACK_PAIN2_FORM_ID);
			Client client = new Client(form.getClientId());
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

			model.addAttribute("message",
					"About Back Pain(2) has been updated successfully.");
			return handleRequest(form.getClientId(), model);
		}

	}

	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/selfExam")
	public String selfExamination(@PathVariable Integer clientId, ModelMap model) {
		try {
			Client client = clientService.getClientById(clientId);
			ClientForm clientForm = formService.getClientForm(
					client.getClientId(), CalbaAppConstant.SELF_EXAM_FORM_ID);
			List<FormQuestionClient> formQuesClient = formService
					.getFormQuestionClient(clientForm.getClientFormId());
			SelfExaminationForm form = new SelfExaminationForm(
					clientForm.getClientFormId());
			FormUtil.setBaseForm(formQuesClient, form);
			form.setClientId(clientId);
			model.addAttribute("form", form);
			clientListing(model, form.getClientId());
			return "selfExam";
		} catch (CalbaAppServiceException e) {
			LOGGER.error("error : ", e);
			model.addAttribute("error", e.getMessage());
			return "admin/adminWelcome";
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/selfExam")
	public String selfExamination(
			@ModelAttribute("form") @Valid SelfExaminationForm form,
			BindingResult result, ModelMap model) {
		System.out.println("inside self exam=="+form.getClientId());
		if (result.hasErrors()) {
			model.addAttribute("error", "Please provide required data.");
			model.addAttribute("form", form);
			clientListing(model, form.getClientId());
			return "selfExam";
		} else {
			List<FormQuestionClient> formQuesClient = FormUtil
					.getFormQuestionClients(form);

			Client client = new Client(form.getClientId());
			formService.addClientState(client.getClientId(),
					CalbaAppConstant.SELF_EXAM_FORM_ID, client);

			// test

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
			// end test

			formService.addFormQuestionClient(formQuesClient,
					form.getClientFormId());
			model.addAttribute("message",
					"Self Examination has been updated successfully.");
			return handleRequest(form.getClientId(), model);
		}

	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/selfExamine")
	public String selfExamine(@PathVariable Integer clientId, ModelMap model) {		
		try {
			Client client = clientService.getClientById(clientId);
			ClientForm clientForm = formService.getClientForm(
					client.getClientId(), CalbaAppConstant.DISABILITY_FORM_ID);
			ClientDetail clientDetail = clientService.getClientDetail(client);
			List<HNPTable> questionList = new ArrayList<HNPTable>();
			questionList = adminService.getSelfQuestionnaire();

//			SelfExamine form = new SelfExamine();
			SelfExamine form = new SelfExamine(
					clientForm.getClientFormId());
			// Getting form data
			List<FormQuestionClient> formQuesClient = formService
					.getFormQuestionClient(clientForm.getClientFormId());
		
			List<ClientListing> formAnswerClient = adminService
					.getSelfExamine(clientId);
						
			form.setClientId(clientId);
			System.out.println("clientid=="+clientId);
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
				
				

//			} if (client.getDisabilityFormUpdate() == 0) {
//				form.setQuestion1("0");
//				form.setQuestion2("0");
//				form.setQuestion3("0");
//				form.setQuestion4("0");
//				form.setQuestion5("0");
//				form.setQuestion6("0");
//				form.setQuestion7("0");
//				form.setQuestion8("0");
//				form.setQuestion9("0");
//				form.setQuestion10("0");
//				form.setQuestion11("0");
//				form.setQuestion12("0");
//				form.setQuestion13("0");
//				form.setQuestion14("0");
//				form.setQuestion15("0");
//				form.setQuestion16("0");
//				form.setQuestion17("0");
//				form.setQuestion18("0");
//				form.setQuestion19("0");
//				form.setQuestion20("0");
//				form.setQuestion21("0");
//				form.setQuestion22("0");
//				form.setQuestion23("0");
//				form.setQuestion24("0");

			}else {

				for (int i = 0; i < formAnswerClient.size(); i++) {
					Map<?, ?> m = (Map<?, ?>) formAnswerClient.get(i);
//					System.out.println("values inside the map questionid..."
//							+ m.get("questionid"));
//					System.out.println("values inside the map score..."
//							+ m.get("score"));
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
			FormUtil.setBaseForm(formQuesClient, form);
//			model.addAttribute("status", "0");
			model.addAttribute("questionList", questionList);
			model.addAttribute("form", form);
			
			clientListing(model, form.getClientId());
			return "selfExamine";
		} catch (CalbaAppServiceException e) {
			LOGGER.error("error : ", e);
			model.addAttribute("error", e.getMessage());
			return "admin/adminWelcome";
		}
		
	}

	@RequestMapping(method = RequestMethod.POST, value = "/selfExamine")
	public String selfExamine(
			@ModelAttribute("form") @Valid  SelfExamine form,
			BindingResult result, ModelMap model) throws EmailException,
			MessagingException {
		System.out.println("inside diasbility=="+form.getClientId());
		if (result.hasErrors()) {
			model.addAttribute("error", "Please provide required data.");
			model.addAttribute("form", form);
			clientListing(model, form.getClientId());
			return "selfExamine";
		} else {
//			List<FormQuestionClient> formQuesClient = FormUtil
//					.getFormQuestionClients(form);
//			ClientForm clientForm = formService.updateClientForm(
//					form.getClientId(), CalbaAppConstant.DISABILITY_FORM_ID);
			Client client = new Client(form.getClientId());
			formService.addClientState(client.getClientId(),
					CalbaAppConstant.DISABILITY_FORM_ID, client);
		}
		List<HNPTable> questionList = new ArrayList<HNPTable>();
		questionList = adminService.getSelfQuestionnaire();
		int sizeList = questionList.size();
		adminService.insertSelfExamineAnswer(form, form.getClientId(),
				sizeList);
		adminService.setUpdateStatus(form.getClientId(),1);
//		client.setDisabilityFormUpdate(1);
		model.addAttribute("questionList", questionList);
		model.addAttribute("form", form);
		System.out.println("score.." + form.isIsquestion1() + "..end");
//		model.addAttribute("status", form.getDisabilityFormUpdate());
		System.out.println("hiii enter......" + form.getClientId());
		model.addAttribute("message",
				"Disability has been updated successfully.");
		return handleRequest(form.getClientId(), model);
	

	}

	/**
	 * Handle POST request of Question List.
	 * 
	 * @param model
	 *            ModelMap
	 * @return String value of view
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/{reportId}/questionListing")
	public String questionListing(@PathVariable Integer reportId,
			@RequestParam Integer pageId, ModelMap model) {

		try {

			model.addAttribute("reportId", reportId);
			pageId = (pageId == null || pageId == 0 ? 1 : pageId);

			List<Question> questionListing = adminService
					.getQuestionListing(pageId);

			model.addAttribute("pageId", pageId);
			model.addAttribute("questionListing", questionListing);
			
			return "admin/questionListing";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return "admin/adminWelcome";
		}
	}

	/**
	 * Handle GET request of Report Question List.
	 * 
	 * @param model
	 *            ModelMap
	 * @return String value of view
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/{reportId}/questionListing")
	public String questionListing(@PathVariable Integer reportId, ModelMap model) {
		try {

			Report report = adminService.getReportQuestionListing(reportId);

			model.addAttribute("report", report);

			return "admin/questionListing";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return "admin/adminWelcome";
		}

	}

	/**
	 * Handle GET request of Question.
	 * 
	 * @param model
	 *            ModelMap
	 * @return String value of view
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/{questionId}/question")
	public String question(@PathVariable Integer questionId, ModelMap model) {
		try {
			Question form = adminService.getQuestionById(questionId);

			model.addAttribute("form", form);
			return "admin/question";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return questionListing(Util.DEFAULT_PAGE, model);
		}
	}

	/**
	 * Handle POST request of Question.
	 * 
	 * @param model
	 *            ModelMap
	 * @return String value of view
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/question")
	public String question(@ModelAttribute("form") Question form, ModelMap model) {
		try {
			Question question = adminService.getQuestionById(form
					.getQuestionId());

			/* Remove for setting min max scores */
			/*
			 * question.setMinScore(form.getMinScore());
			 * question.setMaxScore(form.getMaxScore());
			 * question.setQuestionText(form.getQuestionText());
			 */

			/* Remove code to update only scores */
			question.setMaxScore(form.getMaxScore());
			question.setQuestionText(form.getQuestionText());
			/* End Remove code to update only scores */

			adminService.saveQuestion(question);

			QuestionGroup questionGroup = adminService
					.getQuestionGroup(question.getQuestionGroupId());

			return "redirect:/admin/" + questionGroup.getReportId()
					+ "/questionListing.html";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			model.addAttribute("error", e.getMessage());
			return "admin/question";

		}

	}

	/**
	 * Handle GET request of Client report List.
	 * 
	 * @param model
	 *            ModelMap
	 * @return String value of view
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/nonRadScore")
	public String nonRadScore(@PathVariable Integer clientId, ModelMap model) {

		try {
			Report report = adminService
					.getReportQuestionListing(REPORT_NON_RADICULAR);

			ClientListing client = adminService.getClientListingById(clientId);
			Map<String, Integer> clientScore = adminService
					.getClientReportScore(clientId, REPORT_NON_RADICULAR);
			Map<String, Integer> scoreText = adminService.getClientScoreAnswer(
					clientId, REPORT_NON_RADICULAR);

			model.addAttribute("report", report);
			model.addAttribute("clientScore", clientScore);
			model.addAttribute("clientAnswer", scoreText);
			model.addAttribute("client", client);
			return "admin/nonRadScore";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			e.printStackTrace();
			return handleRequest(model, null, null);
		}
	}

	/**
	 * Handle GET request of Client report List.
	 * 
	 * @param model
	 *            ModelMap
	 * @return String value of view
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/radSScore")
	public String radSScore(@PathVariable Integer clientId, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) {

		try {
			System.out.println("inside the rad score method");
			adminService.updateNullValue();
			Report report1 = adminService
					.getReportQuestionListing(REPORT_TOT_RADICULAR);
			Report report = adminService
					.getReportQuestionListing(REPORT_PAIN_ANALYSIS);

			ClientListing client = adminService.getClientListingById(clientId);
			model.addAttribute("client", client);

			// Data for dermotome tables
			Map<String, Integer> clientScore = adminService
					.getClientReportScore(clientId, REPORT_PAIN_ANALYSIS);

			Map<String, Integer> scoreText = adminService.getClientScoreAnswer(
					clientId, REPORT_PAIN_ANALYSIS);
			// End data for dermotome tables

			Map<String, Integer> clientScore1 = adminService
					.getClientReportScore(clientId, REPORT_TOT_RADICULAR);
			Map<String, Integer> scoreText1 = adminService
					.getClientScoreAnswer(clientId, REPORT_TOT_RADICULAR);

			model.addAttribute("report1", report1);
			model.addAttribute("clientScore1", clientScore1);
			model.addAttribute("clientAnswer1", scoreText1);

			model.addAttribute("report", report);
			model.addAttribute("clientScore", clientScore);
			model.addAttribute("clientAnswer", scoreText);

			model.addAttribute("client", client);

			return "admin/radSScore";

		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return handleRequest(model, request, response);
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/painAnalysisScore")
	public String painAnalysisScore(@PathVariable Integer clientId,
			ModelMap model) {

		try {

			Report report = adminService
					.getReportQuestionListing(REPORT_PAIN_ANALYSIS);

			ClientListing client = adminService.getClientListingById(clientId);
			model.addAttribute("client", client);

			adminService.updateNullValue();
			Map<String, Integer> clientScore = adminService
					.getClientReportScore(clientId, REPORT_PAIN_ANALYSIS);
			Map<String, Integer> scoreText = adminService.getClientScoreAnswer(
					clientId, REPORT_PAIN_ANALYSIS);
			
			
			for(int i=0;i<report.getQuestionGroups().size();i++){
				System.out.println("check thisss,,"+i+",,>>"+report.getQuestionGroups().get(i).getDescription());
				if(i==0){
					report.getQuestionGroups().get(0).setDescription("Buttocks (numbness)");
				}else if(i==1){
					report.getQuestionGroups().get(1).setDescription("Back of thigh (numbness)");
				}else if(i==2){
					report.getQuestionGroups().get(2).setDescription("Shin or calf (numbness)");
				}else if(i==3){
					report.getQuestionGroups().get(3).setDescription("Foot (numbness)");
				}
			}

			model.addAttribute("report", report);
			model.addAttribute("clientScore", clientScore);
			model.addAttribute("clientAnswer", scoreText);
			model.addAttribute("client", client);

			return "admin/painAnalysisScore";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return handleRequest(model, null, null);
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/selfExamScore")
	public String selfExamScore(@PathVariable Integer clientId, ModelMap model) {

		try {
			Report report = adminService
					.getReportQuestionListing(REPORT_SELF_EXAMINATION);
			model.addAttribute("report", report);
			ClientListing client = adminService.getClientListingById(clientId);

			model.addAttribute("client", client);
			return "admin/selfExamScore";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return handleRequest(model, null, null);
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/hnpPhases")
	public String hnpPhases(@PathVariable Integer clientId, ModelMap model,HttpServletRequest request,
			HttpServletResponse response) {

		try {

			 
	       
	        
	        
			adminService.updateNullValue();
			Report report = adminService
					.getReportQuestionListing(REPORT_HNP_PHASES);

			Report report1 = adminService
					.getReportQuestionListing(REPORT_NON_RADICULAR);

			// All rad values
			Report report2 = adminService
					.getReportQuestionListing(REPORT_TOT_RADICULAR);
			Report report3 = adminService
					.getReportQuestionListing(REPORT_PAIN_ANALYSIS);

			Map<String, Integer> clientScore1 = adminService
					.getClientReportScore(clientId, REPORT_TOT_RADICULAR);
			Map<String, Integer> scoreText1 = adminService
					.getClientScoreAnswer(clientId, REPORT_TOT_RADICULAR);

			// Data for dermotome tables
			Map<String, Integer> clientScore2 = adminService
					.getClientReportScore(clientId, REPORT_PAIN_ANALYSIS);
			Map<String, Integer> scoreText2 = adminService
					.getClientScoreAnswer(clientId, REPORT_PAIN_ANALYSIS);
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

			ClientListing client = adminService.getClientListingById(clientId);

			List<HNPTable> myList = new ArrayList<HNPTable>();

			myList = adminService.getHnpTableData();

			// Non rad score
			Map<String, Integer> clientScore = adminService
					.getClientReportScore(clientId, REPORT_NON_RADICULAR);
			Map<String, Integer> scoreText = adminService.getClientScoreAnswer(
					clientId, REPORT_NON_RADICULAR);

			model.addAttribute("clientScore", clientScore);
			model.addAttribute("clientAnswer", scoreText);
			// End non rad score

			model.addAttribute("client", client);
			model.addAttribute("hnpPhaseValue", myList);

			// Code for the question listing of backpain
			ClientForm clientForm = formService.getClientForm(
					client.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
			List<FormQuestionClient> formQuesClient = formService
					.getFormQuestionClient(clientForm.getClientFormId());
			BackPainForm form = new BackPainForm(clientForm.getClientFormId());
			FormUtil.setBaseForm(formQuesClient, form);
			model.addAttribute("formHnp", form);

			String satusOfPain = form.getQuestion32().toString();
			String lastTimePain = form.getQuestion39().toString();
			String firstTimePain = form.getQuestion40().toString();

			String firstColumn = ""; 
			String secondColumn = "";
			
		/*	firstColumn=form.getQuestion293().toString();
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
			}*/

			String thirdColumn = "";
			String fourthColumn = "";
			String tcolumn = "";
			int valueThighBack = 0;
			int valueSinCalf = 0;
			int valueFoot = 0;

		/*	String satusOfSitePain = form.getQuestion291().toString();
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
				} else if (thighbackfirst.equals("5-8 weeks ago")) {
					valueThighBack = 3;
				} else if (thighbackfirst.equals("9-12 weeks ago")) {
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
				} else if (thighbackfirstPast.equals("5-8 weeks ago")) {
					valueThighBack = 7;
				} else if (thighbackfirstPast.equals("9-12 weeks ago")) {
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
				} else if (sinCalffirst.equals("5-8 weeks ago")) {
					valueSinCalf = 3;
				} else if (sinCalffirst.equals("9-12 weeks ago")) {
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
				} else if (sinCalffirstPast.equals("5-8 weeks ago")) {
					valueSinCalf = 7;
				} else if (sinCalffirstPast.equals("9-12 weeks ago")) {
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
				} else if (footfirst.equals("5-8 weeks ago")) {
					valueFoot = 3;
				} else if (footfirst.equals("9-12 weeks ago")) {
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
				} else if (foorfirstPast.equals("5-8 weeks ago")) {
					valueFoot = 7;
				} else if (foorfirstPast.equals("9-12 weeks ago")) {
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

			} else if (valueSinCalf > valueThighBack
					&& valueSinCalf > valueFoot) {

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

			}*/
			
			/*Start New calculation of HNP phases*/
			    String recent=request.getParameter("recent").toString();
		        String firstPain=request.getParameter("firstPain").toString();
		        String current=request.getParameter("current").toString();
		        String lowBack=request.getParameter("lowBack").toString();
		        String val293=request.getParameter("val293").toString();
		        String currentFoot=request.getParameter("currentFoot").toString();
		        String footCurrentPain=request.getParameter("footCurrentPain").toString();
		        System.out.println("value of currentFoot currentFoot........."+footCurrentPain);
		      /*  
		        if(val293.equals("Yes I have")){
		        	firstColumn="Current Year";
		        }else if(val293.equals("Yes I had")){
		        	firstColumn="Past Year";
		        }*/
		        
		        if(footCurrentPain.equals("0")){
		        	System.out.println("value is 0 in foot");
		        	firstColumn="Current";
		        }else{
		        	System.out.println("value is not current in foot"+recent);
		        	if(footCurrentPain.equals("2")){
		        		firstColumn="PAST YEAR";
			        }else if(footCurrentPain.equals("4")){
			        	firstColumn="PAST YEAR";
			        }if(footCurrentPain.equals("8")){
			        	firstColumn="PAST YEAR";
			        }if(footCurrentPain.equals("12")){
			        	firstColumn="PAST YEAR";
			        }if(footCurrentPain.equals("13")){
			        	firstColumn="PAST YEAR";
			        }if(footCurrentPain.equals("26")){
			        	firstColumn="PAST YEAR";
			        }if(footCurrentPain.equals("40")){
			        	firstColumn="PAST YEAR";
			        }if(footCurrentPain.equals("53")){
			        	firstColumn="1-2 yr ago";
			        }if(footCurrentPain.equals("105")){
			        	firstColumn="3-5 yr ago";
			        }if(footCurrentPain.equals("260")){
			        	firstColumn=">5 yr ago";
			        }
		        }
		        
		        
		        
		        
		        if(lowBack.equals("1")){
		        	secondColumn="In the past year";
		        }else if(lowBack.equals("2")){
		        	secondColumn="1-2 years ago";
		        }else if(lowBack.equals("5")){
		        	secondColumn="3-5 years ago";	
		        }else if(lowBack.equals(">5")){
		        	secondColumn="More than 5 years ago";	
		        }
		        
		        if(currentFoot.length() != 0){
		        if(currentFoot.equals("2")){
		        	thirdColumn="Within past 2 weeks";
		        }else if(currentFoot.equals("4")){
		        	thirdColumn="3-4 weeks ago";
		        }if(currentFoot.equals("8")){
		        	thirdColumn="5-8 weeks ago";
		        }if(currentFoot.equals("12")){
		        	thirdColumn="9-12 weeks ago";
		        }if(currentFoot.equals("13")){
		        	thirdColumn="3-6 months ago";
		        }if(currentFoot.equals("26")){
		        	thirdColumn="7-9 months ago";
		        }if(currentFoot.equals("40")){
		        	thirdColumn="10-12 months ago";
		        }if(currentFoot.equals("53")){
		        	thirdColumn="1-2 years ago";
		        }if(currentFoot.equals("105")){
		        	thirdColumn="3-5 years ago";
		        }if(currentFoot.equals("260")){
		        	thirdColumn=">5 years ago";
		        }
		        
		        }
		        else{
		        	if(recent.equals("0")){
		        		if(current.equals("2")){
				        	thirdColumn="Within past 2 weeks";
				        }else if(current.equals("4")){
				        	thirdColumn="3-4 weeks ago";
				        }if(current.equals("8")){
				        	thirdColumn="5-8 weeks ago";
				        }if(current.equals("12")){
				        	thirdColumn="9-12 weeks ago";
				        }if(current.equals("13")){
				        	thirdColumn="3-6 months ago";
				        }if(current.equals("26")){
				        	thirdColumn="7-9 months ago";
				        }if(current.equals("40")){
				        	thirdColumn="10-12 months ago";
				        }if(current.equals("53")){
				        	thirdColumn="1-2 years ago";
				        }if(current.equals("105")){
				        	thirdColumn="3-5 years ago";
				        }if(current.equals("260")){
				        	thirdColumn=">5 years ago";
				        }
		        	}
		        	else if(recent.equals("2")){
			        	thirdColumn="Within past 2 weeks";
			        }else if(recent.equals("4")){
			        	thirdColumn="3-4 weeks ago";
			        }if(recent.equals("8")){
			        	thirdColumn="5-8 weeks ago";
			        }if(recent.equals("12")){
			        	thirdColumn="9-12 weeks ago";
			        }if(recent.equals("13")){
			        	thirdColumn="3-6 months ago";
			        }if(recent.equals("26")){
			        	thirdColumn="7-9 months ago";
			        }if(recent.equals("40")){
			        	thirdColumn="10-12 months ago";
			        }if(recent.equals("53")){
			        	thirdColumn="1-2 years ago";
			        }if(recent.equals("105")){
			        	thirdColumn="3-5 years ago";
			        }if(recent.equals("260")){
			        	thirdColumn=">5 years ago";
			        }
		        }
		        
		      
		        if(firstPain.equals("1")){
		        	fourthColumn="Past year";
		        }else if(firstPain.equals("2")){
		        	fourthColumn="1-2 yr ago";
		        }else if(firstPain.equals("5")){
		        	fourthColumn="3-5 yr ago";	
		        }else if(firstPain.equals(">5")){
		        	fourthColumn=">5 yr ago";	
		        }
		        
		      System.out.println("values of all columns::::"+firstColumn+"2>"+secondColumn+"3>"+thirdColumn+"4>"+fourthColumn);
		      
		      List<?> historyTable = new ArrayList<Object>();
		      if(firstColumn.equals("Current")){
		    	  
		    	  historyTable = adminService.getHnpHistoryData(firstColumn,secondColumn, thirdColumn);
					model.addAttribute("historyValueHnp", historyTable);
		    	  System.out.println("value import is 1st column, 2nd column and 3rd column");
		    	  
		      }else if(firstColumn.equals("PAST YEAR")){
		    	  
		    	  historyTable = adminService.getHnpHistoryData(firstColumn,secondColumn, thirdColumn);
					model.addAttribute("historyValueHnp", historyTable);
		    	  System.out.println("value import is 1st column, 2nd column and 3rd column");
		    	  
		      }else if(firstColumn.equals("1-2 yr ago")||firstColumn.equals("3-5 yr ago")||firstColumn.equals(">5 yr ago")){
		    	  
		    	  historyTable = adminService.getHnpHistoryValue(firstColumn,secondColumn);
					model.addAttribute("historyValueHnp", historyTable);
		    	  System.out.println("value import is 1st column, 2nd column");
		      }
		        
		    /*End New calculation of HNP phases*/

			/* Old calculation for history factor*/			
			/*if (firstColumn.length() != 0 && secondColumn.length() != 0
					&& thirdColumn.length() != 0) {

				historyTable = adminService.getHnpHistoryData(firstColumn,
						secondColumn, thirdColumn);
				model.addAttribute("historyValueHnp", historyTable);
			} else if (thirdColumn.length() == 0) {

				historyTable = adminService.getHnpHistoryValue(firstColumn,
						secondColumn);
				model.addAttribute("historyValueHnp", historyTable);
			}*/
		      
		    /*End Old calculation for history factor*/

			// End code for question listing backpain
			

			return "admin/hnpPhases";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return handleRequest(model, null, null);
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/cancerScore")
	public String cancerScore(@PathVariable Integer clientId, ModelMap model) {

		try {
			Report report = adminService
					.getReportQuestionListing(REPORT_CANCER);
			model.addAttribute("report", report);
			ClientListing client = adminService.getClientListingById(clientId);
			model.addAttribute("client", client);
			return "admin/cancerScore";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return handleRequest(model, null, null);
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/ccsScore")
	public String ccsScore(@PathVariable Integer clientId, ModelMap model) {

		try {

			adminService.updateNullValue();

			Report report = adminService.getReportQuestionListing(REPORT_CCS);

			ClientListing client = adminService.getClientListingById(clientId);
			Map<String, Integer> clientScore = adminService
					.getClientReportScore(clientId, REPORT_CCS);
			Map<String, Integer> scoreText = adminService.getClientScoreAnswer(
					clientId, REPORT_CCS);

			model.addAttribute("report", report);
			model.addAttribute("clientScore", clientScore);
			model.addAttribute("clientAnswer", scoreText);
			model.addAttribute("client", client);

			model.addAttribute("report", report);

			model.addAttribute("client", client);
			return "admin/ccsScore";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return handleRequest(model, null, null);
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/finalReport")
	public String finalReport(@PathVariable Integer clientId, ModelMap model) {

		try {
			ClientListing client = adminService.getClientListingById(clientId);
			model.addAttribute("client", client);
			System.out.println("chceck the report...");
			return "admin/finalReport";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return handleRequest(model, null, null);
		}
	}

	// End hnp edit section
	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/hnpLookupPhase")
	public String hnpLookup(@PathVariable Integer clientId, ModelMap model) {
		try {

			List<HNPTable> myList = new ArrayList<HNPTable>();

			myList = adminService.getHnpTableData();
			model.addAttribute("HNPPhase", myList);
			return "admin/hnpLookupEdit";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return handleRequest(model, null, null);
		}

	}

	@RequestMapping(method = RequestMethod.GET, value = "/{questionId}/hnpLookupValue")
	public String hnpLookupEdit(@PathVariable Integer questionId, ModelMap model) {
		try {

			List<HNPTable> myListhnp = new ArrayList<HNPTable>();
			myListhnp = adminService.getHNPValue(questionId);

			model.addAttribute("form", myListhnp);
			return "admin/hnpFactorEdit";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return questionListing(Util.DEFAULT_PAGE, model);
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/hnpLookupValue")
	public String hnpLookupValue(@ModelAttribute("form") HNPLOOKUP form,
			ModelMap model) {
		try {

			adminService.updateHNPLookup(form.getId(), form.getAcute(),
					form.getEarly(), form.getEarly_mid(), form.getLate_mid(),
					form.getLate(), form.getRecovered(), form.getChronic(),
					form.getConsult());

			return "redirect:/admin/" + 8 + "/hnpLookupPhase.html";

		} catch (Exception e) {
			LOGGER.error("error : ", e);
			model.addAttribute("error", e.getMessage());
			return "admin/question";

		}

	}

	// hnp edit section

	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/hnpPhaseHistory")
	public String hnpPhaseHistory(@PathVariable Integer clientId, ModelMap model) {

		try {
			ClientListing client = adminService.getClientListingById(clientId);
			model.addAttribute("client", client);

			List<HNPTable> myListCurrent = new ArrayList<HNPTable>();
			List<HNPTable> myListPast = new ArrayList<HNPTable>();
			List<HNPTable> myList1to2year = new ArrayList<HNPTable>();
			List<HNPTable> myList3to5year = new ArrayList<HNPTable>();
			List<HNPTable> myList5year = new ArrayList<HNPTable>();

			myListCurrent = adminService.getHnpHistoryTableData();
			myListPast = adminService.getHnpHistoryPastData();
			myList1to2year = adminService.getHnpHistory1to2year();

			myList3to5year = adminService.getHnpHistory3to5year();
			myList5year = adminService.getHnpHistory5year();

			model.addAttribute("threeYearListVal", myList3to5year);
			model.addAttribute("fiveYearListVal", myList5year);

			model.addAttribute("twoYearListVal", myList1to2year);
			model.addAttribute("pastListVal", myListPast);
			model.addAttribute("currentListVal", myListCurrent);

			return "admin/hnpHistory";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return handleRequest(model, null, null);
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{questionId}/historyFactor")
	public String historyFactor(@PathVariable Integer questionId, ModelMap model) {
		try {

			List<HNPTable> myListhistoryFactor = new ArrayList<HNPTable>();
			myListhistoryFactor = adminService.gethistoryFactor(questionId);

			model.addAttribute("form", myListhistoryFactor);
			return "admin/historyFactorEdit";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return questionListing(Util.DEFAULT_PAGE, model);
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/historyFactor")
	public String historyFactor(@ModelAttribute("form") HistoryFactor form,
			ModelMap model) {
		try {

			adminService.updateHnpFactors(form.getCode(), form.getAcute(),
					form.getEarly(), form.getEarly_mid(), form.getLate_mid(),
					form.getLate(), form.getRecovered(), form.getDd1(),
					form.getDd2());

			return "redirect:/admin/" + 5 + "/hnpPhaseHistory.html";

		} catch (Exception e) {
			LOGGER.error("error : ", e);
			model.addAttribute("error", e.getMessage());
			return "admin/question";

		}

	}

	@RequestMapping(method = RequestMethod.GET, value = "/monitoringForms")
	public String monitoringForms(ModelMap model) {
		try {

			return "admin/monitoringForms";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return questionListing(Util.DEFAULT_PAGE, model);
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/monitorSet")
	public String monitorSet(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		try {

			int param = Integer.parseInt(request.getParameter("param"));

			List<HNPTable> questionList = new ArrayList<HNPTable>();
			questionList = adminService.getSetForms(param);

			model.addAttribute("form", questionList);
			return "admin/monitorSet";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return questionListing(Util.DEFAULT_PAGE, model);
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{questionId}/monitoringSystem")
	public String monitoringSystem(@PathVariable Integer questionId,
			ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		try {

			List<ClientListing> result = adminService.getUserListing();

			for (int i = 0; i < result.size(); i++) {
				if (questionId.equals(result.get(i).getClientId())) {

					model.addAttribute("setVal", result.get(i).getSetForm());
				}
			}
			model.addAttribute("resultVal", result);
			model.addAttribute("clientId", questionId);
			return "admin/monitoringSystem";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return questionListing(Util.DEFAULT_PAGE, model);
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/monitoringReport")
	public String monitoringReport(@PathVariable Integer clientId,
			ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		try {

			List<MoniterListing> listMoniter = adminService
					.getListMoniter(clientId);
			ClientListing client = adminService.getClientListingById(clientId);
			model.addAttribute("client", client);

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

			return "admin/monitoringReport";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return questionListing(Util.DEFAULT_PAGE, model);
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/monitoringFormsEdit")
	public String monitoringFormsEdit(@PathVariable Integer clientId,
			ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			List<ClientListing> result = adminService.getUserListing();

			int flag = 0;
			for (int i = 0; i < result.size(); i++) {

				if (clientId.equals(result.get(i).getClientId())) {

					model.addAttribute("setFormVal", result.get(i).getSetForm());
					model.addAttribute("setFlag", result.get(i)
							.getFormSetFlag());
					flag = result.get(i).getSetForm();
					List<HNPTable> questionList = new ArrayList<HNPTable>();
					List<HNPTable> listVal = new ArrayList<HNPTable>();
					questionList = adminService.getSetForms(flag);
					listVal = adminService.getFlagValue(flag, clientId);

					model.addAttribute("listVal", listVal);

					model.addAttribute("form", questionList);
				}

			}

			return "admin/monitoringFormsEdit";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return questionListing(Util.DEFAULT_PAGE, model);
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/{clientId}/monitoringFormsEdit")
	public String monitoringFormsEdit(@PathVariable Integer clientId,
			@ModelAttribute("form") MonitoringFormsEdit form, ModelMap model) {
		try {

			List<ClientListing> result = adminService.getUserListing();
			int flag = 0;
			int setForm = 0;
			for (int i = 0; i < result.size(); i++) {

				if (clientId.equals(result.get(i).getClientId())) {

					model.addAttribute("setFormVal", result.get(i).getSetForm());
					model.addAttribute("setFlag", result.get(i)
							.getFormSetFlag());
					flag = result.get(i).getSetForm();
					List<HNPTable> questionList = new ArrayList<HNPTable>();
					questionList = adminService.getSetForms(flag);

					model.addAttribute("form", questionList);
				}

			}

			int staus1 = 0;
			int staus2 = 0;
			int staus3 = 0;
			int staus4 = 0;
			int staus5 = 0;
			int staus6 = 0;
			int staus7 = 0;
			int staus8 = 0;
			int staus9 = 0;
			int staus10 = 0;
			int staus11 = 0;
			int staus12 = 0;
			int staus13 = 0;
			int staus14 = 0;
			int staus15 = 0;
			int staus16 = 0;

			if (form.getStatus1() != null) {

				staus1 = 1;
			}

			if (form.getStatus2() != null) {

				staus2 = 1;
			}

			if (form.getStatus3() != null) {

				staus3 = 1;
			}

			if (form.getStatus4() != null) {

				staus4 = 1;
			}

			if (form.getStatus5() != null) {

				staus5 = 1;
			}

			if (form.getStatus6() != null) {

				staus6 = 1;
			}

			if (form.getStatus7() != null) {

				staus7 = 1;
			}
			if (form.getStatus8() != null) {

				staus8 = 1;
			}

			if (form.getStatus9() != null) {

				staus9 = 1;
			}
			if (form.getStatus10() != null) {

				staus10 = 1;
			}
			if (form.getStatus11() != null) {

				staus11 = 1;
			}
			if (form.getStatus12() != null) {

				staus12 = 1;
			}
			if (form.getStatus13() != null) {

				staus13 = 1;
			}
			if (form.getStatus14() != null) {

				staus14 = 1;
			}
			if (form.getStatus15() != null) {

				staus15 = 1;
			}
			if (form.getStatus16() != null) {

				staus16 = 1;
			}

			adminService.updateFormValue(staus1, staus2, staus3, staus4,
					staus5, staus6, staus7, staus8, staus9, form, clientId,
					flag);

			List<HNPTable> listVal = new ArrayList<HNPTable>();
			listVal = adminService.getFlagValue(flag, clientId);
			model.addAttribute("listVal", listVal);

			model.addAttribute("message", "successfully Updated");
			return "admin/monitoringFormsEdit";

		} catch (Exception e) {
			LOGGER.error("error : ", e);
			model.addAttribute("error", e.getMessage());
			return "admin/question";

		}

	}

	@RequestMapping(method = RequestMethod.GET, value = "/{questionId}/assignFormValues")
	public String assignForm(@PathVariable Integer questionId, ModelMap model,
			HttpServletRequest request, HttpServletResponse response)
			throws ParseException, IOException, EmailException,
			MessagingException {

		Writer out = response.getWriter();
		StringBuilder data = new StringBuilder();
		response.setHeader("Cache-Control", "no-cache");
		response.setContentType("text/html");
		String userId = request.getParameter("userId");
		int formSet = Integer.parseInt(request.getParameter("formSet"));

		adminService.updateClientForSet(userId, formSet);
		adminService.updateClientSetFlag(questionId.toString(), 0);

		ClientListing clientListing = adminService
				.getClientListingById(questionId);

		MailReminder mail = new MailReminder();

		List<ClientListing> clientEmail = adminService.getUserEmail(questionId
				.toString());

		String assignedForm = "";

		if (formSet == 1) {

			assignedForm = "Daily Monitoring form";

		} else if (formSet == 2) {
			assignedForm = "Weekly Monitoring form";

		} else if (formSet == 3) {
			assignedForm = "Fortnightly Monitoring form";

		}

		Map<?, ?> m = (Map<?, ?>) clientEmail.get(0);

		mail.sendMessage(
				m.get("emailaddress").toString(),
				"Monitoring Form assinment",
				"Hello "
						+ clientListing.getForeName()
						+ " "
						+ clientListing.getSurName()
						+ ",\n\n<html><br><br><center><b>Activation of your "
						+ assignedForm
						+ " </b></center><p>You can now start monitoring your condition.  Go to www.calba.net, log into your account (with your User name and Password) and in the left hand panel Click on 'Monitoring System' and then on 'Update'. The form is very simple and takes less than 5 minutes to complete.</p><p>You will receive a fresh form early every morning, ready for you to complete at some time during the day. Try to get into a routine of completing it at roughly the same time each day.</p> <p>You will be able to see an updated rerecord of your entries at any time by clicking on 'Monitoring System' then on 'Report'.</p>With best wishes,<br>CALBA Team</html>");

		data.append("<p>Updated Succesfully.</p>");

		out.write(data.toString());
		return null;

	}
	


		@RequestMapping(method = RequestMethod.GET, value = "/{questionId}/assesSystem")
		public String assessSystem(@PathVariable Integer questionId,
				ModelMap model, HttpServletRequest request,
				HttpServletResponse response) {
			try {

				System.out.println("client id==" + request.getParameter("userId"));
				List<ClientListing> result = adminService.getUserListing();
				ClientListing resultSet=adminService.getUserSetFlag(questionId);

				// for (int i = 0; i < result.size(); i++) {
				// if (questionId.equals(result.get(i).getClientId())) {
				//
				// model.addAttribute("setVal", result.get(i).getSetForm());
				// }
				// }
		

				model.addAttribute("comment1",resultSet.getComment1());
				model.addAttribute("comment2",resultSet.getComment2());
				model.addAttribute("comment3",resultSet.getComment3());
				model.addAttribute("comment4",resultSet.getComment4());
				model.addAttribute("comment5",resultSet.getComment5());

				
				model.addAttribute("userId", request.getParameter("userId"));
				model.addAttribute("fname", request.getParameter("fname"));
				model.addAttribute("lname", request.getParameter("lname"));
				model.addAttribute("resultVal", result);
				model.addAttribute("clientId", questionId);
				return "admin/assessmentSystem";
			} catch (Exception e) {
				LOGGER.error("error : ", e);
				return questionListing(Util.DEFAULT_PAGE, model);
			}
		}
		
	@RequestMapping(method = RequestMethod.GET, value = "/{questionId}/disabilitySystem")
	public String disabilitySystem(@PathVariable Integer questionId,
			ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("client id==" + request.getParameter("userId"));
			List<ClientListing> result = adminService.getUserListing();

			// for (int i = 0; i < result.size(); i++) {
			// if (questionId.equals(result.get(i).getClientId())) {
			//
			// model.addAttribute("setVal", result.get(i).getSetForm());
			// }
			// }
			model.addAttribute("userId", request.getParameter("userId"));
			model.addAttribute("resultVal", result);
			model.addAttribute("clientId", questionId);
			return "admin/disabilitySystem";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return questionListing(Util.DEFAULT_PAGE, model);
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{questionId}/assignDisabilityFormValues")
	public String assignDisabilityForm(@PathVariable Integer questionId,
			ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws ParseException, IOException,
			EmailException, MessagingException {
		Writer out = response.getWriter();
		String userId = request.getParameter("userId");
//		System.out.println("userId ==" + request.getParameter("userId"));
		adminService.setUpdateStatusByUID(userId);
		ClientForm clientForm=new ClientForm();
		clientForm.setClientId(questionId);
		clientForm.setFormId(CalbaAppConstant.DISABILITY_FORM_ID);
		clientForm.setState(CalbaAppConstant.ACTIVE);
		adminService.setUpdateStatus(questionId,0);
		clientForm = formService.getClientForm(
				questionId, CalbaAppConstant.DISABILITY_FORM_ID);
		
		out.write("<p>Updated Succesfully.</p>");
		return null;

	}
	
	
	@RequestMapping(method = RequestMethod.GET, value = "/{questionId}/assignAssessmentFormValues")
	public String assignAssessmentValues(@PathVariable Integer questionId,
			ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws ParseException, IOException,
			EmailException, MessagingException {
		Writer out = response.getWriter();
		String userId = request.getParameter("userId");
		String comments = request.getParameter("comments");
		String comment1 = request.getParameter("comment1");
		String comment2 = request.getParameter("comment2");
		String comment3 = request.getParameter("comment3");
		String comment4 = request.getParameter("comment4");
		String comment5 = request.getParameter("comment5");
		
		System.out.println("value of comment 1"+comment1);
		System.out.println("value of comment 2"+comment2);
		System.out.println("value of comment 3"+comment3);
		System.out.println("value of comment 4"+comment4);
		System.out.println("value of comment 5"+comment5);
		
		ClientListing nclient=new ClientListing();
		nclient.setComment1(comment1);
		nclient.setComment2(comment2);
		nclient.setComment3(comment3);
		nclient.setComment4(comment4);
		nclient.setComment5(comment5);
		
		System.out.println("userId ==" + request.getParameter("userId"));
		System.out.println("value of comments."+comments);
		
		adminService.updateAssesmentSys(userId,comments,comment1,comment2,comment3,comment4,comment5);
		ClientListing clientListing = adminService.getClientListingById(questionId);
		List<ClientListing> clientEmail = adminService.getUserEmail(questionId
				.toString());
        Map<?, ?> m = (Map<?, ?>) clientEmail.get(0);		
        MailReminder mail = new MailReminder();
		mail.sendMessage(m.get("emailaddress").toString(), "Assessment Report", "" +
				"Hello "
				+ clientListing.getForeName()
				+ " "
				+ clientListing.getSurName()
				+ "<br><br>Your Assessment Report is now ready.   To view it, Click WWW.CALBA.Net then  enter your User Name and Password and click on &quot;Assessment Report&quot; in the left hand panel.   Don&rsquo;t hesitate to email or phone us if you have any difficulties with this.<br><br>The CALBA Team,<br>Tel:  020-8245 6420</html>");
		
		out.write("<p>Updated Succesfully.</p>");
		return null;

	}

	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/disabilityReport")
	public String disabilityReport(@PathVariable Integer clientId,
			ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			ClientListing client = adminService.getClientListingById(clientId);
			List<DisabilityReportInfo> result = adminService
					.getDisabilityReportInfo(clientId);
			model.addAttribute("client", client);
			model.addAttribute("result", result);
			return "admin/disabilityReport";
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return questionListing(Util.DEFAULT_PAGE, model);
		}
	}

	private void clientListing(ModelMap model, Integer clientId) {
		ClientListing clientListing = adminService
				.getClientListingById(clientId);
		model.addAttribute("client", clientListing);
	}

	public List<ClientListing> moniterListing() {
		List<ClientListing> result = adminService.getMoniterListing();
		return result;
	}
	
	
	@RequestMapping(method=RequestMethod.GET, value="/adminRegister")
	 public String register(ModelMap model){
		ClientRegisterForm form = new ClientRegisterForm();
		System.out.println("hello admin side");
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
		
		return "admin/adminRegister";
	 }

	@RequestMapping(method = RequestMethod.POST, value = "/adminRegister")
	public String handleRequest(@ModelAttribute("form") @Valid ClientRegisterForm form,
			BindingResult result, ModelMap model) {
	 
	 try {
		 
		 System.out.println("inside post method..");
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
			model.addAttribute("message", "user successfully created.");
			return "admin/adminWelcome" ;
		}
	
 }
	
	@RequestMapping(method = RequestMethod.GET, value = "/{clientId}/painHistory")
	public String painHistory(@PathVariable Integer clientId,
			ModelMap model,HttpServletRequest request,
			HttpServletResponse response) 
	{


		try {
			
			
			String redirectVal=request.getParameter("redirect").toString();
			model.addAttribute("redirectVal", redirectVal);
			
			Report report = adminService
					.getReportQuestionListing(REPORT_PAIN_ANALYSIS);

			ClientListing client = adminService.getClientListingById(clientId);
			model.addAttribute("client", client);

			adminService.updateNullValue();
			Map<String, Integer> clientScore = adminService
					.getClientReportScore(clientId, REPORT_PAIN_ANALYSIS);
			Map<String, Integer> scoreText = adminService.getClientScoreAnswer(
					clientId, REPORT_PAIN_ANALYSIS);
			
			/*Calculation for new columns*/
			
			ClientForm clientForm = formService.getClientForm(
					client.getClientId(), CalbaAppConstant.BACK_PAIN_FORM_ID);
			
			List<FormQuestionClient> formQuesClient = formService
					.getFormQuestionClient(clientForm.getClientFormId());
			
			BackPainForm form = new BackPainForm(clientForm.getClientFormId());

			FormUtil.setBaseForm(formQuesClient, form);

			form.setClientId(clientId);
			model.addAttribute("form", form);
			Map<String, String> newColumns = new HashMap<String, String>();
			Map<String, Integer> currentColumn = new HashMap<String, Integer>();
			Map<String, String> recentColumn = new HashMap<String, String>();

			
			String painAppear = "";
			int currentEpisode = 0;
			String recentPain="";
			int recentPainVal32=0;
			int recentPainVal34=0;
			int recentPainVal291=0;
			int recentPainVal292=0;
			int recentPainVal293=0;

			
			for (FormQuestionClient answer : formQuesClient){
				
				/*Start most recent pain column*/

				if(answer.getQuestionId()==32){
					if(answer.getValue().equals("Yes I have")){
						recentPain="0";
						recentColumn.put("436", recentPain);
						
					}else if(answer.getValue().equals("Yes I had")){
							recentPainVal32=1;
					}
				}
				
				if(answer.getQuestionId()==34){
					if(answer.getValue().equals("Yes I have")){
						recentPain="0";
						recentColumn.put("261", recentPain);
	
					}else if(answer.getValue().equals("Yes I had")){
							recentPainVal34=1;
					}
				}
				
				if(answer.getQuestionId()==291){
					if(answer.getValue().equals("Yes I have")){
						recentPain="0";
						recentColumn.put("266", recentPain);

					}else if(answer.getValue().equals("Yes I had")){
						recentPainVal291=1;
					}
				}
				if(answer.getQuestionId()==292){
					if(answer.getValue().equals("Yes I have")){
						recentPain="0";
						recentColumn.put("267", recentPain);

					}else if(answer.getValue().equals("Yes I had")){
						recentPainVal292=1;
					}
				}
				
				if(answer.getQuestionId()==293){
					model.addAttribute("val293", answer.getValue()); 
					
					if(answer.getValue().equals("Yes I have")){
						recentPain="0";
						recentColumn.put("268", recentPain);

					}else if(answer.getValue().equals("Yes I had")){
						recentPainVal293=1;
					}
				}
				
				if(answer.getQuestionId()==39){
				if(recentPainVal32==1){
					System.out.println("check this value.32.."+recentPainVal32);
					System.out.println("see..32.."+answer.getValue());

					
					if(answer.getValue().equals("Past 2 weeks")){
						recentPain="2";
					}else if(answer.getValue().equals("3-4 weeks ago")){
						recentPain="4";
					}else if(answer.getValue().equals("5-8 weeks ago")){
						recentPain="8";
					}else if(answer.getValue().equals("9-12 weeks ago")){
						recentPain="12";
					}else if(answer.getValue().equals("3-6 months ago")){
						recentPain="13";
					}else if(answer.getValue().equals("7-9 months ago")){
						recentPain="26";
					}else if(answer.getValue().equals("10-12 months ago")){
						recentPain="40";
					}else if(answer.getValue().equals("1-2 years ago")){
						recentPain="53";
					}else if(answer.getValue().equals("3-5 years ago")){
						recentPain="105";
					}else if(answer.getValue().equals("More than 5 years ago")){
						recentPain="260";
					}
					recentColumn.put("436", recentPain);
				}}
				
				if(answer.getQuestionId()==43){
				if(recentPainVal34==1){
					
					if(answer.getValue().equals("Past 2 weeks")){
						recentPain="2";
					}else if(answer.getValue().equals("3-4 weeks ago")){
						recentPain="4";
					}else if(answer.getValue().equals("5-8 weeks ago")){
						recentPain="8";
					}else if(answer.getValue().equals("9-12 weeks ago")){
						recentPain="12";
					}else if(answer.getValue().equals("3-6 months ago")){
						recentPain="13";
					}else if(answer.getValue().equals("7-9 months ago")){
						recentPain="26";
					}else if(answer.getValue().equals("10-12 months ago")){
						recentPain="40";
					}else if(answer.getValue().equals("1-2 years ago")){
						recentPain="53";
					}else if(answer.getValue().equals("3-5 years ago")){
						recentPain="105";
					}else if(answer.getValue().equals("More than 5 years ago")){
						recentPain="260";
					}
					recentColumn.put("261", recentPain);
				}}
				
				if(answer.getQuestionId()==309){
				if(recentPainVal291==1){
					
					if(answer.getValue().equals("Past 2 weeks")){
						recentPain="2";
					}else if(answer.getValue().equals("3-4 weeks ago")){
						recentPain="4";
					}else if(answer.getValue().equals("5-8 weeks ago")){
						recentPain="8";
					}else if(answer.getValue().equals("9-12 weeks ago")){
						recentPain="12";
					}else if(answer.getValue().equals("3-6 months ago")){
						recentPain="13";
					}else if(answer.getValue().equals("7-9 months ago")){
						recentPain="26";
					}else if(answer.getValue().equals("10-12 months ago")){
						recentPain="40";
					}else if(answer.getValue().equals("1-2 years ago")){
						recentPain="53";
					}else if(answer.getValue().equals("3-5 years ago")){
						recentPain="105";
					}else if(answer.getValue().equals("More than 5 years ago")){
						recentPain="260";
					}
					recentColumn.put("266", recentPain);

				}}
				
				if(answer.getQuestionId()==310){
				if(recentPainVal292==1){
					
					if(answer.getValue().equals("Past 2 weeks")){
						recentPain="2";
					}else if(answer.getValue().equals("3-4 weeks ago")){
						recentPain="4";
					}else if(answer.getValue().equals("5-8 weeks ago")){
						recentPain="8";
					}else if(answer.getValue().equals("9-12 weeks ago")){
						recentPain="12";
					}else if(answer.getValue().equals("3-6 months ago")){
						recentPain="13";
					}else if(answer.getValue().equals("7-9 months ago")){
						recentPain="26";
					}else if(answer.getValue().equals("10-12 months ago")){
						recentPain="40";
					}else if(answer.getValue().equals("1-2 years ago")){
						recentPain="53";
					}else if(answer.getValue().equals("3-5 years ago")){
						recentPain="105";
					}else if(answer.getValue().equals("More than 5 years ago")){
						recentPain="260";
					}
					recentColumn.put("267", recentPain);

				}}
				
				if(answer.getQuestionId()==311){

				if(recentPainVal293==1){
					
					if(answer.getValue().equals("Past 2 weeks")){
						recentPain="2";
					}else if(answer.getValue().equals("3-4 weeks ago")){
						recentPain="4";
					}else if(answer.getValue().equals("5-8 weeks ago")){
						recentPain="8";
					}else if(answer.getValue().equals("9-12 weeks ago")){
						recentPain="12";
					}else if(answer.getValue().equals("3-6 months ago")){
						recentPain="13";
					}else if(answer.getValue().equals("7-9 months ago")){
						recentPain="26";
					}else if(answer.getValue().equals("10-12 months ago")){
						recentPain="40";
					}else if(answer.getValue().equals("1-2 years ago")){
						recentPain="53";
					}else if(answer.getValue().equals("3-5 years ago")){
						recentPain="105";
					}else if(answer.getValue().equals("More than 5 years ago")){
						recentPain="260";
					}
					recentColumn.put("268", recentPain);

				}}
				
				/*End most recent pain column*/
				
				if(answer.getQuestionId()==40){
					
					if(answer.getValue().equals("Past year")){
						painAppear="1";
					}else if(answer.getValue().equals("1-2 years ago")){
						painAppear="2";
					}else if(answer.getValue().equals("3-5 years ago")){
						painAppear="5";
					}else if(answer.getValue().equals("More than 5 years ago")){
						painAppear=">5";
					}
					newColumns.put("436", painAppear);
				}else if(answer.getQuestionId()==44){
					
					
					if(answer.getValue().equals("Past year")){
						painAppear="1";
					}else if(answer.getValue().equals("1-2 years ago")){
						painAppear="2";
					}else if(answer.getValue().equals("3-5 years ago")){
						painAppear="5";
					}else if(answer.getValue().equals("More than 5 years ago")){
						painAppear=">5";
					}
					newColumns.put("261", painAppear);
				}else if(answer.getQuestionId()==297){
					
					
					if(answer.getValue().equals("Past year")){
						painAppear="1";
					}else if(answer.getValue().equals("1-2 years ago")){
						painAppear="2";
					}else if(answer.getValue().equals("3-5 years ago")){
						painAppear="5";
					}else if(answer.getValue().equals("More than 5 years ago")){
						painAppear=">5";
					}
					newColumns.put("266", painAppear);
				}else if(answer.getQuestionId()==298){
					
					
					if(answer.getValue().equals("Past year")){
						painAppear="1";
					}else if(answer.getValue().equals("1-2 years ago")){
						painAppear="2";
					}else if(answer.getValue().equals("3-5 years ago")){
						painAppear="5";
					}else if(answer.getValue().equals("More than 5 years ago")){
						painAppear=">5";
					}
					newColumns.put("267", painAppear);
				}else if(answer.getQuestionId()==299){
					
					
					if(answer.getValue().equals("Past year")){
						painAppear="1";
					}else if(answer.getValue().equals("1-2 years ago")){
						painAppear="2";
					}else if(answer.getValue().equals("3-5 years ago")){
						painAppear="5";
					}else if(answer.getValue().equals("More than 5 years ago")){
						painAppear=">5";
					}
					newColumns.put("268", painAppear);
				}
				
				if(answer.getQuestionId()==286){
					
					if(answer.getValue().equals("Past 2 weeks")){
						currentEpisode=2;
					}else if(answer.getValue().equals("3-4 weeks ago")){
						currentEpisode=4;
					}else if(answer.getValue().equals("5-8 weeks ago")){
						currentEpisode=8;
					}else if(answer.getValue().equals("9-12 weeks ago")){
						currentEpisode=12;
					}else if(answer.getValue().equals("3-6 months ago")){
						currentEpisode=13;
					}else if(answer.getValue().equals("7-9 months ago")){
						currentEpisode=26;
					}else if(answer.getValue().equals("10-12 months ago")){
						currentEpisode=40;
					}else if(answer.getValue().equals("1-2 years ago")){
						currentEpisode=53;
					}else if(answer.getValue().equals("3-5 years ago")){
						currentEpisode=105;
					}else if(answer.getValue().equals("More than 5 years ago")){
						currentEpisode=260;
					}
					currentColumn.put("436", currentEpisode);
				}else if(answer.getQuestionId()==288){
					
					if(answer.getValue().equals("Past 2 weeks")){
						currentEpisode=2;
					}else if(answer.getValue().equals("3-4 weeks ago")){
						currentEpisode=4;
					}else if(answer.getValue().equals("5-8 weeks ago")){
						currentEpisode=8;
					}else if(answer.getValue().equals("9-12 weeks ago")){
						currentEpisode=12;
					}else if(answer.getValue().equals("3-6 months ago")){
						currentEpisode=13;
					}else if(answer.getValue().equals("7-9 months ago")){
						currentEpisode=26;
					}else if(answer.getValue().equals("10-12 months ago")){
						currentEpisode=40;
					}else if(answer.getValue().equals("1-2 years ago")){
						currentEpisode=53;
					}else if(answer.getValue().equals("3-5 years ago")){
						currentEpisode=105;
					}else if(answer.getValue().equals("More than 5 years ago")){
						currentEpisode=260;
					}
					currentColumn.put("261", currentEpisode);
				}else if(answer.getQuestionId()==294){
					
					if(answer.getValue().equals("Past 2 weeks")){
						currentEpisode=2;
					}else if(answer.getValue().equals("3-4 weeks ago")){
						currentEpisode=4;
					}else if(answer.getValue().equals("5-8 weeks ago")){
						currentEpisode=8;
					}else if(answer.getValue().equals("9-12 weeks ago")){
						currentEpisode=12;
					}else if(answer.getValue().equals("3-6 months ago")){
						currentEpisode=13;
					}else if(answer.getValue().equals("7-9 months ago")){
						currentEpisode=26;
					}else if(answer.getValue().equals("10-12 months ago")){
						currentEpisode=40;
					}else if(answer.getValue().equals("1-2 years ago")){
						currentEpisode=53;
					}else if(answer.getValue().equals("3-5 years ago")){
						currentEpisode=105;
					}else if(answer.getValue().equals("More than 5 years ago")){
						currentEpisode=260;
					}
					currentColumn.put("266", currentEpisode);
				}else if(answer.getQuestionId()==295){
					
					if(answer.getValue().equals("Past 2 weeks")){
						currentEpisode=2;
					}else if(answer.getValue().equals("3-4 weeks ago")){
						currentEpisode=4;
					}else if(answer.getValue().equals("5-8 weeks ago")){
						currentEpisode=8;
					}else if(answer.getValue().equals("9-12 weeks ago")){
						currentEpisode=12;
					}else if(answer.getValue().equals("3-6 months ago")){
						currentEpisode=13;
					}else if(answer.getValue().equals("7-9 months ago")){
						currentEpisode=26;
					}else if(answer.getValue().equals("10-12 months ago")){
						currentEpisode=40;
					}else if(answer.getValue().equals("1-2 years ago")){
						currentEpisode=53;
					}else if(answer.getValue().equals("3-5 years ago")){
						currentEpisode=105;
					}else if(answer.getValue().equals("More than 5 years ago")){
						currentEpisode=260;
					}
					currentColumn.put("267", currentEpisode);
				}else if(answer.getQuestionId()==296){
					
					if(answer.getValue().equals("Past 2 weeks")){
						currentEpisode=2;
					}else if(answer.getValue().equals("3-4 weeks ago")){
						currentEpisode=4;
					}else if(answer.getValue().equals("5-8 weeks ago")){
						currentEpisode=8;
					}else if(answer.getValue().equals("9-12 weeks ago")){
						currentEpisode=12;
					}else if(answer.getValue().equals("3-6 months ago")){
						currentEpisode=13;
					}else if(answer.getValue().equals("7-9 months ago")){
						currentEpisode=26;
					}else if(answer.getValue().equals("10-12 months ago")){
						currentEpisode=40;
					}else if(answer.getValue().equals("1-2 years ago")){
						currentEpisode=53;
					}else if(answer.getValue().equals("3-5 years ago")){
						currentEpisode=105;
					}else if(answer.getValue().equals("More than 5 years ago")){
						currentEpisode=260;
					}
					currentColumn.put("268", currentEpisode);
				}
				
			
				
				System.out.println("check valuess.."+newColumns);
				
				
			}
			
			
			/*End Calculation for new columns*/			
			model.addAttribute("newColumn", newColumns);
			model.addAttribute("recentColumn", recentColumn);
			model.addAttribute("currentColumn", currentColumn);
			model.addAttribute("report", report);
			model.addAttribute("clientScore", clientScore);
			model.addAttribute("clientAnswer", scoreText);
			model.addAttribute("client", client);
			
			String redirectJSP="";
			
			if(redirectVal.equals("yes")){
				redirectJSP="admin/painRedirect";
			}else{
				redirectJSP="admin/painHistory";
			}

			return redirectJSP;
		} catch (Exception e) {
			LOGGER.error("error : ", e);
			return handleRequest(model, null, null);
		}
	}
	
	
}
