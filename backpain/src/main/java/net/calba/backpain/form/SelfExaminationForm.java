package net.calba.backpain.form;

import org.hibernate.validator.constraints.NotEmpty;

public class SelfExaminationForm extends BaseForm {
	
	private Integer clientId;
	
	@NotEmpty(message="Please provide answer")
	private String question65 = "";
	
	private String question66 = "";
	@NotEmpty(message="Please provide answer")
	private String question67 = "";
	@NotEmpty(message="Please provide answer")
	private String question68 = "";
	
	private String question69 = "";
	
	private String question70 = "";
	@NotEmpty(message="Please provide answer")
	private String question71 = "";	
	/**
	 * child question of 71.
	 */
	private String question74 = "";	
	@NotEmpty(message="Please provide answer")
	private String question72 = "";
	/**
	 * child question of 72.
	 */
	@NotEmpty(message="Please provide answer")
	private String question23 = "";
	
	private String question73 = "";
	
	private String question434 = "";	
	private String question435 = "";
	
	private String question432 = "";	
	private String question433 = "";
	private String question515 = "";
	private String question516 = "";
	private String sendMessage;
	
	
	
	public SelfExaminationForm() {
		super();
	}
	
	public SelfExaminationForm(Integer clientFormId) {
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

	
	public String getQuestion23() {
		return question23;
	}

	public void setQuestion23(String question23) {
		this.question23 = question23;
	}

	public String getQuestion65() {
		return question65;
	}

	public void setQuestion65(String question65) {
		this.question65 = question65;
	}

	public String getQuestion66() {
		return question66;
	}

	public void setQuestion66(String question66) {
		this.question66 = question66;
	}

	public String getQuestion67() {
		return question67;
	}

	public void setQuestion67(String question67) {
		this.question67 = question67;
	}

	public String getQuestion68() {
		return question68;
	}

	public void setQuestion68(String question68) {
		this.question68 = question68;
	}

	public String getQuestion69() {
		return question69;
	}

	public void setQuestion69(String question69) {
		this.question69 = question69;
	}

	public String getQuestion70() {
		return question70;
	}

	public void setQuestion70(String question70) {
		this.question70 = question70;
	}

	public String getQuestion71() {
		return question71;
	}

	public void setQuestion71(String question71) {
		this.question71 = question71;
	}

	public String getQuestion72() {
		return question72;
	}

	public void setQuestion72(String question72) {
		this.question72 = question72;
	}

	public String getQuestion73() {
		return question73;
	}

	public void setQuestion73(String question73) {
		this.question73 = question73;
	}

	public String getQuestion74() {
		return question74;
	}

	public void setQuestion74(String question74) {
		this.question74 = question74;
	}

	public String getQuestion434() {
		return question434;
	}

	public void setQuestion434(String question434) {
		this.question434 = question434;
	}

	public String getQuestion435() {
		return question435;
	}

	public void setQuestion435(String question435) {
		this.question435 = question435;
	}

	public String getQuestion432() {
		return question432;
	}

	public void setQuestion432(String question432) {
		this.question432 = question432;
	}

	public String getQuestion433() {
		return question433;
	}

	public void setQuestion433(String question433) {
		this.question433 = question433;
	}

	
	
	public String getSendMessage() {
		return sendMessage;
	}

	public void setSendMessage(String sendMessage) {
		this.sendMessage = sendMessage;
	}
	

	public String getQuestion515() {
		return question515;
	}

	public void setQuestion515(String question515) {
		this.question515 = question515;
	}

	public String getQuestion516() {
		return question516;
	}

	public void setQuestion516(String question516) {
		this.question516 = question516;
	}

	@Override
	public String toString() {
		return "SelfExaminationForm [clientId=" + clientId + ", question65="
				+ question65 + ", question66=" + question66 + ", question67="
				+ question67 + ", question68=" + question68 + ", question69="
				+ question69 + ", question70=" + question70 + ", question71="
				+ question71 + ", question74=" + question74 + ", question72="
				+ question72 + ", question23=" + question23 + ", question73="
				+ question73 + ", question434=" + question434
				+ ", question435=" + question435 + ", question432="
				+ question432 + ", question433=" + question433
				+ ", question515=" + question515 + ", question516="
				+ question516 + ", sendMessage=" + sendMessage + "]";
	}

	

	

	
	

	
	

}
