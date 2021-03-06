package net.calba.backpain.dao.mybatis;

import java.util.List;
import net.calba.backpain.model.QuestionGroup;
import net.calba.backpain.model.QuestionGroupExample;
import org.apache.ibatis.annotations.Param;

public interface QuestionGroupMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.questiongroup
     *
     * @mbggenerated Sun Nov 10 12:19:05 PKT 2013
     */
    int countByExample(QuestionGroupExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.questiongroup
     *
     * @mbggenerated Sun Nov 10 12:19:05 PKT 2013
     */
    int deleteByExample(QuestionGroupExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.questiongroup
     *
     * @mbggenerated Sun Nov 10 12:19:05 PKT 2013
     */
    int deleteByPrimaryKey(Integer questionGroupId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.questiongroup
     *
     * @mbggenerated Sun Nov 10 12:19:05 PKT 2013
     */
    int insert(QuestionGroup record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.questiongroup
     *
     * @mbggenerated Sun Nov 10 12:19:05 PKT 2013
     */
    int insertSelective(QuestionGroup record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.questiongroup
     *
     * @mbggenerated Sun Nov 10 12:19:05 PKT 2013
     */
    List<QuestionGroup> selectByExample(QuestionGroupExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.questiongroup
     *
     * @mbggenerated Sun Nov 10 12:19:05 PKT 2013
     */
    QuestionGroup selectByPrimaryKey(Integer questionGroupId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.questiongroup
     *
     * @mbggenerated Sun Nov 10 12:19:05 PKT 2013
     */
    int updateByExampleSelective(@Param("record") QuestionGroup record, @Param("example") QuestionGroupExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.questiongroup
     *
     * @mbggenerated Sun Nov 10 12:19:05 PKT 2013
     */
    int updateByExample(@Param("record") QuestionGroup record, @Param("example") QuestionGroupExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.questiongroup
     *
     * @mbggenerated Sun Nov 10 12:19:05 PKT 2013
     */
    int updateByPrimaryKeySelective(QuestionGroup record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.questiongroup
     *
     * @mbggenerated Sun Nov 10 12:19:05 PKT 2013
     */
    int updateByPrimaryKey(QuestionGroup record);
}