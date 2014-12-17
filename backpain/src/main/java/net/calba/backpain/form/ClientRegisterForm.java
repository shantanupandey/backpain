package net.calba.backpain.form;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import net.calba.backpain.validator.FieldMatch;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
@FieldMatch.List({
    @FieldMatch(first = "newPassward", second = "confirmPassward", message = "The password fields must match"),
    @FieldMatch(first = "email", second = "confirmEmail", message = "The Email fields must match")
})



public class ClientRegisterForm {
	

	
	
	
	private Integer clientId;
	private Integer projectId;	
	@NotEmpty(message = "Gender must not be blank.")
	private String sex;
//	@Pattern(regexp =  "^([0-9\\+ \\-]{7,15})$",
//			message = "Must contain only numbers and have no spaces.")
//	@NotEmpty(message = "Mobile No must not be blank.")
	private String mobile;
	@NotEmpty(message = "First name must not be blank.")
//	@Pattern(regexp="[a-zA-z]+([\\w-'\\s]+)*",
//	message = "First name  must be contains Alphanumeric underscore, hypen, space and  apostrophe Characters.")
	private String foreName;
	private String categoryname;
//	@Pattern(regexp="^[a-zA-Z0-9_]+$",
//			message = "User name  must be contains Alphanumeric underscore Characters.")
//	@Size(min=6, max=20,  message = "User name  must between 6 to 20 Characters.")	
	private String userId;
	
//	@Pattern(regexp="[a-zA-z]+([\\w-'\\s]+)*",
//			message = "Last name  must be contains Alphanumeric, underscore, hypen, space and  apostrophe Characters.")
	@NotEmpty(message = "Last name must not be blank.")
	private String surName;
	
	@NotEmpty(message = "Email must not be blank.")
	@Email
	private String email;
	
	@NotEmpty( message = "Confirm Email must not be blank.")
	@Email
	private String confirmEmail;
	
//	@NotEmpty(message = "Line 1 must not be blank.")
	private String line1;	
	
	private String line2;
	
	private String line3;
	
//	@Pattern(regexp="[a-zA-z]+([\\w-'\\s]+)*",
//			message = "City must be contains Alphanumeric, hypen, underscore, space and  apostrophe Characters.")
	@NotEmpty(message = "City must not be blank.")
	private String city;
	
//	@Pattern(regexp="^[a-zA-z]+([\\w-'\\s]+)*",
//			message = "Country must be contains Alphanumeric, hypen, underscore, space and  apostrophe Characters.")
	@NotEmpty(message = "Country must not be blank.")
	private String country;
	
//	@Pattern(regexp="^([a-zA-Z0-9\\s]+)*",
//			message = "Postcode must be contains Alphanumeric and space Characters.")
	private String postcode;
	
//	@Pattern(regexp ="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$",
//			message = "Enter Date of birth in format (dd/MM/yyyy).")
	private String dateOfBirth;
	
//	@Pattern(regexp="^[a-zA-Z0-9_@#$%]{6,20}$",
//			message = "Password must between 6 to 20 Characters and contain Alphanumeric characters,underscore and at least one of the following characters:@,#,$,%")
//	@Size(min=6, max=20,  message = "Password must between 6 to 20 Characters.")	
	@NotEmpty(message="Password must not be left blank.")
	private String newPassward;	
	
	@NotEmpty(message="Confirm Password must not be left blank.")
	private String confirmPassward;
	
//	@Pattern(regexp =  "^([0-9\\+ \\-]{7,15})$",
//			message = "Must contain only numbers and have no spaces.")
//	@NotEmpty(message = "Telephone No must not be blank.")
	private String telephone;
	
	private boolean trial;
	
	public Integer getClientId() {
		return clientId;
	}
	public void setClientId(Integer clientId) {
		this.clientId = clientId;
	}
	public Integer getProjectId() {
		return projectId;
	}
	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	public String getForeName() {
		return foreName;
	}
	public void setForeName(String foreName) {
		this.foreName = foreName;
	}
	public String getSurName() {
		return surName;
	}
	public void setSurName(String surName) {
		this.surName = surName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLine1() {
		return line1;
	}
	public void setLine1(String line1) {
		this.line1 = line1;
	}
	public String getLine2() {
		return line2;
	}
	public void setLine2(String line2) {
		this.line2 = line2;
	}
	public String getLine3() {
		return line3;
	}
	public void setLine3(String line3) {
		this.line3 = line3;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}	
	public boolean isTrial() {
		return trial; 
	}
	public void setTrial(boolean trial) {
		this.trial = trial;
	}
	public String getConfirmEmail() {
		return confirmEmail;
	}
	public void setConfirmEmail(String confirmEmail) {
		this.confirmEmail = confirmEmail;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}		
	
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	@Override
	public String toString() {
		return "ClientRegisterForm [clientId=" + clientId + ", projectId="
				+ projectId + ", sex=" + sex + ", mobile=" + mobile
				+ ", foreName=" + foreName + ", categoryname=" + categoryname
				+ ", userId=" + userId + ", surName=" + surName + ", email="
				+ email + ", confirmEmail=" + confirmEmail + ", line1=" + line1
				+ ", line2=" + line2 + ", line3=" + line3 + ", city=" + city
				+ ", country=" + country + ", postcode=" + postcode
				+ ", dateOfBirth=" + dateOfBirth + ", newPassward="
				+ newPassward + ", confirmPassward=" + confirmPassward
				+ ", telephone=" + telephone + ", trial=" + trial + "]";
	}
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}	
	
	
	
	
	

}
