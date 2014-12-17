package net.calba.backpain.form;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import net.calba.backpain.CalbaAppConstant;
import net.calba.backpain.Util;
import net.calba.backpain.model.Address;
import net.calba.backpain.model.Client;
import net.calba.backpain.model.ClientDetail;
import net.calba.backpain.model.Email;
import net.calba.backpain.model.FormQuestionClient;
import net.calba.backpain.model.PersonalDetails;
import net.calba.backpain.model.SelfExamine;
import net.calba.backpain.model.Telephone;
import net.calba.backpain.service.ClientService;
import net.calba.backpain.service.FormService;

import org.apache.log4j.Logger;
import org.springframework.util.StringUtils;


public class FormUtil {


	/**
	 * LOGGER filed.
	 */
	private static final Logger LOGGER = Logger
			.getLogger(FormUtil.class);

	@SuppressWarnings("rawtypes")
	public static List<FormQuestionClient> getFormQuestionClients(BaseForm form) {

		List<FormQuestionClient> answers = new ArrayList<FormQuestionClient>();
		Class formClass = form.getClass();
		Integer clientFormId  = form.getClientFormId();

		String name; 
		String value;
		Integer quesId;
		FormQuestionClient formQuesClient;
		try {
			for(Field field : formClass.getDeclaredFields()) {
				field.setAccessible(true);
				name = field.getName();

				if(name.contains(CalbaAppConstant.QUESTION_PREFIX)) {

					if(field.getType() == String.class){
						value = (String) field.get(form);	
					} else {
						value = Arrays.toString((String[])field.get(form)).replaceFirst("^\\[", "").replaceFirst("\\]$", "");
					}			


					if(!value.isEmpty()) {
						value = escapeApostrophes(value);
						name = name.replaceFirst(CalbaAppConstant.QUESTION_PREFIX, "");				
						quesId = new Integer(name);
						formQuesClient = new FormQuestionClient();
						formQuesClient.setValue(value);
						formQuesClient.setClientFormId(clientFormId);
						formQuesClient.setQuestionId(quesId);
						answers.add(formQuesClient);	
					}		

				} 
			}
		} catch(Exception e) {
			LOGGER.error("error :", e);
		}



		return answers;

	}

	@SuppressWarnings("rawtypes")
	public static void setBaseForm(List<FormQuestionClient> formQuesClient, BaseForm form) {


		Class formClass = form.getClass();
		Field field;
		try {
			for(FormQuestionClient ques :  formQuesClient) {
				
				try {
					field = formClass.getDeclaredField(CalbaAppConstant.QUESTION_PREFIX + ques.getQuestionId());
					field.setAccessible(true);
					if(field.getType() == String.class) {
						field.set(form, removeEscapeApostrophes(ques.getValue()));
						
					} else {
						field.set(form, StringUtils.trimArrayElements(ques.getValue().split(",")));
						
					}
					
				}catch(Exception e) {}
				

			}
		}catch(Exception e) {
			LOGGER.error("error :", e);
		}

	}
	
	

	public static AboutYouForm getAboutYouForm(ClientDetail clientDetail,
			List<FormQuestionClient> formQuesClient, Integer clientFormId) {

		AboutYouForm form = new AboutYouForm(clientFormId);
		
		setBaseForm(formQuesClient, form);

		Client client = clientDetail.getClient();
		PersonalDetails details = clientDetail.getDetails();
		Address address = clientDetail.getAddress();
		Telephone telephone = clientDetail.getTelephone();
		Email email = clientDetail.getEmail();		

		form.setClientId(client.getClientId());
		form.setForeName(client.getForeName());
		form.setSurName(client.getSurName());
		form.setSex(client.getSex());
		form.setMobile(clientDetail.getMobile());
		System.out.println("gender=="+clientDetail.getSex());
		if (client.getDateOfBirth() != null) {
			form.setDateOfBirth(Util.formatDate(client.getDateOfBirth()));
		}


		if(details != null) {
			form.setHeight(details.getHeight());
//			form.setSex(details.getSex());
			
			form.setWeight(details.getWeight());
			form.setWeightUnitsId(details.getWeightUnitsId());
			form.setHeightUnitsId(details.getHeightUnitsId());			
		}

		if(address != null) {
			form.setLine1(address.getLine1());
			form.setLine2(address.getLine2());
			form.setLine3(address.getLine3());
			form.setCity(address.getCity());
			form.setPostcode(address.getPostcode());
			form.setCountry(address.getCountry());
		}

		if(telephone != null) {
			form.setPhone(telephone.getPhoneNumber());
		}

		if(email != null) {
			form.setEmail(email.getEmailAddress());
		}


		return form;
	}


	public static void updateClientDetail(ClientDetail clientDetail, AboutYouForm form) {
		escapeApostrophesForm(form);
		Client client = clientDetail.getClient();
		PersonalDetails details = clientDetail.getDetails();
		Address address = clientDetail.getAddress();
		Telephone telephone = clientDetail.getTelephone();
		Email email = clientDetail.getEmail();
		

		Integer clientId = client.getClientId();
		client.setSurName(form.getSurName());
		client.setForeName(form.getForeName());
		client.setDateOfBirth(Util.formatDate(form.getDateOfBirth()));
		client.setSex(form.getSex());
		client.setMobile(form.getMobile());
		
		if(details == null) {
			details = new PersonalDetails();
			clientDetail.setDetails(details);
		}

		details.setSex(form.getSex());
		details.setClientId(clientId);
		
		
		
		
		details.setHeightUnitsId(form.getHeightUnitsId());
		details.setWeight(form.getWeight());
		details.setWeightUnitsId(form.getWeightUnitsId());


		if(address == null) {
			address = new Address();
			clientDetail.setAddress(address);
		}

		address.setClientId(clientId);
		address.setCountry(form.getCountry());
		address.setCity(form.getCity());
		address.setPostcode(form.getPostcode());
		address.setLine1(form.getLine1());
		address.setLine2(form.getLine2());
		address.setLine3(form.getLine3());
		

		clientDetail.setTelephone(telephone);

		telephone.setClientId(clientId);
		telephone.setPhoneNumber(form.getPhone());
		telephone.setMobileNumber(form.getMobile());
		
		

		if(email == null) {
			email = new Email();
			clientDetail.setEmail(email);
		}

		email.setClientId(clientId);
		email.setEmailAddress(form.getEmail());
		removeEscapeApostrophesForm(form);		

	}

	public static ClientDetail createClientDetail(ClientRegisterForm form) {
		ClientDetail clientDetail = new ClientDetail();
		escapeApostrophesForm(form);

		Client client = new Client();
		clientDetail.setClient(client);
		clientDetail.setSex(form.getSex());
		clientDetail.setMobile(form.getMobile());
		Address address = new Address();
		clientDetail.setAddress(address);
System.out.println("sex=="+form.getSex());
		Email email = new Email();
		clientDetail.setEmail(email);

		Telephone telephone = new Telephone();
		clientDetail.setTelephone(telephone);
		clientDetail.setMobile(form.getMobile());
		client.setSurName(form.getSurName());
		client.setForeName(form.getForeName());
		client.setDateOfBirth(Util.formatDate(form.getDateOfBirth()));
		client.setHashedPassword(Util.sha1(form.getNewPassward()));
		client.setUserId(form.getUserId());
		client.setProjectId(new Long(form.getProjectId()));
		client.setClientStateId(CalbaAppConstant.CLIENT_STATE_INACTIVE_ID);
		client.setPassword(form.getNewPassward());
		
		address.setCountry(form.getCountry());
		address.setCity(form.getCity());
		address.setPostcode(form.getPostcode());
		address.setLine1(form.getLine1());
		address.setLine2(form.getLine2());
		address.setLine3(form.getLine3());

		email.setEmailAddress(form.getEmail());
		telephone.setPhoneNumber(form.getTelephone());
		telephone.setMobileNumber(form.getMobile());
		removeEscapeApostrophesForm(form);
		return clientDetail;
	}


	public static void escapeApostrophesForm(Object form) {
		Class formClass = form.getClass();
		String value;
		String name;

		try {
			for(Field field : formClass.getDeclaredFields()) {
				field.setAccessible(true);
				name = field.getName();				
				if(!name.contains(CalbaAppConstant.QUESTION_PREFIX)
						&& field.getType() == String.class) {					
					value = (String) field.get(form);				
					value = escapeApostrophes(value);
					field.set(form, value);				
				}

			}
		} catch(Exception e) {
			LOGGER.error("error :", e);
		}
	}

	public static void removeEscapeApostrophesForm(Object form) {
		Class formClass = form.getClass();
		String value;
		String name;

		try {
			for(Field field : formClass.getDeclaredFields()) {
				field.setAccessible(true);
				name = field.getName();				
				if(!name.contains(CalbaAppConstant.QUESTION_PREFIX)
						&& field.getType() == String.class) {
					
					value = (String) field.get(form);				
					value = removeEscapeApostrophes(value);
					field.set(form, value);


				}					
			}
		} catch(Exception e) {
			LOGGER.error("error :", e);
		}
	}



	public static String escapeApostrophes(String value) {
		if (value != null) {
			return value.replaceAll("'", "''");
		} else {
			return null;
		}
	} 

	public static String removeEscapeApostrophes(String value) {
		if (value != null) {
			return value.replaceAll("''", "'");
		} else {
			return null;
		}
	}

	public static void setBaseForm(List<FormQuestionClient> formAnswerClient,
			SelfExamine form) {


		Class formClass = form.getClass();
		Field field;
		try {
			for(FormQuestionClient ques :  formAnswerClient) {
				
				try {
					field = formClass.getDeclaredField(CalbaAppConstant.QUESTION_PREFIX + ques.getQuestionId());
					field.setAccessible(true);
					if(field.getType() == String.class) {
						field.set(form, removeEscapeApostrophes(ques.getValue()));
						
					} else {
						field.set(form, StringUtils.trimArrayElements(ques.getValue().split(",")));
						
					}
					
				}catch(Exception e) {}
				

			}
		}catch(Exception e) {
			LOGGER.error("error :", e);
		}

		
	} 



}
