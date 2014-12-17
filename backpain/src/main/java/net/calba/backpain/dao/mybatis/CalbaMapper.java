package net.calba.backpain.dao.mybatis;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import net.calba.backpain.model.CategoryList;
import net.calba.backpain.model.ClientFormSet;
import net.calba.backpain.model.ClientListing;
import net.calba.backpain.model.DisabilityReportInfo;
import net.calba.backpain.model.ExamineRecord;
import net.calba.backpain.model.HNPLOOKUP;
import net.calba.backpain.model.HistoryFactor;
import net.calba.backpain.model.MoniterListing;
import net.calba.backpain.model.QuestionScore;
import net.calba.backpain.model.SearchCriteria;

public interface CalbaMapper {
	
	
	/**
	 * Get ClientListing list base on given SearchCriteria.
	 * @param criteria value
	 * @return List<ClientListing> value
	 */
	List<ClientListing> selectClientListing(SearchCriteria criteria);
	
	
	/**
	 * 
	 * @param date
	 * @return
	 */
	List<ClientListing> selectByDate(Date date);
	
	/**
	 * Get ClientListing by given id.
	 * @param clientId value
	 * @return ClientListing value
	 */
	ClientListing selectClientById(Integer clientId);
	
	/**
	 *  Get Client Report question answer score with given parameter map
	 *  which contains clientId and reportId.
	 * @param map  Map
	 * @return Map
	 */
	List<QuestionScore> selectClientReportScoreListing(Map map);
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	List<QuestionScore> selectClientQuestionId(Map map);
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	List<QuestionScore> selectMaxScore(Map map);
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	List<QuestionScore> updateReportScore(Map map);

	/**
	 * 
	 * @param map
	 * @return
	 */
	List selectHistoryFactorListing(Map<String, Integer> map);
	/**
	 * 
	 * @param map
	 * @return
	 */
	List selectHNPValue(Map<String, Integer> map);

	/**
	 * 
	 * @param map
	 * @param map1
	 */
	void updateHistoryFactor(Map<String, Integer> map, Map<String, Float> map1);

    /**
     * 
     * @param history
     */
	void updateHistoryFactor(HistoryFactor history);
	/**
	 * 
	 * @param lookup
	 */
	void updateValuesHnp(HNPLOOKUP lookup);

    /**
     * 
     * @param map
     * @return
     */
	List selectHistoryData(Map<String, String> map);

    /**
     * 
     * @param map
     * @return
     */
	List selectHistoryVal(Map<String, String> map);

    /**
     * 
     * @param map
     * @return
     */
	List selectSetForms(Map<String, Integer> map);

    /**
     * 
     * @return
     */
	List<ClientListing> selectUser();

    /**
     * 
     * @param formset
     */
	void updateClientSet(ClientFormSet formset);

    /**
     * 
     * @return
     */
	List<ClientListing> selectMoniterList();

    /**
     * 
     * @param formset
     */
	void updateClientSetFlag(ClientFormSet formset);

    /**
     * 
     * @param map
     * @return
     */
	List<ClientListing> selectQuestionFormMoniter(Map<String, Integer> map);

    /**
     * 
     * @param map
     */
	void insertToMoniterFormQuestion(Map<String, Integer> map);

    /**
     * 
     * @param map
     */
	void updateMoniterFormQuestion(Map<String, Integer> map);

    /**
     * 
     * @param map
     * @return
     */
	List selectFlagValue(Map<String, Integer> map);

    /**
     * 
     * @param map
     * @return
     */
	List<MoniterListing> getListMoniter(Map<String, Integer> map);

    /**
     * 
     * @param map
     * @return
     */
	List<ClientListing> selectEmailList(Map<String, Integer> map);

    /**
     * 
     * @param map
     * @return
     */
	int selectSetId(Map<String, Integer> map);


	List selectFormQuestions();


	List<ClientListing> selectExamineData(ExamineRecord record);


	void insertToExamineAnswer(ExamineRecord record);


	void updateinsertToExamineAnswer(ExamineRecord record);


	List selectSelfExamineData(Map<String, Integer> map);


	void UpdateClientDisbilityStatus(Map<String, Integer> map);


	List selectClientDisbilityStatus(Map<String, Integer> map);


	void UpdateClientDisbilityStatusByUID(Map<String, Integer> map);


	List<ClientListing> selectClientByUserId(Integer clientId);


	List<DisabilityReportInfo> selectDisabilityReportInfo(Integer clientId);


	List<ClientListing> selectClientListingByUsername(SearchCriteria criteria);


	ClientListing selectUserFormSetFlag(Integer userid);


	void UpdateClientAssesmentStatus(ClientListing cl);


	


	



}
