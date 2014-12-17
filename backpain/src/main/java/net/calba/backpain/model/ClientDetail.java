package net.calba.backpain.model;

public class ClientDetail {
	
	
	private Integer clientId;
	
	private Client client;
	
	private Integer DisabilityFormUpdate;
	
	public Integer getDisabilityFormUpdate() {
		return DisabilityFormUpdate;
	}

	public void setDisabilityFormUpdate(Integer disabilityFormUpdate) {
		DisabilityFormUpdate = disabilityFormUpdate;
	}

	private PersonalDetails  details;
	
	private Email email;
	
	private Address address;	
	
	private Telephone telephone;
	private String mobile;
	private String sex;
	private Role role;
	
	private ClientType clientType;

	public Integer getClientId() {
		return clientId;
	}

	public void setClientId(Integer clientId) {
		this.clientId = clientId;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public PersonalDetails getDetails() {
		return details;
	}

	public void setDetails(PersonalDetails details) {
		this.details = details;
	}

	public Email getEmail() {
		return email;
	}

	public void setEmail(Email email) {
		this.email = email;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Telephone getTelephone() {
		return telephone;
	}

	public void setTelephone(Telephone telephone) {
		this.telephone = telephone;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public ClientType getClientType() {
		return clientType;
	}

	public void setClientType(ClientType clientType) {
		this.clientType = clientType;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	
	
	
	

}
