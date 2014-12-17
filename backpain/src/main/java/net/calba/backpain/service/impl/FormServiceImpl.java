package net.calba.backpain.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

import javax.annotation.PostConstruct;
import javax.mail.MessagingException;

import net.calba.backpain.CalbaAppConstant;
import net.calba.backpain.dao.mybatis.ClientFormMapper;
import net.calba.backpain.dao.mybatis.ClientMapper;
import net.calba.backpain.dao.mybatis.FormMapper;
import net.calba.backpain.dao.mybatis.FormQuestionClientMapper;
import net.calba.backpain.dao.mybatis.QuestionMapper;
import net.calba.backpain.model.Client;
import net.calba.backpain.model.ClientDetail;
import net.calba.backpain.model.ClientForm;
import net.calba.backpain.model.ClientFormExample;
import net.calba.backpain.model.Form;
import net.calba.backpain.model.FormExample;
import net.calba.backpain.model.FormQuestionClient;
import net.calba.backpain.model.FormQuestionClientExample;
import net.calba.backpain.model.MoniterSystem;
import net.calba.backpain.model.Question;
import net.calba.backpain.model.QuestionExample;
import net.calba.backpain.service.FormService;

import org.apache.commons.mail.EmailException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import reminder.MailReminder;

@Service("formService")
public class FormServiceImpl implements FormService {

	/**
	 * LOGGER filed.
	 */
	private static final Logger LOGGER = Logger
			.getLogger(FormServiceImpl.class);

	public static final String QUESTION_OTHER = "Other";

	@Autowired
	private FormMapper formMapper;

	@Autowired
	private QuestionMapper questionMapper;

	@Autowired
	private ClientFormMapper clientFormMapper;

	@Autowired
	private FormQuestionClientMapper formQuestionClientMapper;

	@Autowired
	ClientMapper clientMapper;

	private Map<Integer, Form> forms = new HashMap<Integer, Form>();

	@PostConstruct
	public final void init() {
		LOGGER.debug("Enter in init: ");
		FormExample example = new FormExample();
		QuestionExample questionExample = new QuestionExample();
		List<Form> formList = formMapper.selectByExample(example);
		for (Form form : formList) {
			QuestionExample.Criteria criteria = questionExample
					.createCriteria();
			criteria.andFormIdEqualTo(form.getFormid());
			form.setQuestions(questionMapper.selectByExample(questionExample));
			questionExample.clear();
			forms.put(form.getFormid(), form);
		}

		LOGGER.debug("Exit from init: ");
	}

	public List<FormQuestionClient> getFormQuestionClient(Integer clientFormId) {

		FormQuestionClientExample example = new FormQuestionClientExample();
		FormQuestionClientExample.Criteria criteria = example.createCriteria();
		criteria.andClientFormIdEqualTo(clientFormId);

		return formQuestionClientMapper.selectByExample(example);
	}

	@Transactional(rollbackFor = Exception.class)
	public ClientForm getClientForm(Integer clientId, Integer formId) {
		ClientForm clientForm;
		ClientFormExample example = new ClientFormExample();
		ClientFormExample.Criteria criteria = example.createCriteria();
		criteria.andClientIdEqualTo(clientId);
		criteria.andFormIdEqualTo(formId);
		List<ClientForm> clientForms = clientFormMapper
				.selectByExample(example);

		LOGGER.debug("cliendId: " + clientId + " formId: " + formId
				+ "  ClientForm:" + clientForms);

		if (clientForms.isEmpty()) {
			clientForm = new ClientForm();
			clientForm.setClientId(clientId);
			clientForm.setFormId(formId);
			clientForm.setState(CalbaAppConstant.ACTIVE);
			clientFormMapper.insert(clientForm);
			clientForms = clientFormMapper.selectByExample(example);
		}


		clientForm = clientForms.get(0);
		return clientForm;

	}

	@Transactional(rollbackFor = Exception.class)
	public ClientForm updateClientForm(Integer clientId, Integer formId) {
		ClientForm clientForm=new ClientForm();;
		ClientFormExample example = new ClientFormExample();
		ClientFormExample.Criteria criteria = example.createCriteria();
		criteria.andClientIdEqualTo(clientId);
		criteria.andFormIdEqualTo(formId);
		List<ClientForm> clientForms = clientFormMapper
				.selectByExample(example);

		LOGGER.debug("cliendId: " + clientId + " formId: " + formId
				+ "  ClientForm:" + clientForms);

		if (!clientForms.isEmpty()) {
//			clientForm = new ClientForm();
			ClientFormExample example1 = new ClientFormExample();
			ClientFormExample.Criteria criteria1 = example1.createCriteria();
			criteria1.andClientIdEqualTo(clientId);
			criteria1.andFormIdEqualTo(formId);
			clientForm.setState(CalbaAppConstant.STATE_COMPLETED);
			clientFormMapper.updateByExampleSelective(clientForm, example);

		}
//		try{
			clientForm = clientForms.get(0);
//		}
//		catch(Exception ex){
//			
//		}
		
		return clientForm;

	}

	@Transactional(rollbackFor = Exception.class)
	public void addFormQuestionClient(List<FormQuestionClient> questions,
			Integer clientFormId) {
		FormQuestionClientExample example = new FormQuestionClientExample();
		FormQuestionClientExample.Criteria criteria = example.createCriteria();

		criteria.andClientFormIdEqualTo(clientFormId);
		formQuestionClientMapper.deleteByExample(example);

		for (FormQuestionClient quest : questions) {

			formQuestionClientMapper.insert(quest);
		}

		FormQuestionClient formQuesClient = new FormQuestionClient();
		formQuesClient.setClientFormId(clientFormId);
		formQuesClient.setQuestionId(434);
		formQuesClient.setValue("426");
		formQuestionClientMapper.insert(formQuesClient);

	}

	@Transactional(rollbackFor = Exception.class)
	public void addFormQuestionClient(ClientForm clientForm, Integer parentId,
			String[] questionTexts) {
		QuestionExample.Criteria criteria;
		List<Question> questions;
		FormQuestionClient formQuesClient = new FormQuestionClient();
		formQuesClient.setClientFormId(clientForm.getClientFormId());
		QuestionExample example = new QuestionExample();
		criteria = example.createCriteria();

		for (String questionText : questionTexts) {

			if (!QUESTION_OTHER.equalsIgnoreCase(questionText.trim())) {

				criteria.andQuestionTextEqualTo(questionText);
				criteria.andFormIdEqualTo(clientForm.getFormId());
				criteria.andParentEntityIdEqualTo(parentId);
				questions = questionMapper.selectByExample(example);
				example.clear();
				if (!questions.isEmpty()) {
					formQuesClient.setQuestionId(questions.get(0)
							.getQuestionId());
					formQuesClient.setValue(questionText);
					formQuesClient.setFormQuestionClientId(0);
					formQuestionClientMapper.insert(formQuesClient);
				}
			}

		}
	}

	public Question getQuestion(Integer formId, Integer parentId,
			String questionText) {

		QuestionExample example = new QuestionExample();
		QuestionExample.Criteria criteria = example.createCriteria();
		criteria.andFormIdEqualTo(formId);
		criteria.andQuestionTextEqualTo(questionText);
		criteria.andParentEntityIdEqualTo(parentId);
		List<Question> questions = questionMapper.selectByExample(example);
		if (questions.isEmpty()) {
			return null;
		} else {
			return questions.get(0);
		}

	}

	public List<ClientForm> getFormStatus(Integer clientId, Integer formId) {

		ClientForm clientForm;
		ClientFormExample example = new ClientFormExample();
		ClientFormExample.Criteria criteria = example.createCriteria();
		criteria.andClientIdEqualTo(clientId);
		criteria.andFormIdEqualTo(formId);
		List<ClientForm> clientForms = clientFormMapper
				.selectByExample(example);

		return clientForms;

	}

	public void addClientState(Integer clientId, Integer formId, Client client) {

		MailReminder mail = new MailReminder();

		ClientForm clientForm;
		ClientFormExample example = new ClientFormExample();
		ClientFormExample.Criteria criteria = example.createCriteria();
		criteria.andClientIdEqualTo(clientId);
		criteria.andFormIdEqualTo(2);
		List<ClientForm> clientForms = clientFormMapper
				.selectByExample(example);

		ClientForm clientForm1;
		ClientFormExample example1 = new ClientFormExample();
		ClientFormExample.Criteria criteria1 = example1.createCriteria();
		criteria1.andClientIdEqualTo(clientId);
		criteria1.andFormIdEqualTo(3);
		List<ClientForm> clientForms1 = clientFormMapper
				.selectByExample(example1);

		ClientForm clientForm2;
		ClientFormExample example2 = new ClientFormExample();
		ClientFormExample.Criteria criteria2 = example2.createCriteria();
		criteria2.andClientIdEqualTo(clientId);
		criteria2.andFormIdEqualTo(4);
		List<ClientForm> clientForms2 = clientFormMapper
				.selectByExample(example2);

		ClientForm clientForm3;
		ClientFormExample example3 = new ClientFormExample();
		ClientFormExample.Criteria criteria3 = example3.createCriteria();
		criteria3.andClientIdEqualTo(clientId);
		criteria3.andFormIdEqualTo(5);
		List<ClientForm> clientForms3 = clientFormMapper
				.selectByExample(example3);

		ClientForm clientForm4;
		ClientFormExample example4 = new ClientFormExample();
		ClientFormExample.Criteria criteria4 = example4.createCriteria();
		criteria4.andClientIdEqualTo(clientId);
		criteria4.andFormIdEqualTo(6);
		List<ClientForm> clientForms4 = clientFormMapper
				.selectByExample(example4);

		ClientForm clientForm5;
		ClientFormExample example5 = new ClientFormExample();
		ClientFormExample.Criteria criteria5 = example5.createCriteria();
		criteria4.andClientIdEqualTo(clientId);
		criteria4.andFormIdEqualTo(8);
		List<ClientForm> clientForms5 = clientFormMapper
				.selectByExample(example5);
//		System.out.println("clientForms5 status=="+clientForms5.get(0).getState());
		if (clientForms.size() != 0 && clientForms1.size() != 0
				&& clientForms2.size() != 0 && clientForms3.size() != 0
				&& clientForms4.size() != 0 && clientForms5.size() != 0) {

			if (clientForms.get(0).getState().equals("Completed")
					&& clientForms1.get(0).getState().equals("Completed")
					&& clientForms2.get(0).getState().equals("Completed")
					&& clientForms3.get(0).getState().equals("Completed")
					&& clientForms4.get(0).getState().equals("Completed")
					&& clientForms5.get(0).getState().equals("Complete")) {
//				System.out.println("All cpmpleted=="+clientForms5.get(0).getState());
				ClientDetail clientDetail = new ClientDetail();

				Client client1 = new Client();

				client1.setClientId(clientId);
				client1.setClientStateId(4);
				clientMapper.updateByPrimaryKeySelective(client1);
				try {
					mail.sendMessage(
							"support@calba.net",
							"All forms Completed for user "
									+ client.getUserId() + "",
							"HI,<br>nUser "
									+ client.getUserId()
									+ " have completed all his five forms please check his/her report and assign monitoring forms according to his/her report. <br><br>Thanks and Regards,<br> Calba Team");
				} catch (EmailException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}

	public void addMoniterSystem(List<FormQuestionClient> questions,
			Integer clientId, String formSetId) {
		int setId = Integer.parseInt(formSetId);

		FormQuestionClientExample example = new FormQuestionClientExample();
		FormQuestionClientExample.Criteria criteria = example.createCriteria();

		criteria.andClientFormIdEqualTo(clientId);
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss",Locale.UK);

		dateFormat.setTimeZone(TimeZone.getTimeZone("GMT+1"));
		//long now = System.currentTimeMillis();

		String date =dateFormat.format(GregorianCalendar.getInstance().getTime());

		for (FormQuestionClient quest : questions) {
			quest.setSetId(setId);
			quest.setDate(date);
			quest.setUserId(clientId);
			formQuestionClientMapper.insertMoniterSystem(quest);
		}

	}

}
