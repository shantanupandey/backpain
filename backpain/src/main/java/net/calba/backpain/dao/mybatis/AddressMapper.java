package net.calba.backpain.dao.mybatis;

import java.util.List;

import net.calba.backpain.model.Address;
import net.calba.backpain.model.AddressExample;

import org.apache.ibatis.annotations.Param;

public interface AddressMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int countByExample(AddressExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int deleteByExample(AddressExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int deleteByPrimaryKey(Integer addressId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int insert(Address record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int insertSelective(Address record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    List<Address> selectByExample(AddressExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    Address selectByPrimaryKey(Integer addressId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int updateByExampleSelective(@Param("record") Address record, @Param("example") AddressExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int updateByExample(@Param("record") Address record, @Param("example") AddressExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int updateByPrimaryKeySelective(Address record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int updateByPrimaryKey(Address record);
}