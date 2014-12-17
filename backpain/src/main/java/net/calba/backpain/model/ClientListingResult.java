package net.calba.backpain.model;

import java.util.List;

public class ClientListingResult {
	
	private List<ClientListing> result;
	private int pageId;
	private int pageSize;
	private int totalResult;
	private int totalPages;
	
	/**
	 * 
	 * @param result List<ClientListing> value
	 * @param pageId value	 
	 * @param totalResult value
	 *  
	 */
	public ClientListingResult(List<ClientListing> result, int pageId, int totalResult) {
		super();
		this.result = result;
		this.pageId = pageId;
		this.pageSize = SearchCriteria.PAGE_SIZE;
		this.totalResult = totalResult;	
		pagination();
	}
	
	public ClientListingResult(List<ClientListing> clientList) {

		this.result = clientList;
	}

	public void pagination() {
		totalPages = totalResult / pageSize;
		if (totalResult %  pageSize > 0 ) {
			totalPages++;
		}	
	}
	
	/**
	 * @return the result
	 */
	public final List<ClientListing> getResult() {
		return result;
	}
	/**
	 * @param result the result to set
	 */
	public final void setResult(List<ClientListing> result) {
		this.result = result;
	}
	/**
	 * @return the pageId
	 */
	public final int getPageId() {
		return pageId;
	}
	/**
	 * @param pageId the pageId to set
	 */
	public final void setPageId(int pageId) {
		this.pageId = pageId;
	}
	/**
	 * @return the pageSize
	 */
	public final int getPageSize() {
		return pageSize;
	}
	/**
	 * @param pageSize the pageSize to set
	 */
	public final void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	/**
	 * @return the totalResult
	 */
	public final int getTotalResult() {
		return totalResult;
	}
	/**
	 * @param totalResult the totalResult to set
	 */
	public final void setTotalResult(int totalResult) {
		this.totalResult = totalResult;
		pagination();
	}
	/**
	 * @return the totalPages
	 */
	public final int getTotalPages() {
		return totalPages;
	}
	/**
	 * @param totalPages the totalPages to set
	 */
	public final void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	

}
