package net.calba.backpain.service.impl;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.TreeSet;

import net.calba.backpain.Util;
import net.calba.backpain.dao.mybatis.CalbaMapper;
import net.calba.backpain.dao.mybatis.ClientMapper;
import net.calba.backpain.dao.mybatis.PersonalDetailsMapper;
import net.calba.backpain.dao.mybatis.QuestionAnswerMapper;
import net.calba.backpain.dao.mybatis.QuestionGroupMapper;
import net.calba.backpain.dao.mybatis.QuestionMapper;
import net.calba.backpain.dao.mybatis.ReportMapper;
import net.calba.backpain.model.CategoryList;
import net.calba.backpain.model.Client;
import net.calba.backpain.model.ClientDetails;
import net.calba.backpain.model.ClientExample;
import net.calba.backpain.model.ClientFormSet;
import net.calba.backpain.model.ClientListing;
import net.calba.backpain.model.ClientListingResult;
import net.calba.backpain.model.DisabilityReportInfo;
import net.calba.backpain.model.ExamineRecord;
import net.calba.backpain.model.FormQuestionClient;
import net.calba.backpain.model.HNPLOOKUP;
import net.calba.backpain.model.HNPTable;
import net.calba.backpain.model.HistoryFactor;
import net.calba.backpain.model.MoniterListing;
import net.calba.backpain.model.MonitoringFormsEdit;
import net.calba.backpain.model.Project;
import net.calba.backpain.model.ProjectExample;
import net.calba.backpain.model.Question;
import net.calba.backpain.model.QuestionAnswer;
import net.calba.backpain.model.QuestionAnswerExample;
import net.calba.backpain.model.QuestionAnswerExample.Criteria;
import net.calba.backpain.model.QuestionExample;
import net.calba.backpain.model.QuestionGroup;
import net.calba.backpain.model.QuestionGroupExample;
import net.calba.backpain.model.QuestionScore;
import net.calba.backpain.model.Report;
import net.calba.backpain.model.SearchCriteria;
import net.calba.backpain.model.SelfExamine;
import net.calba.backpain.service.AdminService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	ClientMapper clientMapper;

	@Autowired
	PersonalDetailsMapper personalDetailsMapper;

	@Autowired
	CalbaMapper calbaMapper;

	@Autowired
	QuestionMapper questionMapper;

	@Autowired
	QuestionGroupMapper questionGroupMapper;

	@Autowired
	QuestionAnswerMapper questionAnswerMapper;

	@Autowired
	ReportMapper reportMapper;

	public ClientListingResult getClientListing(SearchCriteria criteria) {
		ClientListingResult result;

		int totalResult = clientMapper.countByExample(new ClientExample());
		List<ClientListing> clientList = calbaMapper
				.selectClientListing(criteria);
		result = new ClientListingResult(clientList, criteria.getPageId(),
				totalResult);
		return result;
	}

	public ClientListing getClientListingById(Integer clientId) {
		return calbaMapper.selectClientById(clientId);
	}
	public List<ClientListing> getClientListingByUserId(Integer clientId) {
//		System.out.println("inside adminservice==="+clientId);
		List<ClientListing> clientList = calbaMapper.selectClientByUserId(clientId);
		return clientList;
	}
	public ClientListingResult getClientListingByUsername(SearchCriteria criteria){
		ClientListingResult result;

	
		List<ClientListing> clientList = calbaMapper
				.selectClientListingByUsername(criteria);
		result = new ClientListingResult(clientList);
		return result;
	}
	public List<Question> getQuestionListing(Integer pageId) {
		pageId = (pageId == null || pageId == 0 ? 1 : pageId);
		int offset = (pageId - 1) * Util.PAGE_SIZE;
		Map<String, Integer> parameters = new HashMap<String, Integer>();
		parameters.put("offset", offset);
		parameters.put("pageSize", Util.PAGE_SIZE);

		return questionMapper.selectQuestionListing(parameters);
	}

	public Question getQuestionById(Integer questionId) {
		return questionMapper.selectByPrimaryKey(questionId);
	}

	public Question getMaxScoreById(Integer questionId) {
		return questionMapper.selectByPrimaryKey(questionId);
	}

	public void saveQuestion(Question question) {

		questionMapper.updateByPrimaryKey(question);

		QuestionAnswer record = new QuestionAnswer();
		record.setQuestionOptionId(Integer.toString(question.getQuestionId()));

		record.setScore(question.getMaxScore());

		QuestionAnswerExample example = new QuestionAnswerExample();

	}

	public QuestionGroup getQuestionGroup(Integer questionGroupId) {
		return questionGroupMapper.selectByPrimaryKey(questionGroupId);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * net.calba.backpain.service.AdminService#getReportQuestionListing(java
	 * .lang.Integer)
	 */
	public Report getReportQuestionListing(Integer reportId) {
		Report report = null;

		if (reportId == null || reportId <= 0)
			return report;

		List<QuestionGroup> questionGroups;
		List<Question> questions;
		TreeSet<Question> allQuestionList;

		report = reportMapper.selectByPrimaryKey(new Long(reportId));
		System.out.println("report=="+report.toString());
		if (report != null) {

			QuestionGroupExample groupExample = new QuestionGroupExample();
			groupExample.createCriteria().andReportIdEqualTo(reportId);
			questionGroups = questionGroupMapper.selectByExample(groupExample);
			
			for(int i=0;i<questionGroups.size();i++){
				System.out.println("seee"+questionGroups.get(i).getDescription());
			}
			
			report.setQuestionGroups(questionGroups);

			for (QuestionGroup questionGroup : questionGroups) {
				QuestionExample example = new QuestionExample();

				example.createCriteria().andQuestionGroupIdEqualTo(
						questionGroup.getQuestionGroupId());

				questions = questionMapper.selectByExample(example);
				questionGroup.setQuestions(questions);

			}

		}

		return report;
	}

	public Map<String, Integer> getClientReportScore(Integer clientId,
			Integer reportId) {
		Map<String, Integer> map1 = new HashMap<String, Integer>();

		map1.put("clientId", clientId);
		map1.put("reportId", reportId);
		Map<String, Integer> scores = new HashMap<String, Integer>();
		List<QuestionScore> results = calbaMapper
				.selectClientReportScoreListing(map1);

		for (QuestionScore score : results) {

			scores.put(String.valueOf(score.getQuestionId()), score.getScore());

		}

		return scores;
	}

	public Map<String, Integer> getClientScoreAnswer(Integer clientId,
			Integer reportId) {

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("clientId", clientId);
		map.put("reportId", reportId);
		Map<String, Integer> scores = new HashMap<String, Integer>();
		List<QuestionScore> results = calbaMapper
				.selectClientReportScoreListing(map);

		for (QuestionScore score : results) {
			scores.put(String.valueOf(score.getQuestionId()),
					score.getQuestionoptionid());

		}
		return scores;
	}

	public void insertQuestionAnswer(QuestionAnswer records, Integer UserId) {
		QuestionAnswerExample example = new QuestionAnswerExample();

		QuestionAnswerExample.Criteria criteria = example.createCriteria();

		criteria.andQuestionIdEqualTo(records.getQuestionId());
		criteria.andUserIdEqualTo(UserId);

		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
		Calendar cal = Calendar.getInstance();

		String date = dateFormat.format(cal.getTime());

		records.setDateVal(date);

		List<QuestionAnswer> results = questionAnswerMapper
				.selectExample(example);
System.out.println("results:"+records.getAnswerText()+"==888=="+records.getScore());
		/* Commented functionality for generating reports only one for each user */
		if (results.size() == 0) {

			questionAnswerMapper.insert(records);
		} else {

			questionAnswerMapper.updateByExample(records, example);
		}

		questionAnswerMapper.insertmasterAnswerTable(records);

	}

	private Criteria extracted(Criteria criteria) {
		return criteria;
	}

	public List<ClientListing> getUserListing(Date date) {

		List<ClientListing> clientList = calbaMapper.selectByDate(date);

		return clientList;
	}

	public void updateReport(String userId) {

		// For scores
		Map<String, Integer> map = new HashMap<String, Integer>();
		Map<String, Integer> map1 = new HashMap<String, Integer>();
		Map<String, Integer> map2 = new HashMap<String, Integer>();
		int clientId = Integer.parseInt(userId);
		map.put("clientId", clientId);
		map.put("reportId", 1);
		Map<String, Integer> scores = new HashMap<String, Integer>();
		List<QuestionScore> results = calbaMapper.selectClientQuestionId(map);

		for (int i = 0; i < results.size(); i++) {

			String questionId = results.get(i).getAnswertext();

			int questionIdVal = results.get(i).getQuestionId();

			String val = results.get(i).getAnswertext().toString();
			if (questionIdVal == 261 || questionIdVal == 262) {

				if (val.equals("No Pain") || val == "No Pain") {
					questionId = "355";
				} else if (val.equals("Diffuse Pain") || val == "Diffuse Pain") {
					questionId = "356";
				} else if (val.equals("Sharp, localised pain")
						|| val == "Sharp, localised pain") {
					questionId = "357";
				} else if (val
						.equals("Shooting pain along clearly-defined track")
						|| val == "Shooting pain along clearly-defined track") {
					questionId = "358";
				} else if (val.equals("Burning pain") || val == "Burning pain") {
					questionId = "359";
				} else if (val.equals("Other") || val == "Other") {
					questionId = "360";
				} else if (val.equals("Cannot remember")
						|| val == "Cannot remember") {
					questionId = "361";
				}

			} else if (questionIdVal == 266 || questionIdVal == 270) {

				if (val.equals("No Pain") || val == "No Pain") {
					questionId = "362";
				} else if (val.equals("Diffuse Pain") || val == "Diffuse Pain") {
					questionId = "363";
				} else if (val.equals("Sharp, localised pain")
						|| val == "Sharp, localised pain") {
					questionId = "364";
				} else if (val
						.equals("Shooting pain along clearly-defined track")
						|| val == "Shooting pain along clearly-defined track") {
					questionId = "365";
				} else if (val.equals("Burning pain") || val == "Burning pain") {
					questionId = "366";
				} else if (val.equals("Other") || val == "Other") {
					questionId = "367";
				} else if (val.equals("Cannot remember")
						|| val == "Cannot remember") {
					questionId = "368";
				}

			} else if (questionIdVal == 267 || questionIdVal == 271) {

				if (val.equals("No Pain") || val == "No Pain") {
					questionId = "369";
				} else if (val.equals("Diffuse Pain") || val == "Diffuse Pain") {
					questionId = "370";
				} else if (val.equals("Sharp, localised pain")
						|| val == "Sharp, localised pain") {
					questionId = "371";
				} else if (val
						.equals("Shooting pain along clearly-defined track")
						|| val == "Shooting pain along clearly-defined track") {
					questionId = "372";
				} else if (val.equals("Burning pain") || val == "Burning pain") {
					questionId = "373";
				} else if (val.equals("Other") || val == "Other") {
					questionId = "374";
				} else if (val.equals("Cannot remember")
						|| val == "Cannot remember") {
					questionId = "375";
				}

			} else if (questionIdVal == 268 || questionIdVal == 272) {

				if (val.equals("No Pain") || val == "No Pain") {
					questionId = "376";
				} else if (val.equals("Diffuse Pain") || val == "Diffuse Pain") {
					questionId = "377";
				} else if (val.equals("Sharp, localised pain")
						|| val == "Sharp, localised pain") {
					questionId = "378";
				} else if (val
						.equals("Shooting pain along clearly-defined track")
						|| val == "Shooting pain along clearly-defined track") {
					questionId = "379";
				} else if (val.equals("Burning pain") || val == "Burning pain") {
					questionId = "380";
				} else if (val.equals("Other") || val == "Other") {
					questionId = "381";
				} else if (val.equals("Cannot remember")
						|| val == "Cannot remember") {
					questionId = "382";
				}

			} else if (questionIdVal == 263 || questionIdVal == 264) {

				if (val.equals("No Pain") || val == "No Pain") {
					questionId = "383";
				} else if (val.equals("Diffuse Pain") || val == "Diffuse Pain") {
					questionId = "384";
				} else if (val.equals("Sharp, localised pain")
						|| val == "Sharp, localised pain") {
					questionId = "385";
				} else if (val
						.equals("Shooting pain along clearly-defined track")
						|| val == "Shooting pain along clearly-defined track") {
					questionId = "386";
				} else if (val.equals("Burning pain") || val == "Burning pain") {
					questionId = "387";
				} else if (val.equals("Other") || val == "Other") {
					questionId = "388";
				} else if (val.equals("Cannot remember")
						|| val == "Cannot remember") {
					questionId = "389";
				}

			} else if (questionIdVal == 265 || questionIdVal == 269) {

				if (val.equals("No Pain") || val == "No Pain") {
					questionId = "390";
				} else if (val.equals("Diffuse Pain") || val == "Diffuse Pain") {
					questionId = "391";
				} else if (val.equals("Sharp, localised pain")
						|| val == "Sharp, localised pain") {
					questionId = "392";
				} else if (val
						.equals("Shooting pain along clearly-defined track")
						|| val == "Shooting pain along clearly-defined track") {
					questionId = "393";
				} else if (val.equals("Burning pain") || val == "Burning pain") {
					questionId = "394";
				} else if (val.equals("Other") || val == "Other") {
					questionId = "395";
				} else if (val.equals("Cannot remember")
						|| val == "Cannot remember") {
					questionId = "396";
				}

			} else if (questionIdVal == 14) {

				if (val.equals("No") || val == "No") {
					questionId = "497";
				} else if (val.equals("Bladder Only") || val == "Bladder Only") {
					questionId = "498";
				} else if (val.equals("Bowel Only") || val == "Bowel Only") {
					questionId = "499";
				} else if (val.equals("Bladder & Bowel")
						|| val == "Bladder & Bowel") {
					questionId = "500";
				}

			}

			map1.put("questionId", Integer.parseInt(questionId));

			if (!questionId.equals("0")) {

				List<QuestionScore> maxScore = calbaMapper.selectMaxScore(map1);

				// Updating main report table via dry run button

				map2.put("reportUserId", Integer.parseInt(userId));
				map2.put("reportQueScore", maxScore.get(0).getMax_score());
				map2.put("reportQueId", questionIdVal);

				calbaMapper.updateReportScore(map2);

				// End updating vida dry run button
			}
		}

		// End for scores

	}

	public void updateNullValue() {
		questionAnswerMapper.updateNullValues();

	}

	public List getHnpTableData() {
		List myList = new ArrayList();
		myList = questionAnswerMapper.getHnpTableValue();

		return myList;
	}

	public List getHnpHistoryTableData() {
		List myList = new ArrayList();
		myList = questionAnswerMapper.getHnpHistoryTableValue();

		return myList;
	}

	public List getHnpHistoryPastData() {
		List myList = new ArrayList();
		myList = questionAnswerMapper.getHnpHistoryPastValue();

		return myList;
	}

	public List getHnpHistory1to2year() {
		List myList = new ArrayList();
		myList = questionAnswerMapper.getHnpHistory1to2Value();

		return myList;
	}

	public List getHnpHistory3to5year() {
		List myList = new ArrayList();
		myList = questionAnswerMapper.getHnpHistory3to5Value();

		return myList;
	}

	public List getHnpHistory5year() {
		List myList = new ArrayList();
		myList = questionAnswerMapper.getHnpHistory5Value();

		return myList;
	}

	public List gethistoryFactor(Integer codeId) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("codeId", codeId);
		List myList = new ArrayList();

		myList = calbaMapper.selectHistoryFactorListing(map);

		return myList;
	}

	public void updateHnpFactors(Integer code, float acute, float early,
			float early_mid, float late_mid, float late, float recovered,
			float dd1, float dd2) {

		Map<String, Integer> map = new HashMap<String, Integer>();
		Map<String, Float> map1 = new HashMap<String, Float>();

		HistoryFactor history = new HistoryFactor();

		map.put("code", code);
		map1.put("acute", acute);
		map1.put("early", early);

		map1.put("early_mid", early_mid);
		map1.put("late_mid", late_mid);
		map1.put("late", late);
		map1.put("recovered", recovered);
		map1.put("dd1", dd1);
		map1.put("dd2", dd2);

		history.setCode(code);
		history.setAcute(acute);
		history.setEarly(early);
		history.setEarly_mid(early_mid);
		history.setLate_mid(late_mid);
		history.setLate(late);
		history.setRecovered(recovered);
		history.setDd1(dd1);
		history.setDd2(dd2);

		// calbaMapper.updateHistoryFactor(map,map1);
		calbaMapper.updateHistoryFactor(history);

	}

	public List getHnpHistoryData(String firstColumn, String secondColumn,
			String thirdColumn) {
		Map<String, String> map = new HashMap<String, String>();

		map.put("firstColumn", firstColumn);
		map.put("secondColumn", secondColumn);
		map.put("thirdColumn", thirdColumn);
		
		List myList = new ArrayList();
		
		System.out.println("first column..............."+firstColumn);
		System.out.println("secondColumn column..............."+secondColumn);
		System.out.println("thirdColumn column..............."+thirdColumn);
		myList = calbaMapper.selectHistoryData(map);

		return myList;
	}

	public List<HNPTable> getHNPValue(Integer questionId) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("id", questionId);
		List myList = new ArrayList();

		myList = calbaMapper.selectHNPValue(map);

		return myList;
	}

	public void updateHNPLookup(Integer id, float acute, float early,
			float early_mid, float late_mid, float late, float recovered,
			float chronic, float consult) {

		Map<String, Integer> map = new HashMap<String, Integer>();
		Map<String, Float> map1 = new HashMap<String, Float>();

		HNPLOOKUP history = new HNPLOOKUP();

		map.put("id", id);
		map1.put("acute", acute);
		map1.put("early", early);

		map1.put("early_mid", early_mid);
		map1.put("late_mid", late_mid);
		map1.put("late", late);
		map1.put("recovered", recovered);
		map1.put("chronic", chronic);
		map1.put("consult", consult);

		history.setId(id);
		history.setAcute(acute);
		history.setEarly(early);
		history.setEarly_mid(early_mid);
		history.setLate_mid(late_mid);
		history.setLate(late);
		history.setRecovered(recovered);
		history.setChronic(chronic);
		history.setConsult(consult);

		// calbaMapper.updateHistoryFactor(map,map1);
		calbaMapper.updateValuesHnp(history);

	}

	public List getHnpHistoryValue(String firstColumn, String secondColumn) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();

		map.put("firstColumn", firstColumn);
		map.put("secondColumn", secondColumn);

		List myList = new ArrayList();
		myList = calbaMapper.selectHistoryVal(map);

		return myList;
	}

	public List<HNPTable> getSetForms(int param) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("setid", param);
		List myList = new ArrayList();

		myList = calbaMapper.selectSetForms(map);

		return myList;
	}

	public List<ClientListing> getUserListing() {
		List<ClientListing> clientList = calbaMapper.selectUser();

		return clientList;
	}
	public ClientListing getUserSetFlag(Integer userid){
		Client client= new Client();
		client.setClientId(userid);
		ClientListing clientList = calbaMapper.selectUserFormSetFlag(userid);
		System.out.println("clientList=="+clientList.getFormSetFlag());
		return clientList;
	}
	public List<ClientListing> getMoniterListing() {

		List<ClientListing> moniterList = calbaMapper.selectMoniterList();

		return moniterList;
	}

	public void updateClientForSet(String userId, int formSet) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		Map<String, String> map1 = new HashMap<String, String>();

		ClientFormSet formset = new ClientFormSet();

		formset.setFormSet(formSet);
		formset.setUserId(userId);

		calbaMapper.updateClientSet(formset);

	}

	public void updateClientSetFlag(String userId, int SetFlag) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		Map<String, String> map1 = new HashMap<String, String>();

		int uId = Integer.parseInt(userId);
		ClientFormSet formset = new ClientFormSet();

		formset.setFormSetFlag(SetFlag);
		formset.setClinetid(uId);

		calbaMapper.updateClientSetFlag(formset);
	}

	public void updateFormValue(int staus1, int staus2, int staus3, int staus4,
			int staus5, int staus6, int staus7, int staus8, int staus9,
			MonitoringFormsEdit form, Integer clientId, Integer flag) {

		Map<String, Integer> question = new HashMap<String, Integer>();
		question.put(form.getQue1(), staus1);
		question.put(form.getQue2(), staus2);
		question.put(form.getQue3(), staus3);
		question.put(form.getQue4(), staus4);
		question.put(form.getQue5(), staus5);
		question.put(form.getQue6(), staus6);
		question.put(form.getQue7(), staus7);
		question.put(form.getQue8(), staus8);
		question.put(form.getQue9(), staus9);

		Map<String, Integer> map = new HashMap<String, Integer>();

		for (Map.Entry<String, Integer> e : question.entrySet()) {

			map.put("questionID", Integer.parseInt(e.getKey()));
			map.put("clientId", clientId);

			List<ClientListing> moniterList = calbaMapper
					.selectQuestionFormMoniter(map);

			if (moniterList.size() == 0) {

				map.put("userid", clientId);
				map.put("questionid", Integer.parseInt(e.getKey()));
				map.put("setid", flag);
				map.put("flag", e.getValue());

				calbaMapper.insertToMoniterFormQuestion(map);
			} else {

				map.put("userid", clientId);
				map.put("questionid", Integer.parseInt(e.getKey()));
				map.put("setid", flag);
				map.put("flag", e.getValue());

				calbaMapper.updateMoniterFormQuestion(map);

			}
		}

	}

	public List<HNPTable> getFlagValue(int flag, Integer clientId) {
		Map<String, Integer> map = new HashMap<String, Integer>();

		map.put("flag", flag);
		map.put("clientId", clientId);

		List myList = new ArrayList();
		myList = calbaMapper.selectFlagValue(map);

		return myList;
	}

	public List<MoniterListing> getListMoniter(Integer clientId) {
		Map<String, Integer> map = new HashMap<String, Integer>();

		map.put("clientId", clientId);

		List<MoniterListing> moniterList = calbaMapper.getListMoniter(map);

		return moniterList;
	}

	public List<ClientListing> getUserEmail(String uId) {

		Map<String, Integer> map = new HashMap<String, Integer>();

		map.put("clinetid", Integer.parseInt(uId));
		List<ClientListing> emailList = calbaMapper.selectEmailList(map);

		return emailList;
	}

	public int selectSetId(String uId) {
		Map<String, Integer> map = new HashMap<String, Integer>();

		map.put("clinetid", Integer.parseInt(uId));
		int setList = calbaMapper.selectSetId(map);

		return setList;
	}

	public List<HNPTable> getSelfQuestionnaire() {
		List myList = new ArrayList();

		myList = calbaMapper.selectFormQuestions();

		return myList;
	}

	public void insertSelfExamineAnswer(SelfExamine form,Integer clientId,int sizeList) {
		
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss",Locale.UK);
//		Calendar cal = Calendar.getInstance();
		dateFormat.setTimeZone(TimeZone.getTimeZone("GMT+1"));
		long now = System.currentTimeMillis();
//		String date = dateFormat.format(now);
		String date =dateFormat.format(GregorianCalendar.getInstance().getTime());
		System.out.println(dateFormat.format(GregorianCalendar.getInstance().getTime()));
		if(form.isIsquestion1()){
			form.setQuestion1("1");
		}else{
			form.setQuestion1("0");
		}
		
		if(form.isIsquestion2()){
			form.setQuestion2("1");
		}else{
			form.setQuestion2("0");
		}
		
		if(form.isIsquestion3()){
			form.setQuestion3("1");
		}else{
			form.setQuestion3("0");
		}
		
		if(form.isIsquestion4()){
			form.setQuestion4("1");
		}else{
			form.setQuestion4("0");
		}
		
		if(form.isIsquestion5()){
			form.setQuestion5("1");
		}else{
			form.setQuestion5("0");
		}
		
		if(form.isIsquestion6()){
			form.setQuestion6("1");
		}else{
			form.setQuestion6("0");
		}
		
		if(form.isIsquestion7()){
			form.setQuestion7("1");
		}else{
			form.setQuestion7("0");
		}
		
		if(form.isIsquestion8()){
			form.setQuestion8("1");
		}else{
			form.setQuestion8("0");
		}
		
		if(form.isIsquestion9()){
			form.setQuestion9("1");
		}else{
			form.setQuestion9("0");
		}
		
		if(form.isIsquestion10()){
			form.setQuestion10("1");
		}else{
			form.setQuestion10("0");
		}
		
		if(form.isIsquestion11()){
			form.setQuestion11("1");
		}else{
			form.setQuestion11("0");
		}
		
		if(form.isIsquestion12()){
			form.setQuestion12("1");
		}else{
			form.setQuestion12("0");
		}
		if(form.isIsquestion13()){
			form.setQuestion13("1");
		}else{
			form.setQuestion13("0");
		}
		if(form.isIsquestion14()){
			form.setQuestion14("1");
		}else{
			form.setQuestion14("0");
		}
		
		if(form.isIsquestion15()){
			form.setQuestion15("1");
		}else{
			form.setQuestion15("0");
		}
		
		if(form.isIsquestion16()){
			form.setQuestion16("1");
		}else{
			form.setQuestion16("0");
		}
		
		if(form.isIsquestion17()){
			form.setQuestion17("1");
		}else{
			form.setQuestion17("0");
		}
		if(form.isIsquestion18()){
			form.setQuestion18("1");
		}else{
			form.setQuestion18("0");
		}
		
		if(form.isIsquestion19()){
			form.setQuestion19("1");
		}else{
			form.setQuestion19("0");
		}
		
		if(form.isIsquestion20()){
			form.setQuestion20("1");
		}else{
			form.setQuestion20("0");
		}
		
		if(form.isIsquestion21()){
			form.setQuestion21("1");
		}else{
			form.setQuestion21("0");
		}
		
		if(form.isIsquestion22()){
			form.setQuestion22("1");
		}else{
			form.setQuestion22("0");
		}
		
		if(form.isIsquestion23()){
			form.setQuestion23("1");
		}else{
			form.setQuestion23("0");
		}
		
		if(form.isIsquestion24()){
			form.setQuestion24("1");
		}else{
			form.setQuestion24("0");
		}
		
		
		Map<Integer, String> question = new HashMap<Integer, String>();
		question.put(1,form.getQuestion1());
		question.put(2,form.getQuestion2());
		question.put(3,form.getQuestion3());
		question.put(4,form.getQuestion4());
		question.put(5,form.getQuestion5());
		question.put(6,form.getQuestion6());
		question.put(7,form.getQuestion7());
		question.put(8,form.getQuestion8());
		question.put(9,form.getQuestion9());
		question.put(10,form.getQuestion10());
		question.put(11,form.getQuestion11());
		question.put(12,form.getQuestion12());
		question.put(13,form.getQuestion13());
		question.put(14,form.getQuestion14());
		question.put(15,form.getQuestion15());
		question.put(16,form.getQuestion16());
		question.put(17,form.getQuestion17());
		question.put(18,form.getQuestion18());
		question.put(19,form.getQuestion19());
		question.put(20,form.getQuestion20());
		question.put(21,form.getQuestion21());
		question.put(22,form.getQuestion22());
		question.put(23,form.getQuestion23());
		question.put(24,form.getQuestion24());
		
		
		
		
//		System.out.println("value of questions entry set size.."+question.size());
		ExamineRecord record= new ExamineRecord();
		
		for (Map.Entry<Integer, String> e : question.entrySet()) {
           
			
//			System.out.println(question + form.getQuestion1());
			
			record.setId(e.getKey());
			record.setScore(Integer.parseInt(e.getValue()));
			record.setUserId(clientId);
			record.setDate(date);
			

			List<ClientListing> examineList = calbaMapper.selectExamineData(record);
			
//			System.out.println("value of examine list..."+examineList.size());
			
//			if (examineList.size() == 0) {

				record.setId(e.getKey());
				record.setScore(Integer.parseInt(e.getValue()));
				record.setUserId(clientId);
				record.setDate(date);

			    calbaMapper.insertToExamineAnswer(record);
//			} else {

//				record.setId(e.getKey());
//				record.setScore(Integer.parseInt(e.getValue()));
//				record.setUserId(clientId);
//				record.setDate(date);
//
//				calbaMapper.updateinsertToExamineAnswer(record);

//			}

		
		}

		
	
		
		
		
		
	}
	public List<DisabilityReportInfo> getDisabilityReportInfo(Integer clientId){
		List<DisabilityReportInfo> clientList = calbaMapper.selectDisabilityReportInfo(clientId);
		return clientList;
		
	}

	public List<ClientListing> getSelfExamine(Integer clientId) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("clientId", clientId);
		List myList = new ArrayList();

	    myList = calbaMapper.selectSelfExamineData(map);

		return myList;
	}

	public void setUpdateStatus(Integer clientId,int value) {
		// TODO Auto-generated method stub
		Client client=new Client();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("clientId", clientId);
		map.put("score", value);
		calbaMapper.UpdateClientDisbilityStatus(map);

	
	}
	public List<ClientListing> getUpdateStatus(Integer clientId) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("clientId", clientId);
		List<ClientListing> myList = new ArrayList();

	    myList = calbaMapper.selectClientDisbilityStatus(map);

		return myList;
	}
	public void setUpdateStatusByUID(String userID) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("userId", userID);
		map.put("score", 0);
		System.out.println("map==="+map.toString());
		calbaMapper.UpdateClientDisbilityStatusByUID(map);

	
	}

	
//	public void updateAssesmentSys(String userId, String comments) {
//		
//		
//	}

	public void updateAssesmentSys(String userId, String comments,
			String comment1, String comment2, String comment3, String comment4,
			String comment5) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("comments", comments);
		ClientListing cl=new ClientListing();
		cl.setUserId(userId);
		cl.setComment1(comment1);
		cl.setComment2(comment2);
		cl.setComment3(comment3);
		cl.setComment4(comment4);
		cl.setComment5(comment5);
		
		System.out.println("goinf to execute assesment..");
		calbaMapper.UpdateClientAssesmentStatus(cl);
		
	}
	

}
