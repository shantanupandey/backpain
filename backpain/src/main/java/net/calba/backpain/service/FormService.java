package net.calba.backpain.service;

import java.util.List;

import net.calba.backpain.model.Client;
import net.calba.backpain.model.ClientForm;
import net.calba.backpain.model.FormQuestionClient;
import net.calba.backpain.model.Question;

public interface FormService {

	
	/**
	 * 
	 * @param clientFormId Integer
	 * @return List<FormQuestionClient>
	 */
	List<FormQuestionClient> getFormQuestionClient(Integer clientFormId);
	
	/**
	 * 
	 * @param clientId Integer
	 * @param formId Integer
	 * @return ClientForm
	 */
	ClientForm getClientForm(Integer clientId, Integer formId);
	
	/**
	 * 
	 * @param clientId
	 * @param formId
	 * @return
	 */
	ClientForm updateClientForm(Integer clientId, Integer formId);
	
	/**
	 * 
	 * @param clientId
	 * @param formId
	 * @param client
	 */
	void addClientState(Integer clientId, Integer formId,Client client);
	
	/**
	 * 
	 * @param questions List<FormQuestionClient>
	 * @param clientFormId Integer
	 */
	void addFormQuestionClient(List<FormQuestionClient> questions, Integer clientFormId);
	
	 /**
	  * 
	  * @param formId
	  * @param parentId
	  * @param questionText
	  * @return
	  */
	 Question getQuestion(Integer formId, Integer parentId, String questionText);
	 
	 /**
	  * 
	  * @param clientForm
	  * @param parentId
	  * @param questionTexts
	  */
	 void addFormQuestionClient(ClientForm clientForm, Integer parentId, String [] questionTexts);

	/**
	 * 
	 * @param formQuesClient
	 * @param clientFormId
	 * @param formSetId
	 */
	void addMoniterSystem(List<FormQuestionClient> formQuesClient,
			Integer clientFormId, String formSetId);
	
	/**
	 * 
	 * @param clientId
	 * @param formId
	 * @return
	 */
	List<ClientForm> getFormStatus(Integer clientId, Integer formId);
	
	
}
