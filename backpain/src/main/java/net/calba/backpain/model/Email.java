package net.calba.backpain.model;

public class Email {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column email.emailid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    private Integer emailId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column email.emailaddress
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    private String emailAddress;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column email.clinetid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    private Integer clientId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column email.emailid
     *
     * @return the value of email.emailid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public Integer getEmailId() {
        return emailId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column email.emailid
     *
     * @param emailId the value for email.emailid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void setEmailId(Integer emailId) {
        this.emailId = emailId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column email.emailaddress
     *
     * @return the value of email.emailaddress
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public String getEmailAddress() {
        return emailAddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column email.emailaddress
     *
     * @param emailAddress the value for email.emailaddress
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress == null ? null : emailAddress.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column email.clinetid
     *
     * @return the value of email.clinetid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public Integer getClientId() {
        return clientId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column email.clinetid
     *
     * @param clientId the value for email.clinetid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }
}