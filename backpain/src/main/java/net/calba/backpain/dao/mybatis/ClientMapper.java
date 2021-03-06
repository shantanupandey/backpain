package net.calba.backpain.dao.mybatis;

import java.util.List;

import net.calba.backpain.model.CategoryList;
import net.calba.backpain.model.Client;
import net.calba.backpain.model.ClientExample;

import org.apache.ibatis.annotations.Param;

public interface ClientMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table client
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int countByExample(ClientExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table client
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int deleteByExample(ClientExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table client
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int deleteByPrimaryKey(Integer clientId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table client
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int insert(Client record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table client
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int insertSelective(Client record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table client
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    List<Client> selectByExample(ClientExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table client
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    Client selectByPrimaryKey(Integer clientId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table client
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int updateByExampleSelective(@Param("record") Client record, @Param("example") ClientExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table client
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int updateByExample(@Param("record") Client record, @Param("example") ClientExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table client
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int updateByPrimaryKeySelective(Client record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table client
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int updateByPrimaryKey(Client record);
        
    
    /**
     * 
     * @param userId String
     * @return Client
     */
    Client selectByUserId(String userId);

	List<CategoryList> selectCategoryList();

}