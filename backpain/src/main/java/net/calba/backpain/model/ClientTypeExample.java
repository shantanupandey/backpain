package net.calba.backpain.model;

import java.util.ArrayList;
import java.util.List;

public class ClientTypeExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table clienttype
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table clienttype
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table clienttype
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clienttype
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public ClientTypeExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clienttype
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clienttype
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clienttype
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clienttype
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clienttype
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clienttype
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clienttype
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
     * This method corresponds to the database table clienttype
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
     * This method corresponds to the database table clienttype
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clienttype
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
     * This class corresponds to the database table clienttype
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

        public Criteria andClientTypeIdIsNull() {
            addCriterion("clienttypeid is null");
            return (Criteria) this;
        }

        public Criteria andClientTypeIdIsNotNull() {
            addCriterion("clienttypeid is not null");
            return (Criteria) this;
        }

        public Criteria andClientTypeIdEqualTo(Integer value) {
            addCriterion("clienttypeid =", value, "clientTypeId");
            return (Criteria) this;
        }

        public Criteria andClientTypeIdNotEqualTo(Integer value) {
            addCriterion("clienttypeid <>", value, "clientTypeId");
            return (Criteria) this;
        }

        public Criteria andClientTypeIdGreaterThan(Integer value) {
            addCriterion("clienttypeid >", value, "clientTypeId");
            return (Criteria) this;
        }

        public Criteria andClientTypeIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("clienttypeid >=", value, "clientTypeId");
            return (Criteria) this;
        }

        public Criteria andClientTypeIdLessThan(Integer value) {
            addCriterion("clienttypeid <", value, "clientTypeId");
            return (Criteria) this;
        }

        public Criteria andClientTypeIdLessThanOrEqualTo(Integer value) {
            addCriterion("clienttypeid <=", value, "clientTypeId");
            return (Criteria) this;
        }

        public Criteria andClientTypeIdIn(List<Integer> values) {
            addCriterion("clienttypeid in", values, "clientTypeId");
            return (Criteria) this;
        }

        public Criteria andClientTypeIdNotIn(List<Integer> values) {
            addCriterion("clienttypeid not in", values, "clientTypeId");
            return (Criteria) this;
        }

        public Criteria andClientTypeIdBetween(Integer value1, Integer value2) {
            addCriterion("clienttypeid between", value1, value2, "clientTypeId");
            return (Criteria) this;
        }

        public Criteria andClientTypeIdNotBetween(Integer value1, Integer value2) {
            addCriterion("clienttypeid not between", value1, value2, "clientTypeId");
            return (Criteria) this;
        }

        public Criteria andClientTypeIsNull() {
            addCriterion("clienttype is null");
            return (Criteria) this;
        }

        public Criteria andClientTypeIsNotNull() {
            addCriterion("clienttype is not null");
            return (Criteria) this;
        }

        public Criteria andClientTypeEqualTo(String value) {
            addCriterion("clienttype =", value, "clientType");
            return (Criteria) this;
        }

        public Criteria andClientTypeNotEqualTo(String value) {
            addCriterion("clienttype <>", value, "clientType");
            return (Criteria) this;
        }

        public Criteria andClientTypeGreaterThan(String value) {
            addCriterion("clienttype >", value, "clientType");
            return (Criteria) this;
        }

        public Criteria andClientTypeGreaterThanOrEqualTo(String value) {
            addCriterion("clienttype >=", value, "clientType");
            return (Criteria) this;
        }

        public Criteria andClientTypeLessThan(String value) {
            addCriterion("clienttype <", value, "clientType");
            return (Criteria) this;
        }

        public Criteria andClientTypeLessThanOrEqualTo(String value) {
            addCriterion("clienttype <=", value, "clientType");
            return (Criteria) this;
        }

        public Criteria andClientTypeLike(String value) {
            addCriterion("clienttype like", value, "clientType");
            return (Criteria) this;
        }

        public Criteria andClientTypeNotLike(String value) {
            addCriterion("clienttype not like", value, "clientType");
            return (Criteria) this;
        }

        public Criteria andClientTypeIn(List<String> values) {
            addCriterion("clienttype in", values, "clientType");
            return (Criteria) this;
        }

        public Criteria andClientTypeNotIn(List<String> values) {
            addCriterion("clienttype not in", values, "clientType");
            return (Criteria) this;
        }

        public Criteria andClientTypeBetween(String value1, String value2) {
            addCriterion("clienttype between", value1, value2, "clientType");
            return (Criteria) this;
        }

        public Criteria andClientTypeNotBetween(String value1, String value2) {
            addCriterion("clienttype not between", value1, value2, "clientType");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table clienttype
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
     * This class corresponds to the database table clienttype
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