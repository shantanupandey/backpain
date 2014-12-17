package net.calba.backpain.form;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class MyAccountForm {
	
	@Pattern(regexp="^[a-zA-Z0-9_@#$%]{6,20}$",
			message = "Passwor must be contains Alphanumeric underscore and @#$% Characters.")
	@Size(min=6, max=20,  message = "Password must between 6 to 20 Characters.")			
	private String password ;
	
	@Size(min=6, max=20,  message = "Password must between 6 to 20 Characters.")
	private String newPassward;	
	
	private String confirmPassward;
	
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNewPassward() {
		return newPassward;
	}
	public void setNewPassward(String newPassward) {
		this.newPassward = newPassward;
	}
	public String getConfirmPassward() {
		return confirmPassward;
	}
	public void setConfirmPassward(String confirmPassward) {
		this.confirmPassward = confirmPassward;
	}
	
	
	
	

}
