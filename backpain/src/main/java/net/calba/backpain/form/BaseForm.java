package net.calba.backpain.form;

public class BaseForm {
	
	protected Integer clientFormId;
	
	
	public BaseForm() {		
	}

	public BaseForm(Integer clientFormId) {		
		this.clientFormId = clientFormId;
	}

	public Integer getClientFormId() {
		return clientFormId;
	}

	public void setClientFormId(Integer clientFormId) {
		this.clientFormId = clientFormId;
	}
	
	
	

}
