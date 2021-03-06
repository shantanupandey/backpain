package net.calba.backpain.dao.mybatis;

import java.util.List;

import net.calba.backpain.model.ClientForm;
import net.calba.backpain.model.ClientFormExample;
import net.calba.backpain.model.ClientListing;

import org.apache.ibatis.annotations.Param;

public interface ClientFormMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.clientform
     *
     * @mbggenerated Thu May 23 14:05:46 PKT 2013
     */
    int countByExample(ClientFormExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.clientform
     *
     * @mbggenerated Thu May 23 14:05:46 PKT 2013
     */
    int deleteByExample(ClientFormExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.clientform
     *
     * @mbggenerated Thu May 23 14:05:46 PKT 2013
     */
    int deleteByPrimaryKey(Integer clientFormId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.clientform
     *
     * @mbggenerated Thu May 23 14:05:46 PKT 2013
     */
    int insert(ClientForm record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.clientform
     *
     * @mbggenerated Thu May 23 14:05:46 PKT 2013
     */
    int insertSelective(ClientForm record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.clientform
     *
     * @mbggenerated Thu May 23 14:05:46 PKT 2013
     */
    List<ClientForm> selectByExample(ClientFormExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.clientform
     *
     * @mbggenerated Thu May 23 14:05:46 PKT 2013
     */
    ClientForm selectByPrimaryKey(Integer clientFormId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.clientform
     *
     * @mbggenerated Thu May 23 14:05:46 PKT 2013
     */
    int updateByExampleSelective(@Param("record") ClientForm record, @Param("example") ClientFormExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.clientform
     *
     * @mbggenerated Thu May 23 14:05:46 PKT 2013
     */
    int updateByExample(@Param("record") ClientForm record, @Param("example") ClientFormExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.clientform
     *
     * @mbggenerated Thu May 23 14:05:46 PKT 2013
     */
    int updateByPrimaryKeySelective(ClientForm record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table calba.clientform
     *
     * @mbggenerated Thu May 23 14:05:46 PKT 2013
     */
    int updateByPrimaryKey(ClientForm record);

	List<ClientListing> selectUser();
}