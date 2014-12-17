package net.calba.backpain.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import net.calba.backpain.CalbaAppConstant;
import net.calba.backpain.PasswordRecoveryMessagePreparator;
import net.calba.backpain.RegisterClientMessagePreparator;
import net.calba.backpain.Util;
import net.calba.backpain.dao.mybatis.AddressMapper;
import net.calba.backpain.dao.mybatis.ClientFormMapper;
import net.calba.backpain.dao.mybatis.ClientMapper;
import net.calba.backpain.dao.mybatis.ClientTypeMapper;
import net.calba.backpain.dao.mybatis.EmailMapper;
import net.calba.backpain.dao.mybatis.HeightUnitsMapper;
import net.calba.backpain.dao.mybatis.PersonalDetailsMapper;
import net.calba.backpain.dao.mybatis.ProjectMapper;
import net.calba.backpain.dao.mybatis.RoleMapper;
import net.calba.backpain.dao.mybatis.TelephoneMapper;
import net.calba.backpain.dao.mybatis.WeightUnitsMapper;
import net.calba.backpain.exception.CalbaAppServiceException;
import net.calba.backpain.exception.ClientInActiveException;
import net.calba.backpain.exception.InvalidCredentialsException;
import net.calba.backpain.exception.InvalidDataexception;
import net.calba.backpain.exception.RecordNotFoundException;
import net.calba.backpain.model.Address;
import net.calba.backpain.model.AddressExample;
import net.calba.backpain.model.CategoryList;
import net.calba.backpain.model.Client;
import net.calba.backpain.model.ClientDetail;
import net.calba.backpain.model.ClientForm;
import net.calba.backpain.model.ClientFormExample;
import net.calba.backpain.model.ClientType;
import net.calba.backpain.model.Email;
import net.calba.backpain.model.EmailExample;
import net.calba.backpain.model.PersonalDetails;
import net.calba.backpain.model.PersonalDetailsExample;
import net.calba.backpain.model.Role;
import net.calba.backpain.model.Telephone;
import net.calba.backpain.model.TelephoneExample;
import net.calba.backpain.service.ClientService;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.mail.EmailException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import reminder.MailReminder;

@Service("clientService")
public class ClientServiceImpl implements ClientService {

	@Autowired
	EmailMapper emailMapper;

	@Autowired
	ClientMapper clientMapper;

	@Autowired
	PersonalDetailsMapper personalDetailsMapper;

	@Autowired
	WeightUnitsMapper weightUnitsMapper;

	@Autowired
	HeightUnitsMapper heightUnitsMapper;

	@Autowired
	AddressMapper addressMapper;

	@Autowired
	TelephoneMapper telephoneMapper;

	@Autowired
	RoleMapper roleMapper;

	@Autowired
	ProjectMapper projectMapper;

	@Autowired
	ClientTypeMapper clientTypeMapper;

	@Autowired
	private ClientFormMapper clientFormMapper;

	@Autowired
	private JavaMailSender mailSender;

	/**
	 * LOGGER filed.
	 */
	private static final Logger LOGGER = Logger
			.getLogger(ClientServiceImpl.class);

	public Client authenticate(String userId, String password)
			throws CalbaAppServiceException {

		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("email : " + userId);
		}
		if (StringUtils.isEmpty(userId) || StringUtils.isEmpty(password)) {
			throw new InvalidDataexception(
					CalbaAppConstant.USERID_PASSWORD_REQUIRED);
		}

		Client client = clientMapper.selectByUserId(userId);

		if (client == null) {
			throw new InvalidCredentialsException(
					CalbaAppConstant.INVALIAD_CREDENTIAL);
		}

		String hashPassword = Util.sha1(password);

		if (!client.getHashedPassword().equals(hashPassword)) {
			throw new InvalidCredentialsException(
					CalbaAppConstant.INVALIAD_CREDENTIAL);
		}

		if (client.getClientStateId() == CalbaAppConstant.CLIENT_STATE_INACTIVE_ID) {
			throw new ClientInActiveException(CalbaAppConstant.INACTIVE_USER);
		}

		Role role = roleMapper.selectByPrimaryKey(client.getRoleId());
		ClientType clientType = clientTypeMapper.selectByPrimaryKey(client
				.getClientTypeId());
		client.setRole(role);
		client.setClientType(clientType);

		ClientFormExample clientFormExample = new ClientFormExample();
		ClientFormExample.Criteria clientFormCriteria = clientFormExample
				.createCriteria();
		clientFormCriteria.andClientIdEqualTo(client.getClientId());
		List<ClientForm> clientForms = clientFormMapper
				.selectByExample(clientFormExample);
		client.setClientForms(clientForms);

		return client;
	}

	@Transactional(rollbackFor = Exception.class)
	public Client updateClientPassword(String password, String newPassword,
			Integer clientId) throws CalbaAppServiceException {

		Client client;
		client = clientMapper.selectByPrimaryKey(clientId);
		String hashPassword = Util.sha1(password);

		if (!client.getHashedPassword().equals(hashPassword)) {
			throw new InvalidCredentialsException(
					CalbaAppConstant.INVALIAD_PASSWORD);
		}

		hashPassword = Util.sha1(newPassword);
		client.setHashedPassword(hashPassword);
		clientMapper.updateByPrimaryKey(client);

		return client;
	}

	public ClientDetail getClientDetail(Client client) {

		Integer clientId = client.getClientId();
		ClientDetail clientDetail = new ClientDetail();
		clientDetail.setClient(clientMapper.selectByPrimaryKey(clientId));

		EmailExample emailExample = new EmailExample();
		EmailExample.Criteria emailCriteria = emailExample.createCriteria();
		emailCriteria.andClientIdEqualTo(clientId);
		List<Email> emails = emailMapper.selectByExample(emailExample);
		if (!emails.isEmpty()) {
			clientDetail.setEmail(emails.get(0));
		}

		PersonalDetailsExample detailsExample = new PersonalDetailsExample();
		PersonalDetailsExample.Criteria detailsCriteria = detailsExample
				.createCriteria();
		detailsCriteria.andClientIdEqualTo(clientId);
		List<PersonalDetails> personalDetails = personalDetailsMapper
				.selectByExample(detailsExample);
		if (!personalDetails.isEmpty()) {
			clientDetail.setDetails(personalDetails.get(0));
		}

		AddressExample addressExample = new AddressExample();
		AddressExample.Criteria addressCriteria = addressExample
				.createCriteria();
		addressCriteria.andClientIdEqualTo(clientId);
		List<Address> addresses = addressMapper.selectByExample(addressExample);
		if (!addresses.isEmpty()) {
			clientDetail.setAddress(addresses.get(0));
		}

		TelephoneExample telephoneExample = new TelephoneExample();
		TelephoneExample.Criteria telephoneCriteria = telephoneExample
				.createCriteria();
		telephoneCriteria.andClientIdEqualTo(clientId);
		List<Telephone> telephones = telephoneMapper
				.selectByExample(telephoneExample);
		
		System.out.println("value of telephone..."+telephones.get(0).getPhoneNumber());
		System.out.println("value of mobile..."+telephones.get(0).getMobileNumber());

		if (!telephones.isEmpty()) {
			clientDetail.setTelephone(telephones.get(0));
			clientDetail.setMobile(telephones.get(0).getMobileNumber());
			System.out.println("mobile numbe12122r=="+client.getMobile());
		}
		return clientDetail;

	}

	@Transactional(rollbackFor = Exception.class)
	public void updateClientDetail(ClientDetail clientDetail) {

		Client client = clientDetail.getClient();
		PersonalDetails details = clientDetail.getDetails();

		Address address = clientDetail.getAddress();
		Telephone telephone = clientDetail.getTelephone();
			
		telephone.setMobileNumber(clientDetail.getMobile());
		
		Email email = clientDetail.getEmail();
		System.out.println("mobile number=="+telephone.getMobileNumber());
		clientMapper.updateByPrimaryKey(client);

		if (details.getPersonalDetailsId() == null) {

			personalDetailsMapper.insert(details);

		} else {

			personalDetailsMapper.updateByPrimaryKey(details);

		}

		if (address.getAddressId() == null) {
			addressMapper.insert(address);
		} else {
			addressMapper.updateByPrimaryKey(address);
		}

		if (email.getEmailId() == null) {
			emailMapper.insert(email);
		} else {
			emailMapper.updateByPrimaryKey(email);
		}

		if (telephone.getTelephoneId() == null) {
			telephoneMapper.insert(telephone);
		} else {
			telephoneMapper.updateByPrimaryKey(telephone);
		}

	}

	@Transactional(rollbackFor = Exception.class)
	public Client addClientDetail(ClientDetail clientDetail)
			throws CalbaAppServiceException {
		Client client = clientDetail.getClient();
		Address address = clientDetail.getAddress();
		Email email = clientDetail.getEmail();
		Telephone telephone = clientDetail.getTelephone();
		Client exits = clientMapper.selectByUserId(client.getUserId());

		if (exits != null) {
			throw new InvalidDataexception(CalbaAppConstant.USER_NAME_EXISTS);
		}

		client.setRoleId(CalbaAppConstant.ROLE_END_USER_ID);
		// client.setClientStateId(CalbaAppConstant.CLIENT_STATE_INACTIVE_ID);
		client.setClientStateId(CalbaAppConstant.CLIENT_STATE_ACTIVE_ID);

		if (CalbaAppConstant.DIRECT_USER_PROJECT_ID == client.getProjectId()
				.intValue()) {
			client.setClientTypeId(CalbaAppConstant.CLIENT_TYPE_DIRECT_USER_ID);
		} else {
			client.setClientTypeId(CalbaAppConstant.CLIENT_TYPE_TRIAL_USER_ID);
		}
		client.setSex(clientDetail.getSex());
		clientMapper.insert(client);

		address.setClientId(client.getClientId());
		addressMapper.insert(address);

		email.setClientId(client.getClientId());
		emailMapper.insert(email);

		telephone.setClientId(client.getClientId());
		telephone.setMobileNumber(clientDetail.getMobile());
		telephoneMapper.insert(telephone);

		RegisterClientMessagePreparator messagePreparator = new RegisterClientMessagePreparator(
				client, email);
		sendMail(messagePreparator);

		return client;
	}

	@Transactional(rollbackFor = Exception.class)
	public void passwordRecovery(String email) throws CalbaAppServiceException {
		EmailExample emailExample = new EmailExample();
		EmailExample.Criteria emailCriteria = emailExample.createCriteria();
		emailCriteria.andEmailAddressEqualTo(email);
		List<Email> emails = emailMapper.selectByExample(emailExample);
		if (emails.isEmpty()) {
			throw new RecordNotFoundException(
					CalbaAppConstant.EMAIL_NOT_REGISTERED);
		}

		Email record = emails.get(0);

		Client client = clientMapper.selectByPrimaryKey(record.getClientId());
		String password = RandomStringUtils
				.randomAlphanumeric(CalbaAppConstant.PASSWORD_LENGTH);

		String hashedPassword = Util.sha1(password);
		client.setHashedPassword(hashedPassword);
		clientMapper.updateByPrimaryKey(client);
		client.setPassword(password);

		PasswordRecoveryMessagePreparator messagePreparator = new PasswordRecoveryMessagePreparator(
				client, record);
		MailReminder mail=new MailReminder();
		try {
			mail.sendMessage(email,"Your Calba password has been reset","<html><body>Hello "+client.getForeName()+", <br><br>Your Calba <span>password</span> has been successfully reset.<br><br>"
					+"<h3>Account detail</h3>"
					+"<table>"	
					+"<tr><td>Email: </td><td>" + email+ "</td></tr>"
					+"<tr><td>User Name: </td><td>" + client.getUserId() + "</td></tr>"
					+"<tr><td>Password: </td><td>" + client.getPassword() + "</td></tr>"
					+"</table>"	
					+"</body>"
					+"</html>");
		} catch (EmailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		//sendMail(messagePreparator);

		LOGGER.debug("updated password : " + password);

	}

	public void sendMail(MimeMessagePreparator messagePreparator) {
		
		final MimeMessage message = mailSender.createMimeMessage();
	
		try {
			messagePreparator.prepare(message);
			Thread thread = new Thread(new Runnable() {

				public void run() {
					LOGGER.debug("before sendMail");
					mailSender.send(message);
					LOGGER.debug("after sendMail");
				}
			});
			thread.start();

		} catch (Exception e) {
			LOGGER.error("error : ", e);

		}

	}

	public Client getClientById(Integer clientId)
			throws RecordNotFoundException {
		Client client = clientMapper.selectByPrimaryKey(clientId);
		if (client == null) {
			throw new RecordNotFoundException(CalbaAppConstant.RECORD_NOT_FOUND);
		}

		return client;

	}
	public List<CategoryList> getCategoryList(){	
		List<CategoryList> myList = new ArrayList();
	    myList = clientMapper.selectCategoryList();
		return myList;
	}

}
