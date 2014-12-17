package net.calba.backpain.model;

import java.util.Date;

public class ClientListing {
	

    private Integer clientId;
    private String foreName;
    private String surName;
    private String userId;
    private Integer roleId;
    private Date createdDate;  
    private Long projectId;
    private Integer clientTypeId;
    private Integer clientStateId;
    private String city;
    private String phoneNumber;
    private Integer setForm;
    private Integer formSetFlag;
    private String emailAddress;
    private Integer assessmentformflag;
    private String careComment;
    private String comment1;
    private String comment2;
    private String comment3;
    private String comment4;
    private String comment5;

	
    public String getComment1() {
		return comment1;
	}
	public void setComment1(String comment1) {
		this.comment1 = comment1;
	}
	public String getComment2() {
		return comment2;
	}
	public void setComment2(String comment2) {
		this.comment2 = comment2;
	}
	public String getComment3() {
		return comment3;
	}
	public void setComment3(String comment3) {
		this.comment3 = comment3;
	}
	public String getComment4() {
		return comment4;
	}
	public void setComment4(String comment4) {
		this.comment4 = comment4;
	}
	public String getComment5() {
		return comment5;
	}
	public void setComment5(String comment5) {
		this.comment5 = comment5;
	}
	public Integer getAssessmentformflag() {
		return assessmentformflag;
	}
	public void setAssessmentformflag(Integer assessmentformflag) {
		this.assessmentformflag = assessmentformflag;
	}
	public String getCareComment() {
		return careComment;
	}
	public void setCareComment(String careComment) {
		this.careComment = careComment;
	}
	public Integer getFormSetFlag() {
		return formSetFlag;
	}
	public void setFormSetFlag(Integer formSetFlag) {
		this.formSetFlag = formSetFlag;
	}
	private Integer moniterid;
    private Integer questionid;
    private String answertext;
    private Integer userid;
    private String formsubmitdate;

    
    
    
	public Integer getMoniterid() {
		return moniterid;
	}
	public void setMoniterid(Integer moniterid) {
		this.moniterid = moniterid;
	}
	
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public Integer getQuestionid() {
		return questionid;
	}
	public void setQuestionid(Integer questionid) {
		this.questionid = questionid;
	}
	public String getAnswertext() {
		return answertext;
	}
	public void setAnswertext(String answertext) {
		this.answertext = answertext;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getFormsubmitdate() {
		return formsubmitdate;
	}
	public void setFormsubmitdate(String formsubmitdate) {
		this.formsubmitdate = formsubmitdate;
	}
	public Integer getSetForm() {
		return setForm;
	}
	public void setSetForm(Integer setForm) {
		this.setForm = setForm;
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
	/**
	 * @return the foreName
	 */
	public final String getForeName() {
		return foreName;
	}
	/**
	 * @param foreName the foreName to set
	 */
	public final void setForeName(String foreName) {
		this.foreName = foreName;
	}
	/**
	 * @return the surName
	 */
	public final String getSurName() {
		return surName;
	}
	/**
	 * @param surName the surName to set
	 */
	public final void setSurName(String surName) {
		this.surName = surName;
	}
	/**
	 * @return the userId
	 */
	public final String getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public final void setUserId(String userId) {
		this.userId = userId;
	}
	/**
	 * @return the roleId
	 */
	public final Integer getRoleId() {
		return roleId;
	}
	/**
	 * @param roleId the roleId to set
	 */
	public final void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	/**
	 * @return the createdDate
	 */
	public final Date getCreatedDate() {
		return createdDate;
	}
	/**
	 * @param createdDate the createdDate to set
	 */
	public final void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}	
	/**
	 * @return the projectId
	 */
	public final Long getProjectId() {
		return projectId;
	}
	/**
	 * @param projectId the projectId to set
	 */
	public final void setProjectId(Long projectId) {
		this.projectId = projectId;
	}
	/**
	 * @return the clientTypeId
	 */
	public final Integer getClientTypeId() {
		return clientTypeId;
	}
	/**
	 * @param clientTypeId the clientTypeId to set
	 */
	public final void setClientTypeId(Integer clientTypeId) {
		this.clientTypeId = clientTypeId;
	}
	/**
	 * @return the city
	 */
	public final String getCity() {
		return city == null ? "" : city;
	}
	/**
	 * @param city the city to set
	 */
	public final void setCity(String city) {
		this.city = city;
	}
	/**
	 * @return the phoneNumber
	 */
	public final String getPhoneNumber() {
		return phoneNumber == null ? "" : phoneNumber;
	}
	/**
	 * @param phoneNumber the phoneNumber to set
	 */
	public final void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	/**
	 * @return the clientStateId
	 */
	public final Integer getClientStateId() {
		return clientStateId;
	}
	/**
	 * @param clientStateId the clientStateId to set
	 */
	public final void setClientStateId(Integer clientStateId) {
		this.clientStateId = clientStateId;
	}
	
	
    
    


}
