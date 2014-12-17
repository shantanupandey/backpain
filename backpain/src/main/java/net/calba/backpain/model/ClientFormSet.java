package net.calba.backpain.model;

public class ClientFormSet {
	
    private Integer formSet;
    
    public Integer getClinetid() {
		return clinetid;
	}

	public void setClinetid(Integer clinetid) {
		this.clinetid = clinetid;
	}

	private Integer clinetid;
	
    private Integer formSetFlag;
    
	private String userId;

	public Integer getFormSet() {
		return formSet;
	}

	public void setFormSet(Integer formSet) {
		this.formSet = formSet;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getFormSetFlag() {
		return formSetFlag;
	}

	public void setFormSetFlag(Integer formSetFlag) {
		this.formSetFlag = formSetFlag;
	}
	

}
