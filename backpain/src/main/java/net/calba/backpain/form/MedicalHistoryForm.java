package net.calba.backpain.form;

import org.hibernate.validator.constraints.NotEmpty;

public class MedicalHistoryForm extends BaseForm {
	
	public static final int QUESTION_10 = 10;
	
	public static final int QUESTION_12 = 12;
	
	public static final int QUESTION_13 = 13;
	
	public static final int QUESTION_110 = 110;
	
	public static final int QUESTION_112 = 112;
	
	public static final int QUESTION_114 = 114;
	
	public static final int QUESTION_116 = 116;
	
	public static final int QUESTION_118 = 118;
	
	private Integer clientId;
	
	@NotEmpty(message="Please provide answer")
	private String question1 = "";
	@NotEmpty(message="Please provide answer")
	private String question2 = "";
	@NotEmpty(message="Please provide answer")
	private String question3 = "";
	
	private String[] question110 = {};
	
	private String question111 = "";
	
	@NotEmpty(message="Please provide answer")
	private String question4 = "";
	
	private String[] question112 = {};
	
	private String question113 = "";
	
	@NotEmpty(message="Please provide answer")
	private String question5 = "";
	
	private String[] question114 = {};
	
	private String question115 = "";
	
	@NotEmpty(message="Please provide answer")
	private String question6 = "";
	
	private String[] question116 = {};
	
	private String question117 = "";
	
	
	@NotEmpty(message="Please provide answer")
	private String question7 = "";
	
	private String[] question118 = {};
	
	private String question119 = "";
	
	
	@NotEmpty(message="Please provide answer")
	private String question8 = "";
	
	private String question9 = "";
	
	private String[] question10 = {};
	
	/**
	 * child  question of  question10.
	 */
	private String question11 = "";
	
	@NotEmpty(message="Please provide answer")
	private String[] question12 = {};
	
	
	private String[] question13 = {};
	
	@NotEmpty(message="Please provide answer")
	private String question14 = "";
	
	
	private String sendMessage;
	
	
	public MedicalHistoryForm() {
		super();
	}
	
	public MedicalHistoryForm(Integer clientFormId) {
		super(clientFormId);	
	}
	
	
	
	/**
	 * @return the clientId
	 */
	public final Integer getClientId() {
		return clientId;
	}

	/**
	 * @param clientId the clientId to set
	 */
	public final void setClientId(Integer clientId) {
		this.clientId = clientId;
	}

	public String getQuestion1() {
		return question1;
	}
	public void setQuestion1(String question1) {
		this.question1 = question1;
	}
	public String getQuestion2() {
		return question2;
	}
	public void setQuestion2(String question2) {
		this.question2 = question2;
	}
	
	
	public String getQuestion3() {
		return question3;
	}
	public void setQuestion3(String question3) {
		this.question3 = question3;
	}
	public String getQuestion4() {
		return question4;
	}
	public void setQuestion4(String question4) {
		this.question4 = question4;
	}
	public String getQuestion5() {
		return question5;
	}
	public void setQuestion5(String question5) {
		this.question5 = question5;
	}
	public String getQuestion6() {
		return question6;
	}
	public void setQuestion6(String question6) {
		this.question6 = question6;
	}
	public String getQuestion7() {
		return question7;
	}
	public void setQuestion7(String question7) {
		this.question7 = question7;
	}
	public String getQuestion8() {
		return question8;
	}
	public void setQuestion8(String question8) {
		this.question8 = question8;
	}		
	
	public String getQuestion9() {
		return question9;
	}
	public void setQuestion9(String question9) {
		this.question9 = question9;
	}
	
	public String[] getQuestion10() {
		return question10;
	}
	public void setQuestion10(String[] question10) {
		this.question10 = question10;
	}	
	public String getQuestion11() {
		return question11;
	}
	public void setQuestion11(String question11) {
		this.question11 = question11;
	}
	
	public String[] getQuestion12() {
		return question12;
	}
	public void setQuestion12(String[] question12) {
		this.question12 = question12;
	}
	public String[] getQuestion13() {
		return question13;
	}
	public void setQuestion13(String[] question13) {
		this.question13 = question13;
	}
	public String getQuestion14() {
		return question14;
	}
	public void setQuestion14(String question14) {
		this.question14 = question14;
	}
	
	
	
	public String[] getQuestion110() {
		return question110;
	}

	public void setQuestion110(String[] question110) {
		this.question110 = question110;
	}

	public String getQuestion111() {
		return question111;
	}

	public void setQuestion111(String question111) {
		this.question111 = question111;
	}

	public String[] getQuestion112() {
		return question112;
	}

	public void setQuestion112(String[] question112) {
		this.question112 = question112;
	}

	public String getQuestion113() {
		return question113;
	}

	public void setQuestion113(String question113) {
		this.question113 = question113;
	}
	

	public String[] getQuestion114() {
		return question114;
	}

	public void setQuestion114(String[] question114) {
		this.question114 = question114;
	}

	public String getQuestion115() {
		return question115;
	}

	public void setQuestion115(String question115) {
		this.question115 = question115;
	}

	public String[] getQuestion116() {
		return question116;
	}

	public void setQuestion116(String[] question116) {
		this.question116 = question116;
	}

	public String getQuestion117() {
		return question117;
	}

	public void setQuestion117(String question117) {
		this.question117 = question117;
	}

	public String[] getQuestion118() {
		return question118;
	}

	public void setQuestion118(String[] question118) {
		this.question118 = question118;
	}

	public String getQuestion119() {
		return question119;
	}

	public void setQuestion119(String question119) {
		this.question119 = question119;
	}
	
	

	public String getSendMessage() {
		return sendMessage;
	}

	public void setSendMessage(String sendMessage) {
		this.sendMessage = sendMessage;
	}

	@Override
	public String toString() {
		return "MedicalHistoryForm [question1=" + question1 + ", question2="
				+ question2 + ", question3=" + question3 + ", question4="
				+ question4 + ", question5=" + question5 + ", question6="
				+ question6 + ", question7=" + question7 + ", question8="
				+ question8 + "]";
	}
	
	
	
	
	
	

}
