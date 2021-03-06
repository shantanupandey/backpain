package net.calba.backpain.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class ProjectExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table project
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table project
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table project
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table project
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public ProjectExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table project
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table project
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table project
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table project
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table project
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table project
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table project
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table project
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table project
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table project
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table project
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andProjectIdIsNull() {
            addCriterion("projectid is null");
            return (Criteria) this;
        }

        public Criteria andProjectIdIsNotNull() {
            addCriterion("projectid is not null");
            return (Criteria) this;
        }

        public Criteria andProjectIdEqualTo(Long value) {
            addCriterion("projectid =", value, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdNotEqualTo(Long value) {
            addCriterion("projectid <>", value, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdGreaterThan(Long value) {
            addCriterion("projectid >", value, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdGreaterThanOrEqualTo(Long value) {
            addCriterion("projectid >=", value, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdLessThan(Long value) {
            addCriterion("projectid <", value, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdLessThanOrEqualTo(Long value) {
            addCriterion("projectid <=", value, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdIn(List<Long> values) {
            addCriterion("projectid in", values, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdNotIn(List<Long> values) {
            addCriterion("projectid not in", values, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdBetween(Long value1, Long value2) {
            addCriterion("projectid between", value1, value2, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdNotBetween(Long value1, Long value2) {
            addCriterion("projectid not between", value1, value2, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectNameIsNull() {
            addCriterion("projectname is null");
            return (Criteria) this;
        }

        public Criteria andProjectNameIsNotNull() {
            addCriterion("projectname is not null");
            return (Criteria) this;
        }

        public Criteria andProjectNameEqualTo(String value) {
            addCriterion("projectname =", value, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameNotEqualTo(String value) {
            addCriterion("projectname <>", value, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameGreaterThan(String value) {
            addCriterion("projectname >", value, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameGreaterThanOrEqualTo(String value) {
            addCriterion("projectname >=", value, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameLessThan(String value) {
            addCriterion("projectname <", value, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameLessThanOrEqualTo(String value) {
            addCriterion("projectname <=", value, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameLike(String value) {
            addCriterion("projectname like", value, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameNotLike(String value) {
            addCriterion("projectname not like", value, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameIn(List<String> values) {
            addCriterion("projectname in", values, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameNotIn(List<String> values) {
            addCriterion("projectname not in", values, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameBetween(String value1, String value2) {
            addCriterion("projectname between", value1, value2, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameNotBetween(String value1, String value2) {
            addCriterion("projectname not between", value1, value2, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectDescIsNull() {
            addCriterion("projectdesc is null");
            return (Criteria) this;
        }

        public Criteria andProjectDescIsNotNull() {
            addCriterion("projectdesc is not null");
            return (Criteria) this;
        }

        public Criteria andProjectDescEqualTo(String value) {
            addCriterion("projectdesc =", value, "projectDesc");
            return (Criteria) this;
        }

        public Criteria andProjectDescNotEqualTo(String value) {
            addCriterion("projectdesc <>", value, "projectDesc");
            return (Criteria) this;
        }

        public Criteria andProjectDescGreaterThan(String value) {
            addCriterion("projectdesc >", value, "projectDesc");
            return (Criteria) this;
        }

        public Criteria andProjectDescGreaterThanOrEqualTo(String value) {
            addCriterion("projectdesc >=", value, "projectDesc");
            return (Criteria) this;
        }

        public Criteria andProjectDescLessThan(String value) {
            addCriterion("projectdesc <", value, "projectDesc");
            return (Criteria) this;
        }

        public Criteria andProjectDescLessThanOrEqualTo(String value) {
            addCriterion("projectdesc <=", value, "projectDesc");
            return (Criteria) this;
        }

        public Criteria andProjectDescLike(String value) {
            addCriterion("projectdesc like", value, "projectDesc");
            return (Criteria) this;
        }

        public Criteria andProjectDescNotLike(String value) {
            addCriterion("projectdesc not like", value, "projectDesc");
            return (Criteria) this;
        }

        public Criteria andProjectDescIn(List<String> values) {
            addCriterion("projectdesc in", values, "projectDesc");
            return (Criteria) this;
        }

        public Criteria andProjectDescNotIn(List<String> values) {
            addCriterion("projectdesc not in", values, "projectDesc");
            return (Criteria) this;
        }

        public Criteria andProjectDescBetween(String value1, String value2) {
            addCriterion("projectdesc between", value1, value2, "projectDesc");
            return (Criteria) this;
        }

        public Criteria andProjectDescNotBetween(String value1, String value2) {
            addCriterion("projectdesc not between", value1, value2, "projectDesc");
            return (Criteria) this;
        }

        public Criteria andProjectStartDateIsNull() {
            addCriterion("projectstartdate is null");
            return (Criteria) this;
        }

        public Criteria andProjectStartDateIsNotNull() {
            addCriterion("projectstartdate is not null");
            return (Criteria) this;
        }

        public Criteria andProjectStartDateEqualTo(Date value) {
            addCriterionForJDBCDate("projectstartdate =", value, "projectStartDate");
            return (Criteria) this;
        }

        public Criteria andProjectStartDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("projectstartdate <>", value, "projectStartDate");
            return (Criteria) this;
        }

        public Criteria andProjectStartDateGreaterThan(Date value) {
            addCriterionForJDBCDate("projectstartdate >", value, "projectStartDate");
            return (Criteria) this;
        }

        public Criteria andProjectStartDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("projectstartdate >=", value, "projectStartDate");
            return (Criteria) this;
        }

        public Criteria andProjectStartDateLessThan(Date value) {
            addCriterionForJDBCDate("projectstartdate <", value, "projectStartDate");
            return (Criteria) this;
        }

        public Criteria andProjectStartDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("projectstartdate <=", value, "projectStartDate");
            return (Criteria) this;
        }

        public Criteria andProjectStartDateIn(List<Date> values) {
            addCriterionForJDBCDate("projectstartdate in", values, "projectStartDate");
            return (Criteria) this;
        }

        public Criteria andProjectStartDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("projectstartdate not in", values, "projectStartDate");
            return (Criteria) this;
        }

        public Criteria andProjectStartDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("projectstartdate between", value1, value2, "projectStartDate");
            return (Criteria) this;
        }

        public Criteria andProjectStartDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("projectstartdate not between", value1, value2, "projectStartDate");
            return (Criteria) this;
        }

        public Criteria andProjectEndDateIsNull() {
            addCriterion("projectenddate is null");
            return (Criteria) this;
        }

        public Criteria andProjectEndDateIsNotNull() {
            addCriterion("projectenddate is not null");
            return (Criteria) this;
        }

        public Criteria andProjectEndDateEqualTo(Date value) {
            addCriterionForJDBCDate("projectenddate =", value, "projectEndDate");
            return (Criteria) this;
        }

        public Criteria andProjectEndDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("projectenddate <>", value, "projectEndDate");
            return (Criteria) this;
        }

        public Criteria andProjectEndDateGreaterThan(Date value) {
            addCriterionForJDBCDate("projectenddate >", value, "projectEndDate");
            return (Criteria) this;
        }

        public Criteria andProjectEndDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("projectenddate >=", value, "projectEndDate");
            return (Criteria) this;
        }

        public Criteria andProjectEndDateLessThan(Date value) {
            addCriterionForJDBCDate("projectenddate <", value, "projectEndDate");
            return (Criteria) this;
        }

        public Criteria andProjectEndDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("projectenddate <=", value, "projectEndDate");
            return (Criteria) this;
        }

        public Criteria andProjectEndDateIn(List<Date> values) {
            addCriterionForJDBCDate("projectenddate in", values, "projectEndDate");
            return (Criteria) this;
        }

        public Criteria andProjectEndDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("projectenddate not in", values, "projectEndDate");
            return (Criteria) this;
        }

        public Criteria andProjectEndDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("projectenddate between", value1, value2, "projectEndDate");
            return (Criteria) this;
        }

        public Criteria andProjectEndDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("projectenddate not between", value1, value2, "projectEndDate");
            return (Criteria) this;
        }

        public Criteria andMonitorTriggerIntervalIsNull() {
            addCriterion("monitortriggerinterval is null");
            return (Criteria) this;
        }

        public Criteria andMonitorTriggerIntervalIsNotNull() {
            addCriterion("monitortriggerinterval is not null");
            return (Criteria) this;
        }

        public Criteria andMonitorTriggerIntervalEqualTo(Integer value) {
            addCriterion("monitortriggerinterval =", value, "monitorTriggerInterval");
            return (Criteria) this;
        }

        public Criteria andMonitorTriggerIntervalNotEqualTo(Integer value) {
            addCriterion("monitortriggerinterval <>", value, "monitorTriggerInterval");
            return (Criteria) this;
        }

        public Criteria andMonitorTriggerIntervalGreaterThan(Integer value) {
            addCriterion("monitortriggerinterval >", value, "monitorTriggerInterval");
            return (Criteria) this;
        }

        public Criteria andMonitorTriggerIntervalGreaterThanOrEqualTo(Integer value) {
            addCriterion("monitortriggerinterval >=", value, "monitorTriggerInterval");
            return (Criteria) this;
        }

        public Criteria andMonitorTriggerIntervalLessThan(Integer value) {
            addCriterion("monitortriggerinterval <", value, "monitorTriggerInterval");
            return (Criteria) this;
        }

        public Criteria andMonitorTriggerIntervalLessThanOrEqualTo(Integer value) {
            addCriterion("monitortriggerinterval <=", value, "monitorTriggerInterval");
            return (Criteria) this;
        }

        public Criteria andMonitorTriggerIntervalIn(List<Integer> values) {
            addCriterion("monitortriggerinterval in", values, "monitorTriggerInterval");
            return (Criteria) this;
        }

        public Criteria andMonitorTriggerIntervalNotIn(List<Integer> values) {
            addCriterion("monitortriggerinterval not in", values, "monitorTriggerInterval");
            return (Criteria) this;
        }

        public Criteria andMonitorTriggerIntervalBetween(Integer value1, Integer value2) {
            addCriterion("monitortriggerinterval between", value1, value2, "monitorTriggerInterval");
            return (Criteria) this;
        }

        public Criteria andMonitorTriggerIntervalNotBetween(Integer value1, Integer value2) {
            addCriterion("monitortriggerinterval not between", value1, value2, "monitorTriggerInterval");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table project
     *
     * @mbggenerated do_not_delete_during_merge Wed May 22 17:15:02 PKT 2013
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table project
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}