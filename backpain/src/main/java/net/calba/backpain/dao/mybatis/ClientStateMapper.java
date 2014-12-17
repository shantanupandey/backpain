package net.calba.backpain.dao.mybatis;

import java.util.List;

import net.calba.backpain.model.ClientState;
import net.calba.backpain.model.ClientStateExample;

import org.apache.ibatis.annotations.Param;

public interface ClientStateMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clientstate
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int countByExample(ClientStateExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clientstate
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int deleteByExample(ClientStateExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clientstate
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int deleteByPrimaryKey(Integer clientStateId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clientstate
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int insert(ClientState record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clientstate
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int insertSelective(ClientState record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clientstate
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    List<ClientState> selectByExample(ClientStateExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clientstate
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    ClientState selectByPrimaryKey(Integer clientStateId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clientstate
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int updateByExampleSelective(@Param("record") ClientState record, @Param("example") ClientStateExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clientstate
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int updateByExample(@Param("record") ClientState record, @Param("example") ClientStateExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clientstate
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int updateByPrimaryKeySelective(ClientState record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table clientstate
     *
     * @mbggenerated Wed May 22 17:15:02 PKT 2013
     */
    int updateByPrimaryKey(ClientState record);
}