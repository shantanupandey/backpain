package net.calba.backpain.model;

public class WeightUnits {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column weightunits.weightunitsid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    private Integer weightUnitsId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column weightunits.unitname
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    private String unitName;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column weightunits.weightunitsid
     *
     * @return the value of weightunits.weightunitsid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public Integer getWeightUnitsId() {
        return weightUnitsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column weightunits.weightunitsid
     *
     * @param weightUnitsId the value for weightunits.weightunitsid
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void setWeightUnitsId(Integer weightUnitsId) {
        this.weightUnitsId = weightUnitsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column weightunits.unitname
     *
     * @return the value of weightunits.unitname
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public String getUnitName() {
        return unitName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column weightunits.unitname
     *
     * @param unitName the value for weightunits.unitname
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void setUnitName(String unitName) {
        this.unitName = unitName == null ? null : unitName.trim();
    }
}