package net.calba.backpain.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import net.calba.backpain.model.CategoryList;
import net.calba.backpain.model.ClientDetails;
import net.calba.backpain.model.ClientListing;
import net.calba.backpain.model.ClientListingResult;
import net.calba.backpain.model.DisabilityReportInfo;
import net.calba.backpain.model.FormQuestionClient;
import net.calba.backpain.model.HNPTable;
import net.calba.backpain.model.MoniterListing;
import net.calba.backpain.model.MonitoringFormsEdit;
import net.calba.backpain.model.Question;
import net.calba.backpain.model.QuestionAnswer;
import net.calba.backpain.model.QuestionGroup;
import net.calba.backpain.model.Report;
import net.calba.backpain.model.SearchCriteria;
import net.calba.backpain.model.SelfExamine;

public interface AdminService {
	
	
	/**
	 * Get ClientListingResult list base on given SearchCriteria.
	 * @param criteria value
	 * @return ClientListingResult value
	 */
	ClientListingResult getClientListing(SearchCriteria criteria);
	
	
	
	/**
	 * 
	 * @param date
	 * @return
	 */
	List<ClientListing> getUserListing(Date date);

	
	/**
	 * Get ClientListing by given clientId.
	 * @param clientId value
	 * @return ClientListing value
	 */
	ClientListing getClientListingById(Integer clientId);
	
	/**
	 * 
	 * @param pageId Integer
	 * @return List<Question>
	 */
	List<Question>  getQuestionListing(Integer pageId);
	
	/**
	 * 
	 * @param questionId
	 * @return Question
	 */
	Question getQuestionById(Integer questionId);
	
	/**
	 * save the update Question 
	 * @param question Question
	 */
	void saveQuestion(Question question);
	
	/**
	 * 
	 * @param integer 
	 * @param questions List<FormQuestionClient>
	 * @param clientFormId Integer
	 */
	void insertQuestionAnswer(QuestionAnswer records, Integer UserId);
	
	
	/**
	 * Get QuestionGroup by given questionGroupId value.
	 * @param questionGroupId Integer 
	 * @return QuestionGroup
	 */
	QuestionGroup getQuestionGroup(Integer questionGroupId);
	
	/**
	 * Get Report by given reportId value.
	 * @param reportId Integer value
	 * @return Report
	 */
	Report  getReportQuestionListing(Integer reportId);
	
	/**
	 * Get Client Report question answer score with given parameter
	 * @param clientId Integer
	 * @param reportId Integer
	 * @return Map<Integer, Integer>
	 */
	Map<String, Integer> getClientReportScore(Integer clientId, Integer reportId);



    /**
     * 
     * @param userId
     */
	void updateReport(String userId);



    /**
     * 
     * @param clientId
     * @param reportId
     * @return
     */
	Map<String, Integer> getClientScoreAnswer(Integer clientId,	Integer reportId);



    /**
     * 
     */
	void updateNullValue();



    /**
     * 
     * @return
     */
	List<HNPTable> getHnpTableData();



    /**
     * 
     * @return
     */
	List<HNPTable> getHnpHistoryTableData();



    /**
     * 
     * @return
     */
	List<HNPTable> getHnpHistoryPastData();



    /**
     * 
     * @return
     */
	List<HNPTable> getHnpHistory1to2year();



    /**
     * 
     * @return
     */
	List<HNPTable> getHnpHistory3to5year();



    /**
     * 
     * @return
     */
	List<HNPTable> getHnpHistory5year();



    /**
     * 
     * @param questionId
     * @return
     */
	List<HNPTable> gethistoryFactor(Integer questionId);
	
	/**
	 * 
	 * @param questionId
	 * @return
	 */
	List<HNPTable> getHNPValue(Integer questionId);



    /**
     * 
     * @param integer
     * @param f
     * @param g
     * @param h
     * @param i
     * @param j
     * @param k
     * @param l
     * @param m
     */
	void updateHnpFactors(Integer integer, float f, float g, float h, float i, float j, float k, float l, float m);

    /**
     * 
     * @param integer
     * @param f
     * @param g
     * @param h
     * @param i
     * @param j
     * @param k
     * @param l
     * @param m
     */
	void updateHNPLookup(Integer integer, float f, float g, float h, float i, float j, float k, float l, float m);

    /**
     * 
     * @param string
     * @param string2
     * @param thirdColumn
     * @return
     */
	List getHnpHistoryData(String string, String string2, String thirdColumn);



    /**
     * 
     * @param firstColumn
     * @param secondColumn
     * @return
     */
	List getHnpHistoryValue(String firstColumn, String secondColumn);



    /**
     * 
     * @param param
     * @return
     */
	List<HNPTable> getSetForms(int param);



    /**
     * 
     * @return
     */
	List<ClientListing> getUserListing();
	
	/**
	 * 
	 * @return
	 */
	List<ClientListing> getMoniterListing();


    /**
     * 
     * @param userId
     * @param formSet
     */
	void updateClientForSet(String userId, int formSet);
	
	/**
	 * 
	 * @param userId
	 * @param formSet
	 */
	void updateClientSetFlag(String userId, int formSet);



    /**
     * 
     * @param staus1
     * @param staus2
     * @param staus3
     * @param staus4
     * @param staus5
     * @param staus6
     * @param staus7
     * @param staus8
     * @param staus9
     * @param form
     * @param clientId
     * @param flag
     */
	void updateFormValue(int staus1, int staus2, int staus3, int staus4,
			int staus5, int staus6, int staus7, int staus8,int staus9,
			MonitoringFormsEdit form, Integer clientId,Integer flag);



    /**
     * 
     * @param flag
     * @param clientId
     * @return
     */
	List<HNPTable> getFlagValue(int flag, Integer clientId);



    /**
     * 
     * @param clientId
     * @return
     */
	List<MoniterListing> getListMoniter(Integer clientId);



    /**
     * 
     * @param uId
     * @return
     */
	List<ClientListing> getUserEmail(String uId);



    /**
     * 
     * @param uId
     * @return
     */
	int selectSetId(String uId);



	List<HNPTable> getSelfQuestionnaire();



	void insertSelfExamineAnswer(SelfExamine form, Integer clientId, int sizeList);



	List<ClientListing> getSelfExamine(Integer clientId);



	void setUpdateStatus(Integer clientId, int i);
	List<ClientListing> getUpdateStatus(Integer clientId);



	void setUpdateStatusByUID(String userId);



	List<ClientListing> getClientListingByUserId(Integer userId);



	List<DisabilityReportInfo> getDisabilityReportInfo(Integer clientId);



	ClientListingResult getClientListingByUsername(SearchCriteria criteria);



	ClientListing getUserSetFlag(Integer integer);



	void updateAssesmentSys(String userId, String comments, String comment1, String comment2, String comment3, String comment4, String comment5);




	

}
