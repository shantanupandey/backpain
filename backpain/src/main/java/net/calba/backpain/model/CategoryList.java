package net.calba.backpain.model;

public class CategoryList {
	  private String categoryname;
	  private String username;
	  private Integer categoryid;
	  private String [] status;
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
//	@Override
//	public String toString() {
//		return "CategoryList [categoryname=" + categoryname + ", username="
//				+ username + ", getCategoryname()=" + getCategoryname()
//				+ ", getUsername()=" + getUsername() + ", getClass()="
//				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
//				+ super.toString() + "]";
//	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public CategoryList(){
		
	}
	public Integer getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(Integer categoryid) {
		this.categoryid = categoryid;
	}
	public String [] getStatus() {
		return status;
	}
	public void setStatus(String [] status) {
		this.status = status;
	}
	
	
}
