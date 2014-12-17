package net.calba.backpain.dao.mybatis;

import java.util.List;

import net.calba.backpain.model.WeightUnits;
import net.calba.backpain.model.WeightUnitsExample;

import org.apache.ibatis.annotations.Param;

public interface WeightUnitsMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table weightunits
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int countByExample(WeightUnitsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table weightunits
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int deleteByExample(WeightUnitsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table weightunits
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int deleteByPrimaryKey(Integer weightUnitsId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table weightunits
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int insert(WeightUnits record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table weightunits
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int insertSelective(WeightUnits record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table weightunits
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    List<WeightUnits> selectByExample(WeightUnitsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table weightunits
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    WeightUnits selectByPrimaryKey(Integer weightUnitsId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table weightunits
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int updateByExampleSelective(@Param("record") WeightUnits record, @Param("example") WeightUnitsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table weightunits
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int updateByExample(@Param("record") WeightUnits record, @Param("example") WeightUnitsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table weightunits
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int updateByPrimaryKeySelective(WeightUnits record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table weightunits
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int updateByPrimaryKey(WeightUnits record);
}