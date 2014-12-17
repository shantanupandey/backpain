package net.calba.backpain.form;

import org.hibernate.validator.constraints.NotEmpty;

public class BackPain2Form extends BaseForm {
	
	public static final int QUESTION_52 = 52;
	
	private Integer clientId;
	
	@NotEmpty(message="Please provide answer")
	private String question50 = "";
	@NotEmpty(message="Please provide answer")
	private String question51 = "";
	/* Question 51 child */
	private String[] question52 = {};	
	
	@NotEmpty(message="Please provide answer")
	private String question53 = "";	
	
	private String question54 = "";
	
	private String question55 = "";
	@NotEmpty(message="Please provide answer")
	private String question56 = "";
	@NotEmpty(message="Please provide answer")
	private String question57 = "";
	@NotEmpty(message="Please provide answer")
	private String question58 = "";	
	@NotEmpty(message="Please provide answer")
	private String question59 = "";	
	@NotEmpty(message="Please provide answer")
	private String question60 = "";
	@NotEmpty(message="Please provide answer")
	private String question61 = "";
	@NotEmpty(message="Please provide answer")
	private String question417 = "";
	private String question434 = "";
	
	@NotEmpty(message="Please provide answer")
	private String question25 = "";
	@NotEmpty(message="Please provide answer")
	private String question26 = "";
	@NotEmpty(message="Please provide answer")
	private String question27 = "";
	
	private String question505="";
	
	private String sendMessage;
	
	
	public String getSendMessage() {
		return sendMessage;
	}

	public void setSendMessage(String sendMessage) {
		this.sendMessage = sendMessage;
	}

	public String getQuestion25() {
		return question25;
	}

	public void setQuestion25(String question25) {
		this.question25 = question25;
	}

	public String getQuestion26() {
		return question26;
	}

	public void setQuestion26(String question26) {
		this.question26 = question26;
	}

	public String getQuestion27() {
		return question27;
	}

	public void setQuestion27(String question27) {
		this.question27 = question27;
	}

	public BackPain2Form() {
		super();
	}
	
	public BackPain2Form(Integer clientFormId) {
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

	public String getQuestion50() {
		return question50;
	}

	public void setQuestion50(String question50) {
		this.question50 = question50;
	}

	public String getQuestion51() {
		return question51;
	}

	public void setQuestion51(String question51) {
		this.question51 = question51;
	}

	public String[] getQuestion52() {
		return question52;
	}

	public void setQuestion52(String[] question52) {
		this.question52 = question52;
	}

	public String getQuestion53() {
		return question53;
	}

	public void setQuestion53(String question53) {
		this.question53 = question53;
	}

	public String getQuestion54() {
		return question54;
	}

	public void setQuestion54(String question54) {
		this.question54 = question54;
	}

	public String getQuestion55() {
		return question55;
	}

	public void setQuestion55(String question55) {
		this.question55 = question55;
	}

	public String getQuestion56() {
		return question56;
	}

	public void setQuestion56(String question56) {
		this.question56 = question56;
	}

	public String getQuestion57() {
		return question57;
	}

	public void setQuestion57(String question57) {
		this.question57 = question57;
	}

	public String getQuestion58() {
		return question58;
	}

	public void setQuestion58(String question58) {
		this.question58 = question58;
	}

	public String getQuestion59() {
		return question59;
	}

	public void setQuestion59(String question59) {
		this.question59 = question59;
	}

	public String getQuestion60() {
		return question60;
	}

	public void setQuestion60(String question60) {
		this.question60 = question60;
	}

	public String getQuestion61() {
		return question61;
	}

	public String getQuestion417() {
		return question417;
	}

	public void setQuestion417(String question417) {
		this.question417 = question417;
	}

	public void setQuestion61(String question61) {
		this.question61 = question61;
	}

	public String getQuestion434() {
		return question434;
	}

	public void setQuestion434(String question434) {
		this.question434 = question434;
	}

	public String getQuestion505() {
		return question505;
	}

	public void setQuestion505(String question505) {
		this.question505 = question505;
	}


}
