package net.calba.backpain.form;

import java.util.Arrays;
import java.util.List;

import javax.validation.constraints.Null;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import net.calba.backpain.model.HeightUnits;
import net.calba.backpain.model.WeightUnits;

public class AboutYouForm extends BaseForm {
	
	
	public static final int QUESTION_108 = 108;
	
	private Integer clientId;
	
	private Integer heightUnitsId;
	
	private Integer weightUnitsId;
	
	
	

	@Pattern(regexp="[a-zA-z]+([\\w-'\\s]+)*",
	message = "First name  must contain Alphanumeric, underscore, hypen, space and  apostrophe Characters.")
	private String foreName;
	
	@Pattern(regexp="[a-zA-z]+([\\w-'\\s]+)*",
			message = "Last name  must contain Alphanumeric, underscore, hypen, space and  apostrophe Characters.")	
	private String surName;
	
	
	@Email
	@NotEmpty(message = "Email must not be blank.")
	private String email;

	
	private String line1;
	
	private String line2;
	
	private String line3;
	
	private String city;
	
	@Pattern(regexp="[a-zA-z]+([\\w-'\\s]+)*",
			message = "Country must contain Alphanumeric, underscore, hypen, space and  apostrophe Characters.")	
	private String country;
	
	@Pattern(regexp="^([a-zA-Z0-9\\s]+)*",
			message = "Postcode must contain Alphanumeric and space Characters.")	
	private String postcode;
	
	
//	@Pattern(regexp =  "^([0-9\\+ \\-]{7,15})$",
//			message = "Phone Number must be valid")
	private String phone;
	
//	@Pattern(regexp =  "^([0-9\\+ \\-]{7,15})$",
//			message = "Must contain only numbers and have no spaces.")
//	@NotEmpty(message = "Mobile No must not be blank.")
	private String mobile;
	
	private String height;
	
	private String heightInch;
	
	private String weight;	
	
	@NotEmpty(message = "Sex must not be blank.")
	private String sex;
	
	@Pattern(regexp ="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$",
			message = "Enter Date of birth in format (dd/MM/yyyy).")
	private String dateOfBirth;
	
	
	private String question100 = "";
	
	private String question101 = "";
	
	private String question102 = "";
	
	private String question103 = "";
	
	private String question104 = "";
	
	private String question105 = "";
	
	private String question106 = "";
	
	private String question107 = "";	
	
	private String[] question108 = {};
	/**
	 * child question of question108.
	 */
	private String question109 = "";
	
	private List<HeightUnits> heightUnits;
	
	private List<WeightUnits> weightUnits;
	
	private String sendMessage;
	
	
	
	public AboutYouForm() {
		super();	
	}
	public AboutYouForm(Integer clientFormId) {
		super(clientFormId);
	
	}
	public Integer getClientId() {
		return clientId;
	}
	public void setClientId(Integer clientId) {
		this.clientId = clientId;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getHeightUnitsId() {
		return heightUnitsId;
	}
	public void setHeightUnitsId(Integer heightUnitsId) {
		this.heightUnitsId = heightUnitsId;
	}
	public Integer getWeightUnitsId() {
		return weightUnitsId;
	}
	public void setWeightUnitsId(Integer weightUnitsId) {
		this.weightUnitsId = weightUnitsId;
	}
	
	
	
	public String getHeightInch() {
		return heightInch;
	}
	public void setHeightInch(String heightInch) {
		this.heightInch = heightInch;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
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
	public List<HeightUnits> getHeightUnits() {
		return heightUnits;
	}
	public void setHeightUnits(List<HeightUnits> heightUnits) {
		this.heightUnits = heightUnits;
	}
	public List<WeightUnits> getWeightUnits() {
		return weightUnits;
	}
	public void setWeightUnits(List<WeightUnits> weightUnits) {
		this.weightUnits = weightUnits;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getQuestion100() {
		return question100;
	}
	public void setQuestion100(String question100) {
		this.question100 = question100;
	}
	public String getQuestion101() {
		return question101;
	}
	public void setQuestion101(String question101) {
		this.question101 = question101;
	}
	public String getQuestion102() {
		return question102;
	}
	public void setQuestion102(String question102) {
		this.question102 = question102;
	}
	public String getQuestion103() {
		return question103;
	}
	public void setQuestion103(String question103) {
		this.question103 = question103;
	}
	public String getQuestion104() {
		return question104;
	}
	public void setQuestion104(String question104) {
		this.question104 = question104;
	}
	public String getQuestion105() {
		return question105;
	}
	public void setQuestion105(String question105) {
		this.question105 = question105;
	}
	public String getQuestion106() {
		return question106;
	}
	public void setQuestion106(String question106) {
		this.question106 = question106;
	}
	public String getQuestion107() {
		return question107;
	}
	public void setQuestion107(String question107) {
		this.question107 = question107;
	}
	public String[] getQuestion108() {
		return question108;
	}
	public void setQuestion108(String[] question108) {
		this.question108 = question108;
	}
	public String getQuestion109() {
		return question109;
	}
	public void setQuestion109(String question109) {
		this.question109 = question109;
	}
	
	public String getSendMessage() {
		return sendMessage;
	}
	public void setSendMessage(String sendMessage) {
		this.sendMessage = sendMessage;
	}
	@Override
	public String toString() {
		return "AboutYouForm [clientId=" + clientId + ", heightUnitsId="
				+ heightUnitsId + ", weightUnitsId=" + weightUnitsId
				+ ", foreName=" + foreName + ", surName=" + surName
				+ ", email=" + email + ", line1=" + line1 + ", line2=" + line2
				+ ", line3=" + line3 + ", city=" + city + ", country="
				+ country + ", postcode=" + postcode + ", phone=" + phone
				+ ", mobile=" + mobile + ", height=" + height + ", heightInch="
				+ heightInch + ", weight=" + weight + ", sex=" + sex
				+ ", dateOfBirth=" + dateOfBirth + ", question100="
				+ question100 + ", question101=" + question101
				+ ", question102=" + question102 + ", question103="
				+ question103 + ", question104=" + question104
				+ ", question105=" + question105 + ", question106="
				+ question106 + ", question107=" + question107
				+ ", question108=" + Arrays.toString(question108)
				+ ", question109=" + question109 + ", heightUnits="
				+ heightUnits + ", weightUnits=" + weightUnits
				+ ", sendMessage=" + sendMessage + ", clientFormId="
				+ clientFormId + ", getClientId()=" + getClientId()
				+ ", getEmail()=" + getEmail() + ", getLine1()=" + getLine1()
				+ ", getLine2()=" + getLine2() + ", getLine3()=" + getLine3()
				+ ", getCity()=" + getCity() + ", getCountry()=" + getCountry()
				+ ", getPostcode()=" + getPostcode() + ", getPhone()="
				+ getPhone() + ", getHeightUnitsId()=" + getHeightUnitsId()
				+ ", getWeightUnitsId()=" + getWeightUnitsId()
				+ ", getHeightInch()=" + getHeightInch() + ", getHeight()="
				+ getHeight() + ", getWeight()=" + getWeight() + ", getSex()="
				+ getSex() + ", getForeName()=" + getForeName()
				+ ", getSurName()=" + getSurName() + ", getHeightUnits()="
				+ getHeightUnits() + ", getWeightUnits()=" + getWeightUnits()
				+ ", getDateOfBirth()=" + getDateOfBirth()
				+ ", getQuestion100()=" + getQuestion100()
				+ ", getQuestion101()=" + getQuestion101()
				+ ", getQuestion102()=" + getQuestion102()
				+ ", getQuestion103()=" + getQuestion103()
				+ ", getQuestion104()=" + getQuestion104()
				+ ", getQuestion105()=" + getQuestion105()
				+ ", getQuestion106()=" + getQuestion106()
				+ ", getQuestion107()=" + getQuestion107()
				+ ", getQuestion108()=" + Arrays.toString(getQuestion108())
				+ ", getQuestion109()=" + getQuestion109()
				+ ", getSendMessage()=" + getSendMessage() + ", getMobile()="
				+ getMobile() + ", getClientFormId()=" + getClientFormId()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
