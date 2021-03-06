package net.calba.backpain.model;

public class PersonalDetails {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column personaldetails.personaldetailsid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    private Integer personalDetailsId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column personaldetails.height
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    private String height;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column personaldetails.weight
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    private String weight;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column personaldetails.sex
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    private String sex;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column personaldetails.clinetid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    private Integer clientId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column personaldetails.heightunitsid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    private Integer heightUnitsId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column personaldetails.weightunitsid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    private Integer weightUnitsId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column personaldetails.personaldetailsid
     *
     * @return the value of personaldetails.personaldetailsid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public Integer getPersonalDetailsId() {
        return personalDetailsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column personaldetails.personaldetailsid
     *
     * @param personalDetailsId the value for personaldetails.personaldetailsid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void setPersonalDetailsId(Integer personalDetailsId) {
        this.personalDetailsId = personalDetailsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column personaldetails.height
     *
     * @return the value of personaldetails.height
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public String getHeight() {
        return height;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column personaldetails.height
     *
     * @param height the value for personaldetails.height
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void setHeight(String height) {
        this.height = height == null ? null : height.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column personaldetails.weight
     *
     * @return the value of personaldetails.weight
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public String getWeight() {
        return weight;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column personaldetails.weight
     *
     * @param weight the value for personaldetails.weight
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void setWeight(String weight) {
        this.weight = weight == null ? null : weight.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column personaldetails.sex
     *
     * @return the value of personaldetails.sex
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public String getSex() {
        return sex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column personaldetails.sex
     *
     * @param sex the value for personaldetails.sex
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column personaldetails.clinetid
     *
     * @return the value of personaldetails.clinetid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public Integer getClientId() {
        return clientId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column personaldetails.clinetid
     *
     * @param clientId the value for personaldetails.clinetid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column personaldetails.heightunitsid
     *
     * @return the value of personaldetails.heightunitsid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public Integer getHeightUnitsId() {
        return heightUnitsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column personaldetails.heightunitsid
     *
     * @param heightUnitsId the value for personaldetails.heightunitsid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void setHeightUnitsId(Integer heightUnitsId) {
        this.heightUnitsId = heightUnitsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column personaldetails.weightunitsid
     *
     * @return the value of personaldetails.weightunitsid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public Integer getWeightUnitsId() {
        return weightUnitsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column personaldetails.weightunitsid
     *
     * @param weightUnitsId the value for personaldetails.weightunitsid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void setWeightUnitsId(Integer weightUnitsId) {
        this.weightUnitsId = weightUnitsId;
    }
}