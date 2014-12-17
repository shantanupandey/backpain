package net.calba.backpain.form;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
public class LoginForm {
	
//	@Pattern(regexp="^[a-zA-Z0-9_]+$",
//			message = "User name  must be contains Alphanumeric underscore Characters.")
	@NotEmpty(message = "User name must not be blank.")
	private String userId = "";	
	
//	@Pattern(regexp="^[a-zA-Z0-9_]+$",
//			message = "Password must contain at least 12 characters, including letters, numbers, and any two of the following:   #  $  %   @")
	@NotEmpty(message = "Password must not be blank.")
	private String password = "";	
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	

}
