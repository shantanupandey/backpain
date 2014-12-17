package net.calba.backpain.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.calba.backpain.Util;

@SuppressWarnings("serial")
public class SearchCriteria implements Serializable {
	
	
	public static final int PAGE_SIZE = Util.PAGE_SIZE;
	
	public static final int SORT_FIRST_NAME = 1;
	
	public static final int SORT_LAST_NAME = 2;
	
	public static final int SORT_USER_NAME = 3;
	
	public static final int SORT_CITY = 4;
	
	public static final int SORT_REGISTER_DATE = 5;
	
	private String creationDate;
	 private String searchValue="";
	public String getCreationDate() {
		return creationDate;
	}



	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}



	private int pageId;
	
	private int pageSize;	
	
	private int offset;	
	
	private int sortBy;
	
	
	
	public String getSearchValue() {
		return searchValue;
	}



	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	
	
	
	/**
	 * create default.
	 */
	public SearchCriteria() {
		this.sortBy = SORT_REGISTER_DATE;
		this.pageId = 1;
		this.pageSize = PAGE_SIZE;		
		offset = 0;
	}
	
	
	
	/**
	 * Create new SearchCriteria with given parameters.	  
	 * @param sortBy value
	 * @param pageId value	
	 */
//	public SearchCriteria(Integer sortBy, Integer pageId) {
//		this.pageSize = PAGE_SIZE;	
//		this.pageId = (pageId == null || pageId == 0 ? 1 : pageId);			
//		offset = (this.pageId - 1) *  PAGE_SIZE;
//		this.sortBy = (sortBy == null ? SORT_FIRST_NAME : sortBy.intValue());
//	}	
	
	public SearchCriteria(Integer sortBy, Integer pageId,String searchfor) {
		this.pageSize = PAGE_SIZE;	
		this.pageId = (pageId == null || pageId == 0 ? 1 : pageId);			
		offset = (this.pageId - 1) *  PAGE_SIZE;
		this.sortBy = (sortBy == null ? SORT_FIRST_NAME : sortBy.intValue());
		this.searchValue=searchfor;
	}
	/**
	 * @return the sortBy
	 */
	public final int getSortBy() {
		return sortBy;
	}

	/**
	 * @param sortBy the sortBy to set
	 */
	public final void setSortBy(int sortBy) {
		this.sortBy = sortBy;
	}

	/**
	 * @param pageId the pageId to set
	 */
	public final void setPageId(int pageId) {
		this.pageId = pageId;
	}

	/**
	 * @return the pageId
	 */
	public final int getPageId() {
		return pageId;
	}
	
	/**
	 * @return the pageSize
	 */
	public final int getPageSize() {
		return pageSize;
	}	

	/**
	 * @return the offset
	 */
	public final int getOffset() {
		return offset;
	}
	
	
	
	/**
	 * @return the orderByClause
	 */
	public final String getOrderByClause() {
		String orderByClause;
		switch(sortBy) {
			case SORT_USER_NAME : orderByClause = "userid"; break;
			case SORT_LAST_NAME : orderByClause = "surname";  break;
			case SORT_CITY : orderByClause = "city";  break;
			case SORT_REGISTER_DATE : orderByClause = "createddate desc";  break;
			default : orderByClause = "forename"; 	 
		}
		
		return orderByClause;
	}



	
	
	


}
